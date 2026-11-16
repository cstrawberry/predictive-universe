#!/usr/bin/env python3
"""Exact indexed bounded-cost finite T^4 operational network.
No source files are imported or modified. Physical ND-RID receipt/port adapter
is a separate consuming interface, not silently inferred by this constructor.
"""
from fractions import Fraction as F
from itertools import product
from math import sqrt, cos, pi, ceil
from functools import lru_cache

@lru_cache(None)
def directions(R):
    assert isinstance(R,int) and R>=1
    return tuple(s for s in product(range(-2*R,2*R+1),repeat=4)
                 if 0<sum(t*t for t in s)<=4*R*R)

@lru_cache(None)
def construct(n):
    assert isinstance(n,int) and n>=0
    R=n+3; N=8*R**3
    return parameters(R,N)

@lru_cache(None)
def parameters(R,N):
    assert R>=1 and N>4*R and N%2==0
    S=directions(R); A=sum(s[0]**2 for s in S); h=F(1,N)
    rate_total=N*N*(F(4)+F(len(S),A))
    tau=F(1,16*R*R)/rate_total**2
    return {'R':R,'N':N,'h':h,'vertices':N**4,'direction_count':len(S),
            'A':A,'measure_atom':h**4,'microscopic_length':F(2*R,3*N),
            'jump_radius':2*R*h,'total_rate':rate_total,'tick':tau,
            'maximum_horizon':R,'maximum_ticks':int(F(R)/tau),
            'metric_a':F(R,R-1) if R>1 else None,
            'metric_b':F(2*(R+2),3*N)}

def vertex(p,index):
    assert 0<=index<p['vertices']
    N=p['N']; z=[]
    for j in range(4): z.append(index%N);index//=N
    return tuple(z)

def vertex_id(p,z):
    N=p['N']; return sum((z[j]%N)*N**j for j in range(4))

def edge(p,x,i):
    s=directions(p['R'])[i]; N=p['N'];q=sum(t*t for t in s)
    rate=F(N*N,p['A'])+(F(N*N,2) if q==1 else F(0))
    return {'tail':tuple(x),'head':tuple((x[j]+s[j])%N for j in range(4)),
            'direction':s,'squared_displacement_grid':q,
            'dimensionless_weight':{'rational_part':F(1),'sqrt_integer':q,
                                    'sqrt_multiplier':F(1,p['R'])},
            'length':{'rational_part':F(2*p['R'],3*N),
                      'sqrt_integer':q,'sqrt_multiplier':F(2,3*N)},
            'rate':rate,'tick_probability':p['tick']*rate,
            'native_input_alphabet':'Four ready states of the SAME native G port',
            'receipt_target':{'baseline':F(1),'length_receipt':('sqrt',q,p['R'])}}

def rate(p,s):
    return F(p['N']**2,p['A'])+(F(p['N']**2,2) if sum(x*x for x in s)==1 else F(0))

def symbol(p,k):
    N=p['N'];return sum(float(rate(p,s))*(1-cos(2*pi*sum(k[j]*s[j] for j in range(4))/N)) for s in directions(p['R']))

def shortest_lift(p,x,y):
    N=p['N'];return tuple((y[j]-x[j]+N//2)%N-N//2 for j in range(4))

def near_straight_path(p,x,y):
    """Witness for d <= R/(R-1) d_T + 2h(R+2)/3. Exact integer rounding."""
    R=p['R']; assert R>=3
    v=shortest_lift(p,x,y);qnorm=sum(t*t for t in v)
    if not qnorm:return []
    # ceil(sqrt(qnorm)/(2R-2)) without floating-point comparisons.
    q=1;den=2*R-2
    from math import isqrt
    q=max(1,isqrt(qnorm)//den)
    while q*q*den*den<qnorm:q+=1
    # Difference of floors has error <1 per coordinate from v/q.
    points=[tuple((l*t)//q for t in v) for l in range(q+1)]
    increments=[tuple(points[l+1][j]-points[l][j] for j in range(4)) for l in range(q)]
    return [s for s in increments if any(s)]

def as_json(x):
    if isinstance(x,F):return {'numerator':x.numerator,'denominator':x.denominator}
    if isinstance(x,dict):return {k:as_json(v) for k,v in x.items()}
    if isinstance(x,(tuple,list)):return [as_json(v) for v in x]
    return x
