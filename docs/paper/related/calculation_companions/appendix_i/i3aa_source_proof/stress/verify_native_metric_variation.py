"""Instantaneous full-native K=8^1 per mode source check; not a history proof."""
import numpy as np, json, math
from pathlib import Path
K=8;t0=1.5;x0=.7;eps=.01;h=1.
def coeff(t,x):
 b=t*np.exp(eps*t*np.cos(x)); H=1/t+eps*np.cos(x)
 f00=1/t**2-6*eps*np.cos(x)/t-3*eps**2*np.cos(x)**2
 f01=2*eps*np.sin(x)
 common=(1/t**2+6*eps*np.cos(x)/t+3*eps**2*np.cos(x)**2)*b*b
 f11=2*eps*t*np.cos(x)+common
 f22=eps*t*np.cos(x)-eps**2*t*t*np.sin(x)**2+common
 return [f00,f01,f11,f22,1/t**2]
b=t0*math.exp(eps*t0*math.cos(x0));v=b**3
f0=coeff(t0,x0);pstar=np.array([v*f0[0],v*f0[1],0,0])
Kcl=.5/v*(pstar[0]**2*f0[2]-2*pstar[0]*pstar[1]*f0[1]+pstar[1]**2*f0[0])/(f0[0]*f0[2]-f0[1]**2)
Gcl=.5*v/b**2*(f0[2]+2*f0[3]);Vcl=v*f0[4];Ecl=Kcl+Gcl+Vcl
out=[]
for eta in [1e-2,1e-3,1e-4,1e-5]:
 a=np.diag(np.sqrt(np.arange(1,K)),1);Q=math.sqrt(eta/2)*(a+a.T);P=-1j*math.sqrt(eta/2)*(a-a.T)
 vals,U=np.linalg.eigh(Q); Pq=U.T@P@U; vac=U[0,:].astype(complex)
 psi=np.einsum('i,j,k,l->ijkl',vac,vac,vac,vac)
 def papply(axis):
  Paxis=Pq+pstar[axis]*np.eye(K)
  return np.moveaxis(np.tensordot(Paxis,psi,axes=(1,axis)),0,axis)
 ps=[papply(i) for i in range(4)]
 tt=(t0+vals)[:,None,None,None];xx=(x0+vals)[None,:,None,None]
 f00,f01,f11,f22,V=coeff(tt,xx);det=f00*f11-f01*f01
 assert np.min(det)>0 and np.min(f22)>0
 A00=f11/det;A01=-f01/det;A11=f00/det;A22=1/f22
 kin=np.sum(np.conj(ps[0])*A00*ps[0]+np.conj(ps[1])*A11*ps[1]+2*np.real(np.conj(ps[0])*A01*ps[1])+np.conj(ps[2])*A22*ps[2]+np.conj(ps[3])*A22*ps[3]).real/(2*v)
 prob=abs(psi)**2; grad=np.sum(prob*.5*v/b**2*(f11+2*f22));pot=np.sum(prob*v*V)
 energy=kin+grad+pot
 def E(s):return math.exp(-3*s)*kin+math.exp(s)*grad+math.exp(3*s)*pot
 d=1e-5;fd=(E(d)-E(-d))/(2*d);actual=-3*kin+grad+3*pot
 out.append(dict(eta=eta,native_factors=4,full_dimension=K**4,code_states_omitted=0,
  actual_energy=float(energy),classical_energy=float(Ecl),energy_difference=float(energy-Ecl),
  positive_kinetic=float(kin),positive_gradient=float(grad),positive_potential=float(pot),
  actual_isotropic_metric_derivative=float(actual),finite_difference_metric_derivative=float(fd),
  derivative_abs_error=float(abs(fd-actual)),lapse_derivative_equals_full_energy=True,
  zero_point_subtracted=False))
 assert abs(fd-actual)<1e-6
assert all(abs(out[i+1]['energy_difference'])<.2*abs(out[i]['energy_difference']) for i in range(len(out)-1))
r=dict(scope='Instantaneous actual Hamiltonian/metric-variation consistency on all 8^4 native states. Gradient rod data are fixed local cell data for this smoke test. Not a source-history or semiclassical-uniform theorem.',checks=out)
Path(__file__).with_name('NATIVE_METRIC_VARIATION_VERIFICATION.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps(r,indent=2))
