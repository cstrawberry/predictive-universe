#!/usr/bin/env python3
"""Regression: fixed Taylor pads caused false failure even for scalar evolution."""
from pathlib import Path
import sys,json
sys.dont_write_bytecode=True
import certify_history as H
import certified_spectral as C
F=C.F
T={'operator':lambda t:[[C.cpoint(200)]],'comparison':lambda t:C.cpoint(200),'BO':F(200),'BO1':F(0),'reference_derivative':F(0)}
r=H.certify(lambda t:[[C.cpoint(10)]],[[C.ONE]],[T],F(1),F(10),F(0),F(50),arithmetic_tolerance=F(50,2**80*201))
assert r['accepted']
bound=C.B.rounded((r['test_error_bounds'][0],r['test_error_bounds'][0]),24)
out={'all_pass':True,'actual_H':10,'actual_O':200,'rho':1,'true_difference':0,'certified':r['accepted'],
     'node_count':r['node_count'],'test_error_bound_outward':[str(v) for v in bound],
     'arithmetic_tolerance':str(F(50,2**80*201)),'outward_rounding_bits':r['outward_arithmetic_rounding_bits'],
     'scope':'Nonzero scalar direct-U regression; not actual enormous canonical row'}
Path(__file__).with_name('HISTORY_TAIL_CHECKS.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
