#!/usr/bin/env python3
"""Direct finite-U certificate. Acceptance uses actual matrix entries only.
No semiclassical constant or target-assigned diagonal observable enters it.
"""
from fractions import Fraction as F
import certified_spectral as C
import native_master_source as S
B=S.B

def dagger(A):return [[C.cconj(A[j][i]) for j in range(len(A))] for i in range(len(A))]
def expectation(U,rho,O):
    state=C.mmul(C.mmul(U,rho),dagger(U))
    return C.csum(C.cmul(state[i][j],O[j][i]) for i in range(len(O)) for j in range(len(O)))
def magnitude_upper(z):return max(abs(x) for x in z[0])+max(abs(x) for x in z[1])

def certify(H_at,rho,tests,eta,BH,BH1,tolerance,arithmetic_tolerance=None):
    """Each test has operator(t), comparison(t), BO, BO1, reference_derivative.
    Operators include full source derivatives, rates, squares and mixed moments.
    H_at returns a CERTIFIED interval matrix; rho is the full joint density.
    A broad interval results in rejection, never a numerical pass claim.
    """
    assert eta>0 and tolerance>0
    if arithmetic_tolerance is None:arithmetic_tolerance=tolerance/100
    speed=max((t['BO1']+2*BH*t['BO']/eta+t['reference_derivative']+t['BO']*BH1/eta) for t in tests)
    count=max(1,S.ceil_fraction(8*speed/tolerance))
    dt=F(1,count);U=C.identity(len(rho));worst=[F(0)]*len(tests)
    rounding_bits=max(32,arithmetic_tolerance.denominator.bit_length()-arithmetic_tolerance.numerator.bit_length()+20)
    def rounded_matrix(A):
        return [[(B.rounded(z[0],rounding_bits),B.rounded(z[1],rounding_bits)) for z in row] for row in A]
    for j in range(count+1):
        time=1+j*dt
        for k,test in enumerate(tests):
            ev=expectation(U,rho,test['operator'](time))
            difference=C.cadd(ev,C.cneg(test['comparison'](time)))
            extra=C.time_mesh_bound(BH1,test['BO'],test['BO1'],BH,eta,dt,test['reference_derivative'])['total_extra']
            worst[k]=max(worst[k],magnitude_upper(difference)+extra)
        if j<count:
            H=H_at(time)
            A=[[C.cmul(C.cpoint(0,-dt/eta),entry) for entry in row] for row in H]
            E,_,_=C.matrix_exp(A,arithmetic_tolerance/count)
            U=rounded_matrix(C.mmul(rounded_matrix(E),U))
    return {'accepted':all(x<tolerance for x in worst),'node_count':count+1,
            'test_error_bounds':worst,'tolerance':tolerance,
            'uses_actual_full_native_H':True,'matrix_arithmetic':'outward rational complex intervals',
            'between_nodes_and_time_freezing_charged':True,'outward_arithmetic_rounding_bits':rounding_bits}


def dovetail_common_row(J,previous_geometry,attempt):
    """attempt(J,k,precision_stage) must return a finite bounded-stage certificate.
    Fixed-stage failure/inconclusive means try later; no undecidable equality.
    The supplied source theorem proves eventual strict passing margin.
    """
    stage=1
    while True:
        for k in range(previous_geometry+1,previous_geometry+stage+1):
            record=attempt(J,k,stage)
            if record['accepted']:
                assert record['source_history']['accepted'] and record['source_task']['accepted']
                assert record['geometry_errors_pass'] and record['auxiliary_errors_pass']
                return {'J':J,'geometry_index':k,'precision_stage':stage,'certificate':record}
        stage+=1
