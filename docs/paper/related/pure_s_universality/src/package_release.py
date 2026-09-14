"""Build and validate the sharing ZIP from the sealed public files."""
from pathlib import Path
import hashlib,json,os,subprocess,sys,tempfile,zipfile
from datetime import datetime,timezone
from release_verification import public_files,require,sha
ROOT=Path(__file__).resolve().parents[1]

def main():
    subprocess.run([sys.executable,'-B',str(ROOT/'src/check_package.py'),'--repository'],check=True)
    files=public_files(repository=True)
    target=ROOT/'pure_s_universality_submission.zip'
    temporary=ROOT/'.work/release-package.tmp'
    temporary.parent.mkdir(exist_ok=True)
    before={name:sha(p) for name,p in files.items()}
    with zipfile.ZipFile(temporary,'w',zipfile.ZIP_DEFLATED,compresslevel=9) as archive:
        for name,path in sorted(files.items()):
            info=zipfile.ZipInfo(name,date_time=(2026,9,14,0,0,0))
            info.compress_type=zipfile.ZIP_DEFLATED;info.external_attr=0o100644<<16
            archive.writestr(info,path.read_bytes())
    with zipfile.ZipFile(temporary) as archive:
        require(archive.testzip() is None,'ZIP integrity failure')
        require(set(archive.namelist())==set(files),'archive file inventory differs')
        require(all(hashlib.sha256(archive.read(n)).hexdigest()==h for n,h in before.items()),'archive bytes differ from checked release')
        with tempfile.TemporaryDirectory(prefix='pure-s-release-',dir=ROOT/'.work') as directory:
            destination=Path(directory)
            for name in archive.namelist():
                require((destination/name).resolve().is_relative_to(destination.resolve()),'archive path escapes extraction')
            archive.extractall(destination)
            subprocess.run([sys.executable,'-B',str(destination/'src/check_package.py')],cwd=destination,check=True)
    require(before=={n:sha(p) for n,p in files.items()},'public inputs changed during packaging')
    os.replace(temporary,target)
    record={'status':'PASS','archive':target.name,'sha256':sha(target),'files':len(files),'bytes':target.stat().st_size,'extracted_package_verification':'PASS','public_inputs_unchanged':True,'completed_utc':datetime.now(timezone.utc).isoformat()}
    (ROOT/'.work/release-package.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps(record),flush=True)

if __name__=='__main__':main()
