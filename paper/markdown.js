/* Manuscript Markdown renderer; equations use native MathML in math.js. */
function htmlEsc(value){
  return String(value||'').replace(/[&<>"']/g,ch=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[ch]));
}

function attrEsc(value){
  return htmlEsc(value);
}

function markdownHeadingSlug(text){
  return String(text||'')
    .replace(/\s+\{#[\w:.-]+(?:\s+\.[\w-]+)*\}\s*$/, '')
    .replace(/`([^`]*)`/g,'$1')
    .replace(/\$([^$]*)\$/g,'$1')
    .replace(/\\\(([\s\S]*?)\\\)/g,'$1')
    .replace(/\\\[([\s\S]*?)\\\]/g,'$1')
    .replace(/\[([^\]]+)]\([^)]+\)/g,'$1')
    .replace(/<[^>]*>/g,'')
    .replace(/\\([a-zA-Z]+)/g,'$1')
    .replace(/[=]/g,' ')
    .replace(/[{}()[\].,;:'"!?+*/<>|~`^]/g,'')
    .toLowerCase()
    .replace(/[^\p{L}\p{N} _-]+/gu,' ')
    .trim()
    .replace(/\s+/g,'-')
    .replace(/-+/g,'-');
}

function markdownLeadAnchorSlug(text){
  const match=String(text||'').trim().match(/^(?:[-*+]\s+|\d+[.)]\s+)?\*\*(.+?)\.?\*\*/);
  if(!match) return '';
  return markdownHeadingSlug(match[1].replace(/[.:]\s*$/,''));
}

function uniqueMarkdownSlug(base,counts){
  if(!base) return '';
  const count=counts[base]||0;
  counts[base]=count+1;
  return count?`${base}-${count}`:base;
}

/* Zero-dependency Markdown -> HTML renderer */
function renderMarkdown(src, options = {}){
  // Normalize line endings
  src = src.replace(/\r\n/g,'\n').replace(/\r/g,'\n');
  const headingCounts = options.headingCounts || Object.create(null);
  const sourceTokens = new Map();
  function sourceText(text){
    const restored = text.replace(/\x00(?:MI|MB|IC)\d+\x00/g, token => sourceTokens.get(token) ?? token);
    return options.sourceText ? options.sourceText(restored) : restored;
  }
  function anchorFor(text, heading = false){
    text = sourceText(text);
    const explicit = heading && text.match(/\s+\{#([\w:.-]+)(?:\s+\.[\w-]+)*\}\s*$/);
    if(explicit) text = text.slice(0, explicit.index);
    const label = heading ? text : text.trim().match(/^(?:[-*+]\s+|\d+[.)]\s+)?\*\*(.+?)\.?\*\*/)?.[1];
    const slug = uniqueMarkdownSlug(explicit ? explicit[1] : heading ? markdownHeadingSlug(text) : markdownLeadAnchorSlug(text), headingCounts);
    if(slug && options.onAnchor) options.onAnchor({ id: slug, label });
    return slug;
  }

  // Collect footnote definitions [^id]: text
  const footnotes = {};
  src = src.replace(/^\[\^(\w+)\]:\s*(.+)$/gm, (_,id,txt)=>{ footnotes[id]=txt; return ''; });

  // Extract fenced code blocks first to protect them
  const codeBlocks = [];
  const sourceLines = src.split('\n');
  const protectedLines = [];
  for(let i=0;i<sourceLines.length;i++){
    const opening = sourceLines[i].match(/^ {0,3}(`{3,}|~{3,})([^\n]*)$/);
    if(!opening || (opening[1][0]==='`' && opening[2].includes('`'))){ protectedLines.push(sourceLines[i]); continue; }
    const code = [];
    while(++i<sourceLines.length){
      const closing = sourceLines[i].match(/^ {0,3}([`~]+)[ \t]*$/);
      if(closing && [...closing[1]].every(ch=>ch===opening[1][0]) && closing[1].length>=opening[1].length) break;
      code.push(sourceLines[i]);
    }
    const lang = opening[2].trim().split(/\s+/)[0];
    // Pandoc raw-LaTeX blocks control the PDF layout, not browser content.
    if(lang === '{=latex}') continue;
    codeBlocks.push({ lang, code });
    protectedLines.push('\n\x00CB'+(codeBlocks.length-1)+'\x00\n');
  }
  src = protectedLines.join('\n');

  // Protect inline code before math/markdown parsing, matching the CommonMark pipeline.
  const inlineCode = [];
  src = src.replace(/`([^`\n]+)`/g, (_,code)=>{
    inlineCode.push('<code>'+escHtml(code)+'</code>');
    const token = '\x00IC'+(inlineCode.length-1)+'\x00';
    sourceTokens.set(token, _);
    return token;
  });

  src = src.replace(/<!--[\s\S]*?-->/g, '');
  // Source editors may wrap a link label or place its destination on the next
  // line. Keep it intact before paragraph lines are rendered independently.
  src = src.replace(/(!?\[((?:[^\]\n]|\n(?![ \t]*\n))*)\])\([ \t\n]*([^\s)]+)[ \t\n]*\)/g,
    (_,label,text,url)=>label.replace(/\n[ \t]*/g, ' ') + '(' + url + ')');

  // Extract display math $$...$$ (can span multiple lines)
  const mathBlocks = [];
  src = src.replace(/(?<!\\)\$\$([\s\S]*?)(?<!\\)\$\$/g, (_,tex)=>{
    mathBlocks.push(renderLatex(tex.trim(), true));
    return '\x00MB'+(mathBlocks.length-1)+'\x00';
  });
  src = src.replace(/\\\[([\s\S]*?)\\\]/g, (_,tex)=>{
    mathBlocks.push(renderLatex(tex.trim(), true));
    return '\x00MB'+(mathBlocks.length-1)+'\x00';
  });
  const displayEnv = '(?:aligned|alignedat|align\\*?|alignat\\*?|gather\\*?|multline\\*?|flalign\\*?|split|cases|array|matrix|pmatrix|bmatrix|Bmatrix|vmatrix|Vmatrix|smallmatrix|equation\\*?|displaymath)';
  src = src.replace(new RegExp('(^|\\n)[ \\t]*\\\\begin\\{(' + displayEnv + ')\\}([\\s\\S]*?)\\\\end\\{\\2\\}', 'g'), (_,prefix,env,body)=>{
    mathBlocks.push(renderLatex('\\begin{' + env + '}' + body + '\\end{' + env + '}', true));
    return prefix + '\x00MB'+(mathBlocks.length-1)+'\x00';
  });

  // Inline math may wrap within a paragraph. Never cross a blank line or a
  // protected code/display token; escaped dollars and currency stay literal.
  const mathInline = [];
  src = src.replace(/(?<!\\)\$(?!\s)((?:\\[^\n\x00]|[^$\\\n\x00]|\n(?![ \t]*\n))+?)(?<!\s)\$(?!\d)/g, (_,tex)=>{
    mathInline.push(renderLatex(tex.trim(), false));
    const token = '\x00MI'+(mathInline.length-1)+'\x00';
    sourceTokens.set(token, _);
    return token;
  });
  src = src.replace(/\\\(((?:[^\n\x00]|\n(?![ \t]*\n))*?)\\\)/g, (_,tex)=>{
    mathInline.push(renderLatex(tex.trim(), false));
    const token = '\x00MI'+(mathInline.length-1)+'\x00';
    sourceTokens.set(token, _);
    return token;
  });

  // Preserve manuscript labels as browser destinations and replace PDF page
  // references with section links. Code and equations are already protected.
  const labelNames = new Map();
  let currentHeading = '';
  for(const line of src.split('\n')){
    const heading = line.match(/^#{1,6}\s+(.+)$/);
    if(heading) currentHeading = sourceText(heading[1]).replace(/\s+\{#[\w:.-]+(?:\s+\.[\w-]+)*\}\s*$/, '');
    for(const [,id] of line.matchAll(/\\label\{([\w:.-]+)\}/g)){
      const number = currentHeading.match(/^(?:Appendix\s+)?([A-Z](?:\.\d+)*|\d+(?:\.\d+)*)\b/);
      labelNames.set(id, number ? '§ ' + number[1] : 'section');
    }
  }
  const labelTokens = [];
  src = src.replace(/(?:\bpp?\.\s*)?\\pageref\{([\w:.-]+)\}/g, (_,id)=>
    '[' + (labelNames.get(id) || 'section') + '](#' + id + ')');
  src = src.replace(/\\label\{([\w:.-]+)\}/g, (_,id)=>{
    labelTokens.push('<span id="' + escHtml(id) + '"></span>');
    return '\x00LB' + (labelTokens.length-1) + '\x00';
  });
  src = src.replace(/\[\]\{#([\w:.-]+)\}/g, (_,id)=>{
    labelTokens.push('<span id="' + escHtml(id) + '"></span>');
    return '\x00LB' + (labelTokens.length-1) + '\x00';
  });
  // Ignore the PDF's spacing and font declarations while retaining all prose.
  src = src.replace(/^[ \t]*\\(?:Needspace\{\d+\\baselineskip\}|begingroup(?:\\(?:raggedright|small))?|par\\endgroup|endgroup|useOriginalUrlSetting|def\\UrlFont\{\\ttfamily\\addfontfeatures\{Scale=1\}\\fontsize\{\d+\}\{\d+\}\\selectfont\}|linespread\{[\d.]+\}\\selectfont|interlinepenalty=\d+)[ \t]*$/gm, '');

  // ATX headings interrupt paragraphs even without surrounding blank lines.
  src = src.replace(/^ {0,3}#{1,6}\s+[^\n]+$/gm, line => '\n\n' + line + '\n\n');
  // Split into blocks by blank lines
  const blocks = src.split(/\n{2,}/);
  let out = '';

  for(let i=0;i<blocks.length;i++){
    let b = blocks[i].trim();
    if(!b) continue;

    // Restore code blocks
    if(/^\x00CB\d+\x00$/.test(b)){ out += b.replace(/\x00CB(\d+)\x00/,(_,n)=>renderCode(codeBlocks[+n])); continue; }

    // Restore display math blocks (standalone)
    if(/^\x00MB\d+\x00$/.test(b)){ out += b; continue; }
    if(/^\x00LB\d+\x00$/.test(b)){ out += b; continue; }

    // Horizontal rule
    if(/^[-*_]{3,}\s*$/.test(b)){ out += '<hr>'; continue; }

    // Headings
    const hm = b.match(/^(#{1,6})\s+(.*)$/);
    if(hm){
      const lv=hm[1].length;
      const slug=anchorFor(hm[2].trim(), true);
      const headingText=hm[2].trim().replace(/\s+\{#[\w:.-]+(?:\s+\.[\w-]+)*\}\s*$/, '');
      out += `<h${lv}${slug?` id="${escHtml(slug)}"`:''}>${inline(headingText)}</h${lv}>`;
      continue;
    }

    // Table: detect lines with pipes
    const tlines = b.split('\n');
    if(tlines.length>=2 && tlines[0].includes('|') && /^[\s|:-]+$/.test(tlines[1])){
      const end = tlines.findIndex((line, index) => index > 1 && (!line.includes('|') || /^\*\*/.test(line)));
      out += parseTable(end < 0 ? tlines : tlines.slice(0, end));
      if(end >= 0) blocks.splice(i + 1, 0, tlines.slice(end).join('\n'));
      continue;
    }

    // Blockquote
    if(b.startsWith('>')){
      const bqLines = b.split('\n').map(l=>l.replace(/^>\s?/,''));
      out += '<blockquote>'+renderMarkdown(bqLines.join('\n'), { ...options, headingCounts, sourceText })+'</blockquote>'; continue;
    }

    // Lists (ordered & unordered, with nesting)
    if(/^[\s]*[-*+]\s/.test(tlines[0]) || /^[\s]*\d+[.)]\s/.test(tlines[0])){
      out += parseList(tlines); continue;
    }

    // Mixed prose + standalone display math in the same markdown block.
    if(tlines.some(l=>/^\x00MB\d+\x00$/.test(l.trim()))){
      out += parseMixedBlock(tlines); continue;
    }

    // Default: paragraph (split lines before inline to avoid escaping <br>)
    const leadSlug=anchorFor(b);
    out += `<p${leadSlug?` id="${escHtml(leadSlug)}"`:''}>`+b.split('\n').map((line, i)=>i ? anchoredLine(line) : inline(line)).join('<br>')+'</p>';
  }

  out = out.replace(/<\/(ol|ul)><\1>/g,'');

  // Restore footnotes as a section
  const fnUsed = out.match(/\x00FN(\w+)\x00/g);
  if(fnUsed){
    let fnHtml='<hr><ol style="font-size:13px;color:var(--text3);padding-left:20px">';
    const seen=new Set();
    fnUsed.forEach(m=>{
      const id=m.replace(/\x00FN|\x00/g,'');
      if(seen.has(id)) return; seen.add(id);
      fnHtml+=`<li id="fn-${id}">${inline(footnotes[id]||id)} <a href="#fnref-${id}" style="color:var(--accent)">↩</a></li>`;
    });
    fnHtml+='</ol>';
    out = out.replace(/\x00FN(\w+)\x00/g,(_,id)=>`<sup><a href="#fn-${id}" id="fnref-${id}" style="color:var(--accent)">[${id}]</a></sup>`);
    out += fnHtml;
  }

  // Restore math and inline code
  // A recursive blockquote may still contain tokens owned by its parent.
  out = out.replace(/\x00CB(\d+)\x00/g,(token,n)=>codeBlocks[+n] ? renderCode(codeBlocks[+n]) : token);
  out = out.replace(/\x00MB(\d+)\x00/g,(token,n)=>mathBlocks[+n] ?? token);
  out = out.replace(/\x00MI(\d+)\x00/g,(token,n)=>mathInline[+n] ?? token);
  out = out.replace(/\x00IC(\d+)\x00/g,(token,n)=>inlineCode[+n] ?? token);
  out = out.replace(/\x00LB(\d+)\x00/g,(token,n)=>labelTokens[+n] ?? token);

  return out;

  /* ── helpers ── */

  function renderCode(block){
    const code = block.code.map(line => {
      const comment = line.match(/^#\s+(.+)$/);
      const slug = comment ? anchorFor(comment[1], true) : '';
      return slug ? '<span id="'+escHtml(slug)+'">'+escHtml(line)+'</span>' : escHtml(line);
    }).join('\n');
    return '<pre><code'+(block.lang?' class="language-'+escHtml(block.lang)+'"':'')+'>'+code+'</code></pre>';
  }

  function anchoredLine(line){
    const slug = anchorFor(line);
    return (slug ? '<span id="'+escHtml(slug)+'">'+inline(line)+'</span>' : inline(line));
  }

  function escHtml(s){
    return s.replace(/&/g,'&amp;').replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/"/g,'&quot;');
  }

  function inline(s){
    // Sanitize raw text before markdown transforms to prevent XSS from fetched content
    s = escHtml(s);
    s = s.replace(/\\\$/g, '&#36;');
    // Protect generated tags: underscores in manuscript paths are not emphasis.
    const tags = [];
    function protect(html){ tags.push(html); return '\x00HT'+(tags.length-1)+'\x00'; }
    function safeURL(url){
      const normalized = url.replace(/[\u0000-\u0020]/g,'');
      return !/^[a-z][a-z\d+.-]*:/i.test(normalized) || /^(https?|mailto):/i.test(normalized);
    }
    // Images ![alt](url)
    s = s.replace(/!\[([^\]]*)\]\(([^)]+)\)/g,(_, alt, url)=>safeURL(url)?protect('<img src="'+url+'" alt="'+alt+'">'):alt);
    // Links [text](url)
    s = s.replace(/\[([^\]]+)\]\(([^)]+)\)/g,(_, text, url)=>safeURL(url)?protect('<a href="'+url+'" target="_blank" rel="noopener">'+text+'</a>'):text);
    // Footnote refs [^id]
    s = s.replace(/\[\^(\w+)\]/g,'\x00FN$1\x00');
    // Bold+italic
    s = s.replace(/\*\*\*(.+?)\*\*\*/g,'<strong><em>$1</em></strong>');
    // Bold
    s = s.replace(/\*\*(.+?)\*\*/g,'<strong>$1</strong>');
    s = s.replace(/__(.+?)__/g,'<strong>$1</strong>');
    // Italic
    s = s.replace(/\*(.+?)\*/g,'<em>$1</em>');
    s = s.replace(/_(.+?)_/g,'<em>$1</em>');
    // Strikethrough
    s = s.replace(/~~(.+?)~~/g,'<del>$1</del>');
    // Task list checkboxes
    s = s.replace(/\[x\]/gi,'<span class="task-check checked"></span>');
    s = s.replace(/\[ \]/g,'<span class="task-check"></span>');
    // Superscript (e.g. x^2)
    s = s.replace(/\^(\w+)/g,'<sup>$1</sup>');
    return s.replace(/\x00HT(\d+)\x00/g,(_,n)=>tags[+n]);
  }

  function parseTable(lines){
    const hdr = splitRow(lines[0]);
    const labels = hdr.map(c=>tableLabel(c));
    // lines[1] is the separator — parse alignment
    const aligns = splitRow(lines[1]).map(c=>{
      c=c.trim();
      if(c.startsWith(':')&&c.endsWith(':')) return 'center';
      if(c.endsWith(':')) return 'right';
      return 'left';
    });
    let h='<table class="md-table"><thead><tr>';
    hdr.forEach((c,i)=>{ h+=`<th style="text-align:${aligns[i]||'left'}">${inline(c.trim())}</th>`; });
    h+='</tr></thead><tbody>';
    for(let r=2;r<lines.length;r++){
      const cells=splitRow(lines[r]);
      h+='<tr>';
      cells.forEach((c,i)=>{ h+=`<td data-label="${escHtml(labels[i]||'')}" style="text-align:${aligns[i]||'left'}">${inline(c.trim())}</td>`; });
      h+='</tr>';
    }
    h+='</tbody></table>';
    return h;
  }

  function tableLabel(s){
    return s
      .replace(/\x00(?:MI|MB|IC|CB)\d+\x00/g,'')
      .replace(/!\[([^\]]*)\]\([^)]+\)/g,'$1')
      .replace(/\[([^\]]+)\]\([^)]+\)/g,'$1')
      .replace(/[`*_~$]/g,'')
      .replace(/\\[a-zA-Z]+/g,'')
      .replace(/[{}]/g,'')
      .trim();
  }

  function splitRow(line){
    return line.replace(/^\|/,'').replace(/\|$/,'').split('|');
  }

  function parseMixedBlock(lines){
    let h = '';
    let para = [];
    function flushPara(){
      if(!para.length) return;
      const slug = anchorFor(para.join('\n'));
      h += '<p'+(slug?' id="'+escHtml(slug)+'"':'')+'>' + para.map((line, i)=>i ? anchoredLine(line) : inline(line)).join('<br>') + '</p>';
      para = [];
    }
    lines.forEach(line=>{
      const trimmed = line.trim();
      if(/^\x00MB\d+\x00$/.test(trimmed)){
        flushPara();
        h += trimmed;
      } else {
        para.push(line);
      }
    });
    flushPara();
    return h;
  }

  function parseList(lines){
    // Determine top-level type
    const isOrdered = /^\s*\d+[.)]\s/.test(lines[0]);
    const tag = isOrdered ? 'ol' : 'ul';
    let html = `<${tag}>`;
    let i = 0;

    while(i < lines.length){
      const line = lines[i];
      const match = line.match(/^(\s*)([-*+]|\d+[.)])\s+(.*)/);
      if(!match){ i++; continue; }

      const indent = match[1].length;
      const content = match[3];
      // Collect continuations in the same list item, plus any deeper nested list.
      const contLines = [];
      const subLines = [];
      let j = i+1;
      while(j < lines.length){
        const sub = lines[j];
        const trimmed = sub.trim();
        if(!trimmed) break;

        const sm = sub.match(/^(\s*)([-*+]|\d+[.)])\s/);
        if(sm && sm[1].length > indent){
          subLines.push(sub.replace(new RegExp('^\\s{0,'+(indent+2)+'}'),''));
          j++;
          continue;
        }
        if(sm) break;

        // Display math and ordinary continuation lines may be unindented after
        // a list item once block math has been replaced by placeholders.
        contLines.push(trimmed);
        j++;
      }

      const slug = anchorFor(content);
      html += '<li'+(slug?' id="'+escHtml(slug)+'"':'')+'>' + inline(content);
      if(contLines.length){
        html += contLines.map(l=>'<div class="li-cont">'+anchoredLine(l)+'</div>').join('');
      }
      if(subLines.length){
        html += parseList(subLines);
      }
      html += '</li>';
      i = j;
    }

    html += `</${tag}>`;
    return html;
  }
}
