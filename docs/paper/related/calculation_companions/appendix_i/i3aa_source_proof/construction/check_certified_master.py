#!/usr/bin/env python3
from pathlib import Path
import sys,json,numpy as np
sys.dont_write_bytecode=True
import certified_spectral as C
import certified_canonical as Q
import certify_history as H
import native_master_source as S
import observable_instruments as OI
F=S.F
K=8;Jmat=np.diag(np.sqrt(np.arange(1,K)),1)+np.diag(np.sqrt(np.arange(1,K)),-1);ev,U=np.linalg.eigh(Jmat)
spectral=[]
for j in range(K):
 p=C.eigenpair(K,j,eta=F(2),bits=18)
 assert float(p['value'][0])<=ev[j]<=float(p['value'][1])
 if U[0,j]<0:U[:,j]*=-1
 assert all(float(v[0])-1e-14<=u<=float(v[1])+1e-14 for v,u in zip(p['vector'],U[:,j]))
 spectral.append({'root':j,'width':str(p['value'][1]-p['value'][0]),'working_bits':p['working_bits']})
E,tail,terms=C.matrix_exp([[C.cpoint(),C.cpoint(0,-1)],[C.cpoint(0,-1),C.cpoint()]],F(1,2**25))
assert float(E[0][0][0][0])<=np.cos(1)<=float(E[0][0][0][1])
assert float(E[0][1][1][0])<=-np.sin(1)<=float(E[0][1][1][1])
registry=S.load('dark03_registry_test',S.BASE/'common_source/candidate_registry.py')
ci=S.load('dark03_candidate_interval_test',S.BASE/'common_source/candidate_intervals.py')
candidate=registry.Registry(0).decode(1);ad={'b_interval':lambda t,x,bits=40:ci.b_interval(candidate,tuple(map(F,t)),tuple(map(F,x)),bits),'Bt_interval':lambda t,x,bits=40:ci.Bt_interval(candidate,tuple(map(F,t)),tuple(map(F,x)),bits)}
res=lambda tb,xb,J,bits:Q.M.candidate_residual_interval(tb,xb,J,ad['b_interval'],ad['Bt_interval'],bits)
source=Q.CertifiedCanonical(1,8,F(20),ad['b_interval'],res,F(40),bits=10)
# Point numerical candidate metric is a diagnostic, not the certificate.
def midpoint(iv):return float(sum(F(v) for v in iv)/2)
def bc(t,x):return midpoint(ad['b_interval']((F(str(t)),)*2,(F(str(x)),)*2,35))
def btc(t,x):return midpoint(ad['Bt_interval']((F(str(t)),)*2,(F(str(x)),)*2,35))
def metric(t,x):return {'N':1.,'beta':np.zeros(3),'gamma':bc(t,x)**2*np.eye(3)}
profile=Q.M.make_candidate_controller(1,bc,btc,40,'finite nonzero candidate code1')
numerical=Q.M.CanonicalMatterSource(1,8,20,True,metric,profile);numerical.RQ_budget=source.RQ
entries=[]
for a,b in [(0,0),(0,1),(0,8),(0,64),(1,8)]:
 val=source.entry(a,b,F(3,2));n=numerical.entry(a,b,1.5)
 assert float(val[0][0])-1e-8<=n.real<=float(val[0][1])+1e-8
 assert float(val[1][0])-1e-8<=n.imag<=float(val[1][1])+1e-8
 entries.append({'row':a,'column':b,'real_width':str(val[0][1]-val[0][0]),'diagnostic_real':float(n.real)})
for dN,dg,db in [(F(1),None,None),(F(0),np.eye(3),None),(F(0),[[0,1,0],[1,0,0],[0,0,0]],None),(F(0),None,[1,0,0])]:
 val=Q.metric_derivative_entry(source,0,0,F(3,2),0,dN,db,dg)
 n=numerical.metric_derivative_entry(0,0,1.5,0,float(dN),db,dg)
 assert float(val[0][0])-1e-8<=n.real<=float(val[0][1])+1e-8
# Genuine direct-U tiny history: H=0, nontrivial mixed rho, identity O.
zero=[[C.Z,C.Z],[C.Z,C.Z]];ident=C.identity(2);rho=[[C.cpoint(F(1,3)),C.Z],[C.Z,C.cpoint(F(2,3))]]
test={'operator':lambda t:ident,'comparison':lambda t:C.ONE,'BO':F(1),'BO1':F(0),'reference_derivative':F(0)}
history=H.certify(lambda t:zero,rho,[test],F(1),F(0),F(0),F(1,100))
assert history['accepted']
# Full native8 terminal pointer reflection; exact effects have unbiased mean.
obs=[[C.cpoint(-1),C.Z],[C.Z,C.cpoint(1)]]
inst=OI.instrument(obs,F(1),F(1,16))
assert inst['pointer_native_levels']==8 and inst['all_padding_identity']
intbound=OI.instrument([[C.cpoint(1)]],3,F(1,16))
exact=C.cscale(C.cadd(intbound['effects'][0][0][0],C.cneg(intbound['effects'][1][0][0])),F(3))
assert exact==C.ONE
assert len(OI.observable_bank(1))==22
assert len(OI.observable_bank(8))==18*8+4
assert {x[0] for x in OI.observable_bank(8) if x[1]=='material_clock'}==set(range(8))
for i in range(2):
 for j in range(2):
  reconstructed=C.cadd(inst['effects'][0][i][j],C.cneg(inst['effects'][1][i][j]))
  assert reconstructed==obs[i][j]
assert OI.clock_window_effect((F(3,2),F(3,2)),F(3,2),F(1,10))==S.B.ONE
report={'all_pass':True,'scope':'Executed reduced certified primitives and actual nonzero-candidate native H entries; not huge history execution',
 'jacobi_all8_eigenpairs':spectral,'matrix_exp_terms':terms,'matrix_exp_remainder':str(tail),
 'actual_candidate_code':1,'actual_native_dimension':8**4,'canonical_entries':entries,
 'native_pointer_levels':8,'observable_count_J1':22,'unbiased_actual_observable_instrument':True,
 'ADM_directions_checked':['lapse','spatial trace','spatial offdiagonal','shift'],
 'direct_U_tiny_history':S.B.serialize(history),
 'not_executed':['full selected physical row history','all astronomical candidate codes','huge full joint density']}
Path(__file__).with_name('CERTIFIED_MASTER_CHECKS.json').write_text(json.dumps(report,indent=2,sort_keys=True)+'\n')
print(json.dumps({k:v for k,v in report.items() if k not in ('canonical_entries','jacobi_all8_eigenpairs')},indent=2))
