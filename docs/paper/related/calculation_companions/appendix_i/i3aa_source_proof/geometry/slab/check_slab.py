#!/usr/bin/env python3
from slab_family import *
from pathlib import Path
from itertools import product
import json, hashlib, math, numpy as np
from scipy.sparse import coo_matrix,diags
from scipy.sparse.linalg import eigsh
from scipy.sparse.csgraph import connected_components
ROOT=Path(__file__).resolve().parent
p=parameters(0);N=p['N'];M=N//4
assert p['slab_nodes']*p['h']**4==F(1,4)
first=slab_vertex(p,0);last=slab_vertex(p,p['slab_nodes']-1)
assert cell(p,first)['time_faces_y'][0]==F(1,4)
assert cell(p,last)['time_faces_y'][1]==F(1,2)
assert neighbor(p,first,0,-1) is None and neighbor(p,last,0,1) is None
assert first[0]==M and last[0]==2*M-1
native=[]
for j in [(M,0,0,0),(3*N//8,N//4,0,0),(N//2-1,N//2,0,0)]:
 out=source_outputs_iv(p,j,20);meas=measure_iv(p,j,20)
 assert max(out['rho'][0],out['rho_formula12'][0])<=min(out['rho'][1],out['rho_formula12'][1])
 assert out['energy_rate'][1]<0 and out['sigma2']==B.ZERO
 for direct,source in zip(out['W_y'],out['W_from_actual_source']):assert max(direct[0],source[0])<=min(direct[1],source[1])
 e=axis_edge_iv(p,j,1,1,20);rev=axis_edge_iv(p,e['head'],1,-1,20)
 assert max(e['conductance'][0],rev['conductance'][0])<=min(e['conductance'][1],rev['conductance'][1])
 mr=B.mul(meas['mass'],e['rate'])
 assert max(mr[0],e['conductance'][0])<=min(mr[1],e['conductance'][1])
 native.append({'j':j,'theta':serialize(out['theta']),'rho':serialize(out['rho']),'rate':serialize(out['energy_rate']),'capacity_q':serialize(meas['q'])})
# The exact former kink is now smooth; test its exact values and variations.
s=(p['R']//4,0,0,0);j=(M,0,0,0);r=receipt_iv(p,j,s,20)
expected={'x':F(1),'w':1+p['receipt_epsilon']/2,'Fprime':F(1,2),'Fsecond':F(p['R'],2),
          'Dx_H':F(1,32),'Dw_H':F(1,64),'D2x_HJ':F(-1,1024),'D2w_HJ':F(p['R']-1,2048)}
for k,v in expected.items():assert r[k][0]<=v<=r[k][1],(k,r[k],v)
# Full finite reflecting graph check on the same formulas at a smaller diagnostic
# mesh. This does not claim the enormous global-BE cutoff for the diagnostic mesh.
Nd=8;Md=Nd//4;hd=1/Nd
nodes=list(product(range(Md,2*Md),range(Nd),range(Nd),range(Nd)));idx={j:k for k,j in enumerate(nodes)}
def coeff(j):
 t=4*(j[0]+.5)/Nd;x=2*math.pi*j[1]/Nd;b=t*math.exp(.01*t*math.cos(x));mu=32*math.pi**3*b**3
 return t,x,b,mu,(2*math.pi**3*b**3,8*math.pi*b,8*math.pi*b,8*math.pi*b)
mu=np.array([coeff(j)[3]*hd**4 for j in nodes]);theta=np.array([3*(1/coeff(j)[0]+.01*math.cos(coeff(j)[1])) for j in nodes])
rows=[];cols=[];vals=[];edgecount=0
for z,j in enumerate(nodes):
 for i in range(4):
  k=list(j);k[i]+=1
  if i==0 and k[0]>=2*Md:continue
  if i>0:k[i]%=Nd
  k=tuple(k);v=idx[k]
  mid=list(j);mid[i]+=.5
  # A time midpoint uses the time-node phase as well; spatial midpoints use x.
  c=coeff(mid)[4][i];g=hd**2*c
  rows.extend([z,v,z,v]);cols.extend([z,v,v,z]);vals.extend([g,g,-g,-g]);edgecount+=1
K=coo_matrix((vals,(rows,cols)),shape=(len(nodes),len(nodes))).tocsr()
assert connected_components(K,directed=False,return_labels=False)==1
assert np.max(np.abs(K@np.ones(len(nodes))))<1e-10
S=diags(1/np.sqrt(mu))@K@diags(1/np.sqrt(mu));eigs=eigsh(S,k=3,which='SM',return_eigenvectors=False,tol=1e-10);eigs=np.sort(eigs)
nu=Nd*Nd/math.pi**2*math.sin(math.pi/Nd)**2;gaplower=nu/(64*math.exp(.13))
assert abs(eigs[0])<1e-9 and eigs[1]/2>=gaplower
mean=np.dot(mu,theta)/sum(mu);var=np.dot(mu,(theta-mean)**2)/sum(mu);energy=.5*theta@(K@theta)/sum(mu)
assert var>0 and energy>=gaplower*var
source=K@theta;assert abs(sum(source))<1e-10
# Refining common output/energy diagnostic; y,z cancel exactly by symmetry.
def diagnostic(N):
 M=N//4;dt=4/N;dx=2*math.pi/N;t=1+(np.arange(M)+.5)*dt;x=np.arange(N)*dx
 T=t[:,None];X=x[None,:];b=T*np.exp(.01*T*np.cos(X));w=b**3;th=3*(1/T+.01*np.cos(X));m=w.sum();av=(w*th).sum()/m;var=(w*(th-av)**2).sum()/m
 tm=(t[:-1]+t[1:])/2;bmid=tm[:,None]*np.exp(.01*tm[:,None]*np.cos(X))
 Et=(bmid**3*((th[1:]-th[:-1])/dt)**2).sum()
 xm=x+dx/2;bm=T*np.exp(.01*T*np.cos(xm[None,:]));Ex=(bm*((np.roll(th,-1,axis=1)-th)/dx)**2).sum()
 return {'N':N,'mean_theta':float(av),'variance_theta':float(var),'Q':float(2*var/3),'normalized_Cheeger_theta':float((Et+Ex)/(2*m)),'nu_N':N*N/math.pi**2*math.sin(math.pi/N)**2}
diag=[diagnostic(N) for N in (8,16,32,64,128,256)]
assert all(z['variance_theta']>0 for z in diag)
assert abs(diag[-1]['Q']-diag[-2]['Q'])<abs(diag[1]['Q']-diag[0]['Q'])
record={'all_pass':True,'exact_domain_coordinate_volume':'1/4','exact_time_faces':['1','2'],'midpoint_cells_no_half_cells':True,
 'source_capacity_and_reversible_rate_probes':native,'smooth_former_kink_exact_targets':{k:str(v) for k,v in expected.items()},
 'smooth_former_kink_intervals':serialize(r),'complete_reflecting_graph':{'N':Nd,'vertices':len(nodes),'undirected_edges':edgecount,'connected':True,'generator_gap_numeric':float(eigs[1]),'Cheeger_gap_lower_bound':gaplower,'theta_variance':float(var),'theta_energy':float(energy),'forcing_mean_zero_error':float(abs(sum(source)))},
 'common_output_quadrature_diagnostics':diag,'scope':'Finite algebra/enclosures plus diagnostic spectral checks; full slab Mosco and uniform gap are proved analytically. Ambient graph BE is not asserted for the reflecting boundary restriction.'}
(ROOT/'SLAB_CHECKS.json').write_text(json.dumps(record,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in record.items() if k not in ['source_capacity_and_reversible_rate_probes','smooth_former_kink_intervals']},indent=2))
