/* Search relevance, offline index integrity, query safety, and response time. */
const fs=require('node:fs');
const path=require('node:path');
const vm=require('node:vm');
const assert=require('node:assert/strict');
const {performance}=require('node:perf_hooks');
const core=require('../paper/search-engine.js');
const root=path.resolve(__dirname,'..');
const context={window:{},renderLatex:()=>''};
vm.createContext(context);
for(const file of ['manifest.js','markdown.js','search-index.js']) vm.runInContext(fs.readFileSync(path.join(root,'paper',file),'utf8'),context);
const data=context.window.PU_SEARCH_DATA;
const manuscript=context.window.PU_PAPER.sections;
const engine=core.createEngine(data);
const anchors=new Map();
for(const section of manuscript) {
  const ids=new Set();
  context.renderMarkdown(fs.readFileSync(path.join(root,'docs/paper',section.file),'utf8'),{onAnchor:anchor=>ids.add(anchor.id)});
  anchors.set(section.id,ids);
}
for(const [sectionIndex,anchor,title,body] of data.records) {
  const section=data.sections[sectionIndex];
  assert(section && anchors.get(section.id)?.has(anchor),'Search target exists: '+section?.id+'/'+anchor);
  assert(title && typeof body==='string','Result has a title and text');
}
assert.equal(data.sections.length,manuscript.length,'All manuscript sections are indexed');
const first=query=>engine.search(query).results[0];
assert.match(first('Theorem PL.2').href,/\/theorem-pl2-reference-implementation/);
assert.match(first('thm Z.1').href,/\/theorem-z1-/);
assert.match(first('horizon constant').href,/#paper\/05_horizon_constant\//);
assert.match(first('appendix z').href,/#paper\/appendices--appendix_z_fine_structure_constant\/appendix-z-/);
assert.match(first('quant').href,/#paper\/08_quantum_emergence\//);
const pageOne=engine.search('quant',8,0), pageTwo=engine.search('quant',8,8);
assert.equal(pageOne.total,pageTwo.total,'Paging preserves the total');
assert.equal(pageTwo.results.length,8,'Further results are available');
assert(!pageTwo.results.some(result=>pageOne.results.some(first=>first.href===result.href)),'Result pages do not repeat destinations');
assert.match(first('quantm').href,/#paper\/08_quantum_emergence\//);
assert(engine.search('quantm').approximate,'Typo fallback is identified');
assert(engine.search('gravtiy').results.some(result=>result.href.includes('12_gravity_derivation')),'Transposed letters are tolerated');
assert(engine.search('black holes').results.some(result=>/black.hole/i.test(result.title)),'Plural queries find singular concepts');
assert.equal(first('K_0').href,first('K0').href,'Math subscripts match plain typing');
assert.equal(first('α').href,first('alpha').href,'Greek characters and names match');
assert.equal(core.normalize('Schrödinger'),core.normalize('Schrodinger'),'Diacritics do not block matches');
assert.match(first('§12.5').href,/\/125-a-multi-scale-/,'Section notation resolves to its heading');
const phrase=engine.search('"nine-horizon tensor"');
assert(phrase.results.length>0 && phrase.results.every(result=>core.normalize(result.title+' '+data.records[result.id][3]).includes('nine horizon tensor')),'Quoted phrases stay together');
assert.equal(engine.search('"tensor nine horizon"').total,0,'Word order matters inside quotes');
assert.equal(engine.search('Theorem PL.999999').total,0,'Numeric references are not typo-corrected to another theorem');
assert.equal(engine.search('zxqvvzzqq').total,0,'Unknown words have a clean empty state');
for(const query of ['', '   ', '!!!', 'the and of', 'constructor', '__proto__', '<img src=x onerror=alert(1)>', '"', 'x'.repeat(20000)]) {
  const found=engine.search(query);
  assert(Array.isArray(found.results) && found.results.length<=8,'Safe bounded output for arbitrary input');
  assert.equal(new Set(found.results.map(result=>result.href)).size,found.results.length,'Each destination appears once');
}
// A phrase present only in body text must be searchable and point to its own section.
const sample=core.buildData([[0,'gravity','Gravity',''],[0,'measurement','Measurement','An interferometer registers a distinctive turquoise signal.'],[1,'quantum','Quantum','Gravity is mentioned here.']],
  [{id:'gravity',anchor:'gravity',label:'Gravity',context:'Section 1',group:'Main text'},{id:'quantum',anchor:'quantum',label:'Quantum',context:'Section 2',group:'Main text'}]);
const small=core.createEngine(sample);
assert.equal(small.search('gravity').results[0].href,'#paper/gravity/gravity','Direct title beats incidental references');
assert.equal(small.search('turquoise signal').results[0].href,'#paper/gravity/measurement','Body-only matches use the correct anchor');
assert.equal(small.search('quantum turquoise').total,0,'All query words are required');
const timings=[];
for(const query of ['Theorem PL.2','quant','gravtiy','fine structure constant','appendix z','K0','α','black holes','zxqvvzzqq']) {
  const started=performance.now(); engine.search(query); timings.push(performance.now()-started);
}
console.log('Passed: '+data.records.length+' indexed passages with valid anchors; exact titles, body text, prefixes, typos, references, phrases, Greek symbols, plurals, empty states, and query safety. Slowest sampled query: '+Math.ceil(Math.max(...timings))+' ms.');
