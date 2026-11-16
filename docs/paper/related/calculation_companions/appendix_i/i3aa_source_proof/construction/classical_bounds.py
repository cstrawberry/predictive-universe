"""Explicit finite-jet classical interpolation/controller derivative bounds."""
from fractions import Fraction as F
from math import factorial
import bind_common_source as S
T=S.TASK;I=S.B;CI=S.CI

def fields(candidate,tbox,xbox,n,bits):
    tj=T.Jet(n,bits,{(0,0):tuple(map(F,tbox)),(1,0):I.ONE})
    co=T.from_derivatives(n,bits,lambda a,b:I.ZERO if a else CI.trig_derivative('cos',1,xbox,b,bits+12))
    si=T.from_derivatives(n,bits,lambda a,b:I.ZERO if a else CI.trig_derivative('sin',1,xbox,b,bits+12))
    Bj=T.from_derivatives(n,bits,lambda a,b:CI.B_derivative(candidate,tbox,xbox,a,b,bits+12))
    eps=F(1,100);u=eps*tj*co;iv=tj.inv();V=iv**2;common=(2*u).exp()*(1+6*u+3*u**2)
    f00=V-6*eps*co*iv-3*eps**2*co**2;f01=2*eps*si;f11=2*u+common;f22=u-eps**2*tj**2*si**2+common
    return Bj,f00,f01,f11,f22,V

def controller_jets(candidate,J,tbox,xbox,order=1,bits=40):
    n=order+2;bits+=16
    Bj,f00,f01,f11,f22,V=fields(candidate,tbox,xbox,n,bits);tr=f11+2*f22;h=I.scale(I.pi_iv(bits+16),F(2,J))
    hj=T.Jet(n,bits,{(0,0):h})
    xp=(F(xbox[0])+h[0],F(xbox[1])+h[1]);xm=(F(xbox[0])-h[1],F(xbox[1])-h[0])
    bp,_,fp0,fp1,_,_=fields(candidate,tbox,xp,n,bits);bm,_,fm0,fm1,_,_=fields(candidate,tbox,xm,n,bits)
    div0=(bp.exp()*fp0-bm.exp()*fm0)*(2*hj).inv()*(-3*Bj).exp()
    div1=(bp.exp()*fp1-bm.exp()*fm1)*(2*hj).inv()*(-3*Bj).exp()
    lo,hi=map(F,tbox)
    l=CI.chi_derivatives((10*(lo-F(9,10)),10*(hi-F(9,10))),n,bits+12)
    r=CI.chi_derivatives((10*(F(21,10)-hi),10*(F(21,10)-lo)),n,bits+12)
    lj=T.from_derivatives(n,bits,lambda a,b:I.ZERO if b else I.scale(l[a],10**a))
    rj=T.from_derivatives(n,bits,lambda a,b:I.ZERO if b else I.scale(r[a],(-10)**a))
    cut=lj*rj
    r0=cut*(-F(1,2)*f00.derivative(1,0)-3*Bj.derivative(1,0)*f00+div0-F(1,2)*(-2*Bj).exp()*tr.derivative(1,0)-V.derivative(1,0))
    r1=cut*(-3*Bj.derivative(1,0)*f01+div1+F(1,2)*f00.derivative(0,1)-F(1,2)*(-2*Bj).exp()*tr.derivative(0,1))
    return r0,r1

def interpolation_certificate(source):
    panels=2**source.stage;bits=source.bits;max_rx=F(0);max_rt=F(0);max_base=F(0);max_dx=F(0);max_dt=F(0);mu_derivative=F(0)
    for a in range(panels):
        tb=(F(9,10)+F(6*a,5*panels),F(9,10)+F(6*(a+1),5*panels))
        for b in range(panels):
            xb=(F(7*b,panels),F(7*(b+1),panels))
            rr=controller_jets(source.candidate,source.J,tb,xb,1,bits)
            max_rx=max(max_rx,S.absolute(rr[0].actual(0,1)))
            max_rt=max(max_rt,S.absolute(rr[0].actual(1,0)))
            # Uniform source comparisons are required only on retained slab.
            u,v=max(F(1),tb[0]),min(F(2),tb[1])
            if u>v:continue
            Bj,f00,f01,f11,f22,V=fields(source.candidate,(u,v),xb,3,bits+16)
            tr=f11+2*f22;em=(-2*Bj).exp()
            rho=F(1,2)*f00+F(1,2)*em*tr+V
            momentum=(-Bj).exp()*f01
            pressure=F(1,2)*f00-F(1,2)*em*tr-V
            outputs=(rho,momentum,pressure+em*f11,pressure+em*f22,rho.derivative(1,0),3*Bj.derivative(1,0))
            max_base=max(max_base,*(S.absolute(o.actual(0,0)) for o in outputs))
            max_dx=max(max_dx,*(S.absolute(o.actual(0,1)) for o in outputs))
            max_dt=max(max_dt,*(S.absolute(o.actual(1,0)) for o in outputs))
            mu=(3*Bj).exp()
            mu_derivative=max(mu_derivative,S.absolute(mu.actual(1,0)),S.absolute(mu.actual(0,1)))
    Wbound=F(6,5)*source.density_bound
    W_x_bound=F(6,5)*max_rx
    control_bound=(3+source.RQ)*source.density_bound+Wbound
    magnitude=max_base+control_bound
    derivative=max_dx+W_x_bound
    time_derivative=max_dt+source.density_bound+max_rt
    # volume<=27*(2pi)^3<13824, sqrtvolume<118, Frobenius<=4maxcomponent,
    # cell x diameter<8/J and literal midpoint time pitch4/N<=4/J.
    # Factor8192 dominates4*118*(8+4). mu in[1/27,27] controls
    # normalized weighted-ratio errors;10^6 dominates denominator factors.
    L2=F(8192,source.J)*(1+2*magnitude)*(1+derivative+time_derivative)
    weighted_moment=F(10**6,source.J)*(1+magnitude)**3*(1+derivative+time_derivative+mu_derivative)
    return {'source_and_second_moment_L2_interpolation_bound':max(L2,weighted_moment),
            'literal_4D_weighted_moment_quadrature_bound':weighted_moment,
            'time_grid_step_upper':F(4,source.row.N),'spatial_grid_step_upper':F(8,source.J),
            'frame_component_absolute_bound':magnitude,'frame_spatial_derivative_bound':derivative,
            'frame_time_derivative_bound':time_derivative,'volume_weight_derivative_bound':mu_derivative,
            'controller_Wx_bound':W_x_bound,'finite_box_count':panels**2,
            'method':'Exact finite jets for T,T², energy rate/rate² and theta/theta²; actual candidate/controller and frame/volume conversion'}
