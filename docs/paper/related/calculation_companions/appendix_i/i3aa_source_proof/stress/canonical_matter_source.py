"""Literal full-native canonical matter Hamiltonian and source interface.

Cutoffs and quadrature endpoints are exact rationals.

All K=8**k states are retained. The native basis is the registered Q eigenbasis
of the finite oscillator; this is a fixed, metric-independent basis choice.
`entry` and `metric_derivative_entry` are floating evaluators of the total
mathematical entry oracle, NOT rigorous interval certificates. Scalar interval
coefficient/control enclosures and finite time-mesh bound primitives are exposed
separately. The certified search is specified in CERTIFIED_NATIVE_SOURCE_SEARCH.

Normalized units: physical H=(ell/kappa)*Hbar; eta=hbar*kappa/ell**2.
"""
from __future__ import annotations
from dataclasses import dataclass
from functools import lru_cache
import math
import numpy as np
from scipy.integrate import quad
import mpmath as mp
from fractions import Fraction

CUT_LO=Fraction(9,10)
CUT_HI=Fraction(21,10)

EPS=0.01
F_COORD_LOWER=0.08  # positive extension on [.9,2.1], proved by diagonal dominance


def smooth_step(u: float)->float:
    if u<=0:return 0.
    if u>=1:return 1.
    a=-1/u;b=-1/(1-u)
    if a>=b:return 1/(1+math.exp(b-a))
    z=math.exp(a-b);return z/(1+z)


def clock_cutoff(t: float)->float:
    return smooth_step(10*(t-.9))*smooth_step(10*(2.1-t))


def raw_f(t:float,x:float):
    """Dimensionless f=kappa F and v=kappa ell² V on the retained chart."""
    c=math.cos(x);s=math.sin(x);u=EPS*t*c;b=t*math.exp(u)
    f00=1/t**2-6*EPS*c/t-3*EPS**2*c*c
    f01=2*EPS*s
    common=math.exp(2*u)*(1+6*u+3*u*u)
    f11=2*u+common
    f22=u-EPS**2*t*t*s*s+common
    F=np.array([[f00,f01,0,0],[f01,f11,0,0],[0,0,f22,0],[0,0,0,f22]],float)
    return F,1/t**2


def positive_extended_f(q0:float,q1:float):
    """Full-native material coefficient, positive also outside physical slab."""
    if q0<=.9 or q0>=2.1:return np.eye(4),1.
    chi=clock_cutoff(q0); F,V=raw_f(q0,q1)
    return chi*F+(1-chi)*np.eye(4),chi*V+1-chi


def target_metric(t:float,x:float):
    b=t*math.exp(EPS*t*math.cos(x))
    return dict(N=1.,beta=np.zeros(3),gamma=b*b*np.eye(3),b=b)


def flux(t:float,x:float,A:int)->float:
    F,_=raw_f(t,x); b=t*math.exp(EPS*t*math.cos(x))
    return b*F[A,1]


def flux_x(t:float,x:float,A:int)->float:
    c=math.cos(x);s=math.sin(x);u=EPS*t*c;b=t*math.exp(u)
    if A==0:return b*(2*EPS*c-2*EPS**2*t*s*s)
    if A==1:
        f11=2*u+math.exp(2*u)*(1+6*u+3*u*u)
        f11x=-2*EPS*t*s-EPS*t*s*math.exp(2*u)*(8+18*u+6*u*u)
        return b*(f11x-EPS*t*s*f11)
    return 0.


def residual_density(t:float,x:float,J:int)->np.ndarray:
    """E_h(q*)/physical cell volume, not a canonical-force total.

    Hctl=N v Vctl adds force -N v grad(Vctl). On N=1 target this
    cancels the canonical residual when grad(Vctl)=this density.
    Profiles are immutable material functions, not recomputed under metric δg.
    """
    if t<=.9 or t>=2.1:return np.zeros(4)
    h=2*math.pi/J;b=t*math.exp(EPS*t*math.cos(x));chi=clock_cutoff(t)
    r=np.zeros(4)
    for A in (0,1):r[A]=chi*((flux(t,x+h,A)-flux(t,x-h,A))/(2*h)-flux_x(t,x,A))/b**3
    return r


@lru_cache(maxsize=65536)
def control_W(q0:float,x:float,J:int)->float:
    """Numerical integral only. `control_W_interval` is the rigorous interface."""
    end=min(2.1,max(.9,q0))
    if end==.9:return 0.
    return quad(lambda t:residual_density(t,x,J)[0],.9,end,epsabs=1e-12,epsrel=1e-12,points=[v for v in (1.,2.) if .9<v<end],limit=200)[0]


def control_potential(q, x:float,J:int,RQ:float):
    h=2*math.pi/J
    # |r0|,|r1|<=h² globally after the cutoff; |W|<=1.2h².
    # q1-x is exactly the bounded eigenvalue of the centered Q register.
    C=(3+RQ)*h*h
    return C+control_W(float(q[0]),x,J)+residual_density(float(q[0]),x,J)[1]*(q[1]-x)


def residual_uniform_bounds(J:int):
    """Analytic Taylor certificate, not a sampled maximum."""
    h=2*math.pi/J;a=.021;bmin=.9*math.exp(-a)
    B=[1,a,a+a*a,a+3*a*a+a**3]
    f0third=2*EPS*2.1*math.exp(a)*(1+7*a+6*a*a+a**3)
    P=[1+6*a+3*a*a]+[6*a+3*(2**r)*a*a for r in (1,2,3)]
    z=3*a;E=[1,z,z+z*z,z+3*z*z+z**3]
    f1third=2.1*(2*math.exp(a)*a*(1+7*a+6*a*a+a**3)+math.exp(3*a)*sum(math.comb(3,r)*E[r]*P[3-r] for r in range(4)))
    c0=f0third/(6*bmin**3);c1=f1third/(6*bmin**3)
    assert max(c0,c1)<1
    return dict(r0_upper=c0*h*h,r1_upper=c1*h*h,simple_each_upper=h*h,
                W_upper=1.2*h*h,method='centered derivative Taylor remainder h² sup|flux_xxx|/(6 b_min³)',
                residual_type='force density; actual canonical force is -N_v v_v r_A')


def f_material_derivatives(t:float,x:float):
    """Analytic material derivatives needed by every candidate residual."""
    c=math.cos(x);sn=math.sin(x);u=EPS*t*c;E=math.exp(2*u)
    f00t=-2/t**3+6*EPS*c/t**2
    f00x=6*EPS*sn/t+6*EPS**2*c*sn
    trace_t=4*EPS*c-4*EPS**2*t*sn**2+3*EPS*c*E*(8+18*u+6*u*u)
    ux=-EPS*t*sn
    trace_x=4*ux-4*EPS**2*t*t*sn*c+3*E*ux*(8+18*u+6*u*u)
    return dict(f00t=f00t,f00x=f00x,trace_t=trace_t,trace_x=trace_x,Vt=-2/t**3)


@dataclass
class ControllerProfile:
    residual: object
    density_bound: float
    profile_id: str
    # density_bound covers ALL clock-extension support, not only retained [1,2].
    def __post_init__(self):
        if self.density_bound<0:raise ValueError('force-density upper bound must be nonnegative')
    def W(self,q0,x,J):
        end=min(2.1,max(.9,float(q0)))
        if end==.9:return 0.
        return quad(lambda t:float(self.residual(t,x,J)[0]),.9,end,
                    epsabs=1e-11,epsrel=1e-11,
                    points=[v for v in (1.,2.) if .9<v<end],limit=250)[0]
    def potential(self,q,x,J,RQ):
        C=(3+RQ)*self.density_bound
        return C+self.W(q[0],x,J)+self.residual(q[0],x,J)[1]*(q[1]-x)


def make_candidate_controller(J,b_callback,Bt_callback,force_density_bound,profile_id):
    """Freeze one candidate's full material E_h/volume as its own profile.

    b_callback,Bt_callback must cover [.9,2.1] with a positive b and
    the supplied certified force-density bound over that extension. The
    bound is epsilon_task+C_discretization*h², not assumed h² for B!=B*.
    The returned profile is held FIXED during independent metric variations.
    """
    def profile(t,x,unused_J):
        if t<=.9 or t>=2.1:return np.zeros(4)
        h=2*math.pi/J;b=float(b_callback(t,x));bt=float(Bt_callback(t,x))
        if b<=0:raise ValueError('candidate b must be positive')
        F,_=raw_f(t,x);d=f_material_derivatives(t,x)
        div=[]
        for A in (0,1):
            fp=raw_f(t,x+h)[0][A,1];fm=raw_f(t,x-h)[0][A,1]
            div.append((b_callback(t,x+h)*fp-b_callback(t,x-h)*fm)/(2*h*b**3))
        r0=-.5*d['f00t']-3*bt*F[0,0]+div[0]-.5*d['trace_t']/b**2-d['Vt']
        r1=-3*bt*F[1,0]+div[1]+.5*d['f00x']-.5*d['trace_x']/b**2
        return clock_cutoff(t)*np.array([r0,r1,0,0])
    return ControllerProfile(profile,float(force_density_bound),str(profile_id))


@dataclass
class Oscillator:
    K:int
    eta:float
    h:float
    def __post_init__(self):
        if self.K<8 or 8**round(math.log(self.K,8))!=self.K:raise ValueError('K must be a positive power of 8')
        a=np.diag(np.sqrt(np.arange(1,self.K)),1)
        Q=math.sqrt(self.eta/(2*self.h**2))*(a+a.T)
        P=-1j*math.sqrt(self.eta*self.h**2/2)*(a-a.T)
        self.q,self.U=np.linalg.eigh(Q)
        self.U*=np.where(self.U[0,:]<0,-1.,1.)[None,:]  # fixed positive first-component eigenvector convention
        self.P=self.U.T@P@self.U
        self.RQ=float(max(abs(self.q)))
    @property
    def native_factors(self):return round(math.log(self.K,8))
    def coherent(self,qmean:float,pmean:float):
        alpha=self.h*qmean/math.sqrt(2*self.eta)+1j*pmean/(self.h*math.sqrt(2*self.eta))
        # Stable finite normalized projected coefficients, including underflow-safe logs.
        if alpha==0:
            z=np.zeros(self.K,complex);z[0]=1
        else:
            logs=np.array([m*math.log(abs(alpha))-.5*math.lgamma(m+1) for m in range(self.K)])
            z=np.exp(logs-max(logs))*np.exp(1j*np.arange(self.K)*np.angle(alpha));z/=np.linalg.norm(z)
        return self.U.T@z


class CanonicalMatterSource:
    """Total native Hbar matrix-entry and actual ADM derivative oracle."""
    def __init__(self,J:int,K:int,eta:float,control=True,metric_callback=None,controller_profile=None):
        if J<1:raise ValueError('J>=1')
        self.J=J;self.h=2*math.pi/J;self.K=K;self.eta=eta;self.control=bool(control)
        self.metric_callback=target_metric if metric_callback is None else metric_callback
        if self.control and metric_callback is not None and controller_profile is None:
            raise ValueError('A non-target metric requires its OWN frozen controller profile/bound')
        self.controller_profile=controller_profile
        self.osc=Oscillator(K,eta,self.h);self.RQ_budget=math.ceil(2*math.sqrt(eta*K/self.h**2))+1;self.cells=J**3;self.modes=4*self.cells
        self.full_dimension=K**self.modes
        self.labels=[tuple(self.h*a for a in np.unravel_index(v,(J,J,J))) for v in range(self.cells)]
        self.offsets=[(1.5,)+xyz for xyz in self.labels]
    def inventory(self):
        return dict(scalar_J=self.J,cells=self.cells,canonical_modes=self.modes,K=self.K,
                    full_dimension=self.full_dimension,native8_factors=self.modes*self.osc.native_factors,
                    omitted_native_states=0,eta=self.eta,coordinate_period=2*math.pi,
                    physical_energy_multiplier='ell/kappa',zero_point_subtracted=False,
                    norm_Q=self.osc.RQ,registered_Q_budget=self.RQ_budget,norm_P_density_bound=float(np.linalg.norm(self.osc.P,2)/self.h**3),
                    controls='autonomous q0 material potential' if self.control else 'none',
                    matrix_evaluator_certification='floating evaluation; not an interval certificate')
    def decode(self,row:int):
        if not 0<=row<self.full_dimension:raise IndexError('row outside FULL native space')
        a=[0]*self.modes
        for i in range(self.modes-1,-1,-1):a[i]=row%self.K;row//=self.K
        return a
    def encode(self,a):
        n=0
        for v in a:n=n*self.K+int(v)
        return n
    def cell_q(self,a,v):return np.array(self.offsets[v])+self.osc.q[np.array(a[4*v:4*v+4])]
    def neighbor(self,v,axis,step):
        z=list(np.unravel_index(v,(self.J,)*3));z[axis]=(z[axis]+step)%self.J
        return np.ravel_multi_index(tuple(z),(self.J,)*3)
    def gradients(self,a,v):
        d=np.zeros((3,4))
        for i in range(3):
            vp=self.neighbor(v,i,1);vm=self.neighbor(v,i,-1)
            # Exact winding derivative plus the differences of centered deviations.
            d[i]=(self.osc.q[np.array(a[4*vp:4*vp+4])]-self.osc.q[np.array(a[4*vm:4*vm+4])])/(2*self.h)
            d[i,i+1]+=1
        return d
    def _metric(self,t,v,override=None):
        m=self.metric_callback(t,self.labels[v][0]) if override is None else override
        N=float(m['N']);beta=np.array(m.get('beta',np.zeros(3)),float);g=np.array(m['gamma'],float)
        gi=np.linalg.inv(g);vol=self.h**3*math.sqrt(np.linalg.det(g))
        if N<=0 or np.linalg.eigvalsh(g).min()<=0:raise ValueError('positive lapse and spatial metric required')
        return N,beta,g,gi,vol
    def _kinetic_numerator(self,a,b,v):
        base=4*v;diff=[j for j in range(self.modes) if a[j]!=b[j]]
        if any(j<base or j>=base+4 for j in diff) or len(diff)>2:return 0j
        value=0j;P=self.osc.P
        for A,B in [(0,0),(1,1),(2,2),(3,3),(0,1),(1,0)]:
            allowed={base+A,base+B}
            if any(j not in allowed for j in diff):continue
            if A==B:
                for u in range(self.K):
                    c=list(a);c[base+A]=u;q=self.cell_q(c,v);F,_=positive_extended_f(q[0],q[1])
                    value+=P[a[base+A],u]*np.linalg.inv(F)[A,A]*P[u,b[base+A]]
            else:
                c=list(a);c[base+A]=b[base+A];q=self.cell_q(c,v);F,_=positive_extended_f(q[0],q[1])
                value+=P[a[base+A],b[base+A]]*np.linalg.inv(F)[A,B]*P[a[base+B],b[base+B]]
        return value
    def _shift_momenta(self,a,b,v):
        diff=[j for j in range(self.modes) if a[j]!=b[j]];out=np.zeros(3,complex)
        for A in range(4):
            idx=4*v+A
            if any(j!=idx for j in diff):continue
            # Symmetric ordering also covers exceptional tiny periodic lattices.
            da=self.gradients(a,v)[:,A];db=self.gradients(b,v)[:,A]
            out+=.5*(da+db)*self.osc.P[a[idx],b[idx]]
        return out
    def entry(self,row,col,t,metric_overrides=None):
        a=self.decode(row);b=self.decode(col);diag=(row==col)
        if sum(x!=y for x,y in zip(a,b))>2:return 0j
        out=0j
        for v in range(self.cells):
            ov=None if metric_overrides is None else metric_overrides.get(v)
            N,beta,g,gi,vol=self._metric(t,v,ov)
            out+=N*self._kinetic_numerator(a,b,v)/(2*vol)
            out+=beta@self._shift_momenta(a,b,v)
            if diag:
                q=self.cell_q(a,v);F,V=positive_extended_f(q[0],q[1]);dq=self.gradients(a,v)
                pot=V+self._control_value(q,self.labels[v][0])
                out+=N*vol*(.5*np.sum(gi*(dq@F@dq.T))+pot)
        return out
    def metric_derivative_entry(self,row,col,t,cell,dN=0.,dbeta=None,dgamma=None):
        """Actual derivative of the WHOLE H wrt one cell's ADM metric data."""
        a=self.decode(row);b=self.decode(col);N,beta,g,gi,vol=self._metric(t,cell)
        dg=np.zeros((3,3)) if dgamma is None else np.array(dgamma,float)
        db=np.zeros(3) if dbeta is None else np.array(dbeta,float)
        tv=.5*np.trace(gi@dg);dgi=-gi@dg@gi
        out=(dN-N*tv)*self._kinetic_numerator(a,b,cell)/(2*vol)
        out+=db@self._shift_momenta(a,b,cell)
        if row==col:
            q=self.cell_q(a,cell);F,V=positive_extended_f(q[0],q[1]);dq=self.gradients(a,cell);G=dq@F@dq.T
            pot=V+self._control_value(q,self.labels[cell][0])
            out+=vol*(dN+N*tv)*(.5*np.sum(gi*G)+pot)+.5*N*vol*np.sum(dgi*G)
        return out
    def _control_value(self,q,x):
        if not self.control:return 0.
        if self.controller_profile is not None:return self.controller_profile.potential(q,x,self.J,self.RQ_budget)
        return control_potential(q,x,self.J,self.RQ_budget)
    def initial_product_state(self,t=1.):
        states=[]
        for v in range(self.cells):
            x,y,z=self.labels[v];F,_=raw_f(t,x);N,be,ga,gi,vol=self._metric(t,v);p=vol/N*(F[:,0]-F[:,1:]@be)
            target=[t,x,y,z]
            for A in range(4):states.append(self.osc.coherent(target[A]-self.offsets[v][A],p[A]))
        return states


def certified_time_mesh_bounds(BH,BH1,BO,BO1,eta,delta,propagator_error,reference_derivative=0.):
    """Exact rational scalar implications of caller-certified upper bounds.

    Outputs are rational strings, not inward-rounded binary floats.
    """
    BH,BH1,BO,BO1,eta,delta,propagator_error,reference_derivative=[Fraction(str(z)) for z in (BH,BH1,BO,BO1,eta,delta,propagator_error,reference_derivative)]
    if min(BH,BH1,BO,BO1,eta,delta,propagator_error,reference_derivative)<0 or eta==0:raise ValueError('nonnegative bounds and eta>0')
    return dict(frozen_H_unitary_error=str(BH1*delta/(2*eta)),
                expectation_error_from_U=str(2*BO*propagator_error),
                between_node_error=str(delta*(BO1+2*BH*BO/eta+reference_derivative)),
                input_status='Caller-certified upper bounds; all returned implications computed exactly as rational numbers.')


def geometry_scaling(k:int,hbar=1.,kappa=1.,delta_prop=1.):
    R=80*2**k;N=8*10**28*R**3;rho=R/N;ell=delta_prop/rho;eta=hbar*kappa/ell**2
    return dict(k=k,R=R,N=N,propagation_step=rho,n_macro=N//R,vertices=N**4,
                ell=ell,eta=eta,physical_coordinate_pitch=delta_prop/R,
                normalization='d_phys/ell, m_phys/ell^4; fixed kappa,hbar,delta_prop')

# Scalar rigorous interval primitives. Interval arithmetic, not sampled errors.
def _iv_cut(t):
    return _iv_step(10*(t-_import_interval(CUT_LO)))*_iv_step(10*(_import_interval(CUT_HI)-t))

def _iv_flux(t,x,A):
    e=mp.iv.mpf('.01');u=e*t*mp.iv.cos(x);b=t*mp.iv.exp(u)
    if A==0:return b*2*e*mp.iv.sin(x)
    return b*(2*u+mp.iv.exp(2*u)*(1+6*u+3*u*u))
def _iv_flux_x(t,x,A):
    e=mp.iv.mpf('.01');c=mp.iv.cos(x);s=mp.iv.sin(x);u=e*t*c;b=t*mp.iv.exp(u)
    if A==0:return b*(2*e*c-2*e*e*t*s*s)
    f=2*u+mp.iv.exp(2*u)*(1+6*u+3*u*u)
    fx=-2*e*t*s-e*t*s*mp.iv.exp(2*u)*(8+18*u+6*u*u)
    return b*(fx-e*t*s*f)
def _iv_residual(t,x,J,A=0):
    e=mp.iv.mpf('.01');h=2*mp.iv.pi/J;b=t*mp.iv.exp(e*t*mp.iv.cos(x))
    return _iv_cut(t)*((_iv_flux(t,x+h,A)-_iv_flux(t,x-h,A))/(2*h)-_iv_flux_x(t,x,A))/b**3

def control_W_interval(q0,x,J,bits=12,max_panels=1000000):
    """Exact-rational endpoint wrapper for the target W interval integral.

    lower/upper are rational endpoint strings (not nearest decimals).
    """
    def residual(tb,xb,J,bits):
        mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
        lo,hi=_rational_bounds(tb)
        if hi<=CUT_LO or lo>=CUT_HI:return dict(certified=True,entries={'r0':('0/1','0/1')})
        tt=_import_interval((max(lo,CUT_LO),min(hi,CUT_HI)))
        rr=_iv_residual(tt,_import_interval(xb),J,0)
        if lo<CUT_LO or hi>CUT_HI:
            a,b=_rational_enclosure(rr);rr=_import_interval((min(a,Fraction(0)),max(b,Fraction(0))))
        return dict(certified=True,entries={'r0':_export_interval(rr)})
    # h²<40/J² is an exact rational uniform density upper bound.
    result=control_W_enclosure(_rational_bounds(q0),_rational_bounds(x),J,residual,Fraction(40,J*J),bits,max_panels)
    if 'interval' in result:result.update(lower=result['interval'][0],upper=result['interval'][1])
    return result

def _fraction_of_mpf_tuple(t):
    from fractions import Fraction
    sign,man,exponent,bc=t
    if bc<0:raise ValueError('nonfinite interval endpoint')
    out=Fraction(man*(1 if sign==0 else -1),1)
    return out*(2**exponent) if exponent>=0 else out/Fraction(2**(-exponent),1)
def _export_interval(x):
    """Outward dyadic rounding directly from exact internal endpoint tuples.

    No nearest-rounded mp.mpf conversion participates. This also avoids
    allocating exp(-1/u)'s potentially astronomical exact denominator.
    """
    p=max(32,mp.mp.prec-8);den=1<<p
    def rounded(t,up):
        sign,man,exponent,bc=t
        if bc<0:raise ValueError('nonfinite interval endpoint')
        shift=exponent+p
        if shift>=0:n=man<<shift;return -n if sign else n
        r=-shift
        if r>=man.bit_length():q=0;rem=(man!=0)
        else:q=man>>r;rem=(man != (q<<r))
        if sign:return -(q if up else q+int(rem))
        return q+int(rem) if up else q
    a=Fraction(rounded(x._mpi_[0],False),den);b=Fraction(rounded(x._mpi_[1],True),den)
    return (f'{a.numerator}/{a.denominator}',f'{b.numerator}/{b.denominator}')

def _rational_bounds(bounds):
    if isinstance(bounds,(int,float,str,Fraction)):bounds=(bounds,bounds)
    a,b=[z if isinstance(z,Fraction) else Fraction(str(z)) for z in bounds]
    if a>b:raise ValueError('reversed rational bounds')
    return a,b

def _rational_enclosure(x):
    return tuple(Fraction(z) for z in _export_interval(x))

def _import_interval(bounds):
    a,b=_rational_bounds(bounds)
    ia=mp.iv.mpf(a.numerator)/a.denominator;ib=mp.iv.mpf(b.numerator)/b.denominator
    return mp.iv.mpf([ia.a,ib.b])

def _iv_step(u):
    # Compare exact rational outward bounds with exact 0 and1. Dyadic export
    # leaves enough guard bits for the positive endpoint denominators below.
    lo,hi=_rational_enclosure(u)
    def point(v):
        if v<=0:return mp.iv.mpf(0)
        if v>=1:return mp.iv.mpf(1)
        z=_import_interval(v);a=mp.iv.exp(-1/z);b=mp.iv.exp(-1/(1-z));return a/(a+b)
    a=point(lo);b=point(hi)
    return mp.iv.mpf([a.a,b.b])

def _iv_raw_f(t,x):
    e=mp.iv.mpf('.01');c=mp.iv.cos(x);sn=mp.iv.sin(x);u=e*t*c;E=mp.iv.exp(2*u)
    return dict(f00=1/t**2-6*e*c/t-3*e*e*c*c,f01=2*e*sn,
                f11=2*u+E*(1+6*u+3*u*u),
                f22=u-e*e*t*t*sn*sn+E*(1+6*u+3*u*u),V=1/t**2)
def positive_extended_f_interval(q0_bounds,q1_bounds,bits=80):
    """Outward coefficient oracle with EXACT rational cutoff classification."""
    mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
    lo,hi=_rational_bounds(q0_bounds);x=_import_interval(q1_bounds)
    ident=dict(f00=mp.iv.mpf(1),f01=mp.iv.mpf(0),f11=mp.iv.mpf(1),f22=mp.iv.mpf(1),V=mp.iv.mpf(1))
    if hi<=CUT_LO or lo>=CUT_HI:out=ident
    else:
        tt=_import_interval((max(lo,CUT_LO),min(hi,CUT_HI)))
        chi=_iv_cut(tt);raw=_iv_raw_f(tt,x)
        out={k:chi*raw[k]+(1-chi)*ident[k] for k in raw}
        if lo<CUT_LO or hi>CUT_HI:
            out={k:_import_interval((min(_rational_enclosure(v)[0],_rational_enclosure(ident[k])[0]),max(_rational_enclosure(v)[1],_rational_enclosure(ident[k])[1]))) for k,v in out.items()}
    return dict(certified=True,bits=bits,entries={k:_export_interval(v) for k,v in out.items()},
                coordinate_F_eigenvalue_lower='2/25',method='exact rational cutoff decisions and outward interval coefficient arithmetic')

def material_derivatives_interval(t_bounds,x_bounds,bits=80):
    """Raw fixed-target coefficient derivatives for the candidate-residual map."""
    mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
    t=_import_interval(t_bounds);x=_import_interval(x_bounds);e=mp.iv.mpf('.01');c=mp.iv.cos(x);sn=mp.iv.sin(x);u=e*t*c;E=mp.iv.exp(2*u);ux=-e*t*sn
    out=dict(f00t=-2/t**3+6*e*c/t**2,
             f00x=6*e*sn/t+6*e*e*c*sn,
             trace_t=4*e*c-4*e*e*t*sn*sn+3*e*c*E*(8+18*u+6*u*u),
             trace_x=4*ux-4*e*e*t*t*sn*c+3*E*ux*(8+18*u+6*u*u),Vt=-2/t**3)
    out.update(_iv_raw_f(t,x))
    return dict(certified=True,bits=bits,entries={k:_export_interval(v) for k,v in out.items()})

def target_b_interval(t_bounds,x_bounds,bits=80):
    mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
    t=_import_interval(t_bounds);x=_import_interval(x_bounds)
    return _export_interval(t*mp.iv.exp(mp.iv.mpf('.01')*t*mp.iv.cos(x)))
def target_Bt_interval(t_bounds,x_bounds,bits=80):
    mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
    t=_import_interval(t_bounds);x=_import_interval(x_bounds)
    return _export_interval(1/t+mp.iv.mpf('.01')*mp.iv.cos(x))
def candidate_residual_interval(t_bounds,x_bounds,J,b_interval,Bt_interval,bits=80):
    """Actual candidate force density; exact rational cutoff classification."""
    mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
    lo,hi=_rational_bounds(t_bounds)
    if hi<=CUT_LO or lo>=CUT_HI:
        return dict(certified=True,entries={f'r{i}':('0/1','0/1') for i in range(4)})
    clipped=(max(lo,CUT_LO),min(hi,CUT_HI));t=_import_interval(clipped);x=_import_interval(x_bounds)
    # Keep the exact clipped input for callback boundaries. Arithmetic values
    # themselves are outward intervals and may safely cross a cutoff slightly.
    tb=tuple(str(z) for z in clipped);xb=tuple(str(z) for z in _rational_bounds(x_bounds))
    d=material_derivatives_interval(tb,xb,bits+16)['entries'];d={k:_import_interval(v) for k,v in d.items()}
    h=2*mp.iv.pi/J;xp=x+h;xm=x-h
    b=_import_interval(b_interval(tb,xb,bits+16));bt=_import_interval(Bt_interval(tb,xb,bits+16))
    bp=_import_interval(b_interval(tb,_export_interval(xp),bits+16));bm=_import_interval(b_interval(tb,_export_interval(xm),bits+16))
    fp=_iv_raw_f(t,xp);fm=_iv_raw_f(t,xm)
    div0=(bp*fp['f01']-bm*fm['f01'])/(2*h*b**3)
    div1=(bp*fp['f11']-bm*fm['f11'])/(2*h*b**3)
    chi=_iv_cut(t)
    out=[chi*(-d['f00t']/2-3*bt*d['f00']+div0-d['trace_t']/(2*b**2)-d['Vt']),
         chi*(-3*bt*d['f01']+div1+d['f00x']/2-d['trace_x']/(2*b**2)),mp.iv.mpf(0),mp.iv.mpf(0)]
    if lo<CUT_LO or hi>CUT_HI:
        out=[_import_interval((min(_rational_enclosure(v)[0],Fraction(0)),max(_rational_enclosure(v)[1],Fraction(0)))) for v in out]
    return dict(certified=True,entries={f'r{i}':_export_interval(v) for i,v in enumerate(out)},
                residual_type='force density: canonical controller force=-N_v v_v r_A')

def control_W_enclosure(q0_bounds,x_bounds,J,residual_interval,density_bound,bits=12,max_panels=1000000):
    """Certified W integral using exact rational endpoints, lengths and midpoints.

    The residual and density-bound callbacks remain caller-certified inputs.
    Input uncertainty or a resource cap never becomes an accuracy certificate.
    """
    mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
    ql,qh=_rational_bounds(q0_bounds);mid=(ql+qh)/2
    aa=CUT_LO;end=min(CUT_HI,max(aa,mid));radius=(qh-ql)/2
    D=_import_interval(density_bound)
    if _rational_bounds(density_bound)[0]<0:raise ValueError('nonnegative density bound required')
    endpoint_error=D*_import_interval(radius);er=_rational_enclosure(endpoint_error)[1]
    tol=Fraction(1,2**bits)
    if end==aa:
        box=(-er,er);ok=(box[1]-box[0]<=tol)
        return dict(certified=ok,interval=tuple(str(z) for z in box),panels=0,bits=bits,
                    **({} if ok else {'reason':'input endpoint uncertainty exceeds tolerance'}))
    cuts=[aa]+[z for z in (Fraction(1),Fraction(2)) if aa<z<end]+[end]
    panels=[(cuts[i],cuts[i+1]) for i in range(len(cuts)-1)]
    while len(panels)<=max_panels:
        total=mp.iv.mpf(0)
        for a,b in panels:
            rr=residual_interval((str(a),str(b)),x_bounds,J,bits+24)
            if not rr.get('certified',False):return dict(certified=False,reason='uncertified residual callback')
            total+=_import_interval(b-a)*_import_interval(rr['entries']['r0'])
        lo,hi=_rational_enclosure(total);box=(lo-er,hi+er)
        if box[1]-box[0]<=tol:return dict(certified=True,interval=tuple(str(z) for z in box),panels=len(panels),bits=bits)
        if 2*len(panels)>max_panels:return dict(certified=False,reason='panel resource cap',interval=tuple(str(z) for z in box),panels=len(panels))
        panels=[p for a,b in panels for p in ((a,(a+b)/2),((a+b)/2,b))]
    return dict(certified=False,reason='panel resource cap')

def canonical_norm_certificate(J,K,eta_bounds,RQ_upper,controller_density_upper,
                               b_lower='1/3',b_upper='3',Bt_upper='2',Btt_upper='2',bits=80):
    """Executed rational-interval operator-norm certificate for shear-free B.

    Covers zero-shift unit-lapse candidate metrics. Inputs b/Bt/Btt and control
    density are certified bounds supplied by candidate/controller receipts.
    Constants F<=7/5 and F^-1<=25/2 come from the fixed full-native extension.
    Includes the real positive control offset; no zero-point subtraction.
    """
    mp.mp.dps=max(30,int(bits*.31)+15);mp.iv.dps=mp.mp.dps
    h=2*mp.iv.pi/J;eta=_import_interval(eta_bounds);elo,_=_rational_bounds(eta_bounds)
    if elo<=0:raise ValueError('eta lower bound must be positive')
    bmin=_import_interval(b_lower);bmax=_import_interval(b_upper);bt=_import_interval(Bt_upper);btt=_import_interval(Btt_upper)
    R=_import_interval(str(RQ_upper));r=_import_interval(controller_density_upper)
    if _rational_bounds(b_lower)[0]<=0 or _rational_bounds(b_upper)[0]<=0 or min(_rational_bounds(str(RQ_upper))[0],_rational_bounds(controller_density_upper)[0],_rational_bounds(Bt_upper)[0],_rational_bounds(Btt_upper)[0])<0:raise ValueError('positive metric bounds and nonnegative upper bounds required')
    vmin=h**3*bmin**3;vmax=h**3*bmax**3;ginv=1/bmin**2
    P2=2*eta*h**2*K
    kin=2*mp.iv.mpf('12.5')*P2/vmin
    grad=6*vmax*ginv*mp.iv.mpf('1.4')*(1+R/h)**2
    pot=vmax*(mp.iv.mpf(100)/81+(mp.iv.mpf('4.2')+2*R)*r)
    cells=J**3;HH=cells*(kin+grad+pot)
    H1=cells*bt*(3*kin+grad+3*pot)
    H2=cells*((3*btt+9*bt**2)*(kin+pot)+(btt+bt**2)*grad)
    rho=(kin+grad+pot)/vmin
    rho1=bt*(6*kin+2*grad)/vmin
    rho2=((6*btt+36*bt**2)*kin+(2*btt+4*bt**2)*grad)/vmin
    rate=rho1+2*HH*rho/eta
    rate_explicit1=rho2+2*(H1*rho+HH*rho1)/eta
    out=dict(H=HH,H_explicit_time_derivative=H1,H_explicit_second_time_derivative=H2,
             cell_kinetic=kin,cell_gradient=grad,cell_positive_potential=pot,
             cell_energy_density=rho,cell_density_explicit_time_derivative=rho1,
             actual_cell_source_rate=rate,source_rate_explicit_time_derivative=rate_explicit1,
             source_rate_square=rate**2,source_rate_square_explicit_derivative=2*rate*rate_explicit1)
    return dict(certified=True,bits=bits,upper_bounds={k:_export_interval(v)[1] for k,v in out.items()},
                assumptions='Certified input bounds; N=1,beta=0,gamma=b²I; profiles fixed material functions; all native states retained.',
                scope='Conservative full-operator norm bounds, including commutator rates, suitable for finite time-mesh acceptance.')
