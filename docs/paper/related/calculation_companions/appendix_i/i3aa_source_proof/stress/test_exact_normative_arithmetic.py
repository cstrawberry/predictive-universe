from fractions import Fraction as F
from pathlib import Path
import json,ast
import canonical_matter_source as M
p=Path(__file__).resolve().parent
z=M.certified_time_mesh_bounds('9/10','21/10','7/5','1/100','1/1000','1/100000','1/1000000','1/3')
assert F(z['frozen_H_unitary_error'])==F(21,2000)
assert F(z['expectation_error_from_U'])==F(7,2500000)
assert F(z['between_node_error'])==F(1,100000)*(F(1,100)+2*F(9,10)*F(7,5)/F(1,1000)+F(1,3))
norms=[]
for bits,power in [(16,160),(32,512),(80,2048)]:
 eta=F(1,2**power)
 c=M.canonical_norm_certificate(1,8,(str(eta),str(eta)),2,'40',bits=bits)
 assert c['certified'] and all(F(v)>0 for v in c['upper_bounds'].values())
 norms.append(dict(bits=bits,eta_denominator_power=power,all_norm_bounds_positive=True))
nearest=[]
for q in ast.walk(ast.parse((p/'canonical_matter_source.py').read_text())):
 if isinstance(q,ast.Call) and isinstance(q.func,ast.Attribute) and q.func.attr=='mpf' and isinstance(q.func.value,ast.Name) and q.func.value.id=='mp':nearest.append(q.lineno)
assert nearest==[]
out={'all_pass':True,'exact_rational_time_bounds':z,'positive_tiny_eta_norm_cases':norms,'nearest_mp_mpf_calls_entire_module':nearest}
(p/'EXACT_NORMATIVE_ARITHMETIC_CHECKS.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
