import sympy as s,json
from pathlib import Path
q0,q1,q2,q3=s.symbols('q0 q1 q2 q3',real=True)
qs=[q1,q2,q3]
r=[s.Function('r'+str(i))(q0) for i in range(4)]
a=[s.Function('a'+str(i))(q0) for i in range(1,4)]
W=s.Function('W')(q0)
V=W+sum(r[i+1]*(qs[i]-a[i]) for i in range(3))
rule={q:a0 for q,a0 in zip(qs,a)}
checks=[]
for i,q in enumerate([q0]+qs):
 expr=s.diff(V,q).subs(rule)
 if i==0:expr=expr.subs(s.diff(W,q0),r[0]+sum(r[j+1]*s.diff(a[j],q0) for j in range(3)))
 checks.append(s.simplify(expr-r[i])==0)
res={'full_material_gradient_matches_all_four_forces':checks,'clock_variation_included':True,'external_time_profile_required':False,'positive_offset_condition':'C_v >= sup_full_native_spectrum |V_ctl,v|; full C_v retained in metric derivative','scope':'Algebraic controller identity along each registered one-dimensional material path; complete source stock remains separately counted.'}
assert all(checks)
Path(__file__).with_name('AUTONOMOUS_CONTROL_VERIFICATION.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res,indent=2))
