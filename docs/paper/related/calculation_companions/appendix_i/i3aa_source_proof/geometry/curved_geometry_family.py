#!/usr/bin/env python3
"""Total indexed warped family and certified rational coefficient/edge enclosures.
All transcendental values denote the explicit computable real functions in the
proof. This evaluator uses rational Taylor bounds, never floating precision as
an exact sign oracle.
"""
from fractions import Fraction as F
from math import isqrt, factorial
from functools import lru_cache

ZERO=(F(0),F(0)); ONE=(F(1),F(1))
def rounded(a,bits):
    D=2**bits
    lo=(a[0]*D).numerator//(a[0]*D).denominator
    z=a[1]*D;hi=-((-z.numerator)//z.denominator)
    return F(lo,D),F(hi,D)
def point(x):x=F(x);return x,x
def add(a,b):return a[0]+b[0],a[1]+b[1]
def neg(a):return -a[1],-a[0]
def sub(a,b):return add(a,neg(b))
def mul(a,b):
    v=[x*y for x in a for y in b];return min(v),max(v)
def inv(a):
    assert a[0]>0;return 1/a[1],1/a[0]
def div(a,b):return mul(a,inv(b))
def scale(a,c):return mul(a,point(c))
def square(a):
    return (F(0) if a[0]<=0<=a[1] else min(a[0]**2,a[1]**2),max(a[0]**2,a[1]**2))
def power(a,k):
    assert k>=0
    z=ONE
    for _ in range(k):z=mul(z,a)
    return z

def exp_point(x,bits):
    x=F(x);eps=F(1,2**bits)
    if x<0:
        if -x>=bits+4:return F(0),F(1,2**(bits+4))
        return rounded(inv(exp_point(-x,bits+8)),bits+4)
    if x==0:return ONE
    k=max(1,(x.numerator+x.denominator-1)//x.denominator);y=x/k
    term=F(1);val=term;j=0
    # exp(y), 0<=y<=1; tail after degree j at most 2/(j+1)!.
    target=eps/F(8*k*3**k)
    while F(2,factorial(j+1))>target:
        j+=1;term*=y/j;val+=term
    err=F(2,factorial(j+1))
    return rounded((val**k,(val+err)**k),bits+4)

def exp_iv(a,bits):return exp_point(a[0],bits+4)[0],exp_point(a[1],bits+4)[1]

def log_point(x,bits):
    x=F(x);assert F(1,2)<=x<=F(5,2)
    z=(x-1)/(x+1);r=abs(z);term=z;v=F(0);k=0;eps=F(1,2**bits)
    while True:
        v+=2*term/(2*k+1);k+=1;term*=z*z
        err=2*r**(2*k+1)/((2*k+1)*(1-r*r))
        if err<=eps:return rounded((v-err,v+err),bits+4)

@lru_cache(None)
def pi_iv(bits):
    def atan(q):
        q=F(q);v=F(0);j=0;eps=F(1,2**(bits+8))
        while True:
            v+=(-1)**j*q**(2*j+1)/(2*j+1);j+=1
            err=q**(2*j+1)/(2*j+1)
            if err<=eps:return rounded((v-err,v+err),bits+4)
    return rounded(sub(scale(atan(F(1,5)),16),scale(atan(F(1,239)),4)),bits+4)

def cos_iv(a,bits):
    mid=(a[0]+a[1])/2;rad=(a[1]-a[0])/2;term=F(1);v=term;j=0;eps=F(1,2**bits)
    while True:
        err=abs(mid)**(2*j+2)/factorial(2*j+2)
        if err<=eps:return rounded((max(F(-1),v-err-rad),min(F(1),v+err+rad)),bits+4)
        j+=1;term*=-mid*mid/((2*j-1)*(2*j));v+=term

def eta_iv(x,bits):
    x=F(x)
    return ZERO if x<=0 else exp_point(-1/x,bits)

def chi_iv(x,bits):
    x=F(x)
    if x<=0:return ZERO
    if x>=1:return ONE
    a,b=eta_iv(x,bits+12),eta_iv(1-x,bits+12)
    return rounded(div(a,add(a,b)),bits+4)

def b_iv(y,bits=40):
    y=tuple(F(z)%1 for z in y);t=4*y[0]
    if t<=F(1,2) or t>=F(5,2):return ONE
    psi=mul(chi_iv(2*t-1,bits+20),chi_iv(5-2*t,bits+20))
    x=scale(pi_iv(bits+20),2*y[1]);cosx=cos_iv(x,bits+20)
    u=mul(psi,add(log_point(t,bits+20),scale(cosx,t/100)))
    return rounded(exp_iv(rounded(u,bits+18),bits+12),bits+8)

def coefficients_iv(y,bits=40):
    b=b_iv(y,bits+12);p=pi_iv(bits+12);p3=power(p,3);b3=power(b,3)
    mu=scale(mul(p3,b3),32)
    c0=scale(mul(p3,b3),2)
    cj=scale(mul(p,b),8)
    return {'b':rounded(b,bits+4),'q':rounded(scale(b3,F(1,27)),bits+4),'mu':rounded(mu,bits+4),'c':tuple(rounded(c,bits+4) for c in (c0,cj,cj,cj))}

def parameters(n):
    assert isinstance(n,int) and n>=0
    R=80*2**n;N=8*10**28*R**3;h=F(1,N);rho=R*h;Q=432/h**2
    return {'n':n,'R':R,'N':N,'h':h,'rho':rho,'vertices':N**4,
            'metric_degree':(2*R+1)**4-1,'diffusion_degree':8,
            'exit_rate_bound':Q,'tick':F(1,16*R*R)/Q**2,
            'curvature_lower_bound':-10**45,
            'metric_alpha':F(80,3*R)+6*10**6*rho,
            'metric_beta':40*h+9*10**6*rho**2+rho,
            'source_capacity_mode':'q=b^3/27, C=q ln4, m=h^4*108*(2pi)^3*C/ln4',
            'source_metric_mode':'required receipt w=max(1,ell_g/(R h))',
            'diffusion_mode':'eight coordinate transfers only; distinct nominated mode'}

def vertex(p,index):
    assert 0<=index<p['vertices'];N=p['N'];z=[]
    for _ in range(4):z.append(index%N);index//=N
    return tuple(z)

def direction(p,index):
    R=p['R'];B=2*R+1;zero=(B**4-1)//2
    assert 0<=index<p['metric_degree']
    if index>=zero:index+=1
    s=[]
    for _ in range(4):s.append(index%B-R);index//=B
    assert any(s);return tuple(s)

def sqrt_point(x,bits):
    x=F(x);assert x>=0;D=2**bits
    k=isqrt(x.numerator*D*D//x.denominator)
    lo=F(k,D);return lo,lo if lo*lo==x else F(k+1,D)

def sqrt_iv(a,bits):return sqrt_point(max(F(0),a[0]),bits)[0],sqrt_point(a[1],bits)[1]

def receipt_weight_iv(p,z,s,bits=30):
    assert any(s) and all(abs(v)<=p['R'] for v in s)
    R,N=p['R'],p['N'];h=p['h'];rho=p['rho'];y=tuple(F(v,N) for v in z)
    # Normalized length ell_g/rho. The integrand's Lipschitz bound in v is
    # G1*rho because |s|<=2R, sqrt(G)>=2. Midpoint error <=L/(4M).
    Lip=3*10**6*rho;tol=F(1,2**bits)
    M=max(1,(Lip*2**(bits+3)).numerator//(Lip*2**(bits+3)).denominator+1)
    total=ZERO;pival=pi_iv(bits+20)
    for j in range(M):
        v=F(2*j+1,2*M);at=tuple(y[i]+v*h*s[i] for i in range(4))
        b=b_iv(at,bits+20)
        sq=add(point(F(16*s[0]*s[0],R*R)),scale(mul(square(pival),square(b)),F(4*sum(s[i]**2 for i in range(1,4)),R*R)))
        total=add(total,sqrt_iv(sq,bits+18))
    avg=scale(total,F(1,M));err=Lip/(4*M)
    out=max(F(1),avg[0]-err),max(F(1),avg[1]+err)
    assert out[0]<=out[1]
    return rounded(out,bits+8)

def rate_iv(p,z,i,sign,bits=40):
    assert 0<=i<4 and sign in (-1,1)
    y=tuple(F(v,p['N']) for v in z);mid=list(y);mid[i]+=sign*p['h']/2
    c=coefficients_iv(mid,bits)['c'][i];mu=coefficients_iv(y,bits)['mu']
    return scale(div(c,mu),1/p['h']**2)

def serialize(x):
    if isinstance(x,F):return str(x)
    if isinstance(x,dict):return {k:serialize(v) for k,v in x.items()}
    if isinstance(x,(list,tuple)):return [serialize(v) for v in x]
    return x
