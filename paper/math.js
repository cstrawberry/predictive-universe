/* Dependency-free TeX subset for this manuscript, rendered by native MathML.
 * Symbols live in math-symbols.js. No font downloads, canvas, or HTML imitations.
 */
function renderLatex(source, display) {
  'use strict';
  const original = source;
  const symbols = PU_MATH_SYMBOLS;
  const escape = value => String(value).replace(/[&<>"']/g, ch => ({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[ch]));
  const row = content => '<mrow>' + content + '</mrow>';
  const node = (xml, limits = false, alwaysLimits = false) => ({ xml, limits, alwaysLimits });
  const operator = (text, attributes = '') => '<mo' + attributes + (!attributes.includes('stretchy=') && /^[()[\]{}|‖⟨⟩⌊⌋⌈⌉]$/.test(text) ? ' stretchy="false"' : '') + '>' + escape(text) + '</mo>';
  const identifier = text => '<mi>' + escape(text) + '</mi>';
  let tex = source, pos = 0, equationNumber = '', displayStyle = display;
  const tailNumber = display && tex.match(/(?:\\quad\s*)?\\(?:text|mbox)\s*\{\s*\(([A-Z0-9][^)]*)\)\s*\}\s*$/);
  if (tailNumber) { equationNumber = tailNumber[1]; tex = tex.slice(0, tailNumber.index); }
  // Only a numeric manuscript reference may be inferred as a bare label.
  // A trailing tuple such as \\quad (R_\\lambda, q_\\lambda) is still mathematics.
  const bareNumber = display && !equationNumber && tex.match(/\\quad\s*\(((?:[A-Z]+\.)?\d+[A-Za-z0-9.'-]*)\)\s*$/);
  if (bareNumber) { equationNumber = bareNumber[1]; tex = tex.slice(0, bareNumber.index); }
  function spaces() { while (/\s/.test(tex[pos] || '') && pos < tex.length) pos++; }
  function commandName() {
    pos++;
    const start = pos;
    while (/[A-Za-z]/.test(tex[pos] || '') && pos < tex.length) pos++;
    return pos === start ? tex[pos++] || '' : tex.slice(start, pos);
  }
  function startsCommand(name) { return tex.slice(pos).match(/^\\([A-Za-z]+|.)/)?.[1] === name; }
  function rawGroup(open = '{', close = '}') {
    spaces();
    if (tex[pos] !== open) return tex[pos++] || '';
    pos++;
    let value = '', depth = 1;
    while (pos < tex.length && depth) {
      const ch = tex[pos++];
      if (ch === '\\' && pos < tex.length) { value += ch + tex[pos++]; continue; }
      if (ch === open) depth++;
      if (ch === close) depth--;
      if (depth) value += ch;
    }
    return value;
  }
  function argument() {
    spaces();
    if (tex[pos] === '{') { pos++; const content = sequence(() => tex[pos] === '}'); if (tex[pos] === '}') pos++; return row(content); }
    return atom(true).xml;
  }
  function optional() {
    spaces();
    if (tex[pos] !== '[') return '';
    pos++; const content = sequence(() => tex[pos] === ']'); if (tex[pos] === ']') pos++;
    return row(content);
  }
  function scripts(base) {
    let lower = '', upper = '';
    while (pos < tex.length) {
      spaces();
      if (startsCommand('limits')) { commandName(); base.limits = true; base.alwaysLimits = true; continue; }
      if (startsCommand('nolimits')) { commandName(); base.limits = false; base.alwaysLimits = false; continue; }
      if (tex[pos] === '_') { pos++; lower += argument(); }
      else if (tex[pos] === '^') { pos++; upper += argument(); }
      else if (tex[pos] === "'") { pos++; upper += operator('′'); }
      else break;
    }
    if (!lower && !upper) return base.xml;
    const under = base.alwaysLimits || (base.limits && displayStyle);
    const tag = lower && upper ? (under ? 'munderover' : 'msubsup') : lower ? (under ? 'munder' : 'msub') : (under ? 'mover' : 'msup');
    return '<' + tag + '>' + base.xml + (lower ? row(lower) : '') + (upper ? row(upper) : '') + '</' + tag + '>';
  }
  function sequence(stop = () => false) {
    let content = '';
    while (pos < tex.length) {
      spaces();
      if (pos >= tex.length || stop()) break;
      const before = pos;
      content += scripts(atom());
      if (pos === before) pos++; // Malformed input cannot trap the reader.
    }
    return content;
  }
  function delimiter() {
    spaces();
    if (tex[pos] !== '\\') return tex[pos++] || '';
    const name = commandName();
    return ({'{':'{','}':'}','|':'‖',lbrace:'{',rbrace:'}',lbrack:'[',rbrack:']'})[name] || symbols.syms[name] || name;
  }
  function fence(value, size = '') {
    return value === '.' ? '' : operator(value, ' fence="true" stretchy="true"' + (size ? ' minsize="' + size + '" maxsize="' + size + '"' : ''));
  }
  function textValue(value) {
    return value.replace(/\\,/g, '\u2009').replace(/\\([{}_#$%& ])/g, '$1').replace(/\\(?:text|mathrm|textrm)\{([^{}]*)\}/g, '$1').replace(/~/g, '\u00a0').replace(/^\s+/, '\u00a0').replace(/\s+$/, '\u00a0');
  }
  function textMarkup(value, name) {
    let cursor = 0;
    function styleFor(command, inherited) {
      const style = { ...inherited };
      if (command === 'textit' || command === 'emph') style['font-style'] = 'italic';
      if (command === 'textbf') style['font-weight'] = 'bold';
      if (command === 'texttt') style['font-family'] = 'monospace';
      if (['textnormal', 'textrm', 'mathrm'].includes(command)) {
        style['font-style'] = 'normal'; style['font-weight'] = 'normal';
      }
      return style;
    }
    function inlineMath(value) {
      const saved = { tex, pos, equationNumber, displayStyle };
      try {
        tex = value; pos = 0; equationNumber = ''; displayStyle = false;
        return row(sequence());
      } finally {
        ({ tex, pos, equationNumber, displayStyle } = saved);
      }
    }
    function segment(style, grouped = false) {
      let xml = '', plain = '';
      function flush() {
        if (!plain) return;
        const css = Object.entries(style).map(([key, value]) => key + ':' + value).join(';');
        xml += '<mtext' + (css ? ' style="' + css + '"' : '') + '>' + escape(textValue(plain)) + '</mtext>';
        plain = '';
      }
      while (cursor < value.length) {
        if (grouped && value[cursor] === '}') { cursor++; break; }
        const rest = value.slice(cursor);
        const nested = rest.match(/^\\(text|mbox|textnormal|textrm|textit|textbf|texttt|hbox|emph|mathrm)\s*\{/);
        if (nested) {
          flush(); cursor += nested[0].length;
          xml += segment(styleFor(nested[1], style), true);
          continue;
        }
        const math = rest.match(/^\$((?:\\.|[^$\\])+)\$/) || rest.match(/^\\\(([\s\S]*?)\\\)/);
        if (math) { flush(); cursor += math[0].length; xml += inlineMath(math[1]); continue; }
        if (value[cursor] === '{') { flush(); cursor++; xml += segment(style, true); continue; }
        if (/^\\[{}_#$%& ]/.test(rest)) { plain += rest.slice(0, 2); cursor += 2; continue; }
        plain += value[cursor++];
      }
      flush();
      return xml;
    }
    return row(segment(styleFor(name, {})));
  }
  function variant(xml, kind) {
    // MathML Core relies on Unicode for mathematical alphabets beyond normal.
    const ranges = {bold:[0x1d400,0x1d41a,0x1d7ce],italic:[0x1d434,0x1d44e],script:[0x1d49c,0x1d4b6],fraktur:[0x1d504,0x1d51e],double:[0x1d538,0x1d552,0x1d7d8],sans:[0x1d5a0,0x1d5ba,0x1d7e2],mono:[0x1d670,0x1d68a,0x1d7f6]};
    const holes = {italic:{h:'ℎ'},script:{B:'ℬ',E:'ℰ',F:'ℱ',H:'ℋ',I:'ℐ',L:'ℒ',M:'ℳ',R:'ℛ',e:'ℯ',g:'ℊ',o:'ℴ'},fraktur:{C:'ℭ',H:'ℌ',I:'ℑ',R:'ℜ',Z:'ℨ'},double:{C:'ℂ',H:'ℍ',N:'ℕ',P:'ℙ',Q:'ℚ',R:'ℝ',Z:'ℤ'}};
    return xml.replace(/<(mi|mn)(?: mathvariant="[^"]*")?>([^<]*)<\/\1>/g, (_, tag, value) => {
      if (kind === 'normal') return '<' + tag + ' mathvariant="normal">' + value + '</' + tag + '>';
      const range = ranges[kind];
      const mapped = [...value].map(ch => {
        if (holes[kind]?.[ch]) return holes[kind][ch];
        if (range && /[A-Z]/.test(ch)) return String.fromCodePoint(range[0] + ch.charCodeAt(0) - 65);
        if (range && /[a-z]/.test(ch)) return String.fromCodePoint(range[1] + ch.charCodeAt(0) - 97);
        if (range?.[2] && /[0-9]/.test(ch)) return String.fromCodePoint(range[2] + Number(ch));
        if (kind === 'bold') {
          const upper = 'ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡϴΣΤΥΦΧΨΩ'.indexOf(ch);
          const lower = 'αβγδεζηθικλμνξοπρςστυφχψω'.indexOf(ch);
          if (upper >= 0) return String.fromCodePoint(0x1d6a8 + upper);
          if (lower >= 0) return String.fromCodePoint(0x1d6c2 + lower);
          const alternate = '∂ϵϑϰϕϱϖ'.indexOf(ch);
          if (alternate >= 0) return String.fromCodePoint(0x1d6db + alternate);
        }
        return ch;
      }).join('');
      return '<' + tag + (kind === 'bold' ? ' mathvariant="bold"' : '') + '>' + mapped + '</' + tag + '>';
    });
  }
  function environment(name) {
    let alignment = '';
    if (name === 'array') alignment = rawGroup().replace(/[^lcr]/g, '').split('').map(x => ({l:'left',c:'center',r:'right'})[x]).join(' ');
    if (/alignedat|alignat/.test(name)) rawGroup();
    const rows = []; let cells = [];
    while (pos < tex.length) {
      spaces();
      if (startsCommand('end')) { commandName(); rawGroup(); break; }
      cells.push(sequence(() => tex[pos] === '&' || startsCommand('\\') || startsCommand('end')));
      if (tex[pos] === '&') { pos++; continue; }
      if (startsCommand('\\')) { commandName(); optional(); rows.push(cells); cells = []; continue; }
      if (startsCommand('end')) { commandName(); rawGroup(); break; }
    }
    if (cells.some(Boolean)) rows.push(cells);
    const count = Math.max(1, ...rows.map(r => r.length));
    if (!alignment) alignment = /align|split/.test(name) ? Array.from({length:count}, (_, i) => i % 2 ? 'left' : 'right').join(' ') : name === 'cases' ? 'left left' : 'center';
    let xml = '<mtable columnalign="' + alignment + '" columnspacing="0.6em" rowspacing="0.35em">' + rows.map(r => '<mtr>' + r.map(c => '<mtd>' + row(c) + '</mtd>').join('') + '</mtr>').join('') + '</mtable>';
    const brackets = {pmatrix:['(',')'],psmallmatrix:['(',')'],bmatrix:['[',']'],Bmatrix:['{','}'],vmatrix:['|','|'],Vmatrix:['‖','‖'],cases:['{','.']}[name];
    if (/smallmatrix/.test(name)) xml = '<mstyle scriptlevel="1">' + xml + '</mstyle>';
    if (brackets) xml = row(fence(brackets[0]) + xml + fence(brackets[1]));
    return node(xml);
  }
  function command() {
    const name = commandName();
    if (/^\s$/.test(name)) return node('<mspace width="0.333em"/>');
    const spacing = {',':'0.167em',':':'0.222em',';':'0.278em','!':'-0.167em',' ':'0.333em',quad:'1em',qquad:'2em',enspace:'0.5em',space:'0.333em'};
    if (Object.hasOwn(spacing, name)) return node('<mspace width="' + spacing[name] + '"/>');
    if (['{','}','|','%','$','#','&','_'].includes(name)) return node(operator(name === '|' ? '‖' : name));
    if (name === '\\') return node('<mspace width="1em"/>');
    if (Object.hasOwn(symbols.greek, name)) return node(identifier(symbols.greek[name]));
    if (Object.hasOwn(symbols.bigOps, name)) return node(operator(symbols.bigOps[name], ' largeop="true" movablelimits="true"'), !/int/.test(name));
    if (Object.hasOwn(symbols.syms, name)) {
      const value = symbols.syms[name];
      return node(/^(?:ell|hbar|aleph|imath|jmath|wp)$/.test(name) ? identifier(value) : operator(value));
    }
    if (symbols.named.includes(name) || name === 'varprojlim') return node('<mo form="prefix" lspace="0.15em" rspace="0.15em">' + escape(name) + '</mo>', /^(lim|limsup|liminf|min|max|sup|inf|varinjlim|varprojlim)$/.test(name));
    if (name === 'operatorname') {
      const limits = tex[pos] === '*'; if (limits) pos++;
      return node('<mo form="prefix" lspace="0.15em" rspace="0.15em">' + escape(textValue(rawGroup())) + '</mo>', limits);
    }
    if (['frac','dfrac','tfrac','cfrac','binom'].includes(name)) {
      const top = argument(), bottom = argument();
      let xml = '<mfrac' + (name === 'binom' ? ' linethickness="0"' : '') + '>' + top + bottom + '</mfrac>';
      if (name === 'binom') xml = row(fence('(') + xml + fence(')'));
      if (name === 'dfrac' || name === 'tfrac') xml = '<mstyle displaystyle="' + (name === 'dfrac') + '">' + xml + '</mstyle>';
      return node(xml);
    }
    if (name === 'sqrt') { const index = optional(), value = argument(); return node(index ? '<mroot>' + value + index + '</mroot>' : '<msqrt>' + value + '</msqrt>'); }
    const variants = {mathcal:'script',mathscr:'script',mathfrak:'fraktur',mathbb:'double',mathrm:'normal',mathbf:'bold',boldsymbol:'bold',mathit:'italic',mathsf:'sans',textsf:'sans',mathnormal:'italic'};
    if (variants[name]) return node(variant(argument(), variants[name]));
    if (name === 'rm' || name === 'sf') return node(variant(row(sequence(() => tex[pos] === '}')), name === 'rm' ? 'normal' : 'sans'));
    if (['text','mbox','textnormal','textrm','textit','textbf','texttt','hbox','emph'].includes(name)) {
      return node(textMarkup(rawGroup(), name));
    }
    const accent = {hat:'^',widehat:'^',bar:'¯',overline:'¯',tilde:'~',widetilde:'~',dot:'˙',ddot:'¨',vec:'→',overrightarrow:'→',overleftarrow:'←',check:'ˇ',underline:'_',underbrace:'⏟',overbrace:'⏞'}[name];
    if (accent) {
      const under = name === 'underline' || name === 'underbrace', tag = under ? 'munder' : 'mover';
      const xml = '<' + tag + (under ? ' accentunder="true"' : ' accent="true"') + '>' + argument() + operator(accent, ' stretchy="true"') + '</' + tag + '>';
      return node(xml, /brace/.test(name), /brace/.test(name));
    }
    if (name === 'left') {
      const left = delimiter();
      const content = sequence(() => startsCommand('right'));
      let right = '.'; if (startsCommand('right')) { commandName(); right = delimiter(); }
      return node(row(fence(left) + content + fence(right)));
    }
    if (name === 'middle' || name === 'right') return node(fence(delimiter()));
    if (/^(big|Big|bigg|Bigg)[lr]?$/.test(name)) {
      const size = {big:'1.2em',Big:'1.6em',bigg:'2em',Bigg:'2.4em'}[name.replace(/[lr]$/, '')];
      return node(fence(delimiter(), size));
    }
    if (name === 'begin') return environment(rawGroup());
    if (name === 'end') { rawGroup(); return node(row('')); }
    if (/^x(?:rightarrow|leftarrow|leftrightarrow|Leftrightarrow|Rightarrow|Leftarrow|Longrightarrow)$/.test(name)) {
      const lower = optional(), upper = argument();
      const arrow = {xrightarrow:'⟶',xleftarrow:'⟵',xleftrightarrow:'⟷',xLeftrightarrow:'⟺',xRightarrow:'⟹',xLeftarrow:'⟸',xLongrightarrow:'⟹'}[name];
      const base = operator(arrow, ' stretchy="true" minsize="2em"');
      return node(lower ? '<munderover>' + base + lower + upper + '</munderover>' : '<mover>' + base + upper + '</mover>');
    }
    if (name === 'overset' || name === 'stackrel' || name === 'underset') {
      const label = argument(), base = argument(), tag = name === 'underset' ? 'munder' : 'mover';
      return node('<' + tag + '>' + base + label + '</' + tag + '>');
    }
    if (name === 'substack') { spaces(); if (tex[pos] === '{') pos++; const lines = []; while (pos < tex.length && tex[pos] !== '}') { lines.push(sequence(() => startsCommand('\\') || tex[pos] === '}')); if (startsCommand('\\')) commandName(); } if (tex[pos] === '}') pos++; return node('<mtable rowspacing="0.1em">' + lines.map(line => '<mtr><mtd>' + row(line) + '</mtd></mtr>').join('') + '</mtable>'); }
    if (name === 'pmod') return node(row(operator('(') + '<mo>mod</mo><mspace width="0.333em"/>' + argument() + operator(')')));
    if (name === 'bmod') return node(operator('mod'));
    if (name === 'tag') { equationNumber = textValue(rawGroup()); return node(row('')); }
    if (name === 'label') { rawGroup(); return node(row('')); }
    if (['nonumber','notag','hline'].includes(name)) return node(row(''));
    if (['displaystyle','textstyle','scriptstyle','scriptscriptstyle'].includes(name)) {
      if (name === 'displaystyle') displayStyle = true;
      return node('<mstyle displaystyle="' + (name === 'displaystyle') + '"' + (name.includes('script') ? ' scriptlevel="' + (name === 'scriptstyle' ? 1 : 2) + '"' : '') + '>' + row(sequence(() => tex[pos] === '}')) + '</mstyle>');
    }
    if (['phantom','hphantom','vphantom'].includes(name)) return node('<mphantom>' + argument() + '</mphantom>');
    if (name === 'boxed') return node('<mrow class="math-box">' + argument() + '</mrow>');
    if (name === 'mathop' || name === 'mathbin' || name === 'mathrel') return node(argument(), name === 'mathop');
    if (name === 'not') return node('<mrow>' + argument() + operator('\u0338', ' lspace="-0.5em" rspace="0"') + '</mrow>');
    if (name === 'hspace') { const length = rawGroup(); return node('<mspace width="' + (/^-?[\d.]+(?:em|ex|px|pt)$/.test(length) ? length : '0.333em') + '"/>'); }
    if (name === 'color') { const color = rawGroup(); return node('<mstyle' + (/^(?:[a-z]+|#[a-f\d]{3,8})$/i.test(color) ? ' mathcolor="' + color + '"' : '') + '>' + argument() + '</mstyle>'); }
    return node('<mtext data-unknown-command="' + escape(name) + '">\\' + escape(name) + '</mtext>');
  }
  function atom(single = false) {
    spaces();
    if (pos >= tex.length) return node(row(''));
    const ch = tex[pos];
    if (ch === '\\') return command();
    if (ch === '{') return node(argument());
    if (ch === '~') { pos++; return node('<mspace width="0.333em"/>'); }
    if (/\d/.test(ch)) { const number = single ? tex[pos++] : (tex.slice(pos).match(/^\d+(?:\.\d+)?/) || [ch])[0]; if (!single) pos += number.length; return node('<mn>' + number + '</mn>'); }
    pos++;
    if (/[A-Za-z\p{L}]/u.test(ch)) return node(identifier(ch));
    if (ch === '-') return node(operator('−'));
    if (ch === '_') return node('<msub>' + row('') + argument() + '</msub>');
    if (ch === '^') return node('<msup>' + row('') + argument() + '</msup>');
    return node(operator(ch));
  }
  const body = row(sequence());
  return '<span class="' + (display ? 'math-d' : 'math-i') + '"><math xmlns="http://www.w3.org/1998/Math/MathML" display="' + (display ? 'block' : 'inline') + '"><semantics>' + body + '<annotation encoding="application/x-tex">' + escape(original) + '</annotation></semantics></math>' + (equationNumber ? '<span class="math-number">(' + escape(equationNumber) + ')</span>' : '') + '</span>';
}
