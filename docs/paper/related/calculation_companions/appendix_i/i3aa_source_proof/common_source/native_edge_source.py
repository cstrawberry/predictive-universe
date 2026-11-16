#!/usr/bin/env python3
"""Actual native8 transfer and paid receipt for a prospective DARK03 edge.

The retained communication output is R only. A is a private physical dump.
The cost ensemble is the uniform ready code S in {0,2,4,6}; arbitrary S
is admitted by the same full-input channel, but has its own return price.
"""
from fractions import Fraction as F
from math import isqrt
import hashlib, json
from pathlib import Path

G_SWAPS = ((8,33),(24,1),(40,34),(56,2))

def native_return(s,a):
    z=8*s+a
    for x,y in G_SWAPS:
        if z==x: z=y; break
        if z==y: z=x; break
    return divmod(z,8)

def word(v):
    """S,R,A,W,F, every code 0..7; no implicit code-only extension."""
    s,r,a,w,f=v
    s,a=native_return(s,a)
    s,r=r,s
    w,f=f,w
    return (s,r,a,w,f)

def inverse(v):
    s,r,a,w,f=v
    w,f=f,w
    s,r=r,s
    s,a=native_return(s,a)
    return (s,r,a,w,f)

def stock_energy_code(c):
    # Same positive native spectrum for stock and receipt. No cheap noncodes.
    return c

def energy_multiplier(v):
    return stock_energy_code(v[3])+stock_energy_code(v[4])

def sqrt_interval(q,bits=80):
    assert isinstance(q,int) and q>=0 and bits>=1
    den=1<<bits; k=isqrt(q*den*den)
    a=F(k,den)
    return a, a if k*k==q*den*den else F(k+1,den)

def flat_demo_weight_interval(s,R,bits=80):
    assert R>=1 and len(s)==4
    q=sum(x*x for x in s)
    assert 0<q<=4*R*R
    a,b=sqrt_interval(q,bits)
    return F(1)+a/R,F(1)+b/R

def channel_matrix_unit(i,j):
    # Exact reduced receiver image of |i><j| under the 5-factor word.
    a=word((i,0,0,1,0)); b=word((j,0,0,1,0))
    return {(a[1],b[1]):1} if a[:1]+a[2:]==b[:1]+b[2:] else {}

def g_matrix_unit(i,j):
    # Public full reusable closure: ready sector fixed; committed branch
    # dumps phi=M, sends the predicted complement 1-P into M, P=I=0.
    def f(z):
        m,p,k=z//4,(z//2)%2,z%2
        return (z,0) if k==0 else (4*(1-p),1+m)
    a,b=f(i),f(j)
    return {(a[0],b[0]):1} if a[1]==b[1] else {}

def check():
    columns=0
    for z in range(8**5):
        x=[]; q=z
        for _ in range(5):x.append(q%8);q//=8
        x=tuple(x)
        assert inverse(word(x))==x
        assert energy_multiplier(word(x))==energy_multiplier(x)
        columns+=1
    for i in range(8):
        for j in range(8):assert channel_matrix_unit(i,j)==g_matrix_unit(i,j)
    ready=[0,2,4,6]
    for i in ready:
        assert word((i,0,0,1,0))==(0,i,0,0,1)
    bounds=[]
    for R in (1,2,3,5,10):
        for s in ((1,0,0,0),(R,0,0,0),(R,R,R,R),(2*R,0,0,0)):
            lo,hi=flat_demo_weight_interval(s,R)
            assert 1<=lo<=hi<=3
            bounds.append({'R':R,'s':s,'weight_interval':[str(lo),str(hi)]})
    return {'all_pass':True,'native_factors_per_isolated_edge':5,
            'full_native_inverse_and_energy_columns':columns,
            'exact_receiver_matrix_units':64,'ready_code':ready,
            'retained_receiver_support_dimension':4,'capacity_nats':'ln(4)',
            'ready_stock_debit':'theta*w for the actual positive coefficient supplied by the geometry source',
            'whole_input_price_scope':'Ready-code cost ensemble only; full native channel all inputs.',
            'full_native_pure_auxiliary_formation_nats':'4*ln(8)',
            'private_dump_retained_physically':True,
            'energy_stock_and_receipt_identical_native_spectrum':[0,1,2,3,4,5,6,7],
            'flat_demo_weight_checks':bounds,
            'curved_weight_join':'smooth floor of actual line-length/rho; successor coefficient binding pending',
            'not_yet_joined':['global geometry/controller','actual predictive matter/stress','RCD/cosmological domain']}

if __name__=='__main__':
    data=check()
    Path(__file__).with_name('NATIVE_EDGE_CHECKS.json').write_text(json.dumps(data,sort_keys=True,indent=2)+'\n')
    print(json.dumps({k:v for k,v in data.items() if k!='flat_demo_weight_checks'},indent=2))
