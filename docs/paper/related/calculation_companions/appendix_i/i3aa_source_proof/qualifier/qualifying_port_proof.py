#!/usr/bin/env python3
"""Exhaustive prospective, source-relative Definition 23 certificate.

No CSW-F4 identification and no program-complexity/dimension bridge are used.
All output is written beside this script.
"""
from pathlib import Path
from fractions import Fraction as Q
import sys, importlib.util, itertools, json, hashlib
sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parent
PREV = ROOT.parent / 'qualifying_port'

def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def load(name, path):
    s = importlib.util.spec_from_file_location(name, path)
    m = importlib.util.module_from_spec(s); s.loader.exec_module(m); return m
qp = load('native_qualifying_port', PREV / 'native_qualifying_port.py')

def build_native_source():
    src=qp.build()
    src['format']='prospective native8 qualifying-port source, hardened environment'
    for g in src['gates'][:4]:g['kind']='environment_unconditional_XOR8'
    src['modes']['6..7']='Predictor identity extension; environment truth generation still runs unconditionally.'
    src['qualification_task']['score']='External Pr[future_prediction = X1 bitwise_xor theta]. Candidate truth registers are never authoritative.'
    src['qualification_task']['immutable_environment']='The first four feedback/truth gates run for ALL 8 mode codes, including noncode sectors. Hidden theta and contexts are sampled independently by the task. Programs cannot write them, replace truth, or alter the scorer.'
    src['qualification_task']['immutable_program_label']='private_mode is fixed independently of theta before the experiment and never written by training or inference. Conditioning on such fixed labels changes the POVM, not the carrier dimension. A universal preparation that writes theta-dependent information to any inference-readable label must include that joint register in its carrier or is rejected from the single-key typed class.'
    src['typed_candidate_operations']={
        'environment_owned_read_only':['hidden_rule','training_context','future_context','training_feedback','future_truth'],
        'fixed_program_label':['private_mode'],
        'training_read_ports':['training_context','training_feedback'],
        'challenge_read_ports':['native_key','future_context','private_mode'],
        'challenge_write_ports':['future_prediction'],
        'fixed_scoring_ports':['external theta','external X1','future_prediction'],
        'postscore_feedback':'future_error and native_key updates happen strictly after the prediction is scored.',
        'universal_extension':'Additional model workspace is admitted only with its full dimension and correlations counted. No edge from private training/error/key-dump/model archives to future_prediction is admitted. Fixed fresh product ancillas may be included in the inference channel; any retained entangled or classically correlated reference is part of the joint carrier.'}
    return src

def gate_column(g,a):
    if g['kind']=='environment_unconditional_XOR8':return [a[0],a[1],a[2]^a[1]]
    return qp.gate_column(g,a)

def run_source(src,theta,x0,x1,mode=0):
    state=[0]*12
    for k,v in [('hidden_rule',theta),('training_context',x0),('future_context',x1),('private_mode',mode)]:state[qp.I[k]]=v
    trace=[]
    for g in src['gates']:
        out=gate_column(g,[state[i] for i in g['targets']])
        for i,v in zip(g['targets'],out):state[i]=v
        trace.append(state.copy())
    return state,trace

def decode_short(word):
    return {'0': 1, '10': 5, '110': 0}.get(word)

def source_case(mode, theta, x0, x1):
    r = build_native_source(); end, trace = run_source(r, theta, x0, x1, mode)
    cut = trace[9]
    return {
        'theta': theta, 'training_context': x0, 'future_context': x1,
        'first_prediction': cut[qp.I['first_prediction']],
        'training_feedback': cut[qp.I['training_feedback']],
        'training_error': cut[qp.I['training_error']],
        'pre_challenge_complete_source_state': cut,
        'pre_challenge_native_memory': cut[0],
        'future_prediction': end[qp.I['future_prediction']],
        'future_truth': end[qp.I['future_truth']],
        'external_ground_truth': theta^x1,
        'future_error': end[qp.I['future_error']],
        'post_challenge_native_memory': end[0],
    }

def build():
    src = build_native_source(); tables = {}; scores = {}; states = {}
    for mode in range(8):
        rows = [source_case(mode, *case) for case in itertools.product(range(8), repeat=3)]
        tables[str(mode)] = rows
        assert all(x['future_truth']==x['external_ground_truth'] and x['training_feedback']==(x['theta']^x['training_context']) for x in rows)
        assert all(x['pre_challenge_complete_source_state'][qp.I['private_mode']]==mode for x in rows)
        scores[str(mode)] = str(Q(sum(x['future_prediction'] == x['external_ground_truth'] for x in rows), 512))
        states[str(mode)] = sorted(set(x['pre_challenge_native_memory'] for x in rows))
    assert scores == {'0':'1','1':'1/8','2':'1/8','3':'1/8','4':'1/8','5':'1/2','6':'1/8','7':'1/8'}
    assert states['0'] == list(range(8)) and states['1'] == [0] and states['5'] == list(range(4))
    assert all(row['pre_challenge_native_memory'] == row['theta'] for row in tables['0'])
    # Baseline's eventual feedback update succeeds, but is NOT its produced state.
    assert all(row['post_challenge_native_memory'] == row['theta'] for row in tables['1'])
    assert scores['1'] == '1/8'
    census=[]
    for n in range(4):
        for bits in itertools.product('01',repeat=n):
            w=''.join(bits); mode=decode_short(w)
            census.append({'word':w,'length':n,'valid':mode is not None,
                           'mode':mode,'score':None if mode is None else scores[str(mode)],
                           'qualifies':mode is not None and Q(scores[str(mode)])>=Q(15,16)})
    assert len(census)==15
    assert [(x['word'],x['length']) for x in census if x['qualifies']]==[('110',3)]
    # Full physical state, not merely the unconditioned marginal, distinguishes programs.
    assert len({json.dumps(tables[str(m)],sort_keys=True) for m in (0,1,5)})==3
    columns=0
    for gate in src['gates']:
        for a in itertools.product(range(8),repeat=3):
            assert gate_column(gate,gate_column(gate,a))==list(a); columns+=1
    eps=Q(1,128)
    assert Q(7,8)+eps < Q(15,16) < 1-eps
    # Counterexample to a marginal-independence shortcut: a one-time pad.
    joint={th:{(r,r^th) for r in range(8)} for th in range(8)}
    assert all({r for r,_ in pairs}=={s for _,s in pairs}==set(range(8)) for pairs in joint.values())
    assert all(r^s==th for th,pairs in joint.items() for r,s in pairs)
    return {
        'format':'prospective Definition23 source-relative certificate',
        'scope':'independently specified XOR task, not the CSW-F4 witness',
        'input_source_sha256':sha(PREV/'native_qualifying_port.py'),
        'task':src['qualification_task'],
        'candidate_definition':{
            'reference':'Fixed declared native hardware and independent source registers; a physically paid fixed prefix interpreter. Cost is program length relative to this source, not total hardware mass.',
            'states':'Complete conditional physical preparation at the cut after 10 gates, including its correlations with task registers. Equality is equality of this preparation, not equality of unconditioned native-memory marginals.',
            'syntax':src['program_presentation']['syntax'],
            'universal_branch':'Choose any one fixed universal prefix machine U with no empty program; 111p is valid exactly when p is a valid halting U program producing an admissible finite preparation. Its minimum length is at least 4. We neither decide its halting problem nor claim to enumerate its long programs.',
            'admission':'Finite physical states and channels obeying the registered training/challenge access cut. All extra retained predictive memory and theta-dependent joint references are charged. Shared fresh randomness is a fixed product input independent of the entire theta-correlated preparation.',
            'complexity':'Minimum admitted binary word length producing the full declared conditional state; no free theta-correlated side information in the reference.',
        },
        'short_word_census':census,
        'minimum':{'bits':3,'nats':'3 ln(2)','witness':'110','same_state_cut_completed_gates':10,'proof':'Every program shorter than 3 is in the exhausted census and fails. 110 produces the qualifying full-loop pre-challenge state. All universal programs have length >=4.'},
        'memory_dimension':{'ideal_bound':'success <= d/8, where d is the Hilbert dimension of the COMPLETE jointly challenge-accessible theta-dependent carrier. Independent fresh product ancillas can be absorbed into the POVM.',
                            'threshold':'15/16','d_at_most7_bound':'7/8','attained_d':8,
                            'all_eight_active':states['0'],
                            'program_dimension_bridge_consumed':False,
                            'marginal_independence_is_not_enough':'The enumerated R,S=R xor theta example has individually uniform marginals but perfect joint decoding.'},
        'null_intervention_scores':scores,
        'robustness':{'uniform_full_joint_reference_stable_process_error':'epsilon < 1/16',
                      'small_carrier_upper':'7/8 + epsilon','full_loop_lower':'1 - epsilon',
                      'worked_epsilon':str(eps),'worked_upper':str(Q(7,8)+eps),'worked_lower':str(1-eps),
                      'warning':'A state marginal error is insufficient. Comparator process errors must be uniformly certified for the frozen task/channel access cut. The theorem applies to the actual states produced by the same programs, not to an ideal score attributed to a different state.'},
        'viability':{'finite_score':1,'operational_Axiom3_claim':False,
                     'reason':'Perfect finite score does not satisfy alpha<PP<beta<=1. No persistent viability, Theorem15 context package, Corollary3 bridge, or self-reference interpretation is inferred.'},
        'physical_source':src,
        'checks':{'exact_source_cases':8*512,'full_native_involution_columns':columns,
                  'program_words_censused':15,'pre_challenge_not_final_marginal':True,
                  'external_truth_all8_modes':True,'immutable_mode_all8_modes':True,
                  'one_time_pad_joint_memory_counterexample':True,'all_pass':True},
    },tables

def main():
    record,tables=build()
    for name,obj in [('QUALIFYING_PORT_CERTIFICATE.json',record),('QUALIFYING_PORT_FULL_RESPONSE_TABLES.json',tables)]:
        (ROOT/name).write_text(json.dumps(obj,indent=2,sort_keys=True)+'\n')
    print(json.dumps(record['checks']))

if __name__=='__main__': main()
