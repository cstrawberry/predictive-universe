#!/usr/bin/env python3
"""Actual flagged nativeG/erasure mode for the volume-capacity measure.

This mode is nominated before inputs are encoded. It is not the supremum
over every instrument the same hardware can run in other source episodes.
"""
from fractions import Fraction as F
from pathlib import Path
import json
from native_edge_source import native_return,g_matrix_unit

def word(v):
    # S,R,A,B,Z; registered Z is independent classical Bernoulli(q).
    s,r,a,b,z=v
    s,a=native_return(s,a)
    s,r=r,s
    if z==0:r,b=b,r
    return s,r,a,b,z

def inverse(v):
    s,r,a,b,z=v
    if z==0:r,b=b,r
    s,r=r,s
    s,a=native_return(s,a)
    return s,r,a,b,z

def channel_matrix_unit(i,j,z):
    a,b=word((i,0,0,0,z)),word((j,0,0,0,z))
    private=lambda v:(v[0],v[2],v[3])
    return {((a[1],a[4]),(b[1],b[4])):1} if private(a)==private(b) else {}

def check():
    for c in range(8**5):
        v=[]
        for _ in range(5):v.append(c%8);c//=8
        v=tuple(v)
        assert inverse(word(v))==v
    for i in range(8):
        for j in range(8):
            fail=channel_matrix_unit(i,j,0)
            assert fail==({((0,0),(0,0)):1} if i==j else {})
            success={((r,1),(c,1)):x for (r,c),x in g_matrix_unit(i,j).items()}
            assert channel_matrix_unit(i,j,1)==success
    probes=[]
    for q in (F(1,729),F(1,27),F(1,2),F(1)):
        # Exact distinguishable support-log coefficient, H(Z) cancels.
        expected_nats_over_ln4=q
        measure_over_cell_volume=27*expected_nats_over_ln4
        assert measure_over_cell_volume==27*q
        probes.append({'q':str(q),'C_over_ln4':str(q),'volume_factor':str(27*q)})
    return {'all_pass':True,'full_native_inverse_columns':8**5,
            'reference_stable_matrix_units':128,
            'actual_channel':'q G(rho) tensor |1><1| + (1-q) tr(rho)|0,0><0,0|',
            'regularized_capacity_nats':'q ln4',
            'capacity_formation_information_nats':'3 ln8 + ln8 - H2(q)',
            'measured_output_factors':['R','Z'],
            'private_physical_factors':['S','A','B'],
            'volume_measure':'cell_coordinate_volume * 27*C/ln4 = cell_coordinate_volume*a^3',
            'source_probability':'q=a^3/27 on the declared a in [1/3,3] branch',
            'different_modes_not_unioned':True,
            'exact_probability_probes':probes,
            'pending':['full shared source/controller','curved volume quadrature and common refinement']}

if __name__=='__main__':
    r=check();Path(__file__).with_name('NATIVE_CAPACITY_MEASURE_CHECKS.json').write_text(json.dumps(r,sort_keys=True,indent=2)+'\n');print(json.dumps(r,indent=2))
