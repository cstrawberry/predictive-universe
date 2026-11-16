#!/usr/bin/env python3
"""Actual bounded unbiased native instruments for source/geometry observables.
No discontinuous spectral-bin equality decision is required. No tomography or
finite-sample concentration is silently asserted.
"""
from fractions import Fraction as F
from math import comb
import certified_spectral as C
B=C.B

def sqrt_contraction(E,tolerance=F(1,1024)):
    """Square root on 0<=E<=I by a norm-certified binomial polynomial.
    Tail after L is binom(2L,L)/4^L, including eigenvalues exactly 0 or1.
    Caller supplies positive-contraction proof, obtained from the norm bound.
    """
    n=len(E);I=C.identity(n);A=[[C.cadd(I[i][j],C.cneg(E[i][j])) for j in range(n)] for i in range(n)]
    L=0;tail=F(1)
    while tail>tolerance:L+=1;tail=F(comb(2*L,L),4**L)
    power=I;result=I;coeff=F(1,2)
    for k in range(1,L+1):
        if k>1:coeff*=F(2*k-3,2*k)
        power=C.mmul(power,A)
        result=[[C.cadd(result[i][j],C.cneg(C.cscale(power[i][j],coeff))) for j in range(n)] for i in range(n)]
    pad=(-tail,tail)
    return [[(B.add(z[0],pad),B.add(z[1],pad)) for z in row] for row in result],{'degree':L,'operator_tail':tail}

def instrument(O,norm_bound,tolerance=F(1,1024)):
    """E0=(I+O/B)/2, E1=I-E0; estimator output+B or−B is unbiased.
    Literal native8 pointer; unused six levels are an explicit identity block.
    Exact reflection U=[[sqrtE0,sqrtE1],[sqrtE1,-sqrtE0]] is self-adjoint
    unitary. H=scale*(I-U) is positive with norm<=2scale.
    """
    norm_bound=F(norm_bound);tolerance=F(tolerance)
    assert norm_bound>0;n=len(O);I=C.identity(n)
    E=[[C.cscale(C.cadd(I[i][j],C.cscale(O[i][j],1/norm_bound)),F(1,2)) for j in range(n)] for i in range(n)]
    D=[[C.cadd(I[i][j],C.cneg(E[i][j])) for j in range(n)] for i in range(n)]
    A,ca=sqrt_contraction(E,tolerance);D,cd=sqrt_contraction(D,tolerance)
    U=[[C.Z for _ in range(8*n)] for __ in range(8*n)]
    for i in range(n):
        for j in range(n):
            U[i][j]=A[i][j];U[i][n+j]=U[n+i][j]=D[i][j];U[n+i][n+j]=C.cneg(A[i][j])
        for code in range(2,8):U[code*n+i][code*n+i]=C.ONE
    return {'unitary_enclosure':U,'effects':(E,[[C.cadd(I[i][j],C.cneg(E[i][j])) for j in range(n)] for i in range(n)]),
            'pointer_native_levels':8,'used_outcome_codes':(0,1),'all_padding_identity':True,
            'estimators':(norm_bound,-norm_bound),'unbiased_identity':'B E0 - B E1 = O',
            'exact_positive_readout_H':'scale*(I-U), scale>0','sqrt_certificates':(ca,cd),
            'scope':'Nominated terminal instrument on actual instantaneous state; disturbance retained, no simultaneous-readout claim'}


def observable_bank(cells):
    bank=[]
    for cell in range(cells):
        for component in ('lapse','shift0','shift1','shift2','g00','g01','g02','g11','g12','g22'):
            bank.append((cell,'actual_H_metric_derivative',component))
        bank.extend([(cell,'actual_energy_rate','dOdt+i[H,O]/eta'),(cell,'actual_source_rate_square','R*R'),
                     (cell,'actual_energy_square','O*O'),(cell,'actual_theta','3 Bt(g)/ell'),
                     (cell,'actual_shear_square','actual congruence shear'),(cell,'actual_theta_square','theta(g)^2')])
        bank.extend([(cell,'material_clock','actual Q0'),(cell,'material_clock_square','actual Q0²')])
    bank.extend([('global','weighted_frobenius_stress_square','sum actual T_ab*T_ab, offdiagonal counted twice'),
                 ('global','weighted_theta','linear weighted theta operator'),
                 ('global','weighted_theta_square','linear weighted theta² operator'),
                 ('global','weighted_shear_square','linear weighted sigma² operator')])
    return bank


def clock_window_effect(q0_interval,event_coordinate,width):
    assert width>0
    diff=B.sub(q0_interval,B.point(event_coordinate))
    return B.inv(B.add(B.ONE,B.scale(B.square(diff),F(1)/(width*width))))


def moment_postprocessing(weighted_T_means,weighted_T_squares,theta_mean,theta_second,shear_second):
    # Classical postprocessing of distinct nominated physical instruments.
    # No nonlinear variance is incorrectly asserted to be a linear operator.
    stress_variance=sum((1 if a==b else 2)*(weighted_T_squares[a,b]-weighted_T_means[a,b]**2) for a,b in weighted_T_means)
    theta_variance=theta_second-theta_mean**2
    return {'stress_variance':stress_variance,'theta_variance':theta_variance,
            'backreaction':F(2,3)*theta_variance-2*shear_second,
            'estimator_noise_note':'The ±B pointer has variance B²−<O>²; this is NOT <O²>−<O>². Measure actual O² separately.'}
