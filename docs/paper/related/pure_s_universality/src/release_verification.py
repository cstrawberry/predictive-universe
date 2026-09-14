"""Validate the delivered Lean 4.33.1 release and its source-bound evidence.

This command validates recorded executions. run_current_verification.py performs
new proof executions. Public records use symbolic paths as explained in
evidence/PUBLIC-COPY.md; all supplied evidence resolves inside this package.
"""
from __future__ import annotations
import argparse, hashlib, json, os, re, subprocess, sys, tempfile
from pathlib import Path, PurePosixPath
from evidence_storage import (read_bytes as evidence_bytes, read_text as evidence_text,
                              exists as evidence_exists, logical_files, stored_gzip)
ROOT=Path(__file__).resolve().parents[1]
EVIDENCE=ROOT/'evidence/formal/headline-complete'
REQUIRED=frozenset({'README.md','VERIFICATION.md','TOOLCHAIN.lock','VERIFICATION-TOOLCHAIN.json',
    'PUBLICATION-TOOLCHAIN.json','paper.md','paper/unified_template.md','paper/references.md',
    'output/pdf/pure_s_universality.pdf','src/run_current_verification.py','src/release_verification.py',
    'src/ExactMain.lean','src/InvalidProof.lean','evidence/formal/headline-complete/COMPLETE-VERIFICATION.json',
    'evidence/formal/headline-complete/MANIFEST.json','formalization/generated/public_api.json',
    'RELEASE.json','evidence/README.md','evidence/tests/receipt.json'})

def check_required(actual):
    require(REQUIRED<=set(actual),'missing public files: '+str(sorted(REQUIRED-set(actual))))

def require(value, message):
    if not value: raise ValueError(message)

def sha(path):
    return hashlib.sha256(evidence_bytes(path)).hexdigest()

def read(path): return json.loads(evidence_bytes(path))

def safe_path(root,name):
    p=PurePosixPath(name)
    require(not p.is_absolute() and '..' not in p.parts and str(p)==name and '\\' not in name,'noncanonical manifest path')
    target=root/p
    require(target.resolve().is_relative_to(root.resolve()) and not target.is_symlink(),'manifest escapes package')
    return target

def public_files(root=ROOT, *, repository=False, post_verification=False):
    result={}
    for parent,dirs,names in os.walk(root):
        rel=Path(parent).relative_to(root)
        excluded=set()
        if rel==Path('.'):
            if repository: excluded|={'.git','.work'}
            if post_verification: excluded.add('.work')
        if post_verification and rel==Path('formalization'):excluded.add('.lake')
        for d in dirs:
            require(not (Path(parent)/d).is_symlink(),'redirected delivery directory')
        dirs[:]=[d for d in dirs if d not in excluded]
        for name in names:
            p=Path(parent)/name
            require(not p.is_symlink(),'symlink in release: '+str(p))
            if repository and rel==Path('.') and name in ['.git','pure_s_universality_submission.zip']:continue
            require(not set(p.relative_to(root).parts)&{'.work','.lake','.git','__pycache__'},'generated files in package: '+str(p))
            require(p.suffix.lower() not in ['.zip','.tar','.7z','.a','.o','.olean','.ilean','.ir','.pyc'] and
                    (p.suffix.lower()!='.gz' or
                     p.is_relative_to(root/'evidence/formal/headline-complete') and stored_gzip(p)),
                    'compiled/archive artifact in release: '+str(p))
            result[p.relative_to(root).as_posix()]=p
    return result

def check_manifest(root,manifest,*,exact=False):
    for name,digest in manifest.items():
        require(re.fullmatch('[0-9a-f]{64}',digest) is not None,'invalid digest')
        p=safe_path(root,name)
        require(evidence_exists(p) and sha(p)==digest,'changed/missing evidence: '+name)
    if exact:
        actual=logical_files(root)
        require(actual==set(manifest),'evidence inventory differs')

def source_binding(root=ROOT,evidence=EVIDENCE):
    baseline=read(evidence/'verified-source-manifest.json')
    formal={n:h for n,h in baseline.items() if n.startswith('formalization/')}
    check_manifest(root,formal)
    actual={p.relative_to(root).as_posix() for p in (root/'formalization').rglob('*') if p.is_file() and '.lake' not in p.relative_to(root).parts}
    require(actual==set(formal),'formalization file set differs from verified sources')
    for name in ['TOOLCHAIN.lock','VERIFICATION-TOOLCHAIN.json','src/run_current_verification.py',
                 'src/ExactMain.lean','src/InvalidProof.lean','src/grouped_replay.py',
                 'src/checker_provenance.py','src/replay_scope.py','src/lean_axiom_report.py',
                 'src/verification_runtime.py','src/toolchain_lock.py',
                 'src/lean_runtime_checks.py','src/verify_root_reset_worked_trace.py',
                 'src/verify_deterministic_tape_examples.py','src/local_workspace.py']:
        require(sha(root/name)==baseline[name],'changed verified input: '+name)
    for name,digest in baseline.items():
        if name.startswith('tests/lean/'):
            require(sha(root/name)==digest,'changed runtime harness: '+name)
    return baseline


def checked_receipt(evidence=EVIDENCE):
    receipt=read(evidence/'receipt.json')
    require(receipt['status']=='PASS' and receipt['stage']=='all','incomplete verification execution')
    checks=receipt['checks'];labels=[c['label'] for c in checks]
    require(len(labels)==len(set(labels)),'duplicate execution check')
    required={'toolchain','inventory','audit_sources','audit_axioms','audit_all_axioms',
              'audit_public_declarations','check_public_signatures','checker-build',
              'lean4lean-exact-lean','lean4lean-exact-c','lean4lean-exact-link',
              'invalid-proof-compile','leanchecker-valid','leanchecker-invalid',
              'leanchecker-missing','lean4lean-valid','lean4lean-invalid',
              'lean4lean-missing','exact-duplicate','static-library',
              'worked-trace','source-examples','selector-regression'}
    require(required<=set(labels),'missing execution gate')
    for check in checks:
        require(sha(evidence/check['log'])==check['log_sha256'],'changed execution log')
        negative=check['label'].endswith(('-invalid','-missing','-duplicate'))
        require(check['returncode']!=0 if negative else check['returncode']==0,'unexpected execution status')
        if check['label'].endswith('-invalid'):
            text=evidence_text(evidence/check['log'])
            require('(kernel)' in text and 'type mismatch' in text and 'False' in text,'invalid proof did not fail in the kernel')
    require(sha(evidence/'runner.py')==receipt['source_manifest']['src/run_current_verification.py'],'executed runner binding differs')
    require(receipt['results']['audit']=='PASS','audit did not complete')
    return receipt


def check_public_execution(root=ROOT,evidence=EVIDENCE):
    receipt=checked_receipt(evidence)
    entries=(root/'formalization/FILES').read_text().splitlines()
    modules=['.'.join(PurePosixPath(n).with_suffix('').parts) for n in entries if n.endswith('.lean') and not n.startswith('#')]
    require(len(modules)==1239 and len(set(modules))==1239,'source module inventory differs')
    coverage=read(evidence/'coverage.json');groups=coverage['groups']
    require(coverage['original_ordered_roots']==modules and set(coverage['expected_project_closure'])==set(modules),'replay root inventory differs')
    require([n for g in groups for n in g['roots']]==modules,'fresh replay groups omit or reorder roots')
    require(receipt['results']['replay']=={'modules':len(modules),'kernel_groups':len(groups),'alternate_batches':(len(modules)+39)//40},'replay coverage incomplete')
    fresh=[c for c in receipt['checks'] if c['label'].startswith('fresh-')]
    require([c['label'] for c in fresh]==['fresh-'+str(i) for i in range(len(groups))],'fresh replay gate inventory differs')
    for group,check in zip(groups,fresh,strict=True):
        source=evidence/(group['module']+'.lean')
        require(sha(source)==group['source_sha256'] and source.read_text()==''.join('import '+n+'\n' for n in group['roots']),'changed fresh replay group')
        require(group['own_declarations']==0 and set(group['roots'])<=set(group['actual_imported_modules']),'fresh group import coverage differs')
        require(check['command'][-1]==group['module'] and '--fresh' in check['command'],'wrong fresh replay invocation')
    batches=[c for c in receipt['checks'] if c['label'].startswith('alternate-')]
    require([c['label'] for c in batches]==['alternate-'+str(i) for i in range((len(modules)+39)//40)],'alternate batch inventory differs')
    observed=[];declarations=0
    for check in batches:
        text=evidence_text(evidence/check['log'])
        passed=re.findall(r'^passed ([A-Za-z_][A-Za-z_0-9.]*) declarations=(\d+)$',text,re.M)
        started=re.findall(r'^replaying ([A-Za-z_][A-Za-z_0-9.]*)$',text,re.M)
        require(started==[n for n,_ in passed]==check['command'][1:],'alternate batch incomplete')
        observed.extend(n for n,_ in passed);declarations+=sum(int(n) for _,n in passed)
    require(observed==modules,'alternate replay omitted or duplicated a source module')
    complete=read(evidence/'COMPLETE-VERIFICATION.json')
    require(declarations==complete['alternate_declarations_added'] and declarations>0,'replayed declaration count differs')
    before=read(evidence/'inputs-before.json')
    require(before==read(evidence/'inputs-after.json'),'replay input mutation')
    for name,digest in receipt['source_manifest'].items():
        if name.startswith('formalization/') and (name.endswith(('.lean','.py','.json','.toml')) or name.endswith('/FILES')):
            require([h for p,h in before.items() if p.endswith('/package/'+name)]==[digest],'replay source binding missing: '+name)
    pinned=read(root/'VERIFICATION-TOOLCHAIN.json')
    for name in ['lean','lake','leanchecker']:
        require([h for p,h in before.items() if p.endswith('/bin/'+name)]==[pinned[name]['binary_sha256']],'replayed tool binary differs: '+name)
    bindings=read(evidence/'checker-bindings.json')
    require(len(bindings)==28 and len([p for p in bindings if p.endswith('.o.export')])==27,'alternate checker object inventory differs')
    driver=next(c for c in receipt['checks'] if c['label']=='lean4lean-exact-link')['command'][2]
    require(driver in bindings and all(c['command'][0]==driver for c in batches),'alternate replay binary binding differs')


def check_proof_evidence(root=ROOT,evidence=EVIDENCE):
    check_manifest(evidence,read(evidence/'MANIFEST.json'),exact=True)
    baseline=source_binding(root,evidence)
    complete=read(evidence/'COMPLETE-VERIFICATION.json')
    require(complete['status']=='PASS_COMPLETE_FORMALIZATION_VERIFICATION','incomplete verification')
    require(complete['source_modules']==1239 and complete['public_exports']==319 and complete['appendix_f_exports']==22,'unexpected coverage')
    for name,digest in complete['evidence'].items():require(sha(evidence/name)==digest,'completion binding mismatch')
    receipt=checked_receipt(evidence)
    require(receipt['source_manifest']==baseline,'source manifest differs from executed package')
    for name,gate in complete['gates'].items():
        require(gate['receipt']=='receipt.json' and sha(evidence/gate['receipt'])==gate['sha256'],'completion receipt binding differs')
    census=read(evidence/'full-declaration-census.json')
    allowed={'propext','Quot.sound'};exceptions=set(census['demo_string_choice_declarations'])
    records=census['declarations']
    require(len(records)==complete['declaration_records'],'declaration census count differs')
    require(len({(d['module'],d['declaration']) for d in records})==len(records),'duplicate declaration census record')
    for d in records:
        if d['safety']!='safe':continue
        permitted=allowed.copy()
        if d['module'].startswith('PureSFormal.AppendixF.') or (d['module']=='PureSFormal.Public' and d['declaration'].startswith('PureSFormal.Public.appendixF')) or (d['module']=='Demo' and d['declaration'] in exceptions):
            permitted.add('Classical.choice')
        require(set(d['axioms'])<=permitted,'unexpected safe axiom: '+d['declaration'])
    api=read(root/'formalization/generated/public_api.json');exports=api['exports']
    require(api['api_version']==10 and api['export_count']==len(exports)==319,'public signature inventory differs')
    require(sum(e['declaration'].startswith('PureSFormal.AppendixF.') for e in exports)==22,'Appendix F export inventory differs')
    for e in exports:
        permitted=allowed|({'Classical.choice'} if e['declaration'].startswith('PureSFormal.AppendixF.') else set())
        require(set(e['axioms'])<=permitted,'public axiom violation')
    check_public_execution(root,evidence)


def check_runtime(root=ROOT,evidence=EVIDENCE):
    import lean_runtime_checks as validators
    import verify_root_reset_worked_trace as worked
    import verify_deterministic_tape_examples as source
    receipt=checked_receipt(evidence);results=receipt['results']
    require(set(results)=={'audit','replay','worked-trace',*validators.FIXTURES},'runtime fixture inventory differs')
    checks={c['label']:c for c in receipt['checks']}
    for name in validators.FIXTURES:
        require(name in checks,'missing runtime execution')
        require(validators.VALIDATORS[name](evidence_text(evidence/checks[name]['log']))==results[name],'runtime validation disagrees')
    with tempfile.TemporaryDirectory(prefix='pure-s-recorded-trace-') as tmp:
        trace=Path(tmp)/'worked-trace.log'
        trace.write_bytes(evidence_bytes(evidence/checks['worked-trace']['log']))
        require(worked.validate(trace,Path(tmp))==results['worked-trace'],'trace validation disagrees')
    before=read(evidence/'runtime-inputs-before.json')
    require(before==read(evidence/'runtime-inputs-after.json'),'runtime input mutation')
    for name,digest in read(evidence/'inputs-after.json').items():
        if name.endswith(('.lean','.olean','.olean.server','.olean.private')):
            require(before.get(name)==digest,'runtime source or object differs from kernel replay')
    bindings=read(evidence/'runtime-bindings.json')
    require(len(bindings)==4 and len([p for p in bindings if p.endswith('.a')])==1,'runtime native binding inventory differs')
    archive=next(p for p in bindings if p.endswith('.a'))
    for name in ['RootResetRuntimeDifferential','RootResetArbitraryRuntime','RootResetWorkedTrace']:
        label=next(label for label,c in checks.items() if c['command'][0].endswith('/'+name) and not label.endswith(('-lean','-c','-link')))
        binary=checks[label]['command'][0]
        require(binary in bindings and archive in checks[name+'-link']['command'],'runtime executable lacks bound static library')
    require('PASS' in evidence_text(evidence/checks['source-examples']['log']),'source examples did not pass')
    examples=evidence/'verified-source-examples';example_receipt=read(examples/'receipt.json')
    require(example_receipt['status']=='PASS_SOURCE_EXAMPLES' and example_receipt['cases']==9 and example_receipt['actual_records']==37,'source-example coverage differs')
    check_manifest(examples,example_receipt['artifacts'])
    example_inputs=read(examples/'inputs-before.json')
    require(example_inputs==read(examples/'inputs-after.json'),'source-example input mutation')
    check_manifest(root,example_inputs['files'])
    from check_runtime_evidence import project_sources
    harnesses=tuple(n for n in example_inputs['files'] if n.startswith('tests/lean/') and n.endswith('.lean'))
    require(project_sources(root,harnesses)=={n:d['source_sha256'] for n,d in example_inputs['project_modules'].items()},'source-example transitive import closure differs')
    for module,identity in example_inputs['project_modules'].items():
        suffix='/package/formalization/.lake/build/lib/lean/'+module.replace('.','/')+'.olean'
        require([h for p,h in before.items() if p.endswith(suffix)]==[identity['olean_sha256']],'source-example compiled import differs from replay')
    expected,_=source.expected_records()
    require(evidence_text(examples/'source-rows.log').splitlines()==expected,'source-machine comparison failed')
    require('PASS' in evidence_text(evidence/checks['selector-regression']['log']),'selector regression did not pass')
    print('PASS recorded runtime: 720 differential contractions, 394 small-term executions, output/preflight, 37 source rows, 85-contraction trace')


def check_release_metadata(root=ROOT):
    metadata=read(root/'RELEASE.json')
    prefix='evidence/formal/headline-complete/'
    for key,filename in {'formal_sources':'verified-source-manifest.json',
                         'verification':'COMPLETE-VERIFICATION.json',
                         'public_audit':'receipt.json','public_replays':'receipt.json'}.items():
        require(metadata[key]==prefix+filename,'stale release pointer: '+key)
    complete=read(root/metadata['verification'])
    for key in ['source_modules','public_exports']:
        require(metadata[key]==complete[key],'stale release count: '+key)
    require(metadata['date']==read(root/'PUBLICATION-TOOLCHAIN.json')['date'],'stale release date')
    index=(root/'evidence/README.md').read_text(encoding='utf-8')
    require(f"{complete['source_modules']:,} modules" in index and
            f"{complete['public_exports']} public exports" in index,'stale evidence index counts')
    require(metadata['tests']=='evidence/tests/receipt.json','stale test receipt pointer')
    tests=read(root/metadata['tests'])
    require(tests['status']=='PASS' and tests['tests']>0,'incomplete package test run')
    test_inputs={p.relative_to(root).as_posix():sha(p) for folder in ['src','tests']
                 for p in (root/folder).glob('*.py')}
    require(tests['source_hashes']==test_inputs,'package tests do not bind current sources')
    log=root/'evidence/tests'/tests['log']
    require(sha(log)==tests['log_sha256'],'changed package test log')
    text=log.read_text(encoding='utf-8')
    require(re.search(rf'(?m)^Ran {tests["tests"]} tests? in ',text) is not None and
            re.search(r'(?m)^OK\s*$',text) is not None,'test count/status differs from execution log')


def check_surface(root=ROOT):
    import build_paper
    from publication_checks import check_lean_line_links
    check_release_metadata(root)
    require(check_lean_line_links((root/'paper/unified_template.md').read_text(encoding='utf-8'),
                                 root/'paper')>0,'no Lean line links checked')
    require((root/'paper.md').read_bytes()==build_paper.unified_markdown_manuscript().encode(),'assembled manuscript stale')
    subprocess.run([sys.executable,'-B',str(root/'src/check_paper_claims.py')],check=True)
    subprocess.run([sys.executable,'-B',str(root/'formalization/scripts/audit_sources.py')],check=True)
    from check_package import check_artifacts
    check_artifacts()
    require('Lean 4.33.1' in (root/'paper.md').read_text(encoding='utf-8'),'stale manuscript toolchain')
    require('no axiom beyond `propext`' not in (root/'paper.md').read_text(encoding='utf-8'),'stale axiom claim')

def check_pdf(root=ROOT):
    import build_paper
    from pypdf import PdfReader
    from check_package import check_pdf_doi_links
    record=read(root/'evidence/pdf/current-build.json')
    require(record['status']=='PASS','PDF build incomplete')
    check_manifest(root,record['input_hashes'])
    pdf=root/record['pdf'];require(sha(pdf)==record['sha256'],'PDF digest mismatch')
    reader=PdfReader(pdf);require(len(reader.pages)==record['pages'],'PDF page count mismatch')
    from publication_checks import check_heading_destinations
    check_heading_destinations(reader,build_paper.unified_manuscript())
    build_paper.assert_tagged_pdf(pdf)
    uris=[]
    for page in reader.pages:
        for ref in page.get('/Annots',[]):
            uri=ref.get_object().get('/A',{}).get('/URI')
            if uri:uris.append(str(uri))
    check_pdf_doi_links((root/'paper/references.md').read_text(encoding='utf-8'),tuple(uris))
    review=read(root/'evidence/pdf/layout-review.json')
    require(review['pdf_sha256']==record['sha256'] and review['status']=='PASS','PDF layout review missing or stale')
    reproduced=read(root/'evidence/pdf/reproduction.json')
    require(reproduced['status']=='PASS' and reproduced['pdf_sha256']==record['sha256'],'PDF reproduction missing or stale')

def checksums(*,repository=False,post_verification=False,write=False):
    files=public_files(repository=repository,post_verification=post_verification)
    files.pop('SHA256SUMS',None)
    actual=''.join(f'{sha(p)}  {n}\n' for n,p in sorted(files.items()))
    if write:(ROOT/'SHA256SUMS').write_text(actual,encoding='utf-8',newline='\n')
    else:require((ROOT/'SHA256SUMS').read_text(encoding='utf-8')==actual,'release checksums/file set differ')

def main():
    require(__debug__,'Python assertions must be enabled')
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--repository',action='store_true')
    parser.add_argument('--post-verification',action='store_true')
    parser.add_argument('--write-evidence-manifest',action='store_true')
    parser.add_argument('--check-public-structure',action='store_true')
    args=parser.parse_args()
    from toolchain_lock import parse_lock
    require(parse_lock()['lean']=='4.33.1','wrong release toolchain')
    files=public_files(repository=args.repository,post_verification=args.post_verification)
    check_required(files)
    from check_public_privacy import check_files
    count=check_files(ROOT,files.values())
    print(f'PASS public privacy scan: {count} files, including compressed records and PDF/image metadata')
    check_proof_evidence()
    check_surface()
    if args.check_public_structure:
        print('PASS source-bound proof evidence, manuscript and scientific artifacts; PDF/runtime not checked');return
    check_runtime();check_pdf()
    checksums(repository=args.repository,post_verification=args.post_verification,write=args.write_evidence_manifest)
    print('PASS Lean 4.33.1 release: exact verified sources, complete recorded checks, current manuscript/PDF and every packaged checksum')

if __name__=='__main__':
    try: main()
    except (ValueError,OSError,KeyError,subprocess.CalledProcessError) as error:raise SystemExit('FAIL release verification: '+str(error))
