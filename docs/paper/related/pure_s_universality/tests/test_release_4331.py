"""Rejection controls for the source-bound public release verifier."""
from pathlib import Path
import hashlib,json,shutil,sys,tempfile,unittest
from unittest.mock import patch
ROOT=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(ROOT/'src'))
import release_verification as verifier

class ReleaseIntegrityTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.tmp=tempfile.TemporaryDirectory();cls.root=Path(cls.tmp.name)
        for directory in ['formalization','tests/lean']:
            shutil.copytree(ROOT/directory,cls.root/directory,ignore=shutil.ignore_patterns('.lake','__pycache__'))
        for name in ['TOOLCHAIN.lock','VERIFICATION-TOOLCHAIN.json','src/run_current_verification.py','src/ExactMain.lean','src/InvalidProof.lean','src/grouped_replay.py','src/checker_provenance.py','src/replay_scope.py','src/lean_axiom_report.py','src/verification_runtime.py','src/toolchain_lock.py','src/lean_runtime_checks.py','src/verify_root_reset_worked_trace.py','src/verify_deterministic_tape_examples.py','src/local_workspace.py']:
            target=cls.root/name;target.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(ROOT/name,target)
    @classmethod
    def tearDownClass(cls):cls.tmp.cleanup()
    def test_verified_sources_accepted(self):verifier.source_binding(self.root)
    def test_changed_proof_rejected(self):
        path=self.root/'formalization/PureSFormal/RootResetChallenge.lean';data=path.read_bytes()
        try:
            path.write_bytes(data+b'\n-- changed after verification\n')
            with self.assertRaisesRegex(ValueError,'changed/missing evidence'):verifier.source_binding(self.root)
        finally:path.write_bytes(data)
    def test_missing_module_rejected(self):
        path=self.root/'formalization/PureSFormal.lean';data=path.read_bytes()
        try:
            path.unlink()
            with self.assertRaisesRegex(ValueError,'changed/missing evidence'):verifier.source_binding(self.root)
        finally:path.write_bytes(data)
    def test_unlisted_module_rejected(self):
        path=self.root/'formalization/Unlisted.lean'
        try:
            path.write_text('theorem extra : True := True.intro\n')
            with self.assertRaisesRegex(ValueError,'file set differs'):verifier.source_binding(self.root)
        finally:path.unlink()
    def test_changed_runtime_harness_rejected(self):
        path=self.root/'tests/lean/RootResetOutputRuntime.lean';data=path.read_bytes()
        try:
            path.write_bytes(data+b'\n-- changed\n')
            with self.assertRaisesRegex(ValueError,'changed runtime harness'):verifier.source_binding(self.root)
        finally:path.write_bytes(data)
    def test_changed_appendix_proof_rejected(self):
        path=self.root/'formalization/PureSFormal/AppendixF/AutonomousObstruction.lean';data=path.read_bytes()
        try:
            path.write_bytes(data+b'\n-- changed after verification\n')
            with self.assertRaisesRegex(ValueError,'changed/missing evidence'):verifier.source_binding(self.root)
        finally:path.write_bytes(data)
    def test_choice_not_allowed_in_central_theorem(self):
        original=verifier.read
        def changed(path):
            data=original(path)
            if Path(path).name=='full-declaration-census.json':
                declaration=next(d for d in data['declarations'] if d['declaration']=='PureSFormal.RootResetChallenge.sCombinatorIsRootResetComputationUniversal')
                declaration['axioms'].append('Classical.choice')
            return data
        with patch.object(verifier,'read',side_effect=changed):
            with self.assertRaisesRegex(ValueError,'unexpected safe axiom'):verifier.check_proof_evidence()
    def test_altered_log_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root=Path(tmp);path=root/'replay.log';path.write_text('passed original\n')
            manifest={'replay.log':verifier.sha(path)}
            path.write_text('passed changed\n')
            with self.assertRaisesRegex(ValueError,'changed/missing evidence'):verifier.check_manifest(root,manifest)
    def test_manifest_cannot_escape_package(self):
        for name in ['../outside','/absolute','a/../b','a\\b']:
            with self.subTest(name=name),self.assertRaises(ValueError):verifier.safe_path(self.root,name)
    def test_unknown_safe_axiom_rejected(self):
        original=verifier.read
        def changed(path):
            data=original(path)
            if Path(path).name=='full-declaration-census.json':
                declaration=next(d for d in data['declarations'] if d['safety']=='safe' and d['module']!='Demo')
                declaration['axioms'].append('Invented.axiom')
            return data
        with patch.object(verifier,'read',side_effect=changed):
            with self.assertRaisesRegex(ValueError,'unexpected safe axiom'):verifier.check_proof_evidence()

if __name__=='__main__':unittest.main()
