#!/usr/bin/env python3
"""Reduced, literal full-native checks; no huge tensor-history claim."""
from pathlib import Path
import sys,json,itertools,math
import numpy as np
sys.dont_write_bytecode=True
import native_master_source as M
F=M.F
ROOT=Path(__file__).resolve().parent
r=M.SourceRow(0,2,1,3,2,b'paid descriptor')
assert r.N==8*10**28*r.R**3 and r.V==r.N**4 and r.edges==r.V*((2*r.R+1)**4-1)
assert r.ell/r.N==r.delta_prop/r.R and r.eta==r.hbar*r.kappa/r.ell**2
assert sum(dict(r.blocks).values())==r.native_count
for block,n in r.blocks:
 if n:
  for i in {0,n-1,n//2}:assert r.factor_at(r.factor(block,i))==(block,i)
# 512 actually correlated qualifier outputs, archive readiness and native key access.
qualified=[M.qualification_support(*z) for z in itertools.product(range(8),repeat=3)]
ready=[M.qualification_support(*z,phase='ready') for z in itertools.product(range(8),repeat=3)]
assert len(set(qualified))==len(set(ready))==512
assert {x[0] for x in qualified}==set(range(8)) and {x[0] for x in ready}=={0}
assert {x[-1] for x in ready}==set(range(8))
for i in range(512):assert qualified[i][0]==ready[i][-1] and qualified[i][1:12]==ready[i][1:12]
assert M.qualification_density_entry(qualified[0],qualified[1])==0
assert sum(M.qualification_density_entry(x,x) for x in qualified)==1
# Qualification gates are actual modes of the same counted native history.
qw=M.qualification_operation(r,0,'training')
for th,x0,x1 in itertools.product(range(8),repeat=3):
 st={r.factor('qualification',1):th,r.factor('qualification',2):x0,r.factor('qualification',3):x1}
 got=M.apply_word_sparse(qw,st)
 assert tuple(got.get(r.factor('qualification',i),0) for i in range(12))==M.qualification_support(th,x0,x1)[:12]
# Full edge spectrum and channel all native8 inputs and reference matrix units.
columns=0
for z in itertools.product(range(8),repeat=5):
 assert M.edge.inverse(M.edge.word(z))==z
 assert M.edge.energy_multiplier(M.edge.word(z))==M.edge.energy_multiplier(z)
 columns+=1
for i,j in itertools.product(range(8),repeat=2):assert M.edge.channel_matrix_unit(i,j)==M.edge.g_matrix_unit(i,j)
# Full volume mode, including six noncode flag levels, is a permutation.
for z in itertools.product(range(8),repeat=5):assert M.volume.inverse(M.volume.word(z))==z
for i,j in itertools.product(range(8),repeat=2):
 for z in (0,1):M.volume.channel_matrix_unit(i,j,z)
# Exact factor aliases and private ownership: no separately invented sender key.
e=0;a,b,s=r.directed_edge(e);w=M.edge_operation(r,e)
prep=M.readiness_operation(r,e,'edge')
assert prep[0][1]==(r.key(a),r.archive(a)) and prep[1][1]==(r.key(b),r.archive(b))
assert w[-2][1]==(r.key(a),r.key(b))
state={r.key(a):5,r.key(b):0}
for i in range(3):state[r.factor('edge_AWF',3*e+i)]=(0,1,0)[i]
# Sparse maps may include explicit zero entries; compare on actual support.
after=M.apply_word_sparse(w,state);back=M.apply_word_sparse(w,after,reverse=True)
assert all(back.get(i,0)==state.get(i,0) for i in set(back)|set(state))
# Actual candidate curved weight vs the slab receipt: independent adapter.
j=(r.N//4,0,0,0);a=r.vertex_id(j);d=r.degree//2+1
actual=M.curved_receipt(r,M.ExactBranch(),a,d,bits=14)
reference=M.slab.receipt_iv(r.p,j,M.B.direction(r.p,d),bits=14)
for name in ('w','Dw_H','D2w_HJ'):
 assert max(actual[name][0],reference[name][0])<=min(actual[name][1],reference[name][1])
# Midpoint time convention, selected q and physical cell map.
y=M.slab.position_y(r.p,j);c=M.candidate_coefficients(M.ExactBranch(),y,16)
assert 0<c['q'][0]<=c['q'][1]<1
assert r.scalar_cell(a)==0
class Changed(M.ExactBranch):
 def b_iv(self,y,bits=30):return M.B.scale(super().b_iv(y,bits),F(101,100))
changed=M.candidate_coefficients(Changed(),y,16)
assert changed['q'][0]>c['q'][1]
# Positive perfect-transfer Hamiltonian on all 64 clock states. Full data sector
# with native8 swap involution, not logical two-state truncation.
L=5;A=np.zeros((64,64))
for j in range(L):A[j,j+1]=A[j+1,j]=math.sqrt((j+1)*(L-j))
H=L*np.eye(64)-A
vals,U=np.linalg.eigh(H)
assert vals.min()>-1e-12 and abs(vals.max()-2*L)<1e-12
T=(U*np.exp(-.5j*math.pi*vals))@U.T
assert abs(T[L,0]-1)<2e-14 and np.linalg.norm(np.delete(T[:,0],L))<2e-14
# Clock padding is real positive energy, not omitted noncode space.
assert np.all(np.diag(H)[L+1:]==L)
# Geometry-dependent complete theta bound includes native stocks and profile norms.
budget=M.auxiliary_majorant(r,M.ExactBranch(),F(1,100),material_test_norm=100)
assert budget['theta_physical']>0
assert budget['source_L2_Hminus1_pairing_bound']<F(1,100)
assert budget['state_Duhamel_bound']<F(1,100)
assert budget['rate_square_comparison_bound']<F(1,100)
support=r.module_support('qualification',0);center=support['coordinate_center']
assert M.bump_profile_iv(r,center,center,8)[0]>0
outside=list(center);outside[0]+=F(1,3*r.N)
assert M.bump_profile_iv(r,center,outside,8)==M.B.ZERO
for L in (1,3,5,15):
 for code in range(64):assert M.clock_terminal_rearm(M.clock_terminal_rearm(code,L),L)==code
assert M.event_map(r,a)['actual_clock_coordinate']==4*y[0]
out={'all_pass':True,'scope':'Reduced full-native algebra and indexed actual-family checks, not enormous matrix evolution',
 'full_native_edge_columns':columns,'full_native_volume_columns':8**5,'reference_stable_edge_matrix_units':64,
 'correlated_qualifier_states':512,'padded_history_clock_dimension':64,'history_endpoint_error':float(abs(T[L,0]-1)),
 'actual_curved_receipt_overlap':{k:[str(x) for x in actual[k]] for k in ('w','Dw_H','D2w_HJ')},
 'selected_profile_changes_actual_capacity':True,'source_count':r.manifest(),
 'auxiliary_bound':{k:str(v) for k,v in budget.items()},'dependency_sha256':M.dependency_hashes(),
 'not_executed':['astronomical full tensor','uniform quantum-history interval certificate','full candidate selector search']}
(ROOT/'NATIVE_MASTER_CHECKS.json').write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ('source_count','auxiliary_bound','dependency_sha256')},indent=2))
