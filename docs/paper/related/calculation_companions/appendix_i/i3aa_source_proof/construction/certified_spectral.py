#!/usr/bin/env python3
"""Terminating rational interval primitives for the FULL native Jacobi modes.
No floating point enters any certificate. Cost may be astronomical.
"""
from fractions import Fraction as F
from math import factorial
import native_master_source as S
B=S.B


def hermites(x,K):
    p=[F(1)]
    if K:p.append(F(x))
    for n in range(2,K+1):p.append(x*p[-1]-(n-1)*p[-2])
    return p

def sturm_less(x,K):
    values=hermites(F(x),K);signs=[1 if v>0 else -1 for v in values if v]
    variations=sum(a!=b for a,b in zip(signs,signs[1:]))
    # With an exact endpoint eigenvalue, return count strictly below it.
    return K-variations-(values[-1]==0)

def root_interval(K,index,bits=30):
    assert K>=2 and 0<=index<K and bits>=1
    lo,hi=F(-2*K),F(2*K);tol=F(1,2**bits)
    while hi-lo>tol:
        mid=(lo+hi)/2;ps=hermites(mid,K);less=sturm_less(mid,K)
        if ps[-1]==0 and less==index:return mid,mid
        if less<=index:lo=mid
        else:hi=mid
    return lo,hi

def hermites_iv(x,K):
    p=[B.ONE]
    if K:p.append(x)
    for n in range(2,K+1):p.append(B.sub(B.mul(x,p[-1]),B.scale(p[-2],n-1)))
    return p

def sqrt_rat(q,bits):return B.sqrt_iv(B.point(q),bits)

def eigenpair(K,index,eta=F(1),h=F(1),bits=30):
    """Q=sqrt(eta/(2h²))J. U_mn=He_m(lambda_n)/sqrt(m!)/norm.
    The Jacobi spectrum is simple because every subdiagonal is nonzero.
    Refinement handles cancellation; no guessed spectral-gap lower bound.
    """
    assert eta>0 and h>0
    precision=bits+16
    while True:
        lam=root_interval(K,index,precision)
        polys=hermites_iv(lam,K-1)
        raw=[B.div(polys[m],sqrt_rat(F(factorial(m)),precision+8)) for m in range(K)]
        norm2=B.ONE
        for r in raw[1:]:norm2=B.add(norm2,B.square(r))
        norm=B.sqrt_iv(norm2,precision+8)
        vec=[B.div(r,norm) for r in raw]
        value=B.mul(sqrt_rat(eta/(2*h*h),precision+8),lam)
        if max([value[1]-value[0]]+[v[1]-v[0] for v in vec])<F(1,2**bits):
            return {'value':B.rounded(value,bits+2),'vector':[B.rounded(v,bits+2) for v in vec],
                    'unscaled_root':lam,'certified_bits':bits,'working_bits':precision}
        precision*=2

def all_eigenpairs(K,eta=F(1),h=F(1),bits=30):
    return [eigenpair(K,j,eta,h,bits) for j in range(K)]

# Rectangular complex intervals represented (real_interval, imaginary_interval).
Z=(B.ZERO,B.ZERO);ONE=(B.ONE,B.ZERO)
def cpoint(re=0,im=0):return B.point(re),B.point(im)
def cadd(a,b):return B.add(a[0],b[0]),B.add(a[1],b[1])
def cneg(a):return B.neg(a[0]),B.neg(a[1])
def cmul(a,b):return B.sub(B.mul(a[0],b[0]),B.mul(a[1],b[1])),B.add(B.mul(a[0],b[1]),B.mul(a[1],b[0]))
def cscale(a,q):return B.scale(a[0],q),B.scale(a[1],q)
def cconj(a):return a[0],B.neg(a[1])
def cabound(a):return max(abs(v) for v in a[0])+max(abs(v) for v in a[1])
def identity(n):return [[ONE if i==j else Z for j in range(n)] for i in range(n)]
def mmul(A,C):
    n=len(A);m=len(C[0]);inner=len(C)
    return [[csum(cmul(A[i][k],C[k][j]) for k in range(inner)) for j in range(m)] for i in range(n)]
def csum(values):
    out=Z
    for v in values:out=cadd(out,v)
    return out

def matrix_exp(A,tolerance=F(1,2**30)):
    """Interval Taylor with rigorous infinity-row-norm remainder.
    All exact matrices in the input interval box are enclosed.
    """
    assert tolerance>0
    n=len(A);norm=max(sum(cabound(v) for v in row) for row in A)
    if norm==0:return identity(n),F(0),0
    exp_upper=3**S.ceil_fraction(norm)
    L=0;tail=exp_upper*norm
    while tail>tolerance:
        L+=1;tail=exp_upper*norm**(L+1)/factorial(L+1)
    term=identity(n);out=identity(n)
    for k in range(1,L+1):
        term=[[cscale(x,F(1,k)) for x in row] for row in mmul(term,A)]
        out=[[cadd(out[i][j],term[i][j]) for j in range(n)] for i in range(n)]
    pad=(-tail,tail)
    out=[[(B.add(v[0],pad),B.add(v[1],pad)) for v in row] for row in out]
    return out,tail,L

def propagate_frozen(H_at,times,eta,tolerance):
    """Finite interval products. Caller adds rigorous Duhamel freeze error.
    H_at(t,bits) returns the actual full-native matrix, not a target table.
    """
    assert eta>0 and tolerance>0 and len(times)>=2
    H=H_at(times[0]);n=len(H);U=identity(n);steps=len(times)-1
    for a,b in zip(times,times[1:]):
        H=H_at(a);A=[[cmul(cpoint(0,-(b-a)/eta),x) for x in row] for row in H]
        E,_,_=matrix_exp(A,tolerance/steps)
        U=mmul(E,U)
    return U

def time_mesh_bound(BH1,BO,BO1,BH,eta,mesh_width,classical_derivative):
    freeze=BH1*mesh_width/(2*eta)
    node_expectation_error=2*BO*freeze
    between=(BO1+2*BH*BO/eta+classical_derivative)*mesh_width
    return {'propagator_freeze_error':freeze,'expectation_freeze_error':node_expectation_error,
            'between_node_error':between,'total_extra':node_expectation_error+between}
