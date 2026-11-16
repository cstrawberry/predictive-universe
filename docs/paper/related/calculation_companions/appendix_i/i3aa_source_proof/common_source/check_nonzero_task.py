#!/usr/bin/env python3
from pathlib import Path
import json
from fractions import Fraction as F
import source_task_certificate as S
r=S.certify(S.C.R.Registry(2).decode(1),F(1,10),panels=2,bits=48)
assert r['accepted'] and 0<F(r['residual_upper'])<F(1,10)
Path(__file__).with_name('NONZERO_TASK_WITNESS.json').write_text(json.dumps(r,sort_keys=True,indent=2)+'\n')
print(json.dumps({'nonzero_candidate_actual_task_pass':True,'level':2,'code':1,'C2_upper':r['residual_upper']}))
