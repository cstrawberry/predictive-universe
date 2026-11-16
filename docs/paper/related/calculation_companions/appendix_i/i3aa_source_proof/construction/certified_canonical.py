#!/usr/bin/env python3
"""Certified entries of the literal native canonical Hamiltonian.

Finite dimensions, no omitted states. The interval expression is the same
P F(Q)^-1 P + gradient + V + material-clock controller as the numerical source.
Controller and candidate metric box oracles are required, never replaced by
an ideal target table. Every returned enclosure is rigorous but may be broad;
`entry_to_bits` refines until a requested point-entry width is certified.
"""
from fractions import Fraction as F
from math import ceil,isqrt
import native_master_source as S
import certified_spectral as C
B=S.B
M=S.load('dark03_canonical',S.BASE/'stress/canonical_matter_source.py')


def asiv(x):return tuple(F(z) for z in x)
def sumiv(xs):
    o=B.ZERO
    for x in xs:o=B.add(o,x)
    return o

class CertifiedOscillator:
    def __init__(self,K,eta,J,bits=30):
        self.K=K;self.eta=F(eta);self.J=J;self.bits=bits
        self.h=B.scale(B.pi_iv(bits+30),F(2,J))
        self.qscale=B.div(B.sqrt_iv(B.point(self.eta/2),bits+30),self.h)
        self.pscale=B.mul(B.sqrt_iv(B.point(self.eta/2),bits+30),self.h)
        pairs=[C.eigenpair(K,j,eta=F(2),h=F(1),bits=bits+16) for j in range(K)]
        self.q=[B.mul(self.qscale,p['value']) for p in pairs]
        self.U=[[p['vector'][i] for p in pairs] for i in range(K)]
        self.P=[]
        for i in range(K):
            row=[]
            for j in range(K):
                # Native -i(a-a†), conjugated by real orthogonal eigenvectors.
                im=B.ZERO
                for n in range(K-1):
                    term=B.sub(B.mul(self.U[n+1][i],self.U[n][j]),B.mul(self.U[n][i],self.U[n+1][j]))
                    term=B.mul(B.sqrt_iv(B.point(n+1),bits+30),term)
                    im=B.add(im,term)
                row.append((B.ZERO,B.mul(self.pscale,im)))
            self.P.append(row)

class CertifiedCanonical:
    def __init__(self,J,K,eta,b_interval,residual_interval,density_bound,bits=30):
        self.J,self.K,self.eta,self.bits=J,K,F(eta),bits
        self.cells=J**3;self.modes=4*self.cells;self.dimension=K**self.modes
        self.osc=CertifiedOscillator(K,eta,J,bits)
        self.b_interval=b_interval;self.residual_interval=residual_interval;self.density_bound=F(density_bound)
        # True analytic upper bound on every |Q eigenvalue|, with rational h lower.
        bound=4*self.eta*K/F(6,J)**2
        self.RQ=isqrt(S.ceil_fraction(bound))+2
    def decode(self,i):
        assert 0<=i<self.dimension
        out=[0]*self.modes
        for j in range(self.modes-1,-1,-1):out[j]=i%self.K;i//=self.K
        return out
    def encode(self,v):
        out=0
        for z in v:out=out*self.K+z
        return out
    def coords(self,cell):return cell//self.J**2,(cell//self.J)%self.J,cell%self.J
    def offset(self,cell):return [B.point(F(3,2))]+[B.scale(self.osc.h,j) for j in self.coords(cell)]
    def cell_q(self,state,cell):return [B.add(v,self.osc.q[state[4*cell+A]]) for A,v in enumerate(self.offset(cell))]
    def neighbor(self,cell,axis,step):
        z=list(self.coords(cell));z[axis]=(z[axis]+step)%self.J
        return z[0]*self.J**2+z[1]*self.J+z[2]
    def gradients(self,state,cell):
        out=[]
        for i in range(3):
            vp,vm=self.neighbor(cell,i,1),self.neighbor(cell,i,-1)
            out.append([B.add(B.point(int(A==i+1)),B.div(B.sub(self.osc.q[state[4*vp+A]],self.osc.q[state[4*vm+A]]),B.scale(self.osc.h,2))) for A in range(4)])
        return out
    def coefficients(self,q):
        f={k:asiv(v) for k,v in M.positive_extended_f_interval(q[0],q[1],self.bits+20)['entries'].items()}
        det=B.sub(B.mul(f['f00'],f['f11']),B.square(f['f01']))
        det=(max(det[0],F(4,625)),det[1])
        f22=(max(f['f22'][0],F(2,25)),f['f22'][1])
        inv={(0,0):B.div(f['f11'],det),(1,1):B.div(f['f00'],det),
             (0,1):B.neg(B.div(f['f01'],det)),(1,0):B.neg(B.div(f['f01'],det)),
             (2,2):B.inv(f22),(3,3):B.inv(f22)}
        fm={(0,0):f['f00'],(1,1):f['f11'],(0,1):f['f01'],(1,0):f['f01'],(2,2):f['f22'],(3,3):f['f22']}
        return fm,inv,f['V']
    def kinetic(self,a,b,v):
        base=4*v;diff=[j for j in range(self.modes) if a[j]!=b[j]]
        if any(j<base or j>=base+4 for j in diff) or len(diff)>2:return C.Z
        value=C.Z
        for A,D in [(0,0),(1,1),(2,2),(3,3),(0,1),(1,0)]:
            allowed={base+A,base+D}
            if any(j not in allowed for j in diff):continue
            if A==D:
                for u in range(self.K):
                    c=list(a);c[base+A]=u;inv=self.coefficients(self.cell_q(c,v))[1]
                    term=C.cmul(C.cmul(self.osc.P[a[base+A]][u],(inv[A,D],B.ZERO)),self.osc.P[u][b[base+A]])
                    value=C.cadd(value,term)
            else:
                c=list(a);c[base+A]=b[base+A];inv=self.coefficients(self.cell_q(c,v))[1]
                term=C.cmul(C.cmul(self.osc.P[a[base+A]][b[base+A]],(inv[A,D],B.ZERO)),self.osc.P[a[base+D]][b[base+D]])
                value=C.cadd(value,term)
        return value
    def controller(self,q,cell):
        x=self.offset(cell)[1]
        # Riemann refinement is unbounded in the total construction. The worker
        # API's finite resource cap returns no certificate rather than a fake one.
        panels=2**(self.bits//2+4)
        w=M.control_W_enclosure(q[0],x,self.J,self.residual_interval,str(self.density_bound),self.bits+8,panels)
        if 'interval' not in w:raise ArithmeticError('Controller interval primitive returned no enclosure: '+str(w))
        # A resource-capped Riemann enclosure remains valid but may be broad.
        # Accuracy is checked only by entry_to_bits, which refines both inputs
        # and integration mesh. It is never promoted to a narrow certificate.
        W=asiv(w['interval'])
        rr=self.residual_interval(q[0],x,self.J,self.bits+12)
        vals=rr.get('entries',rr)
        r1=asiv(vals['r1'])
        return B.add(B.add(B.point((3+self.RQ)*self.density_bound),W),B.mul(r1,B.sub(q[1],x)))
    def components(self,row,col,t):
        a,b=self.decode(row),self.decode(col);diff=sum(x!=y for x,y in zip(a,b))
        if diff>2:return [(C.Z,B.ZERO,B.ZERO)]*self.cells
        result=[]
        for v in range(self.cells):
            x=self.offset(v)[1];bv=asiv(self.b_interval((F(t),F(t)),x,self.bits+20))
            vol=B.mul(B.power(self.osc.h,3),B.power(bv,3))
            kin=C.cmul(self.kinetic(a,b,v),(B.inv(B.scale(vol,2)),B.ZERO))
            grad=pot=B.ZERO
            if row==col:
                q=self.cell_q(a,v);fm,_,V=self.coefficients(q);dq=self.gradients(a,v)
                grad=sumiv(B.mul(fm[A,D],B.mul(dq[i][A],dq[i][D])) for i in range(3) for A,D in fm)
                grad=B.mul(B.scale(B.div(vol,B.square(bv)),F(1,2)),grad)
                pot=B.mul(vol,B.add(V,self.controller(q,v)))
            result.append((kin,grad,pot))
        return result
    def entry(self,row,col,t,variation=None):
        out=C.Z
        for v,(kin,grad,pot) in enumerate(self.components(row,col,t)):
            if variation is None:factors=(1,1,1)
            elif variation==('lapse',v):factors=(1,1,1)
            elif variation==('isotropic_metric',v):factors=(-3,1,3)
            elif variation is not None:continue
            term=C.cadd(C.cscale(kin,factors[0]),(B.add(B.scale(grad,factors[1]),B.scale(pot,factors[2])),B.ZERO))
            out=C.cadd(out,term)
        return out


def entry_to_bits(J,K,eta,b_interval,residual_interval,density_bound,row,col,t,bits=20,variation=None):
    precision=max(8,bits+8)
    while True:
        source=CertifiedCanonical(J,K,eta,b_interval,residual_interval,density_bound,precision)
        value=source.entry(row,col,t,variation)
        if max(v[1]-v[0] for v in value)<F(1,2**bits):
            return {'certified':True,'entry':value,'requested_bits':bits,'working_bits':precision,
                    'dimension':source.dimension,'all_native_states_included':True}
        precision*=2


def metric_derivative_entry(source,row,col,t,cell,dN=F(0),dbeta=None,dgamma=None):
    """All ten independent ADM source directions, on the actual diagonal metric.
    This is derivative of the FULL H, including positive controller offset.
    """
    a,b=source.decode(row),source.decode(col);bits=source.bits
    dg=[[F(0) for _ in range(3)] for _ in range(3)] if dgamma is None else dgamma
    db=[F(0)]*3 if dbeta is None else dbeta
    x=source.offset(cell)[1];bv=asiv(source.b_interval((F(t),F(t)),x,bits+20))
    b2=B.square(bv);vol=B.mul(B.power(source.osc.h,3),B.power(bv,3))
    tv=B.scale(B.inv(b2),sum(F(dg[i][i]) for i in range(3))/2)
    result=C.cmul(source.kinetic(a,b,cell),(B.div(B.sub(B.point(dN),tv),B.scale(vol,2)),B.ZERO))
    # Shift term is .5 (P_A D_i Q_A + D_i Q_A P_A), exactly.
    diff=[j for j in range(source.modes) if a[j]!=b[j]]
    da,dbb=source.gradients(a,cell),source.gradients(b,cell)
    for A in range(4):
        idx=4*cell+A
        if any(j!=idx for j in diff):continue
        coefficient=sumiv(B.scale(B.add(da[i][A],dbb[i][A]),F(db[i])/2) for i in range(3))
        result=C.cadd(result,C.cmul(source.osc.P[a[idx]][b[idx]],(coefficient,B.ZERO)))
    if row==col:
        q=source.cell_q(a,cell);fm,_,V=source.coefficients(q)
        G=[[sumiv(B.mul(fm[A,D],B.mul(da[i][A],da[j][D])) for A,D in fm) for j in range(3)] for i in range(3)]
        trace=sumiv(G[i][i] for i in range(3));delta_contraction=sumiv(B.scale(G[i][j],F(dg[i][j])) for i in range(3) for j in range(3))
        base=B.add(B.scale(B.div(trace,b2),F(1,2)),B.add(V,source.controller(q,cell)))
        derivative=B.mul(B.add(B.point(dN),tv),base)
        derivative=B.sub(derivative,B.scale(B.div(delta_contraction,B.square(b2)),F(1,2)))
        result=C.cadd(result,(B.mul(vol,derivative),B.ZERO))
    return result


def source_rate_entry(H_entry,O_entry,dOdt_entry,dimension,row,col,eta):
    """Exact finite full-H commutator source rate, no source-target substitution."""
    value=dOdt_entry(row,col)
    comm=C.Z
    for k in range(dimension):
        comm=C.cadd(comm,C.cadd(C.cmul(H_entry(row,k),O_entry(k,col)),C.cneg(C.cmul(O_entry(row,k),H_entry(k,col)))))
    return C.cadd(value,C.cmul(C.cpoint(0,F(1)/eta),comm))


def coherent_in_q_basis(osc,qmean,pmean):
    """Exact normalized finite coherent amplitudes; no infinite-tail substitution."""
    scale=B.sqrt_iv(B.point(2*osc.eta),osc.bits+30)
    alpha=(B.div(B.mul(osc.h,qmean),scale),B.div(B.div(pmean,osc.h),scale))
    coeff=[C.ONE]
    for m in range(1,osc.K):coeff.append(C.cmul(coeff[-1],C.cmul(alpha,(B.inv(B.sqrt_iv(B.point(m),osc.bits+30)),B.ZERO))))
    norm2=sumiv(B.add(B.square(c[0]),B.square(c[1])) for c in coeff)
    norm=B.sqrt_iv(norm2,osc.bits+30)
    coeff=[(B.div(c[0],norm),B.div(c[1],norm)) for c in coeff]
    return [C.csum(C.cmul((osc.U[m][j],B.ZERO),coeff[m]) for m in range(osc.K)) for j in range(osc.K)]


def initial_cell_density(source,cell,left4,right4):
    """Actual full correlated pure four-mode density, in registered Q basis."""
    offset=source.offset(cell);x=offset[1]
    f={k:asiv(v) for k,v in M.positive_extended_f_interval((F(1),F(1)),x,source.bits+20)['entries'].items()}
    bv=asiv(source.b_interval((F(1),F(1)),x,source.bits+20));vol=B.mul(B.power(source.osc.h,3),B.power(bv,3))
    p=[B.mul(vol,f['f00']),B.mul(vol,f['f01']),B.ZERO,B.ZERO]
    result=C.ONE
    for A in range(4):
        qmean=B.point(F(-1,2)) if A==0 else B.ZERO
        amps=coherent_in_q_basis(source.osc,qmean,p[A])
        result=C.cmul(result,C.cmul(amps[left4[A]],C.cconj(amps[right4[A]])))
    return result


def whole_entry(row,profile,material,left,right,t,theta,bits=20):
    """Certified actual common Hbar at the retained unit lapse/zero shift.
    Mathematical total finite sum over the FULL indexed tensor inventory.
    Body-profile lapse variations are separate source pairings, not discarded.
    """
    def matter_code(digit):
        return material.encode([sum(digit(row.matter_factor(v,A,k))*8**k for k in range(row.oscillator_digits)) for v in range(row.scalar_cells) for A in range(4)])
    def auxsame(exclude=()):
        ex=set(exclude)
        return all(left(row.factor(block,i))==right(row.factor(block,i)) for block,n in row.blocks if block!='matter' for i in range(n) if row.factor(block,i) not in ex)
    def register(digit,block):
        off,n=row.offset(block);return sum(digit(off+k)*8**k for k in range(n))
    lm,rm=matter_code(left),matter_code(right);same=auxsame()
    result=material.entry(lm,rm,t) if same else C.Z
    if lm!=rm:return result
    state=material.decode(lm)
    if same:
        rest=B.ZERO
        for block,n in row.blocks:
            if block=='matter':continue
            for k in range(n):
                v=row.module_support(block,k)['matter_cell']
                rest=B.add(rest,B.add(B.ONE,sumiv(B.square(material.osc.q[state[4*v+A]]) for A in range(4))))
        for e in range(row.edges):
            a,d=divmod(e,row.degree);w=S.curved_receipt(row,profile,a,d,bits+10)['w']
            rest=B.add(rest,B.scale(w,left(row.factor('edge_AWF',3*e+1))+left(row.factor('edge_AWF',3*e+2))))
        result=C.cadd(result,(B.scale(rest,theta),B.ZERO))
    mode,address=register(left,'mode_register'),register(left,'address_register')
    if (mode,address)!=(register(right,'mode_register'),register(right,'address_register')):return result
    word=S.mode_word(row,mode,address);L=len(word)
    if not L:return result
    clocks={row.factor('history_clock',i) for i in range(2)};targets=set(clocks)
    for _,ids in word:targets.update(ids)
    if not auxsame(targets):return result
    data_ids=targets-clocks
    c,rad=S.history_entry(word,register(left,'history_clock'),register(right,'history_clock'),{i:left(i) for i in data_ids},{i:right(i) for i in data_ids})
    val=B.point(c) if not rad else B.scale(B.sqrt_iv(B.point(rad),bits+20),c)
    return C.cadd(result,(B.scale(val,theta),B.ZERO))


def trace_expectation(dimension,density_entry,operator_entry):
    """Total finite trace; includes off-diagonal density/observable terms."""
    return C.csum(C.cmul(density_entry(i,j),operator_entry(j,i)) for i in range(dimension) for j in range(dimension))


def auxiliary_lapse_pairing_entry(row,profile,material,left,right,theta,lapse_pairing,bits=20):
    """Actual full-native auxiliary stress pairing with a smooth lapse test.
    `lapse_pairing` is the certified body integral for the SAME actual body.
    Clock diagonal/offdiagonal and all code/padding sectors are included.
    """
    def mcode(d):return material.encode([sum(d(row.matter_factor(v,A,k))*8**k for k in range(row.oscillator_digits)) for v in range(row.scalar_cells) for A in range(4)])
    def same(exclude=()):
        ex=set(exclude)
        return all(left(row.factor(block,i))==right(row.factor(block,i)) for block,n in row.blocks if block!='matter' for i in range(n) if row.factor(block,i) not in ex)
    def reg(d,block):
        off,n=row.offset(block);return sum(d(off+k)*8**k for k in range(n))
    if mcode(left)!=mcode(right):return C.Z
    a=material.decode(mcode(left));out=B.ZERO
    if same():
        for block,n in row.blocks:
            if block=='matter':continue
            for k in range(n):
                support=row.module_support(block,k);v=support['matter_cell']
                coupling=B.add(B.ONE,sumiv(B.square(material.osc.q[a[4*v+A]]) for A in range(4)))
                out=B.add(out,B.mul(lapse_pairing(support,bits+8),coupling))
        for e in range(row.edges):
            v,d=divmod(e,row.degree);w=S.curved_receipt(row,profile,v,d,bits+8)['w']
            coeff=left(row.factor('edge_AWF',3*e+1))+left(row.factor('edge_AWF',3*e+2))
            out=B.add(out,B.scale(B.mul(lapse_pairing(row.module_support('edge_AWF',3*e),bits+8),w),coeff))
    mode,address=reg(left,'mode_register'),reg(left,'address_register')
    if (mode,address)==(reg(right,'mode_register'),reg(right,'address_register')):
        word=S.mode_word(row,mode,address)
        if word:
            clocks={row.factor('history_clock',i) for i in range(2)};targets=set(clocks)
            for _,ids in word:targets.update(ids)
            if same(targets):
                ids=targets-clocks
                c,rad=S.history_entry(word,reg(left,'history_clock'),reg(right,'history_clock'),{i:left(i) for i in ids},{i:right(i) for i in ids})
                z=B.point(c) if not rad else B.scale(B.sqrt_iv(B.point(rad),bits+20),c)
                out=B.add(out,B.mul(z,lapse_pairing(row.module_support('history_clock',0),bits+8)))
    return B.scale(out,theta),B.ZERO
