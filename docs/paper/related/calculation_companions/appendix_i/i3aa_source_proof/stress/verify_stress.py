#!/usr/bin/env python3
"""Exact symbolic identities + independently evaluated finite diagnostics.
The numerical quadrature is a diagnostic, not the proof of the inequalities.
All quantities here use ell=kappa=1; the proof restores dimensions.
"""
import json, math
from pathlib import Path
import numpy as np
import sympy as s
from numpy.polynomial.legendre import leggauss
p=Path(__file__).resolve().parent
t,x,y,z,e=s.symbols('t x y z e', positive=True, real=True)
coords=[t,x,y,z]
a=t*s.exp(e*t*s.cos(x)); H=1/t+e*s.cos(x)
g=s.diag(-1,a*a,a*a,a*a); gi=g.inv()
Gamma=[[[s.simplify(sum(gi[i,k]*(s.diff(g[k,j],coords[l])+s.diff(g[k,l],coords[j])-s.diff(g[j,l],coords[k])) for k in range(4))/2) for l in range(4)] for j in range(4)] for i in range(4)]
Ric=s.Matrix(4,4,lambda i,j:s.simplify(sum(s.diff(Gamma[k][i][j],coords[k])-s.diff(Gamma[k][i][k],coords[j])+sum(Gamma[k][k][l]*Gamma[l][i][j]-Gamma[k][j][l]*Gamma[l][i][k] for l in range(4)) for k in range(4))))
R3=s.diag(2*e*t*s.cos(x), e*t*s.cos(x)-e**2*t**2*s.sin(x)**2,e*t*s.cos(x)-e**2*t**2*s.sin(x)**2)
expected=s.zeros(4);expected[0,0]=-6*e*s.cos(x)/t-3*e**2*s.cos(x)**2
expected[0,1]=expected[1,0]=2*e*s.sin(x)
for i in range(1,4):expected[i,i]=R3[i-1,i-1]+(-1/t**2+3*H**2)*a*a
ric_ok=all(s.simplify(Ric[i,j]-expected[i,j])==0 for i in range(4) for j in range(4))
F=Ric-g/t**2; V=1/t**2
T=F-g*(s.trace(gi*F)/2+V)
G=Ric-g*s.trace(gi*Ric)/2
stress_ok=all(s.simplify(T[i,j]-G[i,j])==0 for i in range(4) for j in range(4))
rho=3*H**2+2*e*t*s.cos(x)/a**2-e**2*t**2*s.sin(x)**2/a**2
theta=3*H; rate=s.diff(rho,t)
rho_ok=s.simplify(T[0,0]-rho)==0
momentum_ok=s.simplify(s.diff(theta,x)+(s.Rational(3,2))*T[0,1])==0
T_hat=s.diag(1,1/a,1/a,1/a)*T*s.diag(1,1/a,1/a,1/a)
F_hat=s.diag(1,1/a,1/a,1/a)*F*s.diag(1,1/a,1/a,1/a)
# Direct Noether check of the material scalar equations on Phi^A=z^A.
# E_A = div(F_A B grad Phi^B)-1/2 partial_A F_B C g^BC-partial_A V.
scalar=[]
for A in range(4):
    div=sum(s.diff(a**3*sum(F[A,B]*gi[mu,B] for B in range(4)),coords[mu]) for mu in range(4))/a**3
    rhs=sum(s.diff(F[B,C],coords[A])*gi[B,C] for B in range(4) for C in range(4))/2+s.diff(V,coords[A])
    scalar.append(s.simplify(s.expand_trig(div-rhs))==0)
# Scalar-constraint initial-data alternative.
phi=s.symbols('phi',real=True);AA=s.Rational(1,4);Pi=s.Integer(1);theta0=3-s.Rational(3,2)*phi
Vs=s.Rational(79,32)-3*phi+s.Rational(5,4)*phi**2
initial_hamiltonian=s.simplify(theta0**2/3-(Pi**2/2+(AA**2-phi**2)/2+Vs))==0
# Explicit analytic lower/upper bounds used by the proof.
eps=.01
kinetic_lower=.25-6*eps-2*eps*math.exp(4*eps)-2*eps*math.exp(eps)
rate_error_upper=12*eps+4*eps*math.exp(4*eps)+16*eps**2*math.exp(4*eps)+16*eps**3*math.exp(4*eps)
poincare_upper=32*math.exp(13*eps)
# Tensor-product Gaussian integration (periodic x is also integrated by Gauss).
numfun=s.lambdify((t,x,e),[a,theta,rho,rate]+list(T_hat)+list(F_hat),'numpy',cse=True)
records=[]
for n in [32,64,128]:
    q,w=leggauss(n);tt=(1.5+.5*q)[:,None];xx=(math.pi+math.pi*q)[None,:]
    ww=.5*w[:,None]*math.pi*w[None,:]
    vals=numfun(tt,xx,eps)
    vals=[np.broadcast_to(np.array(v,dtype=float),(n,n)) for v in vals]
    av,th,rr,dr=vals[:4]; W=ww*av**3;Z=W.sum(); avg=lambda f:float((W*f).sum()/Z)
    Tn=np.stack(vals[4:20],axis=-1).reshape(n,n,4,4)
    Fn=np.stack(vals[20:36],axis=-1).reshape(n,n,4,4)
    means=np.sum(W[:,:,None,None]*Tn,axis=(0,1))/Z
    vt=avg(np.sum((Tn-means)**2,axis=(2,3)))
    vth=avg(th*th)-avg(th)**2; er=avg(dr*dr)
    grad2=9/tt**4+9*eps**2*np.sin(xx)**2/av**2
    rhs_grad=4*er+2.25*vt
    records.append(dict(n=n,volume_without_yz=Z,mean_theta=avg(th),variance_theta=vth,Q=2*vth/3,
        stress_variance=vt,source_rate_L2_squared=er,gradient_energy=avg(grad2),
        elliptic_B=poincare_upper*rhs_grad,kinetic_eigenvalue_min_sample=float(np.linalg.eigvalsh(Fn).min()),
        max_temporal_rate_ratio=float(np.max((3/tt**2)/abs(dr))),gradient_inequality_holds=avg(grad2)<=rhs_grad))
res=dict(symbolic=dict(ricci_components=ric_ok,metric_variation_equals_einstein_tensor=stress_ok,
    rho_formula=rho_ok,momentum_constraint=momentum_ok,material_scalar_Euler_Lagrange=scalar,
    alternative_initial_hamiltonian_constraint=initial_hamiltonian),
    analytic_bounds=dict(epsilon=eps,kinetic_eigenvalue_lower=kinetic_lower,
    rate_error_times_t_cubed_upper=rate_error_upper,poincare_constant_upper=poincare_upper),
    numerical_diagnostics=records,
    scope='Exact continuum action/congruence/elliptic proof. This does not certify a native MPU stock or warped-torus graph family.')
assert ric_ok and stress_ok and rho_ok and momentum_ok and all(scalar) and initial_hamiltonian
assert kinetic_lower>.14 and rate_error_upper<3
assert all(r['Q']>0 and r['stress_variance']>0 and r['gradient_inequality_holds'] for r in records)
(p/'STRESS_VERIFICATION.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res,indent=2))
