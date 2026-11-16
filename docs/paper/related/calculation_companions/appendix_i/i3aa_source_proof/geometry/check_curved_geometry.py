#!/usr/bin/env python3
from curved_geometry_family import *
from itertools import product
from pathlib import Path
import json, hashlib
import sympy as sp
ROOT=Path(__file__).resolve().parent
A=[]
for i in range(4):
 for sign in (-1,1):
  z=[0]*4;z[i]=sign;A.append(tuple(z))
origin=(0,0,0,0)
V=sorted(set(A)|{tuple(s[i]+t[i] for i in range(4)) for s in A for t in A}-{origin})
assert len(V)==40
Z=[]
for s in A:
 for t in A:
  row=[0]*40;st=tuple(s[i]+t[i] for i in range(4))
  if st!=origin:row[V.index(st)]+=1
  row[V.index(s)]-=1;row[V.index(t)]-=1;Z.append(row)
Zm=sp.Matrix(Z);rank=Zm.rank();assert rank==36
Lin=sp.Matrix([[v[i] for i in range(4)] for v in V]);assert Zm*Lin==sp.zeros(64,4)
assert Lin.T*Lin==22*sp.eye(4)
# Exact polarization checks on Q'_0 restricted to the entire affine kernel.
C=[F(2),F(3),F(4),F(5)];mu=F(3)
def bi(s):return next(i for i in range(4) if s[i])
def b0(s):return C[bi(s)]/mu
def db(s,z,dc,dm):
 i=bi(s)
 return sum(dc[i][j]*(F(z[j])+F(s[j],2)) for j in range(4))/mu-C[i]*sum(dm[j]*z[j] for j in range(4))/mu**2
def dq_linear(p,dc,dm):
 val=F(0)
 for t in A:
  ft=sum(p[i]*t[i] for i in range(4))
  for s in A:
   fs=sum(p[i]*s[i] for i in range(4));dst=fs
   prod1=db(t,origin,dc,dm)*b0(s)+b0(t)*db(s,t,dc,dm)
   prod0=db(t,origin,dc,dm)*b0(s)+b0(t)*db(s,origin,dc,dm)
   val+=F(1,4)*(prod1*dst**2-prod0*fs**2)-F(1,2)*ft*(prod1*dst-prod0*fs)
 return val
ps=[]
for i in range(4):
 p=[0]*4;p[i]=1;ps.append(p)
 for j in range(i+1,4):
  p=[0]*4;p[i]=p[j]=1;ps.append(p)
polarization=0
for source in range(20):
 dc=[[F(0)]*4 for _ in range(4)];dm=[F(0)]*4
 if source<16:dc[source//4][source%4]=F(1)
 else:dm[source-16]=F(1)
 for p in ps:assert dq_linear(p,dc,dm)==0;polarization+=1
# All numerical constants in the global curvature estimate are rational.
bmin=F(1,13824);gap=bmin**2/400;M1=2*10**13;M2=5*10**20;h=F(1,10**27)
assert h*M1+h*h*M2<=gap/2
Cbe=4*M1*M1/gap+M2;Kabs=22*Cbe/bmin
assert Kabs<=10**45
B1=F(3,2)*F(16*10**6,32)+F(1728*25*10**7,32**2)
B2=F(9,4)*F(18*10**10,32)+F(3*16*10**6*25*10**7,32**2)+F(1728*28*10**11,32**2)+F(2*1728*(25*10**7)**2,32**3)
assert B1<=5*10**8 and B2<=10**16
assert 512*54*5*10**8<=M1
assert 512*((5*10**8)**2+54*10**16)<=M2
p=parameters(0);assert p['h']<h and p['N']%8==0
probes=[]
for y in [(F(0),F(0),F(0),F(0)),(F(1,4),F(0),F(0),F(0)),(F(3,8),F(1,4),F(0),F(0)),(F(1,2),F(1,2),F(0),F(0)),(F(3,4),F(0),F(0),F(0))]:
 c=coefficients_iv(y,24)
 assert F(1,3)<c['b'][0]<=c['b'][1]<3
 assert F(1,729)<c['q'][0]<=c['q'][1]<=1
 assert 32<c['mu'][0]<=c['mu'][1]<27648
 assert all(2<x[0]<=x[1]<1728 for x in c['c'])
 # Actual capacity census factor equals mu as an expression, tested with intervals.
 census=scale(mul(power(pi_iv(40),3),c['q']),864)
 assert max(census[0],c['mu'][0])<=min(census[1],c['mu'][1])
 probes.append({'y':serialize(y),'b_interval':serialize(c['b']),'q_interval':serialize(c['q']),'mu_interval':serialize(c['mu'])})
weights=[]
for coords,s in [((0,0,0,0),(p['R'],0,0,0)),((p['N']//4,0,0,0),(0,p['R'],0,0)),((3*p['N']//8,p['N']//4,0,0),(p['R'],p['R'],p['R'],p['R']))]:
 w=receipt_weight_iv(p,coords,s,20)
 assert 1<=w[0]<=w[1]<=40 and w[1]-w[0]<F(1,2**18)
 head=tuple((coords[i]+s[i])%p['N'] for i in range(4));rev=receipt_weight_iv(p,head,tuple(-v for v in s),20)
 assert max(w[0],rev[0])<=min(w[1],rev[1])
 weights.append({'z':coords,'s':s,'weight_interval':serialize(w),'reversal_intervals_overlap':True})
a=F(1,16);bb=F(49,1936) # pi<22/7 gives b=1/(4pi^2)>bb
assert a*a-6*a*bb-3*bb*bb+(a+3*bb)/20<0
record={'finite_BE_dimension4_obstruction':'K < -1/(20 h^2) on the explicit b=1 radius-two test', 'all_pass':True,'radius_two_nonzero_vertices':len(V),'difference_matrix_rank':rank,'affine_kernel_dimension':4,
 'exact_affine_kernel_polarization_checks':polarization,'affine_restriction_gram':'22 I4',
 'explicit_BE_constants':{'b_min':str(bmin),'complement_gap':str(gap),'M1':M1,'M2':M2,'derived_K_abs':str(Kabs),'declared_K_abs':10**45},
 'first_index':serialize(p),'certified_rational_coefficient_probes':probes,'certified_curved_receipt_probes':weights,
 'scope':'Exact algebra and rational enclosures supplement the full analytic proof. Native source/controller qualification is a separate consumer join.'}
(ROOT/'CURVED_GEOMETRY_CHECKS.json').write_text(json.dumps(record,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in record.items() if k not in ['certified_rational_coefficient_probes','certified_curved_receipt_probes','first_index']},indent=2))
