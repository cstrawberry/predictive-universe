import math,json
from pathlib import Path
from fractions import Fraction
import numpy as np
from canonical_matter_source import *
p=Path(__file__).resolve().parent
rng=np.random.default_rng(441)
src=CanonicalMatterSource(J=1,K=8,eta=.001,control=True)
herm=[];metric=[]
for k in range(12):
 a=rng.integers(0,8,4).tolist();b=list(a)
 for idx in rng.choice(4,size=k%3,replace=False):b[idx]=int(rng.integers(0,8))
 r=src.encode(a);c=src.encode(b);t=1.3+.03*k
 ab=src.entry(r,c,t);ba=src.entry(c,r,t)
 herm.append(abs(ab-ba.conjugate()))
 m=target_metric(t,0);dg=np.array([[.2,.03,0],[.03,-.1,.02],[0,.02,.1]])
 direct=src.metric_derivative_entry(r,c,t,0,dN=.13,dbeta=[.02,0,-.01],dgamma=dg)
 step=1e-5
 def shifted(s):return dict(N=m['N']+.13*s,beta=np.array([.02,0,-.01])*s,gamma=m['gamma']+s*dg)
 fd=(src.entry(r,c,t,{0:shifted(step)})-src.entry(r,c,t,{0:shifted(-step)}))/(2*step)
 metric.append(float(abs(fd-direct)/(1+abs(direct))))
assert max(herm)<1e-8 and max(metric)<1e-7
bounds=residual_uniform_bounds(5)
profile=make_candidate_controller(5,lambda t,x:target_metric(t,x)['b'],lambda t,x:1/t+EPS*math.cos(x),bounds['simple_each_upper'],'base-profile-check')
res=max(np.max(abs(profile.residual(t,x,5)-residual_density(t,x,5))) for t in [1,1.3,1.8,2] for x in [.1,.7,2.2])
assert res<1e-12
# A genuinely different candidate: b=b* exp(delta*(t-1)), Bt=Bt*+delta.
delta=.001
bfun=lambda t,x:target_metric(t,x)['b']*math.exp(delta*(t-1))
btfun=lambda t,x:1/t+EPS*math.cos(x)+delta
cand=make_candidate_controller(5,bfun,btfun,bounds['simple_each_upper']+1,'different-candidate')
candidate_diff=float(np.linalg.norm(cand.residual(1.4,.7,5)-profile.residual(1.4,.7,5)))
assert candidate_diff>1e-5
# Coefficient interval tests use exact rational input endpoints, including joins.
widths=[]
for t in ['1/2','9/10','1','3/2','2','21/10','3']:
 z=positive_extended_f_interval((t,t),('7/10','7/10'),bits=40)
 widths.extend(float(Fraction(b)-Fraction(a)) for a,b in z['entries'].values())
assert max(widths)<1e-20
rr=lambda tb,xb,J,bits:candidate_residual_interval(tb,xb,J,target_b_interval,target_Bt_interval,bits)
wi=control_W_enclosure(('3/2','3/2'),('7/10','7/10'),5,rr,str(bounds['simple_each_upper']),bits=4,max_panels=4096)
assert wi['certified']
num=control_W(1.5,.7,5);lo,hi=map(Fraction,wi['interval'])
assert float(lo)<num<float(hi)
report=dict(full_native_inventory=src.inventory(),max_hermiticity_error=max(herm),
 max_relative_actual_metric_derivative_error=max(metric),candidate_base_residual_replay_error=res,
 different_candidate_changes_actual_force_density=candidate_diff,
 max_coefficient_interval_width=max(widths),executed_control_interval=wi,numerical_control_integral=num,
 coverage='Actual all-state entry/metric derivative smoke checks, candidate residual map, executed outward coefficient/control interval primitives. Not a large finite-U history replay.')
(p/'CANONICAL_SOURCE_MODULE_VERIFICATION.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
