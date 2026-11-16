#!/usr/bin/env python3
"""Actual huge-family metadata binding only; intentionally no giant matrices."""
from pathlib import Path
import sys,json,hashlib
sys.dont_write_bytecode=True
import bind_common_source as B
sources=[B.BoundSource(1,0,1,code) for code in (0,1)]
a,b=sources
assert a.row.native_count==b.row.native_count
assert a.row.description==b.row.description and a.theta==b.theta
assert a.row.candidate_count==a.registry.candidate_count
assert all('material' not in s.__dict__ for s in sources)
assert all(sum(B.rest_counts(s.row))==s.row.auxiliary_count for s in sources)
assert all(s.row.N%s.J==0 and s.K==8**s.row.oscillator_digits for s in sources)
# Test every actual map corner with the canonical x-slow/y-middle/z-fast order.
r=B.S.SourceRow(0,2,1)
step=r.N//2
for x in range(2):
 for y in range(2):
  for z in range(2):
   assert r.scalar_cell(r.vertex_id((r.N//4,x*step,y*step,z*step)))==x*4+y*2+z
out={'all_pass':True,'scope':'Actual-family metadata and same-bank physical budget binding, not enormous full-source execution',
 'R':a.row.R,'N':str(a.row.N),'V':str(a.row.V),'directed_edges':str(a.row.edges),
 'J':a.J,'oscillator_native_digits':a.row.oscillator_digits,'K':str(a.K),
 'candidate_count':str(a.registry.candidate_count),'common_description_bytes':len(a.row.description),
 'common_description_sha256':hashlib.sha256(a.row.description).hexdigest(),
 'same_inventory_and_theta_for_codes0and1':True,'exact_rest_count_compression':True,
 'canonical_spatial_index_all8_cells':True,'full_native_matrices_materialized':False,
 'normative_canonical_module':Path(B.Q.M.__file__).resolve().relative_to(Path(__file__).resolve().parent.parent).as_posix(),
 'normative_canonical_sha256':hashlib.sha256(Path(B.Q.M.__file__).read_bytes()).hexdigest()}
Path(__file__).with_name('BOUND_METADATA_CHECKS.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ('V','directed_edges','K','candidate_count')},indent=2))
