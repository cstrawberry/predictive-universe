/* Dependency-free search. Shared by the browser, index builder, and checks. */
(function (root) {
  'use strict';
  const greek = { α:'alpha', β:'beta', γ:'gamma', δ:'delta', ε:'epsilon', ϵ:'epsilon', ζ:'zeta', η:'eta', θ:'theta', ϑ:'theta', ι:'iota', κ:'kappa', λ:'lambda', μ:'mu', ν:'nu', ξ:'xi', π:'pi', ρ:'rho', σ:'sigma', ς:'sigma', τ:'tau', υ:'upsilon', φ:'phi', ϕ:'phi', χ:'chi', ψ:'psi', ω:'omega' };
  const stop = new Set('a an and are as at be by can does for from how in is it of on or that the this to was what when where which with'.split(' '));
  const aliases = { thm:'theorem', def:'definition', prop:'proposition', lem:'lemma', app:'appendix', sec:'section' };
  const symbols = { ge:'≥', geq:'≥', le:'≤', leq:'≤', ne:'≠', neq:'≠', in:'∈', notin:'∉', to:'→', rightarrow:'→', leftarrow:'←', times:'×', cdot:'·', ldots:'…', dots:'…', infty:'∞', hbar:'ℏ', partial:'∂', forall:'∀', exists:'∃', pm:'±', oplus:'⊕', otimes:'⊗', approx:'≈', sim:'∼', subset:'⊂', subseteq:'⊆', sum:'∑', prod:'∏', int:'∫', mid:'|', vert:'|', ell:'ℓ', hat:'', bar:'', tilde:'', left:'', right:'', big:'', Big:'', quad:' ', qquad:' ' };
  function plainText(value) {
    return String(value || '').replace(/\[([^\]]+)\]\([^)]+\)/g, '$1')
      .replace(/\\(?:text|textrm|mathrm|mathbf|mathcal|mathbb|mathsf|operatorname|boldsymbol)\s*\{([^{}]*)\}/g, '$1')
      .replace(/\\(?:mathrm|mathbf|mathcal|mathbb|mathsf|boldsymbol)\s+(?=[A-Za-z])/g, '')
      .replace(/\\([a-zA-Z]+)/g, (_, name) => Object.hasOwn(symbols,name)?symbols[name]:Object.keys(greek).find(key => greek[key] === name.toLowerCase()) || name)
      .replace(/[`$*{}]/g, '').replace(/\s+/g, ' ').trim();
  }
  function normalize(value) {
    return plainText(value).normalize('NFKD').replace(/\p{M}/gu, '').toLowerCase()
      .replace(/[α-ωϵϑϕ]/g, ch => ' ' + (greek[ch] || ch) + ' ')
      .replace(/§/g, ' section ').replace(/_/g, '').replace(/[’']/g, '')
      .replace(/[^\p{L}\p{N}.]+/gu, ' ').replace(/\.+(?=\s|$)/g, '').trim().replace(/\s+/g, ' ');
  }
  const tokens = value => normalize(value).match(/[\p{L}\p{N}]+(?:\.[\p{L}\p{N}]+)*/gu) || [];
  const route = (section, anchor) => '#paper/' + section + '/' + encodeURIComponent(anchor);
  function buildData(records, sections) {
    const postings = Object.create(null);
    const lengths = records.map(record => tokens(record[3]).length);
    const average = lengths.reduce((a,b)=>a+b, 0) / Math.max(1, lengths.length);
    records.forEach((record, id) => {
      const counts = new Map();
      const section=sections[record[0]];
      [record[2]+(record[1]===section.anchor?' '+section.label:''), record[3], section.context].forEach((field, index) => {
        for (const term of tokens(field)) {
          if (stop.has(term) || term.length > 64) continue;
          if (!counts.has(term)) counts.set(term, [0,0,0]);
          counts.get(term)[index]++;
        }
      });
      for (const [term, [title, body, context]] of counts) {
        const weight = 12 * title / (title + 1.2) + 2.2 * body / (body + 1.2 * (.25 + .75 * lengths[id] / average)) + (context ? .6 : 0);
        (postings[term] ||= []).push(id, Math.round(weight * 100));
      }
    });
    // Delta-coded postings parse only when a query uses that term.
    for(const term of Object.keys(postings)) {
      const entries=postings[term], packed=[]; let previous=0;
      for(let i=0;i<entries.length;i+=2) { packed.push((entries[i]-previous).toString(36)+'.'+entries[i+1].toString(36)); previous=entries[i]; }
      postings[term]=packed.join(',');
    }
    return { version: 1, sections, records, postings };
  }
  function distance(a, b, limit) {
    if (Math.abs(a.length - b.length) > limit) return limit + 1;
    let previous = Array.from({length:b.length+1}, (_,i)=>i), before;
    for (let i=1; i<=a.length; i++) {
      const row = [i];
      for (let j=1; j<=b.length; j++) {
        row[j] = Math.min(row[j-1]+1, previous[j]+1, previous[j-1]+(a[i-1]===b[j-1]?0:1));
        if (i>1 && j>1 && a[i-1]===b[j-2] && a[i-2]===b[j-1]) row[j] = Math.min(row[j], before[j-2]+1);
      }
      if (Math.min(...row) > limit) return limit + 1;
      before = previous; previous = row;
    }
    return previous[b.length];
  }
  function createEngine(data) {
    if (data.version !== 1 || !Array.isArray(data.records)) throw new Error('Invalid search index');
    const vocabulary = Object.keys(data.postings).sort();
    const byLength = new Map();
    vocabulary.forEach(term => { if (!byLength.has(term.length)) byLength.set(term.length, []); byLength.get(term.length).push(term); });
    const normalizedTitles = data.records.map(record => normalize(record[2]));
    const phraseCache = new Map();
    const postingCache = new Map();
    const expansionCache = new Map();
    function postings(word) {
      if(postingCache.has(word)) return postingCache.get(word);
      let id=0; const entries=[];
      for(const pair of data.postings[word].split(',')) { const [gap,weight]=pair.split('.'); id+=parseInt(gap,36); entries.push(id,parseInt(weight,36)); }
      if(postingCache.size>=128) postingCache.delete(postingCache.keys().next().value);
      postingCache.set(word,entries); return entries;
    }
    function expanded(term, fuzzy) {
      const cacheKey=term+'/'+fuzzy;
      if(expansionCache.has(cacheKey)) return expansionCache.get(cacheKey);
      const found = [];
      if (Object.hasOwn(data.postings, term)) found.push([term, 1]);
      if (!/\d/.test(term) && term.length >= 2) {
        let low=0, high=vocabulary.length;
        while(low<high) { const mid=(low+high)>>1; if(vocabulary[mid]<term) low=mid+1; else high=mid; }
        for(let i=low; i<vocabulary.length && vocabulary[i].startsWith(term) && found.length<100; i++) {
          if(vocabulary[i]!==term) found.push([vocabulary[i], .72 * term.length/vocabulary[i].length]);
        }
      }
      if (term.length>3 && term.endsWith('s') && !term.endsWith('ss') && Object.hasOwn(data.postings, term.slice(0,-1))) found.push([term.slice(0,-1), .94]);
      if (term.length>3 && !term.endsWith('s') && Object.hasOwn(data.postings, term+'s')) found.push([term+'s', .9]);
      if (fuzzy && term.length >= 4 && !/\d/.test(term)) {
        const max = term.length >= 8 ? 2 : 1;
        const near = [];
        for(let n=term.length-max; n<=term.length+max; n++) for(const word of byLength.get(n)||[]) {
          if(word===term || word.startsWith(term)) continue;
          const delta=distance(term, word, max);
          if(delta<=max) near.push([word, .52/delta]);
        }
        near.sort((a,b)=>b[1]-a[1] || a[0].localeCompare(b[0]));
        found.push(...near.slice(0,8));
      }
      if(expansionCache.size>=128) expansionCache.delete(expansionCache.keys().next().value);
      expansionCache.set(cacheKey,found); return found;
    }
    function retrieve(queryTerms, fuzzy) {
      let candidates;
      const highlights = new Set(queryTerms);
      for(const term of queryTerms) {
        const matches = new Map();
        for(const [word, quality] of expanded(term, fuzzy)) {
          highlights.add(word);
          const entries=postings(word);
          const rarity=1+Math.log(1+(data.records.length-entries.length/2+.5)/(entries.length/2+.5));
          for(let i=0; i<entries.length; i+=2) {
            const score=entries[i+1]/100*quality*rarity;
            matches.set(entries[i], Math.max(matches.get(entries[i])||0,score));
          }
        }
        if(candidates) {
          for(const [id,score] of candidates) { if(matches.has(id)) candidates.set(id,score+matches.get(id)); else candidates.delete(id); }
        } else candidates=matches;
        if(!candidates.size) break;
      }
      return { candidates:candidates || new Map(), highlights:[...highlights] };
    }
    function result(id, terms=[]) {
      const [sectionIndex, anchor, title, body]=data.records[id];
      const section=data.sections[sectionIndex];
      let start=0;
      for(const match of body.matchAll(/[\p{L}\p{N}]+(?:[._][\p{L}\p{N}]+)*/gu)) {
        if(terms.includes(normalize(match[0]))) { start=Math.max(0,match.index-65); break; }
      }
      if(start) { const boundary=body.indexOf(' ',start); if(boundary>=0 && boundary-start<30) start=boundary+1; }
      let snippet=body.slice(start,start+180);
      if(start+180<body.length) snippet=snippet.replace(/\s+\S*$/,'')+'…';
      if(start) snippet='…'+snippet;
      return { id, title:anchor===section.anchor?section.label:title, snippet, chapter:section.context+(section.context?' · ':'')+section.label, group:section.group, href:route(section.id,anchor), terms };
    }
    function search(raw, limit=8, offset=0) {
      const value=String(raw||'').slice(0,240);
      const phrases=[...value.matchAll(/"([^"]+)"/g)].map(match=>normalize(match[1])).filter(Boolean);
      const queryTerms=[...new Set(tokens(value).map(term=>Object.hasOwn(aliases,term)?aliases[term]:term).filter(term=>!stop.has(term)))].slice(0,12);
      if(!queryTerms.length) return { results:[], total:0, approximate:false, empty:true };
      let {candidates,highlights}=retrieve(queryTerms,false);
      let approximate=false;
      if(!candidates.size && !phrases.length) { ({candidates,highlights}=retrieve(queryTerms,true)); approximate=!!candidates.size; }
      const needle=queryTerms.join(' ');
      const matchesByTerm=queryTerms.map(term=>expanded(term,approximate).map(([word])=>word));
      const ranked=[];
      for(const [id,base] of candidates) {
        if(phrases.length) {
          if(!phraseCache.has(id)) phraseCache.set(id, normalize(data.records[id][2]+' '+data.records[id][3]));
          if(!phrases.every(phrase=>phraseCache.get(id).includes(phrase))) continue;
        }
        const title=normalizedTitles[id], record=data.records[id], section=data.sections[record[0]];
        const chapter=record[1]===section.anchor;
        const chapterTitle=normalize(section.label);
        const titleWords=new Set((title+' '+(chapter?chapterTitle:'')).split(' '));
        const titleMatch=matchesByTerm.every(words=>words.some(word=>titleWords.has(word)));
        const score=base+(title===needle?80:title.startsWith(needle)?35:title.includes(needle)?20:0)
          +(chapter && (normalize(section.context)===needle || chapterTitle===needle)?160:chapter && titleMatch?50:0)
          +(section.id==='glossary' && titleMatch?8:0);
        ranked.push({id,score});
      }
      ranked.sort((a,b)=>b.score-a.score || a.id-b.id);
      const seen=new Set(), results=[];
      for(const {id} of ranked) {
        const record=data.records[id], key=record[0]+'/'+record[1];
        if(seen.has(key)) continue;
        seen.add(key);
        if(seen.size>offset && results.length<limit) results.push(result(id,highlights));
      }
      return { results, total:seen.size, approximate, empty:false };
    }
    return { search, result, data };
  }
  const api={plainText, normalize, tokens, buildData, createEngine};
  if(typeof module==='object' && module.exports) module.exports=api;
  else root.PU_SEARCH_ENGINE=api;
})(typeof window==='undefined'?globalThis:window);
