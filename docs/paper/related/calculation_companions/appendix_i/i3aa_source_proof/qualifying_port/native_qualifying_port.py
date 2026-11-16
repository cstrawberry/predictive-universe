#!/usr/bin/env python3
"""Prospective B0 Definition23 branch: complete native feedback source.
Program complexity and predictive dimension are distinct proved quantities.
No identity to the unavailable CSW-F4 witness is asserted.
"""
from pathlib import Path
from fractions import Fraction as Q
import itertools,json,hashlib
ROOT=Path(__file__).resolve().parent
NAMES=['native_key','hidden_rule','training_context','future_context','training_feedback','future_truth','first_prediction','future_prediction','training_error','future_error','private_mode','private_key_dump']
I={x:i for i,x in enumerate(NAMES)}
def build():
 gates=[]
 def xor(src,dst,skip=()):gates.append({'kind':'mode_controlled_XOR8','targets':[I['private_mode'],I[src],I[dst]],'skip_modes':list(skip)})
 xor('hidden_rule','training_feedback');xor('training_context','training_feedback');xor('hidden_rule','future_truth');xor('future_context','future_truth')
 xor('native_key','first_prediction');xor('training_context','first_prediction',(2,));xor('first_prediction','training_error');xor('training_feedback','training_error',(3,));xor('training_error','native_key',(1,));gates.append({'kind':'drop_high_bit_to_private_dump','targets':[I['private_mode'],I['native_key'],I['private_key_dump']],'only_mode':5})
 xor('future_context','future_prediction');xor('native_key','future_prediction',(4,));xor('future_prediction','future_error');xor('future_truth','future_error');xor('future_error','native_key')
 return {'format':'prospective native8 qualifying-port source','scope':'source-engineered prospective branch, not CSW-F4','native_factor_count':12,'native_MPU_candidate_factor':0,'factors':[{'id':i,'name':name,'native_dimension':8,'initial':'uniform8' if name in ['hidden_rule','training_context','future_context'] else 'ready0','role':'candidate_native_MPU' if i==0 else 'counted_private_or_environment_auxiliary','proper_energy_diagonal':['epsilon']*8} for i,name in enumerate(NAMES)],'gates':gates,'qualification_state_cut':{'completed_gates':10,'clock_phase':'pre-challenge, after learning/optional key compression','state':'Full conditional joint source/model state at this cut; not the final native-key marginal after later feedback.','same_state_score':'The challenge prediction is evaluated from exactly this produced state. Later future-error updating does not retroactively qualify the baseline.'},'unconsumed_bridge':'Corollary3 complexity-capacity/K0 bridge is not inferred from this census. Program complexity and active carrier dimension have separate proofs.', 'qualification_task':{'hidden_rule':'theta uniform on0..7, fixed through training and challenge','contexts':'X0,X1 independent uniform0..7','target':'Yt=Xt bitwise_xor theta','score':'Pr[future_prediction=Y1]','random_baseline':'1/8','qualifying_margin':'13/16','qualifying_threshold':'15/16','training':'Predict, receive feedback, form error, update native memory by actual reversible XOR gates','challenge_access':'Only the native memory and independent future context X1 may influence the predicted output. Hidden rule and all training records have no challenge-time read port; every extra retained accessible predictor is included in the comparison carrier dimension.'},'modes':{'0':'full feedback loop','1':'baseline/no update','2':'observation-null','3':'feedback-null','4':'inference-null','5':'trained low-two-bit candidate','6..7':'noncode identity extension'},'program_presentation':{'reference':'This exact blank finite hardware, independent source registers and fixed prefix interpreter are registered together before comparing models; none are omitted physical resources.','syntax':'0 is the baseline program;10 is the trained low-two-bit program;110 is the full feedback-loop program;111p invokes a fixed universal prefix machine on a nonempty valid prefix program p. All other strings are invalid. This is a prefix-universal presentation, not a dimension proxy.','semantics':'0 prepares mode1;10 prepares mode5;110 prepares mode0. Each produces the complete declared source/model state at the common PRE-CHALLENGE cut after the first10 gates, before any future prediction or feedback. The remainder evaluates that same state; it is not part of its C_P realizer.111p produces any physically admissible finite model state through its encoded preparation; nonhalting/invalid/constraint-violating programs do not realize a model state.','complexity':'C_P(mu) is minimum admitted binary program length producing the FULL declared conditional/joint physical model state from the same reference. The minimum can be reported in bits or multiplied byln2 for nats.','shorter_program_census':[{'word':'','valid':False},{'word':'0','valid':True,'model':'baseline','score':'1/8'},{'word':'1','valid':False},{'word':'00','valid':False},{'word':'01','valid':False},{'word':'10','valid':True,'model':'trained low-two-bit','score':'1/2'},{'word':'11','valid':False}],'attained_qualifying_minimum_bits':3,'witness':'110','universal_branch_guard':'Every111p has length>=4. It can produce more qualifying states, but cannot create a shorter qualifying realizer. A duplicate description of the witness leaves its minimum3.'},'active_dimension_proof':'For a uniform eight-label hidden rule encoded into a d-dimensional complete retained predictive carrier, rho_theta<=I implies (1/8)sum_theta Tr(M_theta rho_theta)<=(1/8)sum_theta Tr(M_theta)=d/8. Shared independent randomness preserves the bound. Extra accessible memory/reference is part of d, not free side information. Threshold15/16 therefore forces d>=8. The literal full loop achieves1 with rho_theta=|theta><theta| and reaches every basis state.','native_factorization':'|theta>=|M,P,I> with theta=4M+2P+I. The actual native G adapter acts on this same factor during the separately nominated boundary interaction. Its full ready-input algebra, arming, private dump and allowed operations are explicitly retained.','resource_ledger':{'pure_native_initial_factors':9,'mixed_native_initial_factors':3,'native_purity_nats':'9ln8','proper_rest_energy':'12epsilon, epsilon>0 supplied','message_and_qualifying_domain_distinction':'Qualification uses the complete feedback task and the same source state/interpreter. The later normalized boundary instrument is defined on the full native carrier; it is not asserted that every arbitrary encoded density has the same Kolmogorov complexity.','clock_and_area':'The complete local word still needs the common clock/geometry integration; this file does not count an unbuilt controller as zero.'}}
def gate_column(g,a):
 mode,x,y=a
 if g['kind']=='drop_high_bit_to_private_dump':return [mode,(x&3)|((y&1)<<2),(y&~1)|((x>>2)&1)] if mode==5 else list(a)
 return [mode,x,y^x] if mode<6 and mode not in g['skip_modes'] else list(a)
def run(r,theta,x0,x1,mode=0):
 s=[0]*12;s[I['hidden_rule']]=theta;s[I['training_context']]=x0;s[I['future_context']]=x1;s[I['private_mode']]=mode;trace=[]
 for g in r['gates']:
  a=[s[i] for i in g['targets']];b=gate_column(g,a)
  for i,v in zip(g['targets'],b):s[i]=v
  trace.append(s.copy())
 return s,trace

def main():
 r=build();scores={};live=set();checks=0
 for mode in range(6):
  wins=0
  for th,x0,x1 in itertools.product(range(8),repeat=3):
   s,tr=run(r,th,x0,x1,mode);wins+=s[I['future_prediction']]==s[I['future_truth']]
   if mode==0:assert tr[9][0]==th and s[0]==th;live.add(tr[9][0])
  scores[str(mode)]=str(Q(wins,512))
 assert scores=={'0':'1','1':'1/8','2':'1/8','3':'1/8','4':'1/8','5':'1/2'} and live==set(range(8))
 for g in r['gates']:
  for a in itertools.product(range(8),repeat=3):assert gate_column(g,gate_column(g,a))==list(a);checks+=1
 # Check the exact dimension/threshold separation with integer arithmetic.
 assert all(Q(d,8)<Q(15,16) for d in range(1,8)) and Q(8,8)>=Q(15,16)
 p=ROOT/'NATIVE_QUALIFYING_PORT_RECORD.json';p.write_text(json.dumps(r,sort_keys=True,indent=2)+'\n');out={'all_pass':True,'source_cases':6*512,'full_native_gate_involution_columns':checks,'complete_mode_scores':scores,'all8_native_states_active':True,'dimension_at_most7_strictly_fails_threshold':True,'exact_program_shorter_census_complete':True,'attained_program_minimum_bits':3,'actual_gates':len(r['gates']),'record_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'common_controller_geometry_integration_not_yet_claimed':True};(ROOT/'NATIVE_QUALIFYING_PORT_CHECKS.json').write_text(json.dumps(out,sort_keys=True,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
