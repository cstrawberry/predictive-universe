#!/usr/bin/env python3
"""Concrete candidate/J/k/stage binding; no arbitrary energy callback.

Methods on the actual family deliberately imply astronomical finite loops.
Do not instantiate the huge matrices for a smoke test or claim they were run.
"""
from fractions import Fraction as F
from functools import cached_property
import native_master_source as S
import certified_canonical as Q
import certified_spectral as C
import certify_history as HC
B=S.B
REG=S.load('bound_dark03_registry',S.BASE/'common_source/candidate_registry.py')
CI=S.load('bound_dark03_candidate_boxes',S.BASE/'common_source/candidate_intervals.py')
TASK=S.load('bound_dark03_actual_task',S.BASE/'common_source/source_task_certificate.py')


def candidate_adapters(candidate):
    return {'b_interval':lambda t,x,bits=40:CI.b_interval(candidate,tuple(map(F,t)),tuple(map(F,x)),bits),
            'Bt_interval':lambda t,x,bits=40:CI.Bt_interval(candidate,tuple(map(F,t)),tuple(map(F,x)),bits)}


def absolute(iv):return max(abs(F(x)) for x in iv)
def common_registry(J):return REG.Registry(J.bit_length()-1)

def rest_counts(row):
    ordinary=(17*row.V+3*row.edges)//row.scalar_cells
    warehouse=row.auxiliary_count-17*row.V-3*row.edges
    assert warehouse>=0
    return [ordinary+(warehouse if v==0 else 0) for v in range(row.scalar_cells)]


def force_density_bound(candidate,J,stage,bits):
    """Actual certified sup of this candidate's frozen controller density."""
    ad=candidate_adapters(candidate);panels=2**stage;upper=F(0)
    res=lambda tb,xb,J,bits:Q.M.candidate_residual_interval(tb,xb,J,ad['b_interval'],ad['Bt_interval'],bits)
    # [0,7] covers a whole 2pi period; [.9,2.1] covers actual extension.
    for i in range(panels):
        tb=(F(9,10)+F(6*i,5*panels),F(9,10)+F(6*(i+1),5*panels))
        for j in range(panels):
            xb=(F(7*j,panels),F(7*(j+1),panels))
            rr=res(tb,xb,J,bits)
            upper=max(upper,*(absolute(x) for x in rr['entries'].values()))
    return upper,res


class BoundSource:
    def __init__(self,J,k,stage,candidate_index=0):
        self.J,self.k,self.stage=J,k,stage;self.bits=16+4*stage
        self.registry=common_registry(J);self.candidate=self.registry.decode(candidate_index)
        assert self.candidate.valid_shape
        self.profile=S.SelectedProfile(self.candidate);self.adapters=candidate_adapters(self.candidate)
        self.epsilon=F(1,16*J)
        # Common ROM and padding across every candidate. The selected code is a
        # separate actual register; code0 here is only the common bank description.
        common_description=S.source_description_bytes(self.registry.decode(0),[__file__])
        common_description+=repr(('DARK03 row',J,k,stage,self.registry.record())).encode()
        self.row=S.SourceRow(k,J,S.oscillator_digits_for(k,J),self.registry.candidate_count,
                            S.ceil_log8(self.registry.candidate_count),common_description)
        self.eta=self.row.eta;self.K=self.row.K;self.dimension=self.K**(4*J**3)
        self.RQ=S.ceil_fraction(F(4*self.eta*self.K,F(6,J)**2))
        from math import isqrt
        self.RQ=isqrt(self.RQ)+2
        # One candidate-independent conservative norm envelope fixes theta over
        # the whole finite comparison bank, not a price-dependent new scale.
        common_force=10**30*(1+J);self.common_force=common_force
        norm=Q.M.canonical_norm_certificate(J,self.K,(str(self.eta),str(self.eta)),self.RQ,str(common_force),
                                           Bt_upper='1000000000000',Btt_upper='1000000000000',bits=self.bits)
        self.common_norms={key:F(value) for key,value in norm['upper_bounds'].items()}
        T=max(F(1),*self.common_norms.values())
        self.budget=S.auxiliary_majorant(self.row,self.profile,self.epsilon,T)
        self.theta=self.budget['theta_normalized']
        self.density_bound,self.residual=force_density_bound(self.candidate,J,stage,self.bits)
    @cached_property
    def material(self):
        return Q.CertifiedCanonical(self.J,self.K,self.eta,self.adapters['b_interval'],self.residual,self.density_bound,self.bits)
    @cached_property
    def installed_stock_sum(self):
        out=B.ZERO
        for e in range(self.row.edges):
            a,d=divmod(e,self.row.degree)
            out=B.add(out,S.curved_receipt(self.row,self.profile,a,d,self.bits)['w'])
        return out
    def rho(self,i,j):
        a,b=self.material.decode(i),self.material.decode(j);value=C.ONE
        for cell in range(self.row.scalar_cells):value=C.cmul(value,Q.initial_cell_density(self.material,cell,a[4*cell:4*cell+4],b[4*cell:4*cell+4]))
        return value
    def H(self,i,j,t):
        """EXACT compression on actual initial idle auxiliary support, not deletion.
        All full auxiliary spectra/source profiles remain in native_master_source.
        """
        value=self.material.entry(i,j,t)
        if i!=j:return value
        a=self.material.decode(i);extra=self.installed_stock_sum
        for cell,count in enumerate(rest_counts(self.row)):
            q2=Q.sumiv(B.square(self.material.osc.q[a[4*cell+A]]) for A in range(4))
            extra=B.add(extra,B.scale(B.add(B.ONE,q2),count))
        return C.cadd(value,(B.scale(extra,self.theta),B.ZERO))
    def initial_energy(self):
        value=Q.trace_expectation(self.dimension,self.rho,lambda i,j:self.H(i,j,F(1)))
        return B.scale(value[0],self.row.ell/self.row.kappa)
    def price(self,temperature=F(1)):
        info=S.formation_information_iv(self.row,self.profile,self.bits)
        return B.add(self.initial_energy(),B.scale(info,temperature))
    def price_to_tolerance(self,tolerance,temperature=F(1)):
        # Precision changes only the oracle enclosure, NOT installed controller
        # density bound, theta, native counts, state or actual candidate.
        while True:
            value=self.price(temperature)
            if value[1]-value[0]<=tolerance:return value
            self.bits*=2
            self.__dict__.pop('material',None)
            self.__dict__.pop('installed_stock_sum',None)
    def task(self):
        return TASK.certify(self.candidate,self.epsilon,panels=2**self.stage,bits=self.bits,order=2)
    def quantum_density_components(self,i,j,t,cell):
        kin,grad,pot=self.material.components(i,j,t)[cell]
        x=self.material.offset(cell)[1];bv=Q.asiv(self.adapters['b_interval']((t,t),x,self.bits+12))
        vol=B.mul(B.power(self.material.osc.h,3),B.power(bv,3))
        return C.cmul(kin,(B.inv(vol),B.ZERO)),(B.div(grad,vol),B.ZERO),(B.div(pot,vol),B.ZERO)
    def rho_operator(self,i,j,t,cell):return C.csum(self.quantum_density_components(i,j,t,cell))
    def rho_explicit_time(self,i,j,t,cell):
        K,G,V=self.quantum_density_components(i,j,t,cell);x=self.material.offset(cell)[1]
        bt=Q.asiv(self.adapters['Bt_interval']((t,t),x,self.bits+12))
        return C.cmul((bt,B.ZERO),C.cadd(C.cscale(K,-6),C.cscale(G,-2)))
    def rate_operator(self,i,j,t,cell):
        return Q.source_rate_entry(lambda a,b:self.H(a,b,t),lambda a,b:self.rho_operator(a,b,t,cell),lambda a,b:self.rho_explicit_time(a,b,t,cell),self.dimension,i,j,self.eta)
    def classical_density(self,t,cell):
        """Same corrected classical Hamiltonian at q=(t,x,y,z), p=v F[:,0]."""
        x=self.material.offset(cell)[1]
        f={key:Q.asiv(value) for key,value in Q.M.material_derivatives_interval((t,t),x,self.bits+12)['entries'].items()}
        b=Q.asiv(self.adapters['b_interval']((t,t),x,self.bits+12));trace=B.add(f['f11'],B.scale(f['f22'],2))
        q=[B.point(t)]+self.material.offset(cell)[1:]
        ctl=self.material.controller(q,cell)
        return B.add(B.add(B.scale(f['f00'],F(1,2)),B.scale(B.div(trace,B.square(b)),F(1,2))),B.add(f['V'],ctl))
    def classical_rate(self,t,cell):
        x=self.material.offset(cell)[1];f={key:Q.asiv(value) for key,value in Q.M.material_derivatives_interval((t,t),x,self.bits+12)['entries'].items()}
        b=Q.asiv(self.adapters['b_interval']((t,t),x,self.bits+12));bt=Q.asiv(self.adapters['Bt_interval']((t,t),x,self.bits+12))
        trace=B.add(f['f11'],B.scale(f['f22'],2));rr=self.residual((t,t),x,self.J,self.bits+12)
        out=B.add(B.scale(f['f00t'],F(1,2)),B.scale(B.div(f['trace_t'],B.square(b)),F(1,2)))
        out=B.sub(out,B.div(B.mul(bt,trace),B.square(b)))
        return B.add(out,B.add(f['Vt'],Q.asiv(rr['entries']['r0'])))
    def dense(self,entry,t):return [[entry(i,j,t) for j in range(self.dimension)] for i in range(self.dimension)]
    def density_matrix(self):return [[self.rho(i,j) for j in range(self.dimension)] for i in range(self.dimension)]
    def frame_source(self,i,j,t,cell,component):
        if component==0:return self.rho_operator(i,j,t,cell)
        x=self.material.offset(cell)[1];b=Q.asiv(self.adapters['b_interval']((t,t),x,self.bits+12))
        vol=B.mul(B.power(self.material.osc.h,3),B.power(b,3))
        if component<4:
            db=[F(0)]*3;db[component-1]=F(1)
            value=Q.metric_derivative_entry(self.material,i,j,t,cell,dbeta=db)
            scale=B.inv(B.mul(vol,b))
        else:
            a,c=[(0,0),(0,1),(0,2),(1,1),(1,2),(2,2)][component-4]
            dg=[[F(0) for _ in range(3)] for __ in range(3)];dg[a][c]=dg[c][a]=F(1)
            value=Q.metric_derivative_entry(self.material,i,j,t,cell,dgamma=dg)
            scale=B.scale(B.div(B.square(b),vol),-2 if a==c else -1)
        return C.cmul(value,(scale,B.ZERO))
    def classical_frame_source(self,t,cell,component):
        if component==0:return self.classical_density(t,cell)
        x=self.material.offset(cell)[1]
        f={key:Q.asiv(value) for key,value in Q.M.material_derivatives_interval((t,t),x,self.bits+12)['entries'].items()}
        b=Q.asiv(self.adapters['b_interval']((t,t),x,self.bits+12));b2=B.square(b)
        if component<4:return B.div(f['f01'],b) if component==1 else B.ZERO
        a,c=[(0,0),(0,1),(0,2),(1,1),(1,2),(2,2)][component-4]
        if a!=c:return B.ZERO
        trace=B.add(f['f11'],B.scale(f['f22'],2))
        pot=B.add(f['V'],self.material.controller([B.point(t)]+self.material.offset(cell)[1:],cell))
        isotropic=B.sub(B.sub(B.scale(f['f00'],F(1,2)),B.scale(B.div(trace,b2),F(1,2))),pot)
        return B.add(isotropic,B.div(f['f11'] if a==0 else f['f22'],b2))
    def history_tests(self):
        """Concrete matrix/test bank; all entries come from this bound source.
        The auxiliary actual-source difference is certified separately by M_aux.
        Testing extra component squares is mathematical certification, not an
        assertion that each was physically measured in the same history.
        """
        T=max(F(1),*self.common_norms.values());majorant=10**12*(1+T)**6
        tests=[]
        def append(name,entry,comparison,scale=F(1)):
            tests.append({'name':name,'operator':lambda t,entry=entry:self.dense(entry,t),
                          'comparison':lambda t,comparison=comparison:(comparison(t),B.ZERO),
                          'BO':majorant*scale,'BO1':majorant*scale,'reference_derivative':majorant*scale})
        for v in range(self.row.scalar_cells):
            for component in range(10):
                op=lambda i,j,t,v=v,c=component:self.frame_source(i,j,t,v,c)
                cl=lambda t,v=v,c=component:self.classical_frame_source(t,v,c)
                append(('T',v,component),op,cl)
                sq=lambda i,j,t,op=op:C.csum(C.cmul(op(i,k,t),op(k,j,t)) for k in range(self.dimension))
                append(('T_squared',v,component),sq,lambda t,cl=cl:B.square(cl(t)))
            rate=lambda i,j,t,v=v:self.rate_operator(i,j,t,v)
            append(('actual_energy_rate',v),rate,lambda t,v=v:self.classical_rate(t,v))
            append(('actual_energy_rate_squared',v),lambda i,j,t,op=rate:C.csum(C.cmul(op(i,k,t),op(k,j,t)) for k in range(self.dimension)),lambda t,v=v:B.square(self.classical_rate(t,v)))
            for power in (1,2):
                def clock(i,j,t,v=v,power=power):
                    if i!=j:return C.Z
                    q=self.material.cell_q(self.material.decode(i),v)[0]
                    return B.power(q,power),B.ZERO
                append(('actual_clock',v,power),clock,lambda t,power=power:B.point(t**power))
        return tests,majorant
    def history(self):
        tests,majorant=self.history_tests()
        Hbound=self.common_norms['H']+self.theta*self.budget['M_aux']
        H1=self.common_norms['H_explicit_time_derivative']
        result=HC.certify(lambda t:self.dense(self.H,t),self.density_matrix(),tests,self.eta,Hbound,H1,self.epsilon,
                          arithmetic_tolerance=self.epsilon*F(1,2**self.bits)/(1+self.dimension*majorant))
        result['actual_auxiliary_source_L2_bound']=str(self.budget['source_L2_Hminus1_pairing_bound'])
        result['actual_auxiliary_rate_square_bound']=str(self.budget['rate_square_comparison_bound'])
        result['full_source_bound']=str(max(result['test_error_bounds'])+self.budget['rate_square_comparison_bound'])
        result['accepted']=result['accepted'] and F(result['full_source_bound'])<2*self.epsilon
        return result
    @cached_property
    def interpolation_bound(self):
        import classical_bounds
        return classical_bounds.interpolation_certificate(self)['source_and_second_moment_L2_interpolation_bound']
    def admission(self):
        if self.density_bound>self.common_force:
            return {'accepted':False,'reason':'stage controller offset exceeds the registered common norm envelope'}
        task=self.task()
        if not task['accepted']:return {'accepted':False,'source_task':task,'reason':'actual fixed-sector source task'}
        # This is a row error budget, not the invalid assertion that every finite
        # corrected residual is h². Refining J makes the actual witness pass.
        controller_limit=F(100000,self.J**2)+8*self.epsilon
        if self.density_bound>controller_limit:return {'accepted':False,'source_task':task,'reason':'actual controller density bound'}
        classical_control_error=100*(5+2*self.RQ)*self.density_bound
        if classical_control_error>=self.epsilon:
            return {'accepted':False,'source_task':task,'reason':'actual controller contribution needs larger scalar J',
                    'classical_control_error':str(classical_control_error)}
        history=self.history()
        p=self.row.p
        geometry_error=p['smoothed_metric_alpha']+p['smoothed_metric_beta']
        geometry_pass=geometry_error<self.epsilon and self.row.eta*self.J**4<self.epsilon
        auxiliary_pass=self.budget['rate_square_comparison_bound']<self.epsilon
        return {'accepted':history['accepted'] and geometry_pass and auxiliary_pass,
                'source_history':history,'source_task':task,'geometry_errors_pass':geometry_pass,
                'auxiliary_errors_pass':auxiliary_pass,'controller_bound':str(self.density_bound),
                'actual_geometry_error':str(geometry_error),'classical_control_error':str(classical_control_error),
                'classical_interpolation_bound':str(self.interpolation_bound),
                'row':self.row.manifest(),
                'source_topology':'sup_t L2_spatial; conservation defect H^-1; normalized units'}


def attempt_actual_row(J,k,stage):
    """Concrete finite candidate source scan, actual history and physical price.
    Never invoked in reduced tests. This binds the previously generic callback.
    """
    registry=common_registry(J);best=None;tolerance=F(1,16*J)
    R=80*2**k;N=8*10**28*R**3
    if N%J:return {'accepted':False,'reason':'dyadic scalar grid does not yet divide actual geometry grid'}
    for index in range(registry.candidate_count):
        candidate=registry.decode(index)
        if not candidate.valid_shape:continue
        source=BoundSource(J,k,stage,index)
        admission=source.admission()
        if not admission['accepted']:continue
        price=source.price_to_tolerance(tolerance)
        if best is None or (price[1],index)<(best['price_interval'][1],best['candidate_index']):
            best={**admission,'price_interval':price,'candidate_index':index,'price_suboptimality':tolerance,
                  'same_source_binding':'BoundSource H,rho,controller,task,geometry,price,tests and inventory'}
    return best if best is not None else {'accepted':False,'reason':'No finite candidate certified at this bounded stage; dovetail later geometry/precision'}


def construct_actual_common_row(minimum_J,previous_geometry=-1,requested_tolerance=F(1,100)):
    # Scalar refinement is part of the dovetail. Raising only k cannot cure
    # a fixed coarse J's actual controller/discretization defect.
    assert minimum_J>=1 and minimum_J&(minimum_J-1)==0 and requested_tolerance>0
    base_power=minimum_J.bit_length()-1;outer=1
    while True:
        for exponent in range(base_power,base_power+outer):
            J=2**exponent
            for k in range(previous_geometry+1,previous_geometry+outer+1):
                record=attempt_actual_row(J,k,outer)
                if not record['accepted']:continue
                total=F(record['source_task']['residual_upper'])+F(record['source_history']['full_source_bound'])+F(record['classical_control_error'])+F(record['classical_interpolation_bound'])+F(record['actual_geometry_error'])
                if 2**20*total<requested_tolerance:
                    return {'J':J,'geometry_index':k,'source_stage':outer,'registered_budget_indicator':str(total),
                            'normalized_L2_source_bound':str(2**20*total),
                            'requested_tolerance':str(requested_tolerance),'certificate':record}
        outer+=1
