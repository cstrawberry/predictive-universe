"""Reproduce Lean 4.33.1 audits, both replays, and bounded runtime checks.

Uses a fresh copy of the package. Existing work directories are never replaced.
The checker checkout must contain the pinned Batteries checkout in
.lake/packages/batteries. No network access occurs in this runner.
"""
from __future__ import annotations
import argparse, hashlib, json, os, re, shlex, shutil, subprocess, sys, time
from datetime import datetime, timezone
from pathlib import Path

ROOT=Path(__file__).resolve().parents[1]
def sha(p):
    with Path(p).open('rb') as f:return hashlib.file_digest(f,'sha256').hexdigest()
def require(ok,message):
    if not ok:raise ValueError(message)

def verify_git_blobs(repo,record):
    def git(*args):return subprocess.check_output(['git','-C',str(repo),*args]).decode().strip()
    require(git('rev-parse','HEAD')==record['commit'],'checker commit differs')
    require(git('rev-parse','HEAD^{tree}')==record['tree'],'checker tree differs')
    require(not git('ls-files','--others','--exclude-standard'),'checker checkout has untracked source files')
    for line in git('ls-tree','-r','HEAD').splitlines():
        meta,name=line.split('\t',1);mode,kind,digest=meta.split()
        require(kind=='blob','unsupported checker submodule')
        p=repo/name
        raw=os.readlink(p).encode() if mode=='120000' else p.read_bytes()
        require(hashlib.sha1(b'blob '+str(len(raw)).encode()+b'\0'+raw).hexdigest()==digest,'modified checker source: '+name)

def main():
    require(__debug__,'run without -O')
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--lake',required=True,type=Path)
    parser.add_argument('--lean4lean-source',type=Path)
    parser.add_argument('--work-dir',required=True,type=Path)
    parser.add_argument('--stage',choices=['audit','replay','runtime','all'],default='all')
    parser.add_argument('--timeout-seconds',type=int,default=7200)
    args=parser.parse_args()
    lake=args.lake.resolve(strict=True);runtime=lake.parent.parent
    require(not lake.is_symlink(),'supply the installed Lake binary, not an elan proxy')
    out=args.work_dir.resolve();require(not out.exists(),'work directory already exists; preserve prior evidence')
    out.mkdir(parents=True);package=out/'package'
    for directory in ['formalization','src','tests']:
        shutil.copytree(ROOT/directory,package/directory,ignore=shutil.ignore_patterns('.lake','.work','__pycache__'))
    for name in ['TOOLCHAIN.lock','VERIFICATION-TOOLCHAIN.json']:
        shutil.copy2(ROOT/name,package/name)
    formal=package/'formalization'
    env=dict(os.environ,PATH=str(runtime/'bin')+os.pathsep+os.environ.get('PATH',''),LEAN_NUM_THREADS='4',PYTHONDONTWRITEBYTECODE='1')
    for key in ['LEAN_PATH','LEAN_SRC_PATH','LEAN_SYSROOT','PURE_S_CONTAINMENT_ROOT']:env.pop(key,None)
    provenance=json.loads((ROOT/'VERIFICATION-TOOLCHAIN.json').read_text())
    checks=[];results={};counter=0
    def run(label,command,cwd=formal,environment=None,expect=0,timeout=None):
        nonlocal counter
        counter+=1;log=out/f'{counter:03d}-{label}.log'
        print('START',label,flush=True);start=time.time()
        with log.open('w') as stream:
            p=subprocess.run(list(map(str,command)),cwd=cwd,env=environment or env,stdout=stream,stderr=subprocess.STDOUT,timeout=timeout or args.timeout_seconds)
        text=log.read_text(errors='replace')
        checks.append({'label':label,'command':list(map(str,command)),'returncode':p.returncode,'elapsed_seconds':time.time()-start,'log':log.name,'log_sha256':sha(log)})
        require(p.returncode==expect if expect is not None else p.returncode!=0,label+' failed: '+text[-3500:])
        print('PASS',label,round(time.time()-start,2),flush=True);return text
    def snapshot():
        paths=[]
        for directory in [formal,package/'src',package/'tests',runtime/'lib/lean']:
            for p in directory.rglob('*'):
                if not p.is_file() or p.is_symlink() or '__pycache__' in p.parts:continue
                if p.suffix in ['.lean','.py','.json','.toml','.olean','.ilean','.ir'] or p.name == 'FILES' or p.name.endswith(('.olean.server','.olean.private','.ir.sig')):paths.append(p)
        paths += [runtime/'bin'/n for n in ['lean','lake','leanchecker']]
        return {str(p):sha(p) for p in sorted(paths)}
    try:
        run('toolchain',[sys.executable,'-B','scripts/check_toolchain.py','--lake',lake])
        run('inventory',[sys.executable,'-B','scripts/build_inventory.py','--lake',lake])
        if args.stage in ['audit','all']:
            for script,tail in [('audit_sources',[]),('audit_axioms',['--lake',lake]),('audit_all_axioms',['--lake',lake,'--output-json',package/'.work/declaration-census.json']),('audit_public_declarations',['--lake',lake]),('check_public_signatures',['--lake',lake,'--check'])]:
                run(script,[sys.executable,'-B','scripts/'+script+'.py',*tail])
            shutil.copy2(package/'.work/declaration-census.json',out/'declaration-census.json')
            results['audit']='PASS'
        checker=None;link_args=None;compile_args=None
        if args.stage in ['replay','runtime','all']:
            require(args.lean4lean_source is not None,'supply --lean4lean-source for replay or native fixture compilation')
            checker=out/'checker'
            original=args.lean4lean_source.resolve(strict=True)
            verify_git_blobs(original,provenance['lean4lean'])
            verify_git_blobs(original/'.lake/packages/batteries',provenance['lean4lean']['batteries'])
            shutil.copytree(original,checker,symlinks=True,ignore=shutil.ignore_patterns('.lake'))
            shutil.copytree(original/'.lake/packages/batteries',checker/'.lake/packages/batteries',symlinks=True,ignore=shutil.ignore_patterns('.lake'))
            run('checker-build',[lake,'build','lean4lean'],checker)
            verify_git_blobs(checker,provenance['lean4lean'])
            verify_git_blobs(checker/'.lake/packages/batteries',provenance['lean4lean']['batteries'])
            compile_args=shlex.split(json.loads((checker/'.lake/build/ir/Main.c.o.export.trace').read_text())['log'][0]['message'].removeprefix('.> '))
            link_args=shlex.split((checker/'.lake/build/bin/lean4lean.rsp').read_text())
        def native(label,source,imports,objects):
            dest=out/'native';dest.mkdir(exist_ok=True)
            environment=dict(env,LEAN_SYSROOT=str(runtime),LEAN_PATH=os.pathsep.join(map(str,imports)))
            c=dest/(label+'.c');obj=dest/(label+'.o');binary=dest/label
            run(label+'-lean',[runtime/'bin/lean','-o',dest/(label+'.olean'),'-c',c,source],source.parent,environment)
            old_obj=str(checker/'.lake/build/ir/Main.c.o.export');old_c=str(checker/'.lake/build/ir/Main.c')
            require(compile_args.count(old_obj)==compile_args.count(old_c)==1,'unexpected compiler response')
            command=[str(obj) if a==old_obj else str(c) if a==old_c else a for a in compile_args]
            run(label+'-c',command,dest,environment)
            args=[a for a in link_args if not a.endswith('.o.export')]
            run(label+'-link',[runtime/'bin/clang','-o',binary,obj,*objects,*args],dest,environment)
            return binary
        if args.stage in ['replay','all']:
            objects=[Path(a) for a in link_args if a.endswith('.o.export') and a!=str(checker/'.lake/build/ir/Main.c.o.export')]
            require(len(objects)==27,'checker implementation object inventory differs')
            bindings={str(p):sha(p) for p in objects}
            binary=native('lean4lean-exact',package/'src/ExactMain.lean',[checker/'.lake/build/lib/lean',checker/'.lake/packages/batteries/.lake/build/lib/lean'],objects)
            bindings[str(binary)]=sha(binary)
            controls=out/'controls';controls.mkdir();shutil.copy2(package/'src/InvalidProof.lean',controls/'InvalidProof.lean')
            control_env=dict(env,LEAN_SYSROOT=str(runtime),LEAN_PATH=str(controls),LEAN_NUM_THREADS='2')
            run('invalid-proof-compile',[runtime/'bin/lean','-o','InvalidProof.olean','InvalidProof.lean'],controls,control_env)
            for label,executable in [('leanchecker',runtime/'bin/leanchecker'),('lean4lean',binary)]:
                run(label+'-valid',[executable,'--fresh','Init.Prelude'],controls,control_env)
                flags=['--fresh'] if label=='leanchecker' else []
                bad=run(label+'-invalid',[executable,*flags,'InvalidProof'],controls,control_env,expect=None)
                require('(kernel)' in bad and 'type mismatch' in bad and 'False' in bad,'invalid proof did not fail in the kernel')
                run(label+'-missing',[executable,'DefinitelyMissingModule'],controls,control_env,expect=None)
            run('exact-duplicate',[binary,'Init.Prelude','Init.Prelude'],controls,control_env,expect=None)
            sys.path.insert(0,str(package/'src'))
            from grouped_replay import prepare_groups
            from local_workspace import LocalWorkspace
            entries=tuple(x for x in (formal/'FILES').read_text().splitlines() if x and not x.startswith('#'))
            modules=tuple('.'.join(Path(n).with_suffix('').parts) for n in entries if n.endswith('.lean'))
            require(len(modules)==1239 and len(set(modules))==1239,'module inventory differs')
            before=snapshot();(out/'inputs-before.json').write_text(json.dumps(before,indent=2)+'\n')
            prepared=prepare_groups(formal,entries,modules,str(lake),package/'.work/replay-groups',LocalWorkspace(package))
            (out/'coverage.json').write_text(json.dumps(prepared.receipt(),indent=2)+'\n')
            for i,group in enumerate(prepared.groups):
                prepared.verify_unchanged();run('fresh-'+str(i),[runtime/'bin/leanchecker','--fresh','-v',group.module],prepared.output,prepared.environment)
            observed=[]
            replay_env=dict(prepared.environment,LEAN_NUM_THREADS='2')
            for i in range(0,len(modules),40):
                batch=list(modules[i:i+40]);text=run('alternate-'+str(i//40),[binary,*batch],prepared.output,replay_env)
                names=re.findall(r'^passed ([A-Za-z_][A-Za-z_0-9.]*) declarations=\d+$',text,re.M)
                require(names==batch,'incomplete alternate batch');observed+=names
            prepared.verify_unchanged();after=snapshot()
            require(before==after and all(sha(p)==h for p,h in bindings.items()),'replay inputs changed')
            require(observed==list(modules),'alternate inventory differs')
            (out/'inputs-after.json').write_text(json.dumps(after,indent=2)+'\n')
            (out/'checker-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
            results['replay']={'modules':len(modules),'kernel_groups':len(prepared.groups),'alternate_batches':(len(modules)+39)//40}
        if args.stage in ['runtime','all']:
            sys.path.insert(0,str(package/'src'))
            import lean_runtime_checks as validators
            import verify_root_reset_worked_trace as worked
            run('static-library',[lake,'build','PureSFormal:static'])
            archive=formal/'.lake/build/lib/libpure__s__universality_PureSFormal.a'
            require(archive.is_file(),'missing native library')
            binaries={}
            for name in ['RootResetRuntimeDifferential','RootResetArbitraryRuntime','RootResetWorkedTrace']:
                binaries[name]=native(name,package/'tests/lean'/(name+'.lean'),[formal/'.lake/build/lib/lean'],[archive])
            before=snapshot();bindings={str(p):sha(p) for p in [archive,*binaries.values()]}
            (out/'runtime-inputs-before.json').write_text(json.dumps(before,indent=2)+'\n')
            if args.stage == 'all':
                replay_inputs=json.loads((out/'inputs-after.json').read_text())
                for name,digest in replay_inputs.items():
                    if name.endswith(('.lean','.olean','.olean.server','.olean.private')):
                        require(before.get(name)==digest,'runtime source or object differs from kernel replay: '+name)
            for name,(source,tail) in validators.FIXTURES.items():
                command=[binaries[Path(source).stem],*tail] if name in ['differential','arbitrary'] else [lake,'env','lean','--run',package/'tests/lean'/source,*tail]
                text=run(name,command)
                results[name]=validators.VALIDATORS[name](text)
            run('worked-trace',[binaries['RootResetWorkedTrace']])
            trace=out/checks[-1]['log'];report_dir=out/'worked-trace';report_dir.mkdir()
            results['worked-trace']=worked.validate(trace,report_dir)
            run('source-examples',[sys.executable,'-B',package/'src/verify_deterministic_tape_examples.py','--lake',lake],package)
            run('selector-regression',[sys.executable,'-B','scripts/check_response_selector_regressions.py','--lake',lake])
            after=snapshot()
            require(before==after and all(sha(p)==h for p,h in bindings.items()),'runtime inputs changed')
            (out/'runtime-inputs-after.json').write_text(json.dumps(after,indent=2)+'\n')
            (out/'runtime-bindings.json').write_text(json.dumps(bindings,indent=2)+'\n')
        status='PASS'
    except BaseException as error:
        (out/'receipt.json').write_text(json.dumps({'status':'FAIL','stage':args.stage,'checks':checks,'results':results,'error':str(error)},indent=2)+'\n')
        raise
    receipt={'status':status,'stage':args.stage,'checks':checks,'results':results,'source_manifest':{p.relative_to(package).as_posix():sha(p) for p in package.rglob('*') if p.is_file() and not set(p.relative_to(package).parts)&{'.work','.lake','__pycache__'}},'completed_utc':datetime.now(timezone.utc).isoformat()}
    (out/'receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
    print('PASS verification stage',args.stage,'receipt',out/'receipt.json',flush=True)

if __name__=='__main__':main()
