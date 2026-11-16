#!/usr/bin/env python3
"""Finite actual diagonal-metric comparison codes; no external target data.

The base coefficient function is already fixed by the declared material action.
Every finite row contains a full rational Bernstein/Fourier perturbation bank.
Invalid shape codes have a defined fail/identity extension, not a new metric.
"""
from pathlib import Path
from fractions import Fraction as F
from math import comb, factorial
import importlib.util,json,sys
sys.dont_write_bytecode=True
P=Path(__file__).resolve().parent.parent/'geometry/curved_geometry_family.py'
sp=importlib.util.spec_from_file_location('dark03_candidate_intervals',P);I=importlib.util.module_from_spec(sp);sp.loader.exec_module(I)
AMP=F(1,10000)

def bernstein(values,s):
    a=list(values);s=F(s)
    for _ in range(len(a)-1):a=[(1-s)*a[j]+s*a[j+1] for j in range(len(a)-1)]
    return a[0]

def differences(values,a):
    v=list(values)
    for _ in range(a):v=[v[j+1]-v[j] for j in range(len(v)-1)]
    return v

def signed_digit(j):
    return 0 if j==0 else ((j+1)//2 if j%2 else -j//2)

class Registry:
    def __init__(self,level):
        assert isinstance(level,int) and level>=0
        self.level=level;self.degree=level+1;self.fourier_cutoff=level+1
        d,k=self.degree,self.fourier_cutoff
        self.half_range=16*(d+1)**8*(k+1)**8
        self.step=AMP/self.half_range;self.radix=2*self.half_range+1
        self.modes=[('cos',0)]+[(kind,k) for k in range(1,k+1) for kind in ('cos','sin')]
        self.coefficient_count=(d+1)*len(self.modes)
        self.candidate_count=self.radix**self.coefficient_count
    def decode(self,index):
        assert 0<=index<self.candidate_count
        code=index;rows=[]
        for _ in self.modes:
            a=[]
            for _ in range(self.degree+1):
                a.append(self.step*signed_digit(code%self.radix));code//=self.radix
            rows.append(a)
        return Candidate(self,index,rows)
    def record(self):
        return {'level':self.level,'degree':self.degree,'Fourier_cutoff':self.fourier_cutoff,
                'coefficient_step':str(self.step),'coefficient_absolute_bound':str(AMP),
                'coefficient_count':self.coefficient_count,'radix':self.radix,
                'candidate_count_exact':str(self.candidate_count),
                'native_code_digits':((self.candidate_count-1).bit_length()+2)//3,
                'base_witness_code':0,'shape_rule':'Every mixed Q derivative through total order6 has declared sup bound <=1/10000.'}

class Candidate:
    def __init__(self,registry,index,coefficients):
        self.registry=registry;self.index=index;self.coefficients=coefficients
        self.valid_shape=all(self.Q_derivative_bound(a,b)<=AMP for a in range(7) for b in range(7-a))
        self.derivative_bounds={'Q_C6':str(AMP),'b_lower':'1/3','b_upper':'3',
            'G_first_norm':3*10**6,'G_second_norm':2*10**10,
            'mu_first_norm':250000000,'mu_second_norm':2800000000000,
            'c_first_norm':16000000,'c_second_norm':180000000000,
            'extension':'Fixed base outside physical slab; perturbation is flat at t=1,2.'}
    def Q_derivative_bound(self,a,b):
        d=self.registry.degree
        if a>d:return F(0)
        c=F(factorial(d),factorial(d-a));total=F(0)
        for (kind,k),row in zip(self.registry.modes,self.coefficients):
            if k==0 and b>0:continue
            total+=c*max(map(abs,differences(row,a)))*k**b
        return total
    def Q_derivative_iv(self,s,y1,a=0,b=0,bits=40):
        assert 0<=s<=1
        d=self.registry.degree
        if a>d:return I.ZERO
        c=F(factorial(d),factorial(d-a));total=I.ZERO;pi=I.pi_iv(bits+20)
        for (kind,k),row in zip(self.registry.modes,self.coefficients):
            if k==0 and b>0:continue
            amp=c*bernstein(differences(row,a),s)*k**b
            if not amp:continue
            phase=I.add(I.scale(pi,2*k*F(y1)),I.scale(pi,F(b,2)))
            trig=I.cos_iv(phase,bits+12) if kind=='cos' else I.cos_iv(I.sub(I.scale(pi,F(1,2)),phase),bits+12)
            total=I.add(total,I.scale(trig,amp))
        return I.rounded(total,bits+4)
    def b_iv(self,y,bits=40):
        y=tuple(F(v)%1 for v in y);t=4*y[0]
        base=I.b_iv(y,bits+16)
        if not self.valid_shape or t<=1 or t>=2:return I.rounded(base,bits+4)
        window=I.mul(I.chi_iv(8*(t-1),bits+20),I.chi_iv(8*(2-t),bits+20))
        q=self.Q_derivative_iv(t-1,y[1],bits=bits+20)
        return I.rounded(I.mul(base,I.exp_iv(I.mul(window,q),bits+12)),bits+4)
    def coefficients_iv(self,y,bits=40):
        b=self.b_iv(y,bits+12);pi=I.pi_iv(bits+12);b3=I.power(b,3);pi3=I.power(pi,3)
        return {'b':I.rounded(b,bits+4),'q':I.rounded(I.scale(b3,F(1,27)),bits+4),
                'mu':I.rounded(I.scale(I.mul(pi3,b3),32),bits+4),
                'c':tuple(I.rounded(v,bits+4) for v in [I.scale(I.mul(pi3,b3),2)]+[I.scale(I.mul(pi,b),8)]*3)}
    def sympy_B(self):
        import sympy as S
        t,x=S.symbols('t x',real=True)
        def eta(z):return S.Piecewise((0,z<=0),(S.exp(-1/z),True))
        def chi(z):return eta(z)/(eta(z)+eta(1-z))
        window=chi(8*(t-1))*chi(8*(2-t));s=t-1;d=self.registry.degree;Q=0
        if self.valid_shape:
            for (kind,k),row in zip(self.registry.modes,self.coefficients):
                pol=sum(S.Rational(v.numerator,v.denominator)*comb(d,j)*s**j*(1-s)**(d-j) for j,v in enumerate(row))
                Q+=pol*(S.cos(k*x) if kind=='cos' else S.sin(k*x))
        return t,x,S.log(t)+S.Rational(1,100)*t*S.cos(x)+window*Q
    def description(self):
        return json.dumps({'format':'DARK03 finite source metric code','registry':self.registry.record(),
                           'index':str(self.index),'valid_shape':self.valid_shape,
                           'coefficients':[[str(v) for v in row] for row in self.coefficients]},sort_keys=True,separators=(',',':')).encode()
    @property
    def description_bytes(self):return len(self.description())


def price_select(registry,residual_certificate,physical_price_interval,tolerance):
    """Total FINITE scan given the actual bounded-precision source callbacks.

    residual_certificate(c) returns a rational validated upper/error receipt,
    not an ideal pointwise residual. physical_price_interval(c,tol) returns the
    actual complete declared one-shot capital-plus-formation price interval of width <=tol.
    """
    tolerance=F(tolerance);assert tolerance>0
    best=None;examined=0
    for i in range(registry.candidate_count):
        c=registry.decode(i);examined+=1
        if not c.valid_shape:continue
        certificate=residual_certificate(c)
        if not certificate['accepted']:continue
        lo,hi=physical_price_interval(c,tolerance)
        assert lo<=hi and hi-lo<=tolerance
        if best is None or (hi,i)<(best['price_upper'],best['index']):
            best={'index':i,'price_lower':lo,'price_upper':hi,'residual_certificate':certificate}
    if best is None:raise ValueError('No physically certified candidate at this row; increase the common refinement.')
    best['examined_codes']=examined;best['physical_price_suboptimality_upper']=tolerance
    return best

if __name__=='__main__':
    checks=[]
    for level in (0,1,2):
        r=Registry(level);base=r.decode(0);assert base.valid_shape
        altered=r.decode(1);assert altered.valid_shape
        for y in ((F(0),F(0),F(0),F(0)),(F(3,8),F(1,4),F(0),F(0)),(F(1,4),F(1,3),F(0),F(0)),(F(1,2),F(1,3),F(0),F(0))):
            a,b=base.b_iv(y,20),I.b_iv(y,20)
            assert max(a[0],b[0])<=min(a[1],b[1])
            q=altered.coefficients_iv(y,20)['q'];assert 0<q[0]<=q[1]<1
        checks.append({'registry':r.record(),'base_description_bytes':base.description_bytes,
                       'one_changed_coefficient_valid':True,'base_matches_actual_source':True})
    out={'all_pass':True,'records':checks,'full_registry_enumerated':False,
         'actual_source_residual_and_price_callbacks':'Constructor binding required; no hard-coded winner or unpriced selector claimed.'}
    Path(__file__).with_name('CANDIDATE_REGISTRY_CHECKS.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
    print(json.dumps({'all_pass':True,'finite_registries_tested':len(checks),'base_and_nonzero_candidates_checked':6}))
