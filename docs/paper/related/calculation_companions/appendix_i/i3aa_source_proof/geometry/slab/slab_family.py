#!/usr/bin/env python3
"""Exact slab/grid/source join.
All returned intervals are rational and outward; physical ell,kappa are positive
rational units, while pi and the analytic source are computable reals.
"""
from pathlib import Path
import sys
sys.dont_write_bytecode=True
sys.path.insert(0,str(Path(__file__).resolve().parent.parent))
import curved_geometry_family as B
F=B.F

def parameters(n):
    p=dict(B.parameters(n));R,N=p['R'],p['N'];eps=F(1,R)
    p.update({'time_grid_phase':F(1,2),'slab_time_first':N//4,
              'slab_time_last_exclusive':N//2,'slab_time_nodes':N//4,
              'slab_nodes':(N//4)*N**3,'receipt_epsilon':eps,
              'smoothed_metric_alpha':(1+eps/2)*(1+p['metric_alpha'])-1,
              'smoothed_metric_beta':(1+eps/2)*p['metric_beta'],
              'receipt_weight_upper':41})
    return p

def slab_vertex(p,a):
    assert 0<=a<p['slab_nodes'];M,N=p['slab_time_nodes'],p['N']
    j=[a%M+p['slab_time_first']];a//=M
    for _ in range(3):j.append(a%N);a//=N
    return tuple(j)

def ambient_id(p,j):return sum((j[i]%p['N'])*p['N']**i for i in range(4))

def position_y(p,j):return (F(2*j[0]+1,2*p['N']),)+tuple(F(j[i],p['N']) for i in range(1,4))

def cell(p,j):
    y=position_y(p,j);h=p['h']
    return {'time_faces_y':(j[0]*h,(j[0]+1)*h),
            'periodic_spatial_intervals':tuple((y[i]-h/2,y[i]+h/2) for i in range(1,4)),
            'coordinate_volume_y':h**4}

def neighbor(p,j,i,sign):
    assert 0<=i<4 and sign in (-1,1)
    z=list(j);z[i]+=sign
    if i==0:
        if not p['slab_time_first']<=z[0]<p['slab_time_last_exclusive']:return None
    else:z[i]%=p['N']
    return tuple(z)

def measure_iv(p,j,bits=30,ell=F(1)):
    assert ell>0
    c=B.coefficients_iv(position_y(p,j),bits)
    return {'q':c['q'],'C_over_ln4':c['q'],
            'mass':B.scale(c['mu'],ell**4*p['h']**4),
            'physical_coordinate_cell_volume_over_pi3':32*ell**4*p['h']**4}

def axis_edge_iv(p,j,i,sign,bits=30,ell=F(1)):
    k=neighbor(p,j,i,sign)
    if k is None:return None
    y=position_y(p,j);mid=list(y);mid[i]+=sign*p['h']/2
    mu=B.coefficients_iv(y,bits)['mu'];c=B.coefficients_iv(mid,bits)['c'][i]
    return {'head':k,'midpoint_y':tuple(mid),
            'rate':B.scale(B.div(c,mu),1/(ell**2*p['h']**2)),
            'conductance':B.scale(c,ell**2*p['h']**2)}

def _bilinear(u,H,v):return sum(u[i]*F(H[i][j])*v[j] for i in range(4) for j in range(4))
def _norm_bound(H):return max(sum(abs(F(x)) for x in row) for row in H)

def length_variations_iv(p,j,s,bits=24,H=None,J=None):
    assert any(s) and all(abs(z)<=p['R'] for z in s)
    if H is None:H=[[F(int(i==k)) for k in range(4)] for i in range(4)]
    if J is None:J=H
    assert all(F(H[i][k])==F(H[k][i]) and F(J[i][k])==F(J[k][i]) for i in range(4) for k in range(4))
    u=tuple(F(z,p['R']) for z in s);hu=_bilinear(u,H,u);ju=_bilinear(u,J,u)
    nh,nj=_norm_bound(H),_norm_bound(J);rho=p['rho'];G1=3*10**6
    # Lipschitz bounds along the edge for x, Dx[H], Dx[J], D2x[H,J].
    Lips=(G1*rho,nh*G1*rho/8,nj*G1*rho/8,3*nh*nj*G1*rho/64)
    q=max(Lips)*2**(bits+5);M=max(1,q.numerator//q.denominator+1)
    wb=bits+30+2*p['R'].bit_length();pi=B.pi_iv(wb);y=position_y(p,j)
    sums=[B.ZERO]*4
    for l in range(M):
        v=F(2*l+1,2*M);at=tuple(y[i]+v*p['h']*s[i] for i in range(4))
        b=B.b_iv(at,wb)
        qs=B.add(B.point(16*u[0]**2),B.scale(B.mul(B.square(pi),B.square(b)),4*sum(u[i]**2 for i in range(1,4))))
        qiv=B.sqrt_iv(qs,wb)
        vals=(qiv,B.scale(B.inv(qiv),hu/2),B.scale(B.inv(qiv),ju/2),B.scale(B.inv(B.power(qiv,3)),-hu*ju/4))
        sums=[B.add(a,b) for a,b in zip(sums,vals)]
    out=[]
    for a,Lip in zip(sums,Lips):
        a=B.scale(a,F(1,M));err=Lip/(4*M);out.append(B.rounded((a[0]-err,a[1]+err),bits+12))
    return {'x':out[0],'Dx_H':out[1],'Dx_J':out[2],'D2x_HJ':out[3],'quadrature_cells':M}

def smooth_floor_iv(x,eps,bits=24):
    d=B.sub(x,B.ONE);q=B.sqrt_iv(B.add(B.square(d),B.point(eps**2)),bits+30+2*eps.denominator.bit_length())
    val=B.scale(B.add(B.add(B.ONE,x),q),F(1,2))
    first=B.scale(B.add(B.ONE,B.div(d,q)),F(1,2))
    second=B.scale(B.inv(B.power(q,3)),eps**2/2)
    return {'w':B.rounded((max(F(1),val[0]),min(F(41),val[1])),bits+8),
            'Fprime':B.rounded((max(F(0),first[0]),min(F(1),first[1])),bits+8),
            'Fsecond':B.rounded((max(F(0),second[0]),min(1/(2*eps),second[1])),bits+8)}

def receipt_iv(p,j,s,bits=24,H=None,J=None):
    out=length_variations_iv(p,j,s,bits+12,H,J);floor=smooth_floor_iv(out['x'],p['receipt_epsilon'],bits+8)
    floor['Dw_H']=B.mul(floor['Fprime'],out['Dx_H'])
    floor['D2w_HJ']=B.add(B.mul(floor['Fsecond'],B.mul(out['Dx_H'],out['Dx_J'])),B.mul(floor['Fprime'],out['D2x_HJ']))
    return {**out,**{k:B.rounded(v,bits+6) for k,v in floor.items()}}

def source_outputs_iv(p,j,bits=24,ell=F(1),kappa=F(1)):
    assert ell>0 and kappa>0
    y=position_y(p,j);t=4*y[0];assert 1<=t<=2
    eps=F(1,100);wb=bits+24;pi=B.pi_iv(wb);x=B.scale(pi,2*y[1]);co=B.cos_iv(x,wb)
    si=B.cos_iv(B.sub(B.scale(pi,F(1,2)),x),wb);co2=B.square(co);si2=B.square(si)
    q=B.scale(co,eps*t);b=B.scale(B.exp_iv(q,wb),t);b2=B.square(b)
    hb=B.add(B.point(1/t),B.scale(co,eps));hb2=B.square(hb)
    r00=B.add(B.scale(co,-6*eps/t),B.scale(co2,-3*eps**2))
    r01=B.scale(si,2*eps)
    common=B.mul(B.add(B.point(-1/t**2),B.scale(hb2,3)),b2)
    r11=B.add(B.scale(co,2*eps*t),common)
    r22=B.add(B.sub(B.scale(co,eps*t),B.scale(si2,eps**2*t*t)),common)
    rbar=B.add(B.neg(r00),B.div(B.add(r11,B.scale(r22,2)),b2))
    scale=1/(kappa*ell**2)
    T00=B.scale(B.add(r00,B.scale(rbar,F(1,2))),scale)
    T01=B.scale(B.div(r01,b),scale)
    T11=B.scale(B.sub(B.div(r11,b2),B.scale(rbar,F(1,2))),scale)
    T22=B.scale(B.sub(B.div(r22,b2),B.scale(rbar,F(1,2))),scale)
    em2=B.exp_iv(B.scale(q,-2),wb)
    rate=B.point(-6/t**3)
    for term in [B.scale(co,-6*eps/t**2),B.scale(B.mul(co,em2),-2*eps/t**2),B.scale(B.mul(co2,em2),-4*eps**2/t),B.scale(B.mul(B.mul(co,si2),em2),2*eps**3)]:rate=B.add(rate,term)
    rate=B.scale(rate,1/(kappa*ell**3))
    rho_alt=B.scale(B.add(B.add(B.scale(hb2,3),B.scale(B.div(co,b2),2*eps*t)),B.scale(B.div(si2,b2),-eps**2*t*t)),scale)
    theta=B.scale(hb,3/ell)
    W0=B.point(-12/(ell*t*t));W1=B.scale(B.mul(pi,si),-6*eps/ell)
    alpha=B.div(B.point(3/(ell**2*t*t)),B.neg(rate))
    W0_source=B.scale(B.mul(alpha,rate),4*ell)
    W1_source=B.scale(B.mul(B.mul(pi,b),T01),-3*kappa*ell)
    T=[[B.ZERO for _ in range(4)] for __ in range(4)]
    T[0][0]=T00;T[0][1]=T[1][0]=T01;T[1][1]=T11;T[2][2]=T[3][3]=T22
    out={'t':t,'x_over_2pi':y[1],'theta':theta,'sigma2':B.ZERO,'rho':T00,'rho_formula12':rho_alt,'energy_rate':rate,
         'W_y':(W0,W1,B.ZERO,B.ZERO),'W_from_actual_source':(W0_source,W1_source,B.ZERO,B.ZERO),
         'T_frame':T,'alpha':alpha}
    for key in ['theta','sigma2','rho','rho_formula12','energy_rate','alpha']:out[key]=B.rounded(out[key],bits+8)
    out['T_frame']=[[B.rounded(v,bits+8) for v in row] for row in T]
    return out

serialize=B.serialize
