#!/usr/bin/env python3
from geometry_family import *
from pathlib import Path
from random import Random
from fractions import Fraction
from itertools import product
import json, math, hashlib, numpy as np
ROOT=Path(__file__).resolve().parent
rng=Random(70305); checks={}
for n in range(3):
 p=construct(n);S=directions(p['R']);A=p['A'];
 Sset=set(S);assert all(tuple(-x for x in s) in Sset for s in S)
 for i in range(4):
  for j in range(4):
   cov=F(sum(s[i]*s[j] for s in S),A)+int(i==j)
   assert cov==2*int(i==j)
 assert sum((p['tick']*rate(p,s) for s in S),F(0))==p['tick']*p['total_rate']<1
 for trial in range(30):
  x=tuple(rng.randrange(p['N']) for _ in range(4));y=tuple(rng.randrange(p['N']) for _ in range(4));path=near_straight_path(p,x,y)
  assert all(0<sum(z*z for z in s)<=4*p['R']**2 for s in path)
  v=shortest_lift(p,x,y);assert tuple(sum(s[j] for s in path) for j in range(4))==v
  cost=sum((2/(3*p['N']))*(p['R']+math.sqrt(sum(z*z for z in s))) for s in path)
  euclid=math.sqrt(sum(z*z for z in v))/p['N']
  assert euclid-1e-12<=cost<=float(p['metric_a'])*euclid+float(p['metric_b'])+1e-12
 checks[str(n)]={'N':p['N'],'vertices':p['vertices'],'directions':len(S),'A':A,'exact_covariance':True,'exact_scheduler_probabilities':True,'rounded_paths':30}
# Complete small finite graph, including all frequencies. This stress-tests the
# same total formulas at R=1, outside the R>=3 continuum indexing only.
p=parameters(1,6);N=p['N'];shape=(N,)*4;kernel=np.zeros(shape)
for s in directions(1):kernel[tuple(x%N for x in s)]+=float(rate(p,s))
lam=float(p['total_rate'])-np.fft.fftn(kernel).real
K=np.array(list(product(range(N),repeat=4)))
for k0 in K:
 k=tuple(int(z if z<N//2 else z-N) for z in k0);l=lam[tuple(k0)];q=sum(z*z for z in k)
 assert 8*q-1e-8<=l<=4*math.pi**2*q+1e-8
# Global pointwise Gamma2 identity on every vertex for a nontrivial random f.
f=np.random.default_rng(3).normal(size=shape)
def shift(f,s):return np.roll(f,tuple(-z for z in s),axis=(0,1,2,3))
def L(f):return sum(float(rate(p,s))*(shift(f,s)-f) for s in directions(1))
def Gamma(f,g):return sum(.5*float(rate(p,s))*(shift(f,s)-f)*(shift(g,s)-g) for s in directions(1))
g2=.5*L(Gamma(f,f))-Gamma(f,L(f));rhs=np.zeros(shape)
for s in directions(1):
 for t in directions(1):
  dd=shift(f,tuple(s[i]+t[i] for i in range(4)))-shift(f,s)-shift(f,t)+f
  rhs+=.25*float(rate(p,s)*rate(p,t))*dd*dd
err=float(np.max(np.abs(g2-rhs))); assert err<1e-6 and float(np.min(g2))>=-1e-6
checks['complete_graph']={'R':1,'N':N,'vertices':N**4,'all_frequency_bounds':True,'all_vertex_Gamma2_identity_max_abs_error':err,'Gamma2_min':float(np.min(g2))}
checks['scope']='Finite checks supplement the full indexed proof; they do not infer continuum or physical MPU realization from samples.'
checks['all_pass']=True
(ROOT/'FLAT_GEOMETRY_CHECKS.json').write_text(json.dumps(checks,indent=2,sort_keys=True)+'\n')
print(json.dumps(checks,indent=2,sort_keys=True))
