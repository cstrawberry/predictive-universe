"""Outward rational box derivatives for actual finite source candidates.
No numerical point value is a coefficient oracle. All jets store derivatives
DIVIDED by factorial; endpoint tails of the flat cutoff are explicitly bounded.
"""
from fractions import Fraction as F
from math import factorial,comb
from pathlib import Path
import importlib.util,sys
sys.dont_write_bytecode=True
spec=importlib.util.spec_from_file_location('dark03_registry_iv',Path(__file__).with_name('candidate_registry.py'));R=importlib.util.module_from_spec(spec);spec.loader.exec_module(R)
I=R.I

def absup(x):return max(abs(x[0]),abs(x[1]))
def neg(x):return I.neg(x)
def scale(x,k):return I.scale(x,k)
def product(a,b,n):
    return [sumiv(I.mul(a[j],b[k-j]) for j in range(k+1)) for k in range(n+1)]
def sumiv(xs):
    z=I.ZERO
    for x in xs:z=I.add(z,x)
    return z
def reciprocal(a,n):
    out=[I.inv(a[0])]
    for k in range(1,n+1):out.append(I.neg(I.mul(out[0],sumiv(I.mul(a[j],out[k-j]) for j in range(1,k+1)))))
    return out
def exponential(a,n,bits):
    out=[I.exp_iv(a[0],bits+8)]
    for k in range(1,n+1):out.append(scale(sumiv(scale(I.mul(a[j],out[k-j]),j) for j in range(1,k+1)),F(1,k)))
    return out

def eta_polynomial(n):
    # d^n exp(-1/z)/dz^n = exp(-w) P_n(w), w=1/z.
    p={0:1}
    for _ in range(n):
        q={}
        for k,v in p.items():
            q[k+2]=q.get(k+2,0)+v
            if k:q[k+1]=q.get(k+1,0)-k*v
        p={k:v for k,v in q.items() if v}
    return p

def eta_derivative(box,n,bits):
    lo,hi=map(F,box)
    if hi<=0:return I.ZERO
    p=eta_polynomial(n)
    if lo>0:
        w=(1/hi,1/lo);pol=sumiv(scale(I.power(w,k),v) for k,v in p.items())
        extra=max(0,(absup(pol).numerator//absup(pol).denominator).bit_length()) if absup(pol) else 0
        return I.rounded(I.mul(I.exp_iv((-w[1],-w[0]),bits+extra+16),pol),bits+8)
    # z in (0,hi]; each w^k exp(-w) is decreasing for w>=k.
    w0=1/hi;bound=F(0)
    for k,v in p.items():
        extra=max(0,(w0**k).numerator.bit_length())
        term=(w0**k*I.exp_point(-w0,bits+extra+16)[1] if w0>=k else F(factorial(k)))
        bound+=abs(v)*term
    if n==0:return F(0),min(F(1),bound)
    return -bound,bound

def chi_derivatives(box,n,bits):
    lo,hi=map(F,box)
    if hi<=0:return [I.ZERO]*(n+1)
    if lo>=1:return [I.ONE]+[I.ZERO]*n
    # Clip to [0,1], where eta(z)+eta(1-z)>=exp(-2)>1/8.
    lo=max(F(0),lo);hi=min(F(1),hi)
    a=[scale(eta_derivative((lo,hi),k,bits+16),F(1,factorial(k))) for k in range(n+1)]
    b=[scale(eta_derivative((1-hi,1-lo),k,bits+16),F((-1)**k,factorial(k))) for k in range(n+1)]
    den=[I.add(a[k],b[k]) for k in range(n+1)];den[0]=(max(F(1,8),den[0][0]),den[0][1])
    out=product(a,reciprocal(den,n),n)
    out[0]=(max(F(0),out[0][0]),min(F(1),out[0][1]))
    # Values outside [0,1] are constants. Include those derivatives exactly.
    if box[0]<0 or box[1]>1:
        out[0]=(min(out[0][0],F(0) if box[0]<0 else F(1)),max(out[0][1],F(1) if box[1]>1 else F(0)))
        out[1:]=[(min(F(0),x[0]),max(F(0),x[1])) for x in out[1:]]
    return [I.rounded(scale(v,factorial(k)),bits+8) for k,v in enumerate(out)]

def window_derivatives(tbox,n,bits):
    l,h=map(F,tbox)
    a=chi_derivatives((8*(l-1),8*(h-1)),n,bits+12)
    b=chi_derivatives((8*(2-h),8*(2-l)),n,bits+12)
    return [I.rounded(sumiv(scale(I.mul(a[j],b[k-j]),comb(k,j)*8**j*(-8)**(k-j)) for j in range(k+1)),bits+8) for k in range(n+1)]

def polynomial_box(values,sbox):
    a=[I.point(v) for v in values];s=tuple(map(F,sbox));one=I.sub(I.ONE,s)
    for _ in range(len(a)-1):a=[I.add(I.mul(one,a[j]),I.mul(s,a[j+1])) for j in range(len(a)-1)]
    return a[0]

def trig_derivative(kind,k,xbox,b,bits):
    if k==0:return I.ONE if b==0 and kind=='cos' else I.ZERO
    phase=I.add(scale(tuple(map(F,xbox)),k),scale(I.pi_iv(bits+12),F(b,2)))
    if kind=='sin':phase=I.sub(scale(I.pi_iv(bits+12),F(1,2)),phase)
    return scale(I.cos_iv(phase,bits+8),k**b)

def q_derivative(c,tbox,xbox,a,b,bits):
    d=c.registry.degree
    if a>d or not c.valid_shape:return I.ZERO
    total=I.ZERO
    for (kind,k),row in zip(c.registry.modes,c.coefficients):
        p=polynomial_box(R.differences(row,a),(F(tbox[0])-1,F(tbox[1])-1))
        total=I.add(total,scale(I.mul(p,trig_derivative(kind,k,xbox,b,bits+12)),F(factorial(d),factorial(d-a))))
    return I.rounded(total,bits+8)

def delta_derivative(c,tbox,xbox,a,b,bits=40):
    if tbox[1]<=1 or tbox[0]>=2 or not c.valid_shape:return I.ZERO
    w=window_derivatives(tbox,a,bits+16)
    return I.rounded(sumiv(scale(I.mul(w[j],q_derivative(c,tbox,xbox,a-j,b,bits+16)),comb(a,j)) for j in range(a+1)),bits+8)

def base_B_derivative(tbox,xbox,a,b,bits=40):
    tbox=tuple(map(F,tbox));assert tbox[0]>0
    if b==0:
        log=(I.log_point(tbox[0],bits+12)[0],I.log_point(tbox[1],bits+12)[1]) if a==0 else scale(I.power(I.inv(tbox),a),(-1)**(a-1)*factorial(a-1))
    else:log=I.ZERO
    extra=I.ZERO
    if a<=1:extra=scale(I.mul(tbox if a==0 else I.ONE,trig_derivative('cos',1,xbox,b,bits+12)),F(1,100))
    return I.rounded(I.add(log,extra),bits+8)

def B_derivative(c,tbox,xbox,a=0,b=0,bits=40):
    return I.rounded(I.add(base_B_derivative(tbox,xbox,a,b,bits+12),delta_derivative(c,tbox,xbox,a,b,bits+12)),bits+8)

def b_interval(c,tbox,xbox,bits=40):return I.rounded(I.exp_iv(B_derivative(c,tbox,xbox,0,0,bits+12),bits+8),bits+4)
def Bt_interval(c,tbox,xbox,bits=40):return B_derivative(c,tbox,xbox,1,0,bits)

def adapter(c):
    return {'b_interval':lambda t,x,bits=40:b_interval(c,t,x,bits),'Bt_interval':lambda t,x,bits=40:Bt_interval(c,t,x,bits)}

if __name__=='__main__':
    import json
    checks=0
    for level in (0,1):
        for code in (0,1):
            c=R.Registry(level).decode(code)
            for t in (F(1),F(129,128),F(9,8),F(3,2),F(15,8),F(255,128),F(2)):
                x=F(1,3);box=b_interval(c,(t,t),(x,x),24);bt=Bt_interval(c,(t,t),(x,x),24)
                assert 0<box[0]<box[1] and bt[0]>0
                for a in range(7):
                    z=delta_derivative(c,(t,t),(x,x),a,0,24)
                    if code==0:assert z==(0,0)
                checks+=1
    tails=[]
    for n in range(7):
        z=eta_derivative((F(0),F(1,1024)),n,80);assert absup(z)<F(1,2**40);tails.append(str(absup(z)))
    out={'all_pass':True,'candidate_point_boxes':checks,'flat_endpoint_derivative_tails_orders0to6':tails,'whole_candidate_class_enumerated':False}
    Path(__file__).with_name('CANDIDATE_INTERVAL_CHECKS.json').write_text(json.dumps(out,sort_keys=True,indent=2)+'\n');print(json.dumps(out))
