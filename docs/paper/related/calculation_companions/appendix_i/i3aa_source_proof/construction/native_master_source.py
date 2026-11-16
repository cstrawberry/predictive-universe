#!/usr/bin/env python3
"""Indexed DARK03 source. No huge tensor is allocated by constructing a row.

Exact classical spectra and permutations
are exposed on every native code. Certified reals are rational intervals.
"""
from __future__ import annotations
from dataclasses import dataclass
from fractions import Fraction as F
from pathlib import Path
from math import isqrt, factorial
import importlib.util, sys, hashlib, json, itertools
sys.dont_write_bytecode=True
if hasattr(sys,"set_int_max_str_digits"):sys.set_int_max_str_digits(0)
ROOT=Path(__file__).resolve().parent
BASE=ROOT.parent

def load(name,path):
    spec=importlib.util.spec_from_file_location(name,path)
    mod=importlib.util.module_from_spec(spec);sys.modules[name]=mod;spec.loader.exec_module(mod);return mod
slab=load('dark03_slab',BASE/'geometry/slab/slab_family.py')
B=slab.B
edge=load('native_edge_source',BASE/'common_source/native_edge_source.py')
volume=load('dark03_volume',BASE/'common_source/native_capacity_measure.py')
qual=load('dark03_qualifier',BASE/'qualifier/qualifying_port_proof.py')


def ceil_log8(n):
    assert n>=1
    return ((n-1).bit_length()+2)//3

def digits8(i,n):
    assert 0<=i<8**n
    return tuple((i//8**j)%8 for j in range(n))

def ceil_fraction(q):return -((-q.numerator)//q.denominator)

@dataclass(frozen=True)
class ExactBranch:
    """Concrete profile for reduced tests; selected sources pass a selector profile.
    This is not a replacement for the selected finite Bernstein/Fourier code.
    """
    description: bytes=b'exact reference branch b=t*exp(.01*t*cos(x)); registered smooth periodic extension'
    b_lipschitz: int=10**6
    metric_lipschitz: int=3*10**6
    derivative_bound: int=10**12
    def b_iv(self,y,bits=30):return B.b_iv(y,bits)

@dataclass(frozen=True)
class SourceRow:
    geometry_index:int
    scalar_J:int
    oscillator_digits:int
    candidate_count:int=1
    candidate_digits:int=1
    description:bytes=b''
    delta_prop:F=F(1)
    hbar:F=F(1)
    kappa:F=F(1)
    def __post_init__(self):
        assert self.geometry_index>=0 and self.scalar_J>=1 and self.scalar_J&(self.scalar_J-1)==0
        assert self.oscillator_digits>=1 and self.candidate_count>=1 and self.candidate_digits>=1
        assert self.N%self.scalar_J==0, 'actual dyadic cell partition must divide N'
        assert self.delta_prop>0 and self.hbar>0 and self.kappa>0
    @property
    def p(self):return slab.parameters(self.geometry_index)
    @property
    def R(self):return 80*2**self.geometry_index
    @property
    def N(self):return 8*10**28*self.R**3
    @property
    def V(self):return self.N**4
    @property
    def degree(self):return (2*self.R+1)**4-1
    @property
    def edges(self):return self.V*self.degree
    @property
    def rho(self):return F(self.R,self.N)
    @property
    def ell(self):return self.delta_prop/self.rho
    @property
    def eta(self):return self.hbar*self.kappa/self.ell**2
    @property
    def K(self):return 8**self.oscillator_digits
    @property
    def scalar_cells(self):return self.scalar_J**3
    @property
    def address_digits(self):return ceil_log8(max(self.edges,self.V,self.candidate_count))
    @property
    def blocks(self):
        # Every listed cell is one actual native8 factor. Coefficient data are
        # paid immutable program states, not free ROM. Address and selector
        # registers include all padding codes, with explicit idle extension.
        return (
            ('qualification',12*self.V),('trained_archive',self.V),
            ('volume_RABZ',4*self.V),('edge_AWF',3*self.edges),
            ('matter',4*self.scalar_cells*self.oscillator_digits),
            ('candidate_book',self.candidate_count*self.candidate_digits),
            ('description_book',(8*len(self.description)+2)//3),
            ('address_book',self.address_digits*(self.V+self.edges)),
            ('mode_book',8),('readout_pointers',18*self.scalar_cells+4),('mode_register',1),
            ('address_register',self.address_digits),('selected_candidate',ceil_log8(self.candidate_count)),
            ('history_clock',2))
    @property
    def native_count(self):return sum(n for _,n in self.blocks)
    @property
    def auxiliary_count(self):return self.native_count-4*self.scalar_cells*self.oscillator_digits
    def offset(self,block):
        off=0
        for name,n in self.blocks:
            if name==block:return off,n
            off+=n
        raise KeyError(block)
    def factor(self,block,index):
        off,n=self.offset(block);assert 0<=index<n;return off+index
    def factor_at(self,index):
        assert 0<=index<self.native_count
        for name,n in self.blocks:
            if index<n:return name,index
            index-=n
    def vertex(self,a):return B.vertex(self.p,a)
    def vertex_id(self,j):return slab.ambient_id(self.p,j)
    def key(self,a):return self.factor('qualification',12*a)
    def archive(self,a):return self.factor('trained_archive',a)
    def directed_edge(self,e):
        assert 0<=e<self.edges
        a,d=divmod(e,self.degree);j=self.vertex(a);s=B.direction(self.p,d)
        return a,self.vertex_id(tuple(j[i]+s[i] for i in range(4))),s
    def scalar_cell(self,a):
        j=self.vertex(a);step=self.N//self.scalar_J
        c=tuple(j[i]//step for i in (1,2,3))
        return sum(c[i]*self.scalar_J**(2-i) for i in range(3))
    def matter_factor(self,cell,field,digit):
        assert 0<=cell<self.scalar_cells and 0<=field<4 and 0<=digit<self.oscillator_digits
        return self.factor('matter',(4*cell+field)*self.oscillator_digits+digit)
    def module_support(self,block,index):
        """Support as actual matter-coupled material label, not point metadata."""
        if block=='qualification':a=index//12
        elif block=='trained_archive':a=index
        elif block=='volume_RABZ':a=index//4
        elif block=='edge_AWF':a=self.directed_edge(index//3)[0]
        elif block=='matter':
            return {'scalar_cell':index//(4*self.oscillator_digits),'material_fields':(0,1,2,3),'support':'entire registered scalar cell'}
        else:a=0  # finite control warehouse at an actual geometry vertex
        j=self.vertex(a)
        return {'vertex':a,'coordinate_center':tuple(F(j[i],self.N) for i in (1,2,3)),
                'radius_y':F(1,4*self.N),'profile':'normalized product bump eta(1-16N^2 d_T(y_i,c_i)^2)',
                'matter_cell':self.scalar_cell(a),'time_layer':j[0]}
    def manifest(self):
        return {'geometry_index':self.geometry_index,'R':self.R,'N':self.N,'vertices':self.V,'directed_edges':self.edges,
                'scalar_J':self.scalar_J,'scalar_cells':self.scalar_cells,'K':self.K,'oscillator_digits':self.oscillator_digits,
                'ell':str(self.ell),'eta':str(self.eta),'physical_coordinate_pitch':str(self.delta_prop/self.R),
                'blocks':dict(self.blocks),'native_factor_total':self.native_count,
                'no_n_equals_N_substitution':True,'all_padding_states_physical':True}


def qualification_support(theta,x0,x1,phase='qualified'):
    """Exact 13-factor joint state, never product of one-factor marginals."""
    src=qual.build_native_source();_,trace=qual.run_source(src,theta,x0,x1,0)
    v=trace[9]+[0]
    if phase=='ready':v[0],v[12]=v[12],v[0]
    else:assert phase=='qualified'
    return tuple(v)

def qualification_density_entry(row,col,phase='qualified'):
    if tuple(row)!=tuple(col):return F(0)
    return F(1,512) if tuple(row) in (qualification_support(*x,phase) for x in itertools.product(range(8),repeat=3)) else F(0)

def joint_density_recipe(row,phase='qualified'):
    return {'vertex_blocks':{'count':row.V,'factor_count_each':13,
                'rho':'(1/512) sum_theta,x0,x1 |U_qual(theta,x0,x1),archive><same|',
                'entry_oracle':'qualification_density_entry','phase':phase,'joint_entropy_each':'3 ln8'},
            'volume_flags':{'count':row.V,'rho':'(1-q_v)|0><0|+q_v|1><1|; q_v uses selected physical metric'},
            'edge_AWF':{'count':row.edges,'pure_basis':(0,1,0)},
            'volume_RAB':{'count':row.V,'pure_basis':(0,0,0)},
            'matter':'exact finite normalized coherent product over 4J^3 full K-level modes',
            'books_and_controls':'pure actual encoded basis states; padding levels remain physical',
            'entropy':'3 V ln8 + sum_v H2(q_v)',
            'formation_nats':'m_total ln8 - 3 V ln8 - sum_v H2(q_v)',
            'preparation_boundary':'paid initial resource, no recursive Gibbs factory claimed'}


def candidate_coefficients(profile,y,bits=30):
    b=profile.b_iv(y,bits+12);pi=B.pi_iv(bits+12);b3=B.power(b,3)
    assert b[0]>0
    return {'b':b,'q':B.rounded(B.scale(b3,F(1,27)),bits+4),
            'mu':B.rounded(B.scale(B.mul(B.power(pi,3),b3),32),bits+4),
            'c':tuple(B.rounded(c,bits+4) for c in (B.scale(B.mul(B.power(pi,3),b3),2),)+(B.scale(B.mul(pi,b),8),)*3)}


def curved_receipt(row,profile,a,d,bits=20,H=None,J=None):
    """Actual selected-profile line integral, midpoint time phase, smooth floor.
    H,J are normalized metric variations along this actual installed edge.
    """
    p=row.p;j=row.vertex(a);s=B.direction(p,d);u=tuple(F(z,row.R) for z in s)
    if H is None:H=[[F(i==k) for k in range(4)] for i in range(4)]
    if J is None:J=H
    nh,nj=slab._norm_bound(H),slab._norm_bound(J)
    hu,ju=slab._bilinear(u,H,u),slab._bilinear(u,J,u)
    G1=profile.metric_lipschitz
    Lips=(G1*row.rho,nh*G1*row.rho/8,nj*G1*row.rho/8,3*nh*nj*G1*row.rho/64)
    cells=max(1,ceil_fraction(max(Lips)*2**(bits+17)))
    wb=bits+42+2*row.R.bit_length();pi=B.pi_iv(wb);y=slab.position_y(p,j);sums=[B.ZERO]*4
    for l in range(cells):
        at=tuple(y[i]+F(2*l+1,2*cells)*p['h']*s[i] for i in range(4));b=profile.b_iv(at,wb)
        q=B.add(B.point(16*u[0]**2),B.scale(B.mul(B.square(pi),B.square(b)),4*sum(u[i]**2 for i in range(1,4))))
        root=B.sqrt_iv(q,wb)
        vals=(root,B.scale(B.inv(root),hu/2),B.scale(B.inv(root),ju/2),B.scale(B.inv(B.power(root,3)),-hu*ju/4))
        sums=[B.add(a,b) for a,b in zip(sums,vals)]
    intervals=[B.rounded((B.scale(a,F(1,cells))[0]-lip/(4*cells),B.scale(a,F(1,cells))[1]+lip/(4*cells)),bits+12) for a,lip in zip(sums,Lips)]
    floor=slab.smooth_floor_iv(intervals[0],F(1,row.R),bits+8)
    return {'s':s,'x':intervals[0],'w':floor['w'],
            'Dw_H':B.mul(floor['Fprime'],intervals[1]),
            'D2w_HJ':B.add(B.mul(floor['Fsecond'],B.mul(intervals[1],intervals[2])),B.mul(floor['Fprime'],intervals[3])),
            'quadrature_cells':cells}


def edge_operation(row,e):
    a,b,s=row.directed_edge(e);A,W,Rc=[row.factor('edge_AWF',3*e+i) for i in range(3)]
    return [('native_return',(row.key(a),A)),('swap',(row.key(a),row.key(b))),('swap',(W,Rc))]

def volume_operation(row,a):
    R,A,C,Z=[row.factor('volume_RABZ',4*a+i) for i in range(4)]
    return [('native_return',(row.key(a),A)),
            ('swap',(row.key(a),R)),('erase_if_zero',(R,C,Z))]

def gate_column(kind,v):
    assert all(isinstance(z,int) and 0<=z<8 for z in v)
    if isinstance(kind,str) and kind.startswith('qualifier:'):
        index=int(kind.split(':')[1]);return tuple(qual.gate_column(qual.build_native_source()['gates'][index],list(v)))
    if kind=='swap':return tuple(reversed(v))
    if kind=='native_return':return edge.native_return(*v)
    if kind=='erase_if_zero':return (v[1],v[0],v[2]) if v[2]==0 else tuple(v)
    raise KeyError(kind)

def apply_word_sparse(word,state,reverse=False):
    state=dict(state)
    for kind,targets in (reversed(word) if reverse else word):
        result=gate_column(kind,tuple(state.get(x,0) for x in targets))
        state.update(zip(targets,result))
    return state

def history_entry(word,clock_row,clock_col,data_row,data_col):
    """H/theta = L I - sum sqrt((j+1)(L-j))(|j+1><j| U_j+h.c.).
    64 clock levels; codes above L get L I. Return exact radical expression.
    """
    L=len(word);assert L<64 and 0<=clock_row<64 and 0<=clock_col<64
    if clock_row==clock_col:return (F(L),0) if data_row==data_col else (F(0),0)
    if abs(clock_row-clock_col)!=1 or max(clock_row,clock_col)>L:return F(0),0
    j=min(clock_row,clock_col);kind,targets=word[j]
    after=apply_word_sparse([(kind,targets)],data_col)
    if after!=data_row:return F(0),0
    return F(-1),(j+1)*(L-j) # coefficient times square root; exact full native


def auxiliary_majorant(row,profile,epsilon,material_test_norm=F(1),derivative_order=3):
    """Conservative COMPLETE bound, including all factors, modes and clock padding.
    Profile lower-integral bound: on |z_i|<=1/(8N), eta>=exp(-4/3)>1/4,
    hence unnormalized integral >=1/(4096N^3). Derivative bound below dominates
    the finite bump derivatives through requested order, including normalization.
    """
    assert epsilon>0 and material_test_norm>=1 and derivative_order>=3
    r=derivative_order
    bump_bound=4096*row.N**3*(10**6*(r+1)**4*row.N)**(2*r+4)
    metric_bound=(1+profile.derivative_bound)**(r+2)
    # Full native 0..7 rest stocks, w<=41, w''<=R/2, controller norm<=30.
    local_bound=1000*(1+row.R)**(r+2)
    M=(1+row.auxiliary_count+row.edges+row.candidate_count)*bump_bound*metric_bound*local_bound
    # eta powers cover Duhamel, actual rate and rate-square norm amplification.
    eta_small=min(F(1),row.eta)
    theta_hat=F(epsilon)*eta_small**4/(64*M*(1+material_test_norm)**2)
    theta_physical=theta_hat*row.ell/row.kappa
    return {'M_aux':M,'theta_normalized':theta_hat,'theta_physical':theta_physical,
            'source_L2_Hminus1_pairing_bound':theta_hat*M,
            'state_Duhamel_bound':theta_hat*M/row.eta,
            'rate_square_comparison_bound':8*theta_hat*M*(1+material_test_norm)**2/eta_small**3,
            'pure_stock_formation_energy_upper':theta_physical*(10**9*row.auxiliary_count+287*2*row.edges),
            'derivative_order':r,'bump_derivative_bound':bump_bound}


def bump_profile_iv(row,center,y,bits=30):
    """Unnormalized physical-module profile; its integral is positive and paid.
    Exact normalization is the integral, defined by certified midpoint sums.
    This entry computes support and numerator, not a zero-stress position label.
    """
    out=B.ONE
    for c,z in zip(center,y):
        d=(F(z)-F(c)+F(1,2))%1-F(1,2)
        u=1-16*row.N**2*d*d
        out=B.mul(out,B.eta_iv(u,bits+12))
    return out


def dependency_hashes():
    files=[BASE/'geometry/slab/slab_family.py',BASE/'geometry/curved_geometry_family.py',BASE/'common_source/native_edge_source.py',BASE/'common_source/native_capacity_measure.py',BASE/'qualifier/qualifying_port_proof.py',BASE/'qualifying_port/native_qualifying_port.py']
    return {str(p.relative_to(BASE)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}


def pure_book_digit(row,block,index,candidate_code=None,selected=0):
    """Literal immutable native8 book contents, including padded zeros."""
    if block=='candidate_book':
        candidate,digit=divmod(index,row.candidate_digits)
        assert candidate_code is not None,'physical candidate decoder required'
        return (candidate_code(candidate)//8**digit)%8
    if block=='description_book':return (int.from_bytes(row.description,'little')//8**index)%8
    if block=='address_book':
        label,digit=divmod(index,row.address_digits)
        address=label if label<row.V else label-row.V
        return (address//8**digit)%8
    if block=='mode_book':return index
    if block=='selected_candidate':return (selected//8**index)%8
    if block in ('mode_register','address_register','history_clock','readout_pointers'):return 0
    raise KeyError(block)


def full_initial_density_entry(row,left,right,profile,matter_density_entry,
                               candidate_code,selected=0,bits=30,phase='qualified'):
    """Total finite product/sum oracle on the entire native tensor product.
    left/right are callables factor_id->digit, so a huge tensor need not be
    allocated. matter_density_entry(cell, left_4Kary, right_4Kary,bits) is the
    genuine coherent-density oracle from the canonical material module.
    Returns real rational interval if that material density is real; the
    general complex version uses componentwise interval arithmetic in caller.
    This function deliberately refuses a missing material entry primitive.
    """
    out=B.ONE
    for a in range(row.V):
        ids=[row.factor('qualification',12*a+i) for i in range(12)]+[row.archive(a)]
        l,r=tuple(left(i) for i in ids),tuple(right(i) for i in ids)
        w=qualification_density_entry(l,r,phase)
        if w==0:return B.ZERO
        out=B.scale(out,w)
        v=[row.factor('volume_RABZ',4*a+i) for i in range(4)]
        if any(left(i)!=0 or right(i)!=0 for i in v[:3]):return B.ZERO
        z=left(v[3]);zz=right(v[3])
        if z!=zz or z not in (0,1):return B.ZERO
        q=candidate_coefficients(profile,slab.position_y(row.p,row.vertex(a)),bits+12)['q']
        out=B.mul(out,q if z else B.sub(B.ONE,q))
    for e in range(row.edges):
        for i,want in enumerate((0,1,0)):
            f=row.factor('edge_AWF',3*e+i)
            if left(f)!=want or right(f)!=want:return B.ZERO
    for block,n in row.blocks:
        if block in ('qualification','trained_archive','volume_RABZ','edge_AWF','matter'):continue
        for i in range(n):
            want=pure_book_digit(row,block,i,candidate_code,selected)
            f=row.factor(block,i)
            if left(f)!=want or right(f)!=want:return B.ZERO
    for cell in range(row.scalar_cells):
        codes=[]
        for b in (left,right):
            codes.append(tuple(sum(b(row.matter_factor(cell,A,d))*8**d for d in range(row.oscillator_digits)) for A in range(4)))
        out=B.mul(out,matter_density_entry(cell,*codes,bits+12))
    return B.rounded(out,bits)


def profile_normalizer_iv(row,bits=30):
    """Certified integral of the material bump over T^3.
    Rescale u=4N d: integral=(I/(4N))^3,
    I=int_-1^1 exp(-1/(1-u²)) du. A Lipschitz bound |f'|<=2
    gives midpoint error <=2/M on [-1,1]. Finite and terminating.
    """
    # Compute relative rather than absolute N-dependent precision.
    M=2**(bits+5);total=B.ZERO
    for j in range(M):
        u=-1+F(2*j+1,M)
        total=B.add(total,B.eta_iv(1-u*u,bits+10))
    total=B.scale(total,F(2,M));err=F(2,M)
    I=(max(F(1,4),total[0]-err),total[1]+err)
    return B.scale(B.power(I,3),F(1,64*row.N**3))


def normalized_profile_iv(row,center,y,bits=30,normalizer=None):
    normalizer=profile_normalizer_iv(row,bits+4) if normalizer is None else normalizer
    return B.div(bump_profile_iv(row,center,y,bits+12),normalizer)


def mode_word(row,mode,address):
    """Only publicly nominated interactions; undefined/padded labels are idle.
    Mode0 idle;1 edge;2 volume. Qualifier prefix is separately environment-owned.
    Other labels cannot read private payload, training data or archived keys.
    """
    if mode==1 and address<row.edges:return edge_operation(row,address)
    if mode==2 and address<row.V:return volume_operation(row,address)
    if mode==3 and address<row.edges:return readiness_operation(row,address,'edge')
    if mode==4 and address<row.V:return readiness_operation(row,address,'volume')
    if mode==5 and address<row.V:return qualification_operation(row,address,'training')
    if mode==6 and address<row.V:return qualification_operation(row,address,'challenge')
    return []


def stock_multiplier(row,aux_digit,edge_weight):
    """Full positive native diagonal, in theta units, before spatial profiles.
    Every auxiliary factor pays a unit rest level on all eight states. AWF
    stock/receipt levels retain the identical 0..7 spectra on the full space.
    """
    value=F(row.auxiliary_count)
    for e in range(row.edges):
        w=edge_weight(e)
        W=row.factor('edge_AWF',3*e+1);R=row.factor('edge_AWF',3*e+2)
        value+=w*(aux_digit(W)+aux_digit(R))
    return value


def auxiliary_terms(row):
    """Finite Hamiltonian expression, with physical tensor supports.
    Material coefficient is lambda_a=integral normalized_body_bump_a(x) N_lapse(x) dx.
    The coordinate body density is fixed, so there is no hidden determinant factor.
    Actual material derivatives act on the separate positive Q coupling.
    This iterator is literal: it has m_aux+2E+1 terms, not an O(N^4) alias.
    """
    for block,n in row.blocks:
        if block=='matter':continue
        for i in range(n):
            yield {'kind':'positive_rest','support':(row.factor(block,i),),
                   'material':row.module_support(block,i),'spectrum':(1,)*8,
                   'coefficient':'theta * lapse paired with normalized body profile * positive actual material-Q coupling'}
    for e in range(row.edges):
        a,b,s=row.directed_edge(e)
        for i in (1,2):
            yield {'kind':'receipt_stock','support':(row.factor('edge_AWF',3*e+i),),
                   'material':row.module_support('edge_AWF',3*e+i),'edge':e,
                   'spectrum':tuple(range(8)),
                   'coefficient':'theta * installed_smooth_receipt_w[B] * lapse paired with normalized physical body profile; installed w fixed under physical metric variation'}
    yield {'kind':'controlled_history','support':'mode,address,2 native clock factors, exactly targets from mode_word',
           'private_exclusions':'no challenge-time read ports to archive, hidden rule, training/error records, edge dump or books',
           'entry_oracle':'history_entry; mode/address blocks and all padded codes included',
           'coefficient':'theta * lapse paired with normalized warehouse material profile',
           'inactive_on_slab_initial_mode':0,'positive_norm_upper_theta':30}


class WholeSource:
    """Literal whole-H matrix expression in material Q-eigenbasis/native aux basis.

    material supplies CanonicalMatterSource; `entry` is an ordinary numerical
    evaluator, while certified evaluation uses certified_spectral and the same
    finite expression. No floating return is labeled an interval certificate.
    Auxiliary profiles are fixed-coordinate smooth physical body densities.
    At lapse=1 their integrals are 1. Lapse variations pair with the ACTUAL
    normalized bump. Receipt coefficients are physically installed immutable data, fixed under metric variation. Their configuration sensitivity uses curved_receipt.
    Extra material coupling is a positive quadratic in the actual Q fields.
    """
    def __init__(self,row,profile,material,theta_normalized):
        assert material.J==row.scalar_J and material.K==row.K
        self.row=row;self.profile=profile;self.material=material;self.theta=theta_normalized
    def matter_code(self,digit):
        r=self.row;codes=[]
        for cell in range(r.scalar_cells):
            for A in range(4):codes.append(sum(digit(r.matter_factor(cell,A,k))*8**k for k in range(r.oscillator_digits)))
        return self.material.encode(codes)
    def register_code(self,digit,block):
        off,n=self.row.offset(block);return sum(digit(off+k)*8**k for k in range(n))
    def auxiliary_equal(self,left,right,exclude=()):
        exclude=set(exclude)
        for block,n in self.row.blocks:
            if block=='matter':continue
            for k in range(n):
                f=self.row.factor(block,k)
                if f not in exclude and left(f)!=right(f):return False
        return True
    def material_rest_factor(self,material_basis,cell):
        q=self.material.cell_q(material_basis,cell)
        ref=self.material.offsets[cell]
        return 1+sum((q[i]-ref[i])**2 for i in range(4))
    def entry(self,left,right,t,weight_oracle=None):
        """Total finite native expression; do NOT call on astronomical inventory.
        Full code padding always goes through the declared scalar/clock rule.
        """
        import math
        r=self.row;lm,rm=self.matter_code(left),self.matter_code(right)
        auxsame=self.auxiliary_equal(left,right)
        result=self.material.entry(lm,rm,t) if auxsame else 0j
        if lm!=rm:return result
        a=self.material.decode(lm)
        if auxsame:
            # Sum every real object, including repeated time-layer hardware.
            for block,n in r.blocks:
                if block=='matter':continue
                for k in range(n):
                    support=r.module_support(block,k)
                    result+=float(self.theta)*self.material_rest_factor(a,support['matter_cell'])
            for e in range(r.edges):
                v,d=divmod(e,r.degree)
                w=(weight_oracle(e) if weight_oracle else sum(curved_receipt(r,self.profile,v,d,20)['w'])/2)
                result+=float(self.theta)*float(w)*(left(r.factor('edge_AWF',3*e+1))+left(r.factor('edge_AWF',3*e+2)))
        # Controlled clock on EVERY mode/address/padding sector. Selector labels
        # are immutable; these cannot become a hidden theta-correlated side port.
        mode=self.register_code(left,'mode_register');address=self.register_code(left,'address_register')
        if mode!=self.register_code(right,'mode_register') or address!=self.register_code(right,'address_register'):return result
        word=mode_word(r,mode,address);L=len(word)
        if not L:return result
        cr=self.register_code(left,'history_clock');cc=self.register_code(right,'history_clock')
        clock_ids=tuple(r.factor('history_clock',i) for i in range(2))
        targets=set(clock_ids)
        for kind,ids in word:targets.update(ids)
        if not self.auxiliary_equal(left,right,targets):return result
        data_ids=targets-set(clock_ids)
        l={i:left(i) for i in data_ids};rr={i:right(i) for i in data_ids}
        c,rad=history_entry(word,cr,cc,l,rr)
        result+=float(self.theta)*float(c)*(math.sqrt(rad) if rad else 1)
        return result
    def exact_entry_definition(self):
        return {'H_physical':'(ell/kappa) [H_matter(g,Phi)+theta_hat(sum_f lambda_f[g](1+|Q_cell-center|²) + sum_e lambda_e[g] installed_w_e[B](n_W+n_F) + lambda_warehouse[g] H_history/theta)]',
                'lambda':'integral_T3 normalized_body_bump_v(x) N_g(x) dx; equals1 at retained lapse1; metric variation pairs deltaN with this SAME bump',
                'spatial_metric_variations':'Differentiate full matter; installed w_e[B] are fixed material coefficients under physical metric variation. Their physical source includes the actual lapse/body-profile response. Configuration derivatives Dw are separate geometry-comparison data.',
                'material_variations':'Differentiate actual Q quadratic, F(Q), gradients, V(Q), autonomous controller. Books and profiles fixed under metric variations.',
                'source':'functional derivative of this full H; physical factors and localized source profiles as registered',
                'rate':'partial_t O + i[Hbar,O]/eta; never derivative of a target-output table',
                'normalization':'Fbar=kappa F, Vbar=kappa ell² V inside Hbar; one external ell/kappa only',
                'numerical_entry_certified':False}


def oscillator_digits_for(row_geometry_index,J,hbar=F(1),kappa=F(1),delta_prop=F(1)):
    """Use h=2pi/J; rational upper 40/J² bounds h². Distinct from geometry k."""
    R=80*2**row_geometry_index;N=8*10**28*R**3
    eta=hbar*kappa*(F(R,N)/delta_prop)**2
    minimum=ceil_fraction(F(2**20*40,J*J)/eta)
    return max(1,ceil_log8(minimum))


def preliminary_common_row(J,previous_geometry=-1,epsilon=F(1,100),**kwargs):
    """First arithmetic row, NOT accepted until actual source certificate passes.
    Full source/selection certification must be dovetailed over later k too.
    """
    assert J>=1 and J&(J-1)==0
    k=max(0,previous_geometry+1)
    while True:
        R=80*2**k;N=8*10**28*R**3
        if N%J:
            k+=1;continue
        d=oscillator_digits_for(k,J,kwargs.get('hbar',F(1)),kwargs.get('kappa',F(1)),kwargs.get('delta_prop',F(1)))
        row=SourceRow(k,J,d,**kwargs)
        if row.eta*J**4<epsilon:return row
        k+=1


def full_initial_density_entry_complex(row,left,right,profile,matter_density_entry,candidate_code,selected=0,bits=30,phase='qualified'):
    import certified_spectral as C
    aux=full_initial_density_entry(row,left,right,profile,lambda *args:B.ONE,candidate_code,selected,bits+8,phase)
    if aux==B.ZERO:return C.Z
    out=(aux,B.ZERO)
    for cell in range(row.scalar_cells):
        codes=[]
        for b in (left,right):codes.append(tuple(sum(b(row.matter_factor(cell,A,d))*8**d for d in range(row.oscillator_digits)) for A in range(4)))
        out=C.cmul(out,matter_density_entry(cell,*codes,bits+8))
    return out


def log_positive_iv(interval,bits=30):
    def logpoint(x):
        assert x>0
        k=0
        while x<F(1,2):x*=2;k-=1
        while x>2:x/=2;k+=1
        return B.add(B.log_point(x,bits+12),B.scale(B.log_point(F(2),bits+12),k))
    return logpoint(interval[0])[0],logpoint(interval[1])[1]


def binary_entropy_iv(q,bits=30):
    assert 0<q[0]<=q[1]<1
    return B.neg(B.add(B.mul(q,log_positive_iv(q,bits+10)),B.mul(B.sub(B.ONE,q),log_positive_iv(B.sub(B.ONE,q),bits+10))))


def formation_information_iv(row,profile,bits=30):
    value=B.scale(log_positive_iv(B.point(8),bits+20),row.native_count-3*row.V)
    # Finite total loop. Spatial and temporal degeneracies can be summed without
    # altering its exact definition; no nonexistent enumeration is reported.
    for v in range(row.V):
        q=candidate_coefficients(profile,slab.position_y(row.p,row.vertex(v)),bits+20)['q']
        value=B.sub(value,binary_entropy_iv(q,bits+12))
    return value


def full_initial_price_iv(row,profile,energy_expectation_iv,temperature=F(1),bits=30):
    """Registered one-shot initial resource price; no recovered return credit.
    theta*w paying stocks are already included in energy: never charge twice.
    energy_expectation_iv must compute Trace(rho0 H_FULL), not matter alone.
    """
    assert temperature>0
    entropy=formation_information_iv(row,profile,bits+12)
    energy=energy_expectation_iv(bits+12)
    return B.add(energy,B.scale(entropy,temperature))


class SelectedProfile:
    """Bind one actual finite candidate to EVERY geometry/source coefficient."""
    def __init__(self,candidate):
        assert candidate.valid_shape
        self.candidate=candidate;self.description=candidate.description()
        d=candidate.derivative_bounds
        self.metric_lipschitz=int(d['G_first_norm'])
        self.b_lipschitz=self.metric_lipschitz
        self.derivative_bound=max(int(d['G_second_norm']),int(d['mu_second_norm']),int(d['c_second_norm']),10**12)
    def b_iv(self,y,bits=30):return self.candidate.b_iv(y,bits)


def source_description_bytes(candidate,extra_paths=()):
    """Literal paid program image, not an unpriced link/hash standing in for ROM."""
    paths=[ROOT/'native_master_source.py',ROOT/'certified_spectral.py',ROOT/'certified_canonical.py',
           BASE/'stress/canonical_matter_source.py',
           BASE/'common_source/candidate_registry.py',
           BASE/'common_source/candidate_intervals.py',
           BASE/'common_source/source_task_certificate.py',ROOT/'certify_history.py',ROOT/'observable_instruments.py',ROOT/'FIXED_ORACLE_LANGUAGE.md',ROOT/'classical_bounds.py']
    paths += [BASE/p for p in dependency_hashes()]
    paths += [Path(p) for p in extra_paths]
    chunks=[candidate.description()]
    for p in paths:
        data=p.read_bytes();name=str(p.relative_to(BASE)).encode()
        chunks.extend([len(name).to_bytes(8,'little'),name,len(data).to_bytes(8,'little'),data])
    return b''.join(chunks)


def selector_permutation(selected_digits,book_state,selector_on_book):
    """A direct finite native permutation, not an unbuilt running search circuit.
    The paid fixed source program interprets every native book state. Invalid
    books return selected code0. XOR8 makes the entire extension involutive.
    selector_on_book is the terminating finite certificate/price scan.
    """
    answer=selector_on_book(book_state)
    assert answer>=0 and answer<8**len(selected_digits)
    return tuple(d^e for d,e in zip(selected_digits,digits8(answer,len(selected_digits))))


def readiness_operation(row,address,kind):
    if kind=='edge':
        a,b,_=row.directed_edge(address)
        return [('swap',(row.key(a),row.archive(a))),('swap',(row.key(b),row.archive(b)))]
    if kind=='volume':return [('swap',(row.key(address),row.archive(address)))]
    raise ValueError('Unknown nominated preparation mode')


def event_map(row,vertex):
    j=row.vertex(vertex)
    return {'actual_clock_coordinate':F(4*(2*j[0]+1),2*row.N),
            'physical_proper_time':row.ell*F(4*(2*j[0]+1),2*row.N),
            'material_clock_cell':row.scalar_cell(vertex),
            'spatial_body':row.module_support('qualification',12*vertex),
            'domain':'retained cosmological event' if row.N//4<=j[0]<row.N//2 else 'operational extension only',
            'clock_observable':'actual Q0 of same canonical cell in common physical history',
            'no_edge_latency_equals_event_spacing':True}


def body_pairing_iv(row,center,test,test_sup,test_lipschitz,bits=20):
    """Certified integral of actual normalized compact body times lapse test.
    test(y,bits) is a rational interval point oracle; bounds are certified.
    Rescaling removes astronomically small body radius from quadrature cells.
    """
    L=3*(2*test_sup+F(test_lipschitz,4*row.N))
    cells=max(1,ceil_fraction(2**(bits+16)*(1+L+test_sup)))
    denom=profile_normalizer_iv(row,bits+12)
    total=B.ZERO
    for a in itertools.product(range(cells),repeat=3):
        u=tuple(-1+F(2*j+1,cells) for j in a)
        y=tuple((c+z/(4*row.N))%1 for c,z in zip(center,u))
        weight=B.ONE
        for z in u:weight=B.mul(weight,B.eta_iv(1-z*z,bits+20))
        total=B.add(total,B.mul(weight,test(y,bits+20)))
    total=B.scale(total,F(8,cells**3));error=8*L/cells
    total=(total[0]-error,total[1]+error)
    return B.div(B.scale(total,F(1,64*row.N**3)),denom)


def clock_terminal_rearm(code,L):
    """Known endpoint |L>↔|0>, identity on ALL other 64 clock states.
    Nominated terminal reversible boundary permutation, not free live-H reset.
    """
    assert 0<=code<64 and 0<=L<64
    return L if code==0 else (0 if code==L else code)


def register_update_xor8(old,new_code):
    """Reversible mode/address boundary update on full padded native register."""
    assert 0<=new_code<8**len(old)
    return tuple(a^b for a,b in zip(old,digits8(new_code,len(old))))


def qualification_operation(row,vertex,phase='training'):
    gates=qual.build_native_source()['gates']
    selected=range(10) if phase=='training' else range(10,len(gates))
    return [('qualifier:'+str(i),tuple(row.factor('qualification',12*vertex+t) for t in gates[i]['targets'])) for i in selected]
