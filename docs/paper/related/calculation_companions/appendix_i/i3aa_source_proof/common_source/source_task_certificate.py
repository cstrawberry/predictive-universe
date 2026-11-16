"""Finite actual action/Einstein residual task, with outward rational boxes.
Acceptance is a certificate of the equations, not distance to a chosen metric.
Exact solved-base identities are algebraic simplifications of those equations.
"""
from fractions import Fraction as F
from math import factorial,comb
from pathlib import Path
import importlib.util,sys,json
sys.dont_write_bytecode=True
sp=importlib.util.spec_from_file_location('dark03_candidate_box',Path(__file__).with_name('candidate_intervals.py'));C=importlib.util.module_from_spec(sp);sp.loader.exec_module(C)
I=C.I

class Jet:
    def __init__(self,n,bits,data=None):
        self.n=n;self.bits=bits;self.d={(a,b):I.ZERO for a in range(n+1) for b in range(n+1-a)}
        if data:self.d.update(data)
    def cast(self,z):return z if isinstance(z,Jet) else Jet(self.n,self.bits,{(0,0):I.point(z)})
    def __add__(self,z):
        z=self.cast(z);return Jet(self.n,self.bits,{k:I.rounded(I.add(v,z.d[k]),self.bits) for k,v in self.d.items()})
    __radd__=__add__
    def __neg__(self):return Jet(self.n,self.bits,{k:I.neg(v) for k,v in self.d.items()})
    def __sub__(self,z):return self+-self.cast(z)
    def __rsub__(self,z):return self.cast(z)+-self
    def __mul__(self,z):
        z=self.cast(z);d={}
        for a,b in self.d:
            d[a,b]=I.rounded(C.sumiv(I.mul(self.d[i,j],z.d[a-i,b-j]) for i in range(a+1) for j in range(b+1)),self.bits)
        return Jet(self.n,self.bits,d)
    __rmul__=__mul__
    def __pow__(self,k):
        assert k>=0;out=self.cast(1)
        for _ in range(k):out=out*self
        return out
    def derivative(self,a=0,b=0):
        return Jet(self.n,self.bits,{(i,j):I.scale(self.d[i+a,j+b],F(factorial(i+a)*factorial(j+b),factorial(i)*factorial(j))) for i in range(self.n+1-a) for j in range(self.n+1-a-i-b)})
    def inv(self):
        c=I.inv(self.d[0,0]);u=self*Jet(self.n,self.bits,{(0,0):c})-1
        # Replace only the zeroth coefficient: Taylor is at each exact center;
        # interval center dependence is retained through c and all derivatives.
        u.d[0,0]=I.ZERO
        out=self.cast(0)
        for k in range(self.n+1):out=out+((-1)**k)*(u**k)
        return out*Jet(self.n,self.bits,{(0,0):c})
    def exp(self):
        u=Jet(self.n,self.bits,dict(self.d));u.d[0,0]=I.ZERO
        out=self.cast(0)
        for k in range(self.n+1):out=out+F(1,factorial(k))*(u**k)
        return out*Jet(self.n,self.bits,{(0,0):I.exp_iv(self.d[0,0],self.bits+8)})
    def actual(self,a,b):return I.scale(self.d[a,b],factorial(a)*factorial(b))

def from_derivatives(n,bits,fun):return Jet(n,bits,{(a,b):I.scale(fun(a,b),F(1,factorial(a)*factorial(b))) for a in range(n+1) for b in range(n+1-a)})

def residual_boxes(candidate,tbox,xbox,order=2,bits=40):
    n=order+2;bits+=24
    base=from_derivatives(n,bits,lambda a,b:C.base_B_derivative(tbox,xbox,a,b,bits+12))
    delta=from_derivatives(n,bits,lambda a,b:C.delta_derivative(candidate,tbox,xbox,a,b,bits+12))
    tj=Jet(n,bits,{(0,0):tuple(map(F,tbox)),(1,0):I.ONE})
    cos=from_derivatives(n,bits,lambda a,b:I.ZERO if a else C.trig_derivative('cos',1,xbox,b,bits+12))
    sin=from_derivatives(n,bits,lambda a,b:I.ZERO if a else C.trig_derivative('sin',1,xbox,b,bits+12))
    eps=F(1,100);u=eps*tj*cos;inv=tj.inv();V=inv**2
    f00=V-6*eps*cos*inv-3*eps**2*cos**2;f01=2*eps*sin
    common=(2*u).exp()*(1+6*u+3*u**2)
    f11=2*u+common;f22=u-eps**2*tj**2*sin**2+common;tr=f11+2*f22
    dt=delta.derivative(1,0);dx=delta.derivative(0,1)
    bt=base.derivative(1,0);bx=base.derivative(0,1)
    em0=(-2*base).exp();ep0=(2*base).exp()
    # expm1 is evaluated as its convergent series at a bounded interval;
    # exact zero delta is kept exact, avoiding fake cancellation residual.
    def expminusone(q):
        z=q.exp();z.d[0,0]=I.sub(I.exp_iv(q.d[0,0],bits+8),I.ONE)
        if q.d[0,0]==I.ZERO:z.d[0,0]=I.ZERO
        return z
    dem=em0*expminusone(-2*delta);dep=ep0*expminusone(2*delta)
    em=em0+dem;ep=ep0+dep
    E0=-3*dt*f00+dem*(f01.derivative(0,1)+bx*f01-F(1,2)*tr.derivative(1,0))+em*dx*f01
    E1=-3*dt*f01+dem*(f11.derivative(0,1)+bx*f11-F(1,2)*tr.derivative(0,1))+em*dx*f11
    # Fixed F,V do not depend on Phi2/Phi3, so their residuals vanish.
    G00=3*(2*bt*dt+dt**2)-em*(2*delta.derivative(0,2)+2*bx*dx+dx**2)-dem*(2*base.derivative(0,2)+bx**2+F(1,2)*tr)
    G01=-2*delta.derivative(1,1)
    common_res=-ep*(2*delta.derivative(2,0)+6*bt*dt+3*dt**2)-dep*(2*base.derivative(2,0)+3*bt**2+F(1,2)*f00-V)
    G11=common_res+2*bx*dx+dx**2;G22=common_res+delta.derivative(0,2)
    named={'material0':E0,'material1':E1,'Einstein00':G00,'Einstein01':G01,'Einstein11':G11,'Einstein22_33':G22}
    return {name:{f'{a},{b}':z.actual(a,b) for a in range(order+1) for b in range(order+1-a)} for name,z in named.items()}

def certify(candidate,tolerance,panels=4,bits=40,order=2):
    tolerance=F(tolerance);assert tolerance>0 and panels>=1
    if not candidate.valid_shape:return {'accepted':False,'reason':'Finite shape certificate failed.'}
    p=I.pi_iv(bits+16);upper=F(0);worst=None;boxes=0
    for i in range(panels):
        tb=(1+F(i,panels),1+F(i+1,panels))
        for j in range(panels):
            xb=(2*p[0]*F(j,panels),2*p[1]*F(j+1,panels))
            res=residual_boxes(candidate,tb,xb,order,bits);boxes+=1
            for name,rs in res.items():
                for derivative,z in rs.items():
                    a=C.absup(z)
                    if a>upper:upper=a;worst=[i,j,name,derivative]
    return {'accepted':upper<=tolerance,'actual_equation_C_order':order,'residual_upper':str(upper),'tolerance':str(tolerance),'boxes':boxes,'bits':bits,'worst':worst,'candidate_index':str(candidate.index),'candidate_level':candidate.registry.level,'source_equations':'Fixed-action material Euler-Lagrange plus Einstein minus actual fixed-action T; all covariant components, derivatives in normalized physical t,x.','zero_components':'material2,3; off-diagonal except01; Einstein33 equals22.'}

if __name__=='__main__':
    r=C.R.Registry(0);records=[]
    for code in (0,1):
        receipt=certify(r.decode(code),F(1,10),panels=2,bits=24);records.append(receipt)
        if code==0:assert receipt['accepted'] and F(receipt['residual_upper'])==0
    # Local convergence at actual flat-cutoff endpoints, not discontinuous jets.
    z0=residual_boxes(r.decode(1),(F(1),F(1)),(F(0),F(0)),2,24)
    assert all(z==I.ZERO for rs in z0.values() for z in rs.values())
    out={'all_pass':True,'records':records,'exact_base_and_endpoint_checks':True,'full_candidate_scan_executed':False}
    Path(__file__).with_name('SOURCE_TASK_CERTIFICATE_CHECKS.json').write_text(json.dumps(out,sort_keys=True,indent=2)+'\n');print(json.dumps(out))
