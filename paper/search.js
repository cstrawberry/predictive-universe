/* Accessible autocomplete controller; index and all assets load locally. */
(function () {
  'use strict';
  const indexURL = new URL('search-index.js', document.currentScript.src);
  let pendingIndex;
  function loadIndex() {
    if (window.PU_SEARCH_DATA) return Promise.resolve(window.PU_SEARCH_DATA);
    if (!pendingIndex) pendingIndex = new Promise((resolve, reject) => {
      const script = document.createElement('script');
      script.src = indexURL.href;
      script.onload = () => {
        script.remove();
        if (window.PU_SEARCH_DATA) resolve(window.PU_SEARCH_DATA);
        else { pendingIndex = null; reject(new Error('Missing search index')); }
      };
      script.onerror = () => { script.remove(); pendingIndex = null; reject(new Error('Search index unavailable')); };
      document.head.append(script);
    });
    return pendingIndex;
  }
  function mount({ input, clearButton, navigate, openContents }) {
    const { normalize } = window.PU_SEARCH_ENGINE;
    const storageKey = 'pu-paper-recent-results';
    const popup = document.createElement('section');
    popup.className = 'search-popover'; popup.hidden = true;
    popup.setAttribute('aria-label', 'Paper search');
    const heading = document.createElement('p'); heading.className = 'search-summary';
    const list = document.createElement('div'); list.id = 'paperSearchResults'; list.setAttribute('role','listbox'); list.setAttribute('aria-label','Search results');
    const message = document.createElement('p'); message.className = 'search-message'; message.hidden = true;
    const retry = document.createElement('button'); retry.className = 'search-retry'; retry.type = 'button'; retry.textContent = 'Try again'; retry.hidden = true;
    const help = document.createElement('div'); help.className = 'search-help'; help.textContent = '↑ ↓ Navigate · Enter Open · Esc Close';
    const paging = document.createElement('div'); paging.className='search-paging'; paging.hidden=true;
    const previous = document.createElement('button'); previous.type='button'; previous.textContent='← Previous'; previous.setAttribute('aria-label','Previous search results');
    const next = document.createElement('button'); next.type='button'; next.textContent='Next →'; next.setAttribute('aria-label','Next search results');
    paging.append(previous,next);
    const live = document.createElement('p'); live.className = 'sr-only'; live.setAttribute('role','status'); live.setAttribute('aria-live','polite'); live.setAttribute('aria-atomic','true');
    popup.append(heading,list,message,retry,paging,help); document.body.append(popup,live);
    input.setAttribute('role','combobox'); input.setAttribute('aria-autocomplete','list'); input.setAttribute('aria-haspopup','listbox');
    input.setAttribute('aria-controls',list.id); input.setAttribute('aria-expanded','false');
    input.autocomplete = 'off'; input.spellcheck = false; input.maxLength = 240;
    let engine, enginePromise, results = [], selected = -1, version = 0, timer, composing = false, resizeFrame, page = 0, total = 0;
    let recent = [];
    try { const saved = JSON.parse(localStorage.getItem(storageKey)); if(Array.isArray(saved)) recent=saved.filter(value=>typeof value==='string').slice(0,5); } catch (_) {}
    function ensureEngine() {
      if (!enginePromise) enginePromise = loadIndex().then(data => engine ||= window.PU_SEARCH_ENGINE.createEngine(data)).catch(error => { enginePromise=null; throw error; });
      return enginePromise;
    }
    function position() {
      if (popup.hidden) return;
      const field = input.closest('.section-search').getBoundingClientRect();
      const viewport = window.visualViewport;
      const width = viewport?.width || window.innerWidth;
      const height = viewport?.height || window.innerHeight;
      const offsetTop = viewport?.offsetTop || 0;
      const offsetLeft = viewport?.offsetLeft || 0;
      const panelWidth = Math.min(580,width-24);
      const below = offsetTop+height-field.bottom-12;
      const above = field.top-offsetTop-12;
      const upwards = below < 190 && above > below;
      popup.style.width = panelWidth+'px';
      popup.style.left = Math.max(offsetLeft+12,Math.min(field.left,offsetLeft+width-panelWidth-12))+'px';
      popup.style.maxHeight = Math.max(100,Math.min(620,upwards?above:below))+'px';
      if(upwards) { popup.style.top='auto'; popup.style.bottom=(window.innerHeight-field.top+8)+'px'; }
      else { popup.style.bottom='auto'; popup.style.top=Math.max(offsetTop+8,field.bottom+8)+'px'; }
    }
    function open() {
      popup.hidden=false; input.setAttribute('aria-expanded','true'); position();
    }
    function close() {
      clearTimeout(timer); version++;
      popup.hidden=true; input.setAttribute('aria-expanded','false'); input.removeAttribute('aria-activedescendant'); input.removeAttribute('aria-busy');
      selected=-1;
    }
    function syncField() {
      clearButton.hidden=!input.value;
    }
    function activate(index, scroll=false) {
      selected=index;
      [...list.children].forEach((row,i)=>row.setAttribute('aria-selected',String(i===selected)));
      if(index>=0 && list.children[index]) {
        input.setAttribute('aria-activedescendant',list.children[index].id);
        if(scroll) list.children[index].scrollIntoView({block:'nearest'});
      } else input.removeAttribute('aria-activedescendant');
    }
    function highlighted(text, terms) {
      const fragment=document.createDocumentFragment();
      let end=0;
      for(const match of text.matchAll(/[\p{L}\p{N}]+(?:[._][\p{L}\p{N}]+)*/gu)) {
        const word=normalize(match[0]);
        if(!terms.some(term=>word===term || (term.length>=2 && word.startsWith(term)))) continue;
        fragment.append(document.createTextNode(text.slice(end,match.index)));
        const mark=document.createElement('mark'); mark.textContent=match[0]; fragment.append(mark);
        end=match.index+match[0].length;
      }
      fragment.append(document.createTextNode(text.slice(end))); return fragment;
    }
    function render(items, title, emptyText='') {
      results=items; list.replaceChildren();
      heading.textContent=title; message.textContent=emptyText; message.hidden=!emptyText; retry.hidden=true;
      items.forEach((item,index)=> {
        const row=document.createElement('a'); row.id='paperSearchOption-'+index; row.href=item.href;
        row.className='search-result'; row.tabIndex=-1; row.setAttribute('role','option');
        const label=document.createElement('span'); label.className='search-result-title'; label.append(highlighted(item.title,item.terms||[]));
        const breadcrumb=document.createElement('span'); breadcrumb.className='search-result-chapter'; breadcrumb.textContent=item.chapter;
        row.append(label,breadcrumb);
        if(item.snippet) { const excerpt=document.createElement('span'); excerpt.className='search-result-excerpt'; excerpt.append(highlighted(item.snippet,item.terms||[])); row.append(excerpt); }
        row.addEventListener('pointermove',()=>activate(index));
        row.addEventListener('pointerdown',event=>{ if(event.pointerType==='mouse' && event.button===0) event.preventDefault(); });
        row.addEventListener('click',event=>{
          if(event.ctrlKey||event.metaKey||event.shiftKey||event.altKey||event.button!==0) return;
          event.preventDefault(); event.stopPropagation(); choose(index);
        });
        list.append(row);
      });
      activate(items.length?0:-1); list.scrollTop=0;
      live.textContent=emptyText || title+'. Use the arrow keys to choose a result and Enter to open it.';
      open();
    }
    async function choose(index) {
      const item=results[index]; if(!item) return;
      recent=[item.href,...recent.filter(href=>href!==item.href)].slice(0,5);
      try { localStorage.setItem(storageKey,JSON.stringify(recent)); } catch (_) {}
      close(); input.blur();
      await navigate(item.href);
      if(popup.hidden && document.activeElement===document.body) document.getElementById('paperContent')?.focus({preventScroll:true});
    }
    function startingPoints() {
      const items=[];
      if(recent.length) {
        const wanted=new Set(recent);
        engine.data.records.forEach((record,id)=> {
          if(items.length>=recent.length) return;
          const href='#paper/'+engine.data.sections[record[0]].id+'/'+encodeURIComponent(record[1]);
          if(wanted.delete(href)) items.push(engine.result(id));
        });
        items.sort((a,b)=>recent.indexOf(a.href)-recent.indexOf(b.href));
      }
      if(items.length) return {items,title:'Recent'};
      for(const id of ['07_minimal_predictive_unit','04_spap','08_quantum_emergence','12_gravity_derivation']) {
        const index=engine.data.records.findIndex(record=>engine.data.sections[record[0]].id===id);
        if(index>=0) items.push(engine.result(index));
      }
      return {items,title:'Start here'};
    }
    async function update() {
      const request=++version;
      syncField();
      if(!engine) {
        results=[]; list.replaceChildren(); activate(-1); heading.textContent='Search';
        message.textContent='Loading search…'; message.hidden=false; retry.hidden=true;
        input.setAttribute('aria-busy','true'); open();
      }
      try {
        await ensureEngine();
        if(request!==version || composing) return;
        input.removeAttribute('aria-busy');
        if(!input.value.trim()) { paging.hidden=true; const start=startingPoints(); render(start.items,start.title); return; }
        const found=engine.search(input.value,8,page*8); total=found.total;
        paging.hidden=total<=8; previous.disabled=page===0; next.disabled=(page+1)*8>=total;
        const count=total>8?(page*8+1)+'–'+Math.min((page+1)*8,total)+' of '+total:total===1?'1 match':total+' matches';
        const title=(found.approximate?'Closest matches · ':'')+count;
        render(found.results,title,found.results.length?'':found.empty?'Type a word, phrase, or theorem number.':'No matches. Try fewer words or a different term.');
      } catch (_) {
        if(request!==version) return;
        input.removeAttribute('aria-busy'); paging.hidden=true; render([],'Search','Search could not load.'); retry.hidden=false;
      }
    }
    function schedule() {
      version++; clearTimeout(timer); syncField(); page=0; paging.hidden=true;
      // Never let Enter open a result left over from an earlier query.
      results=[]; list.replaceChildren(); activate(-1);
      if(composing) return;
      timer=setTimeout(update,70);
    }
    input.addEventListener('input',schedule);
    input.addEventListener('focus',()=>{ clearTimeout(timer); update(); });
    input.addEventListener('click',()=>{ if(popup.hidden) update(); });
    input.addEventListener('compositionstart',()=>{ composing=true; version++; clearTimeout(timer); });
    input.addEventListener('compositionend',()=>{ composing=false; schedule(); });
    function turnPage(direction) {
      if(popup.hidden || !input.value.trim() || page+direction<0 || (page+direction)*8>=total) return;
      page+=direction; update();
    }
    input.addEventListener('keydown',async event=> {
      if(composing || event.isComposing) return;
      if(event.key==='ArrowDown'||event.key==='ArrowUp') {
        event.preventDefault();
        if(popup.hidden) { update(); return; }
        if(results.length) activate((selected+(event.key==='ArrowDown'?1:-1)+results.length)%results.length,true);
      } else if((event.key==='PageDown'||event.key==='PageUp') && !popup.hidden) {
        event.preventDefault(); turnPage(event.key==='PageDown'?1:-1);
      } else if(event.key==='Enter') {
        event.preventDefault();
        if(!popup.hidden && selected>=0) choose(selected);
        else {
          clearTimeout(timer); const query=input.value;
          await update();
          if(!popup.hidden && input.value===query && document.activeElement===input && selected>=0) choose(selected);
        }
      } else if(event.key==='Escape' && !popup.hidden) { event.preventDefault(); event.stopPropagation(); close(); }
    });
    clearButton.addEventListener('pointerdown',event=>event.preventDefault());
    clearButton.addEventListener('click',()=>{ input.value=''; page=0; syncField(); input.focus(); update(); });
    for(const button of [previous,next]) button.addEventListener('pointerdown',event=>event.preventDefault());
    previous.addEventListener('click',()=>turnPage(-1)); next.addEventListener('click',()=>turnPage(1));
    retry.addEventListener('click',()=>{ input.focus(); update(); });
    document.addEventListener('pointerdown',event=> {
      if(!popup.contains(event.target) && !input.closest('.section-search').contains(event.target)) close();
    });
    document.addEventListener('focusin',event=> {
      if(!popup.contains(event.target) && !input.closest('.section-search').contains(event.target)) close();
    });
    document.addEventListener('keydown',event=> {
      const shortcut=(event.ctrlKey||event.metaKey) && !event.altKey && !event.shiftKey && event.key.toLowerCase()==='k';
      const editing=event.target.closest('input,textarea,select,[contenteditable="true"]');
      if(shortcut || (event.key==='/' && !editing && !event.ctrlKey && !event.metaKey && !event.altKey)) {
        event.preventDefault(); openContents(); input.focus(); input.select(); if(popup.hidden) update();
      }
    });
    function reposition(event) {
      if(popup.hidden || (event.target instanceof Node && popup.contains(event.target))) return;
      cancelAnimationFrame(resizeFrame); resizeFrame=requestAnimationFrame(position);
    }
    window.addEventListener('resize',reposition);
    window.addEventListener('scroll',reposition,true);
    window.visualViewport?.addEventListener('resize',reposition);
    window.visualViewport?.addEventListener('scroll',reposition);
    syncField();
    return {close};
  }
  window.PU_SEARCH={mount};
})();
