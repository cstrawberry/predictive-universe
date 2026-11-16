#!/usr/bin/env python3
from pathlib import Path
from fractions import Fraction as F
import importlib.util,sys,json,math
import sympy as S
import mpmath as mp
sys.dont_write_bytecode=True
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT))
import candidate_registry as R
import candidate_intervals as C
import source_task_certificate as T
out={}
# Derive every generic covariant Einstein component symbolically.
t,x,y,z=S.symbols('t x y z',real=True);cs=[t,x,y,z]
B=S.Function('B')(t,x);B0=S.Function('B0')(t,x);delta=B-B0
metric=S.diag(-1,S.exp(2*B),S.exp(2*B),S.exp(2*B));inv=metric.inv()
Gamma=[[[S.simplify(sum(inv[k,l]*(S.diff(metric[l,i],cs[j])+S.diff(metric[l,j],cs[i])-S.diff(metric[i,j],cs[l])) for l in range(4))/2) for j in range(4)] for i in range(4)] for k in range(4)]
Ric=S.Matrix(4,4,lambda i,j:S.simplify(sum(S.diff(Gamma[k][i][j],cs[k])-S.diff(Gamma[k][i][k],cs[j])+sum(Gamma[k][k][m]*Gamma[m][i][j]-Gamma[k][j][m]*Gamma[m][i][k] for m in range(4)) for k in range(4))))
Ein=S.simplify(Ric-metric*S.trace(inv*Ric)/2)
f00,f01,f11,f22,V=[S.Function(n)(t,x) for n in ['f00','f01','f11','f22','V']]
f=S.Matrix([[f00,f01,0,0],[f01,f11,0,0],[0,0,f22,0],[0,0,0,f22]])
tr=f11+2*f22;stress=f-metric*(S.trace(inv*f)/2+V);E=Ein-stress
em=S.exp(-2*B);ep=S.exp(2*B);dem=em-S.exp(-2*B0);dep=ep-S.exp(2*B0)
dt=S.diff(delta,t);dx=S.diff(delta,x);bt=S.diff(B0,t);bx=S.diff(B0,x)
common=-ep*(2*S.diff(delta,t,2)+6*bt*dt+3*dt**2)-dep*(2*S.diff(B0,t,2)+3*bt**2+f00/2-V)
expected={(0,0):3*(2*bt*dt+dt**2)-em*(2*S.diff(delta,x,2)+2*bx*dx+dx**2)-dem*(2*S.diff(B0,x,2)+bx**2+tr/2),(0,1):-2*S.diff(delta,t,x),(1,1):common+2*bx*dx+dx**2,(2,2):common+S.diff(delta,x,2),(3,3):common+S.diff(delta,x,2)}
for (a,b),q in expected.items():assert S.simplify(S.expand(E[a,b]-E[a,b].subs(B,B0).doit()-q))==0,(a,b)
for a,b in [(0,2),(0,3),(1,2),(1,3),(2,3)]:assert E[a,b]==0
# Generic material equations for the same fixed source tensor.
EL=[]
for a in range(4):
 div=S.exp(-3*B)*sum(S.diff(S.exp(3*B)*sum(f[a,b]*inv[mu,b] for b in range(4)),cs[mu]) for mu in range(4))
 rhs=sum(S.diff(f[b,c],cs[a])*inv[b,c] for b in range(4) for c in range(4))/2+S.diff(V,cs[a])
 EL.append(S.simplify(div-rhs))
for a,(fa0,fa1) in enumerate([(f00,f01),(f01,f11)]):
 q=-3*dt*fa0+dem*(S.diff(fa1,x)+bx*fa1-S.diff(tr,cs[a])/2)+em*dx*fa1
 assert S.simplify(S.expand(EL[a]-EL[a].subs(B,B0).doit()-q))==0
assert EL[2]==EL[3]==0
out['generic_covariant_Einstein_residual_identities']=True
out['generic_all_material_residual_identities']=True
# Construct a genuinely nonzero mixed Bernstein/Fourier code, not just code1.
r=R.Registry(2);d=r.degree;coeff=[[F(0)]*(d+1) for _ in r.modes]
coeff[0]=[R.AMP*F(j+1,128) for j in range(d+1)]
coeff[1]=[R.AMP*F(v,1024) for v in [1,0,-1,0]]
coeff[2]=[R.AMP*F(1,2048)]*(d+1)
index=0;pos=0
for row in coeff:
 for v in row:
  a=v/r.step;assert a.denominator==1;a=int(a)
  digit=0 if a==0 else (2*a-1 if a>0 else -2*a)
  assert R.signed_digit(digit)==a
  index+=digit*r.radix**pos;pos+=1
c=r.decode(index);assert c.coefficients==coeff and c.valid_shape
out['nonzero_mixed_candidate']={'level':2,'index':str(index),'valid_shape':True}
mp.mp.dps=100
mf=lambda f:mp.mpf(f.numerator)/f.denominator
def eta(v):return mp.exp(-1/v) if v>0 else mp.mpf('0')
def chi(v):return mp.mpf('0') if v<=0 else (mp.mpf('1') if v>=1 else eta(v)/(eta(v)+eta(1-v)))
def bb(tt,xx):
 ss=tt-1;qq=mp.mpf('0')
 for (kind,k),row in zip(r.modes,coeff):
  pol=sum(mf(v)*math.comb(d,j)*ss**j*(1-ss)**(d-j) for j,v in enumerate(row))
  qq+=pol*(mp.cos(k*xx) if kind=='cos' else mp.sin(k*xx))
 return mp.log(tt)+tt*mp.cos(xx)/100+chi(8*(tt-1))*chi(8*(2-tt))*qq
checks=0
for tt,xx in [(F(129,128),F(1,3)),(F(17,16),F(4,5)),(F(9,8),F(1,7)),(F(3,2),F(11,10)),(F(31,16),F(2,3))]:
 for a in range(5):
  for b in range(5-a):
   actual=mp.diff(lambda ta:mp.diff(lambda xa:bb(ta,xa),mf(xx),b),mf(tt),a)
   iv=C.B_derivative(c,(tt,tt),(xx,xx),a,b,bits=60)
   assert mf(iv[0])-mp.mpf('1e-70')<=actual<=mf(iv[1])+mp.mpf('1e-70'),(tt,a,b,actual,iv)
   checks+=1
out['high_precision_candidate_jet_probes']=checks
# Endpoint flatness and actual shrinking tail enclosures.
for endpoint in [F(1),F(2)]:
 for a in range(7):
  for b in range(7-a):assert C.delta_derivative(c,(endpoint,endpoint),(F(0),F(1)),a,b,40)==(0,0)
out['exact_flat_endpoint_all_mixed_C6']=True
# Check Jet arithmetic against exact rational polynomial calculus.
u,v=S.symbols('u v');poly=2+u+2*v+u*u+u*v+v**3
pt={u:S.Rational(1,7),v:S.Rational(2,9)}
def exactjet(expr,n=4):
 return T.from_derivatives(n,100,lambda a,b:(F(S.diff(expr,u,a,v,b).subs(pt)),)*2)
j=exactjet(poly)
for expr,jj in [(1/poly,j.inv()),(poly**2,j*j)]:
 for a in range(3):
  for b in range(3-a):
   actual=F(S.diff(expr,u,a,v,b).subs(pt));iv=jj.actual(a,b);assert iv[0]<=actual<=iv[1]
# exp jets are checked with high precision, including mixed coefficients.
je=j.exp()
for a in range(3):
 for b in range(3-a):
  actual=mp.mpf(str(S.N(S.diff(S.exp(poly),u,a,v,b).subs(pt),90)));iv=je.actual(a,b)
  assert mf(iv[0])<=actual<=mf(iv[1])
out['Jet_reciprocal_product_exp_checks']=True
# Actual finite task witness.
base=T.certify(r.decode(0),F(1,10),panels=2,bits=24,order=2)
assert base['accepted'] and F(base['residual_upper'])==0
nonzero=T.certify(r.decode(1),F(1,10),panels=2,bits=24,order=2)
assert nonzero['accepted']
out['actual_task_base']=base;out['actual_task_nonzero']=nonzero
out['all_pass']=True
out['scope']='Symbolic Einstein and material residual identities, candidate jet probes and the finite task certificate; the physical price and Hamiltonian are computed in construction/.'
(ROOT/'EINSTEIN_RESIDUAL_CHECKS.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='nonzero_mixed_candidate'},indent=2))
