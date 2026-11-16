import sympy as s, json, math
from pathlib import Path
t,x,e=s.symbols('t x e',positive=True,real=True)
B=s.log(t)+e*t*s.cos(x); b=s.exp(B)
f00=1/t**2-6*e*s.cos(x)/t-3*e**2*s.cos(x)**2
f01=2*e*s.sin(x)
u=e*t*s.cos(x)
ftrace=4*u-2*e**2*t**2*s.sin(x)**2+3*s.exp(2*u)*(1+6*u+3*u**2)
V=1/t**2
A=f01/(3*f00);C=(s.diff(f01,x)-s.diff(ftrace,t)/2)/(3*f00);D=-(s.diff(f00,t)/2+s.diff(V,t))/(3*f00)
identity=s.simplify(s.diff(B,t)-A*s.exp(-2*B)*s.diff(B,x)-C*s.exp(-2*B)-D)
eps=.01
m=.25-6*eps-3*eps**2
ftrace_t=4*eps+8*eps**2+3*eps*math.exp(4*eps)*(8+36*eps+24*eps**2)
a=2*eps/(3*m)
c=(2*eps+.5*ftrace_t)/(3*m)
d=(3+3*eps)/(3*m)
L=18*(2*eps*a+c)
res=dict(symbolic_exact_branch_solves_transport=(identity==0),bounds=dict(F00_lower=m,F01_abs_upper=2*eps,trace_Fii_t_abs_upper=ftrace_t,A_abs_upper=a,C_abs_upper=c,D_abs_upper=d,transport_L_upper=L,residual_multiplier_upper=1/(3*m)),valid_declared_roundings=(a<.036 and c<.301 and d<5.33 and L<6 and 1/(3*m)<2),scope='Uniform candidate |B|<=log 3, fixed Phi=id, fixed diagonal shear-free metric class, tau in [1,2].')
assert identity==0 and res['valid_declared_roundings']
Path(__file__).with_name('SELECTION_TRANSPORT_VERIFICATION.json').write_text(json.dumps(res,indent=2)+'\n')
print(json.dumps(res,indent=2))
