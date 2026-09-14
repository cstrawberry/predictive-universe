/* Shared paper / visualization reader. Manuscript text lives in docs/paper. */
(function () {
  'use strict';
  const { sections, scenes, relatedPapers = [] } = window.PU_PAPER;
  const byId = new Map(sections.map(section => [section.id, section]));
  const byFile = new Map(sections.map(section => [section.file, section]));
  const byScene = new Map(scenes.map(scene => [scene.key, scene]));
  const $ = id => document.getElementById(id);
  const article = $('paperContent');
  const frame = $('visualizationFrame');
  const tabs = [$('paperTab'), $('visualizationsTab')];
  const scripts = new Map();
  const cache = new Map();
  const rootURL = new URL('../', document.currentScript.src);
  const frameOrigin = rootURL.origin === 'null' ? '*' : rootURL.origin;
  let currentSection = sections[0];
  let currentScene = 'cogito';
  let view = 'paper';
  let renderedId = '';
  let requestVersion = 0;
  let paperScroll = 0;
  let visualizationScroll = 0;
  let frameReady = false;
  let paperSearch;
  const escape = htmlEsc;
  const paperRoute = (id, anchor = '') => '#paper/' + id + (anchor ? '/' + encodeURIComponent(anchor) : '');
  const sceneRoute = key => '#visualizations/' + key;
  const plain = value => value.replace(/\$([^$]+)\$/g, '$1').replace(/[{}\\]/g, '').replace(/\*\*/g, '');

  function navigate(hash) {
    if (location.hash === hash) return applyRoute();
    history.pushState(null, '', hash);
    return applyRoute();
  }
  function readRoute() {
    let hash;
    try { hash = decodeURIComponent(location.hash.slice(1)); } catch (_) { hash = ''; }
    const parts = hash.split('/');
    const params = new URLSearchParams(location.search);
    if (/^visuali[sz]ations$/.test(parts[0]) || /^visuali[sz]ations$/.test(params.get('view'))) {
      const key = parts[1] || params.get('scene');
      return { view: 'visualizations', key: byScene.has(key) ? key : 'cogito' };
    }
    // Preserve standalone scene bookmarks and the previous reader's query links.
    if (byScene.has(hash)) return { view: 'visualizations', key: hash };
    let id = parts[0] === 'paper' ? parts[1] : '';
    id = (id || params.get('file') || sections[0].id).replace(/\.md$/, '');
    const publication = relatedPapers.find(paper => paper.id === id || paper.source === id + '.md');
    if (publication) return { view: 'pdf', publication };
    const matched = byId.get(id) || sections.find(section => section.file === id + '.md' || section.file.endsWith('/' + id + '.md'));
    return { view: 'paper', section: matched || sections[0], anchor: parts.slice(2).join('/') };
  }
  function setContents(open) {
    if (!open) paperSearch?.close();
    $('contents').classList.toggle('is-open', open);
    $('contentsToggle').setAttribute('aria-expanded', String(open));
    $('contents').style.setProperty('--contents-top', Math.max(60, document.querySelector('.view-bar').getBoundingClientRect().bottom) + 'px');
  }
  function sendFrame(message) {
    if (frameReady) frame.contentWindow.postMessage({ channel: 'pu-reader', ...message }, frameOrigin);
  }
  function showView(next) {
    const changed = view !== next;
    if (changed) {
      if (view === 'paper') paperScroll = window.scrollY;
      else visualizationScroll = window.scrollY;
    }
    view = next;
    $('paperPanel').hidden = view !== 'paper';
    $('visualizationsPanel').hidden = view !== 'visualizations';
    $('contentsToggle').hidden = view !== 'paper';
    document.querySelector('.skip-link').textContent = view === 'paper' ? 'Skip to paper' : 'Skip to visualizations';
    tabs.forEach((tab, i) => {
      const selected = (i === 0) === (view === 'paper');
      tab.setAttribute('aria-selected', String(selected));
      tab.tabIndex = selected ? 0 : -1;
    });
    setContents(false);
    sendFrame({ type: 'visibility', visible: view === 'visualizations' });
    if (changed) window.scrollTo(0, view === 'paper' ? paperScroll : visualizationScroll);
    updateProgress();
    return changed;
  }
  async function applyRoute() {
    const route = readRoute();
    if (route.view === 'pdf') {
      location.replace(new URL('docs/paper/' + route.publication.file, rootURL).href);
      return;
    }
    const switched = showView(route.view);
    const version = ++requestVersion;
    if (route.view === 'visualizations') {
      currentScene = route.key;
      updateSceneLink();
      if (!frame.hasAttribute('src')) frame.src = new URL(frame.dataset.src + '#' + currentScene, rootURL).href;
      else sendFrame({ type: 'scene', key: currentScene });
      document.title = byScene.get(currentScene).title + ' — The Predictive Universe';
      return;
    }
    const sectionChanged = currentSection.id !== route.section.id || !renderedId;
    currentSection = route.section;
    updateChapterUI();
    document.title = plain(currentSection.label) + ' — The Predictive Universe';
    if (renderedId !== currentSection.id) {
      renderedId = '';
      article.setAttribute('aria-busy', 'true');
      article.innerHTML = '<p class="muted">Loading ' + escape(plain(currentSection.label)) + '…</p>';
      try {
        const markdown = await loadMarkdown(currentSection);
        if (version !== requestVersion) return;
        article.innerHTML = renderMarkdown(markdown);
        prepareArticle(currentSection);
        renderedId = currentSection.id;
        $('readerStatus').textContent = plain(currentSection.label) + ' loaded.';
      } catch (error) {
        if (version !== requestVersion) return;
        renderedId = '';
        article.innerHTML = '<h1>Unable to load this section</h1><p>You can still <a href="' + escape($('sourceLink').href) + '">open the Markdown source</a>.</p><p>Reload the page to try again.</p>';
        $('readerStatus').textContent = 'Unable to load the section.';
      } finally {
        if (version === requestVersion) article.setAttribute('aria-busy', 'false');
      }
    }
    if (version !== requestVersion) return;
    if (route.anchor) {
      const target = article.querySelector('[id="' + CSS.escape(route.anchor) + '"]');
      if (target) target.scrollIntoView({ block: 'start' });
    } else if (sectionChanged && location.hash) {
      $('paperPanel').scrollIntoView({ block: 'start' });
    } else if (switched) window.scrollTo(0, paperScroll);
    if (sectionChanged && location.hash && document.activeElement !== $('sectionSearch')) article.focus({ preventScroll: true });
    updateProgress();
  }

  function loadBundle(section) {
    if (window.PU_PAPER_TEXT?.[section.id] !== undefined) return Promise.resolve(window.PU_PAPER_TEXT[section.id]);
    if (!scripts.has(section.id)) {
      const promise = new Promise((resolve, reject) => {
        const script = document.createElement('script');
        script.src = new URL('paper/content/' + section.id + '.js', rootURL).href;
        script.onload = () => {
          script.remove();
          if (window.PU_PAPER_TEXT?.[section.id] !== undefined) resolve(window.PU_PAPER_TEXT[section.id]);
          else { scripts.delete(section.id); reject(new Error('Missing bundled manuscript')); }
        };
        script.onerror = () => { script.remove(); scripts.delete(section.id); reject(new Error('Could not load manuscript')); };
        document.head.append(script);
      });
      scripts.set(section.id, promise);
    }
    return scripts.get(section.id);
  }
  async function loadMarkdown(section) {
    if (cache.has(section.id)) return cache.get(section.id);
    let text;
    if (location.protocol === 'file:') text = await loadBundle(section);
    else {
      const response = await fetch(new URL('docs/paper/' + section.file, rootURL));
      if (!response.ok) throw new Error('Manuscript response ' + response.status);
      text = await response.text();
    }
    if (cache.size >= 4) cache.delete(cache.keys().next().value);
    cache.set(section.id, text);
    return text;
  }
  function buildNavigation() {
    $('chapterNav').innerHTML = [...new Set(sections.map(section => section.group))].map(group =>
      '<details class="nav-group"' + (group === 'Main text' ? ' open' : '') + '><summary>' + escape(group) + '</summary>' +
      sections.filter(section => section.group === group).map(section =>
        '<a href="' + paperRoute(section.id, markdownHeadingSlug(section.title)) + '" data-section="' + section.id + '"><span>' + escape(section.number || '·') + '</span>' + escape(plain(section.label)) + '</a>').join('') +
      (group === 'Reading guides & related work' ? relatedPapers.map(paper =>
        '<a href="' + escape(new URL('docs/paper/' + paper.file, rootURL).href) + '" target="_blank" rel="noopener noreferrer"><span>PDF</span>' + escape(paper.title) + '</a>').join('') : '') + '</details>').join('');
  }
  function updateChapterUI() {
    document.querySelectorAll('[data-section]').forEach(link => {
      const active = link.dataset.section === currentSection.id;
      if (active) { link.setAttribute('aria-current', 'page'); link.closest('details').open = true; }
      else link.removeAttribute('aria-current');
    });
    $('chapterMarker').textContent = currentSection.group === 'Main text' ?
      (currentSection.number === '00' ? 'THE PAPER / ABSTRACT' : 'SECTION ' + currentSection.number + ' / 15') :
      currentSection.group === 'Appendices' ? 'APPENDIX ' + currentSection.number : 'REFERENCE & CONTEXT';
    $('sourceLink').href = new URL('docs/paper/' + currentSection.file, rootURL).href;
    const index = sections.indexOf(currentSection);
    $('chapterPagination').innerHTML = [[sections[index - 1], '← PREVIOUS'], [sections[index + 1], 'NEXT →']].map(([section, label]) =>
      section ? '<a href="' + paperRoute(section.id) + '"><span>' + label + '</span>' + escape(plain(section.label)) + '</a>' : '').join('');
    let related = scenes.filter(scene => scene.sections.includes(currentSection.id));
    if (currentSection.id === sections[0].id) related = ['cogito', 'mpu', 'cascade'].map(key => byScene.get(key));
    $('relatedScenes').innerHTML = related.length ? '<h2>SEE THE CONCEPTS</h2><p>Follow the argument visually.</p>' + related.map(scene =>
      '<a href="' + sceneRoute(scene.key) + '"><span aria-hidden="true">↗</span> ' + escape(scene.title) + '</a>').join('') :
      '<h2>EXPLORE THE FRAMEWORK</h2><p>Follow its core ideas in 24 interactive scenes.</p><a href="#visualizations/cogito"><span aria-hidden="true">↗</span> Open visualizations</a>';
  }
  function resolvePaperLink(href, section) {
    if (href.startsWith('#')) return paperRoute(section.id, href.slice(1));
    const sourceURL = new URL('docs/paper/' + section.file, rootURL);
    let url;
    try { url = new URL(href, sourceURL); } catch (_) { return null; }
    const paperURL = new URL('docs/paper/', rootURL);
    if (url.origin !== paperURL.origin || !url.pathname.startsWith(paperURL.pathname)) return null;
    const file = decodeURIComponent(url.pathname.slice(paperURL.pathname.length));
    const target = byFile.get(file);
    const publication = relatedPapers.find(paper => paper.source === file);
    return target ? paperRoute(target.id, decodeURIComponent(url.hash.slice(1))) :
      publication ? new URL('docs/paper/' + publication.file, rootURL).href : null;
  }
  function prepareArticle(section) {
    article.querySelectorAll('a[href]').forEach(link => {
      const href = link.getAttribute('href');
      if (/^(?:javascript|data|vbscript):/i.test(href.replace(/[\u0000-\u0020]/g, ''))) { link.removeAttribute('href'); return; }
      const internal = resolvePaperLink(href, section);
      if (internal) {
        link.setAttribute('href', internal);
        if (internal.startsWith('#')) link.removeAttribute('target');
        else { link.target = '_blank'; link.rel = 'noopener noreferrer'; }
      }
      else {
        link.href = new URL(href, new URL('docs/paper/' + section.file, rootURL)).href;
        link.target = '_blank';
        link.rel = 'noopener noreferrer';
      }
    });
    article.querySelectorAll('img[src]').forEach(img => { img.src = new URL(img.getAttribute('src'), new URL('docs/paper/' + section.file, rootURL)).href; img.loading = 'lazy'; });
    article.querySelectorAll('table.md-table').forEach(table => {
      const wrapper = document.createElement('div');
      wrapper.className = 'table-scroll'; wrapper.tabIndex = 0; wrapper.setAttribute('role', 'region'); wrapper.setAttribute('aria-label', 'Scrollable table');
      table.before(wrapper); wrapper.append(table);
    });
    const headings = [...article.querySelectorAll('h2[id], h3[id], p[id]')].filter(el => el.tagName !== 'P' || /^\d+(?:\.\d+)*\s/.test(el.textContent)).slice(0, 150);
    $('pageOutline').hidden = !headings.length;
    $('headingNav').innerHTML = headings.map(heading => {
      const labelNode = ((heading.tagName === 'P' && heading.querySelector('strong')) || heading).cloneNode(true);
      labelNode.querySelectorAll('annotation').forEach(annotation => annotation.remove());
      const label = labelNode.textContent;
      return '<a href="' + paperRoute(section.id, heading.id) + '">' + escape(label) + '</a>';
    }).join('');
    fitInlineMath();
  }
  function fitInlineMath() {
    if (!article.clientWidth) return;
    article.querySelectorAll('.math-i').forEach(wrapper => {
      const math = wrapper.querySelector('math');
      wrapper.classList.toggle('is-wide', !!math && math.getBoundingClientRect().width > article.clientWidth + 1);
    });
  }
  new ResizeObserver(fitInlineMath).observe(article);
  function updateSceneLink() {
    const scene = byScene.get(currentScene);
    $('scenePaperLink').href = paperRoute(scene.sections[0] || sections[0].id);
    $('scenePaperLink').textContent = 'Read this in the paper ↗';
    $('scenePaperLink').title = scene.source;
  }
  function updateProgress() {
    const distance = Math.max(1, article.offsetHeight - window.innerHeight + 110);
    const position = window.scrollY - (article.getBoundingClientRect().top + window.scrollY) + 90;
    $('readingProgress').style.width = view === 'paper' ? Math.min(100, Math.max(0, position / distance * 100)) + '%' : '0';
  }
  document.addEventListener('click', event => {
    const link = event.target.closest('a[href^="#paper/"], a[href^="#visualizations/"]');
    if (link && !event.ctrlKey && !event.metaKey && !event.shiftKey && !event.altKey && event.button === 0) {
      event.preventDefault(); navigate(link.getAttribute('href'));
    }
    if (!event.target.closest('#contents, #contentsToggle, .search-popover')) setContents(false);
  });
  document.querySelector('.skip-link').addEventListener('click', event => {
    event.preventDefault();
    const target = view === 'paper' ? article : $('visualizationsPanel');
    target.tabIndex = -1;
    target.scrollIntoView({ block: 'start' });
    target.focus({ preventScroll: true });
  });
  tabs.forEach((tab, i) => {
    tab.addEventListener('click', () => navigate(i === 0 ? paperRoute(currentSection.id) : sceneRoute(currentScene)));
    tab.addEventListener('keydown', event => {
      if (event.ctrlKey || event.metaKey || event.altKey) return;
      if (!['ArrowLeft', 'ArrowRight', 'Home', 'End'].includes(event.key)) return;
      event.preventDefault();
      const next = event.key === 'Home' ? 0 : event.key === 'End' ? 1 : 1 - i;
      tabs[next].focus(); tabs[next].click();
    });
  });
  $('contentsToggle').addEventListener('click', () => setContents($('contentsToggle').getAttribute('aria-expanded') !== 'true'));
  document.addEventListener('keydown', event => { if (event.key === 'Escape' && $('contents').classList.contains('is-open')) { setContents(false); $('contentsToggle').focus(); } });
  function syncThemeLabel() {
    const light = document.documentElement.dataset.theme === 'light';
    const label = light ? 'Use dark theme' : 'Use light theme';
    $('themeToggle').setAttribute('aria-label', label);
    $('themeToggle').title = label;
  }
  $('themeToggle').addEventListener('click', () => {
    const theme = document.documentElement.dataset.theme === 'light' ? 'dark' : 'light';
    document.documentElement.dataset.theme = theme;
    try { localStorage.setItem('pu-reader-theme', theme); } catch (_) {}
    syncThemeLabel();
  });
  frame.addEventListener('load', () => { frameReady = true; sendFrame({ type: 'visibility', visible: view === 'visualizations' }); sendFrame({ type: 'scene', key: currentScene }); });
  window.addEventListener('message', event => {
    if (event.source !== frame.contentWindow || (rootURL.origin !== 'null' && event.origin !== rootURL.origin) || event.data?.channel !== 'pu-visualization') return;
    const message = event.data;
    if (message.type === 'scene' && byScene.has(message.key)) {
      if (currentScene !== message.key && view === 'visualizations') history.pushState(null, '', sceneRoute(message.key));
      currentScene = message.key; updateSceneLink();
      if (view === 'visualizations') document.title = byScene.get(currentScene).title + ' — The Predictive Universe';
    }
  });
  window.addEventListener('popstate', applyRoute);
  window.addEventListener('hashchange', applyRoute);
  window.addEventListener('scroll', updateProgress, { passive: true });
  window.addEventListener('resize', updateProgress, { passive: true });
  if ('scrollRestoration' in history) history.scrollRestoration = 'manual';
  buildNavigation();
  paperSearch = window.PU_SEARCH.mount({
    input: $('sectionSearch'), clearButton: $('searchClear'), navigate,
    openContents() { if (view !== 'paper') navigate(paperRoute(currentSection.id)); setContents(true); }
  });
  syncThemeLabel(); applyRoute();
})();
