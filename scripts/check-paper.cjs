/* Source integrity and regression checks for the browser reader. */
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const root = path.resolve(__dirname, '..');
const context = { window: {} };
vm.createContext(context);
vm.runInContext(fs.readFileSync(path.join(root, 'paper/manifest.js'), 'utf8'), context);
vm.runInContext(fs.readFileSync(path.join(root, 'paper/math-symbols.js'), 'utf8'), context);
vm.runInContext(fs.readFileSync(path.join(root, 'paper/math.js'), 'utf8'), context);
vm.runInContext(fs.readFileSync(path.join(root, 'paper/markdown.js'), 'utf8'), context);
const { sections, scenes } = context.window.PU_PAPER;
const ids = new Set(sections.map(section => section.id));
assert.equal(ids.size, sections.length, 'Unique section addresses');
assert.equal(scenes.length, 24);
assert.equal(sections.filter(section => section.group === 'Appendices').length, 26);
assert(!sections.some(section => section.file.startsWith('related/pure_s_universality/')),
  'The separate Pure S paper is excluded from reader chapters and full-text indexing');
const pureS = context.window.PU_PAPER.relatedPapers.find(paper => paper.id === 'related--pure_s_universality--paper');
assert(pureS && pureS.file.endsWith('.pdf'), 'Pure S has a direct PDF entry');
assert.equal(fs.readFileSync(path.join(root, 'docs/paper', pureS.file)).subarray(0, 5).toString(), '%PDF-', 'The linked PDF exists');
for (const scene of scenes) {
  assert(scene.sections.length > 0, scene.key + ' has a paper source');
  for (const id of scene.sections) assert(ids.has(id), scene.key + ' references an existing section');
}
let equations = 0;
const anchorsByFile = new Map();
for (const section of sections) {
  const source = fs.readFileSync(path.join(root, 'docs/paper', section.file), 'utf8');
  vm.runInContext(fs.readFileSync(path.join(root, 'paper/content', section.id + '.js'), 'utf8'), context);
  assert.equal(context.window.PU_PAPER_TEXT[section.id], source, section.file + ' offline copy matches');
  const html = context.renderMarkdown(source);
  assert(html.length > 0, section.file + ' rendered');
  assert(!html.includes('\x00'), section.file + ' has no unresolved parser placeholders');
  if (!source.includes('undefined')) assert(!html.includes('undefined'), section.file + ' has no undefined output');
  assert(!html.includes('data-unknown-command'), section.file + ' has no unsupported math commands');
  assert(!/<p(?:\s[^>]*)?>\s*\|/.test(html), section.file + ' has no table rows stranded as paragraphs');
  // Check what readers actually see, including text inside MathML. Counting
  // successfully parsed equations alone misses formulas left as raw Markdown.
  const visible = html.replace(/<annotation\b[\s\S]*?<\/annotation>/g, '')
    .replace(/<pre\b[\s\S]*?<\/pre>/g, '').replace(/<code\b[\s\S]*?<\/code>/g, '');
  const leakedCommand = visible.replace(/<[^>]*>/g, ' ').match(/\\(?:[A-Za-z]{2,}|[,\[\]()])/);
  assert(!leakedCommand, section.file + ' has no visible raw TeX: ' + leakedCommand?.[0]);
  assert(!/\$(?!\d)/.test(visible.replace(/<math\b[\s\S]*?<\/math>/g, '').replace(/<[^>]*>/g, '')),
    section.file + ' has no unparsed math delimiters outside equations');
  for (const [, text] of visible.matchAll(/<mtext\b[^>]*>([^<]*)<\/mtext>/g)) {
    assert(!/\$[^$]+\$/.test(text), section.file + ' renders inline math nested inside text');
  }
  for (const [, tex] of html.matchAll(/<annotation encoding="application\/x-tex">([^<]*)<\/annotation>/g)) {
    let depth = 0;
    for (let i = 0; i < tex.length; i++) {
      if (tex[i] === '\\') { i++; continue; }
      if (tex[i] === '{') depth++;
      if (tex[i] === '}') depth--;
      assert(depth >= 0, section.file + ' has no unmatched closing math groups');
    }
    assert.equal(depth, 0, section.file + ' has balanced math groups');
    const environments = [];
    for (const [, command, name] of tex.matchAll(/\\(begin|end)\{([^}]+)\}/g)) {
      if (command === 'begin') environments.push(name);
      else assert.equal(environments.pop(), name, section.file + ' has matching math environments');
    }
    assert.equal(environments.length, 0, section.file + ' closes every math environment');
  }
  if (section.file === '02_foundations.md') {
    for (const tag of ['2.4.1d.3c', '2.4.1d.3d', '2.4.1d.3e']) {
      assert(html.includes('<span class="math-number">(' + tag + ')</span>'), tag + ' is rendered as a numbered equation');
    }
  }
  const anchors = new Set([...html.matchAll(/\bid="([^"]+)"/g)].map(match => match[1]));
  anchorsByFile.set(section.file, anchors);
  assert(anchors.has(context.markdownHeadingSlug(section.title)), section.file + ' sidebar links to its title');
  equations += (html.match(/<math xmlns=/g) || []).length;
}
const contents = fs.readFileSync(path.join(root, 'docs/paper/contents.md'), 'utf8');
assert(contents.includes('](' + pureS.file + ')'), 'The table of contents opens the separate PDF');
let contentsLinks = 0;
for (const [, label, file, anchor] of contents.matchAll(/\[([^\]\n]+)\]\(([^)\n]+\.md)(?:#([^)]*))?\)/g)) {
  assert(anchor && anchorsByFile.get(file)?.has(anchor), label + ' links to a specific rendered destination');
  contentsLinks++;
}
const headingCases = context.renderMarkdown('Intro\n## Math $C^*$\n**Theorem 1 ($x^2$).** Text.\n\n| A | B |\n|---|---|\n| 1 | 2 |\n**Theorem 2.** More text.');
assert(headingCases.includes('id="math-c"') && headingCases.includes('id="theorem-1-x2"'), 'Heading IDs use source math, independent of equation order');
assert(headingCases.includes('</table><p id="theorem-2">'), 'Text immediately after a table gets its own destination');
const codeAnchor = context.renderMarkdown('```python\n# Verification 1\nassert True\n```');
assert(codeAnchor.includes('<span id="verification-1"># Verification 1</span>') && !codeAnchor.includes('<h1'), 'Code destinations preserve code formatting');
const sample = '[MPU](07_minimal_predictive_unit.md) and [Appendix](appendices/appendix_a_core_logic.md#test)';
const linked = context.renderMarkdown(sample);
assert(linked.includes('href="07_minimal_predictive_unit.md"'));
assert(linked.includes('href="appendices/appendix_a_core_logic.md#test"'));
assert(context.renderMarkdown('[cyclic-tag\nsource](formalization/Core.lean)').includes('>cyclic-tag source</a>'),
  'Source-wrapped links remain clickable');
const publication = context.renderMarkdown('## 3. Example {#section-3}\n\n\\label{guide-example}\n\n\\Needspace{8\\baselineskip}\n\nSee p. \\pageref{guide-example}.\n\n\\begingroup\\small\n\nRetained prose.\n\n\\endgroup\n\n```{=latex}\n\\vspace{1ex}\n```\n\n```tex\n\\Needspace{8\\baselineskip}\n```');
assert(publication.includes('<h2 id="section-3">3. Example</h2>') && publication.includes('id="guide-example"'),
  'Publication headings and TeX labels keep their exact browser destinations');
assert(publication.includes('href="#guide-example"') && publication.includes('§ 3') && publication.includes('Retained prose.'),
  'PDF page references become section links without dropping prose');
assert(!publication.includes('pageref') && !publication.includes('begingroup') && !publication.includes('vspace'),
  'Publication layout commands are hidden in browser output');
assert(publication.includes('<pre><code class="language-tex">\\Needspace'), 'Ordinary TeX examples remain literal code');
assert(!context.renderLatex('\\lbrack x\\rbrack', false).includes('data-unknown-command'), 'Named square brackets render');
assert(context.renderLatex('\\operatorname{arg\\,min}', false).includes('arg\u2009min</mo>'),
  'Operator names render thin spacing without leaking TeX');
const quoted = context.renderMarkdown('> A quoted equation $x^2$ and `code`.\n>\n> $$a=b$$');
assert(quoted.includes('math-i') && quoted.includes('math-d') && quoted.includes('<code>code</code>'));
assert(!quoted.includes('undefined') && !quoted.includes('\x00'));
assert(!context.renderMarkdown('[unsafe](javascript:alert) ![unsafe](data:text/html,test)').includes('href='));
assert(context.renderMarkdown('```js\nconst x = "$literal$";\n```').includes('$literal$'));
const longFence = context.renderMarkdown('~~~~javascript\nconst pattern = /$value$/;\n~~~~');
assert(longFence.includes('<pre><code') && !longFence.includes('<math'), 'Long code fences are not parsed as math');
const wrapped = context.renderMarkdown('Given $a_1\n+b_2=c$, hence $d=2$. Also \\(x_1\n+y_2\\).');
assert.equal((wrapped.match(/<math xmlns=/g) || []).length, 3, 'Wrapped inline equations render with both delimiter styles');
assert(wrapped.includes('</span>, hence <span') && !wrapped.includes('<em>'), 'Wrapped math preserves surrounding prose and subscripts');
assert.equal((context.renderMarkdown('An unclosed $a\n\nAnother paragraph\n\n$x=2$').match(/<math xmlns=/g) || []).length, 1,
  'An unclosed delimiter cannot consume a later paragraph');
const literalDollars = context.renderMarkdown('Cost $5 or $10; literal \\$x\\$; formula $p=\\$5$.');
assert.equal((literalDollars.match(/<math xmlns=/g) || []).length, 1, 'Currency and escaped dollars do not become equation delimiters');
assert(literalDollars.includes('Cost $5 or $10') && literalDollars.includes('&#36;x&#36;'));
const inlineCodeMath = context.renderMarkdown('`$x$` and $y\n+z$');
assert(inlineCodeMath.includes('<code>$x$</code>') && (inlineCodeMath.match(/<math xmlns=/g) || []).length === 1,
  'Inline code remains literal next to wrapped math');
const tuple = context.renderLatex("(R_\\lambda,q_\\lambda)\\quad\\text{and}\\quad(R'_\\lambda,q'_\\lambda)", true);
assert(!tuple.includes('math-number') && (tuple.match(/<mi>λ<\/mi>/g) || []).length === 4,
  'A trailing tuple is fully rendered, never mistaken for an equation number');
assert(context.renderLatex('x=y\\quad(2.4.1)', true).includes('math-number">(2.4.1)'), 'Bare numeric equation labels still render');
const nestedText = context.renderLatex('\\text{$q$ has a \\textbf{finite \\emph{cost}}}\\tag{A.1}', true);
const nestedVisible = nestedText.replace(/<annotation\b[\s\S]*?<\/annotation>/g, '');
assert(nestedVisible.includes('<mi>q</mi>') && nestedVisible.includes('font-weight:bold;font-style:italic'),
  'Math and nested text styles render inside text commands');
assert(nestedVisible.includes('math-number">(A.1)') && !nestedVisible.includes('$') && !nestedVisible.includes('\\'),
  'Nested text parsing preserves the surrounding equation state');
const literalMathText = context.renderLatex('\\texttt{"\\$rat"}\\text{literal \\{brace\\}}', false)
  .replace(/<annotation\b[\s\S]*?<\/annotation>/g, '');
assert(literalMathText.includes('&quot;$rat&quot;') && literalMathText.includes('{brace}'), 'Escaped text characters stay literal');
const aligned = context.renderLatex('\\begin{gathered}a<b\\\\c>d\\end{gathered}', true);
assert.equal((aligned.match(/<mtr>/g) || []).length, 2, 'Gathered equations preserve rows');
assert(aligned.includes('<mo>&lt;</mo>') && aligned.includes('<mo>&gt;</mo>'), 'Equation comparisons stay text');
assert(context.renderLatex('N_{\\mathrm{vis}}^{\\min}', false).includes('<msubsup>'), 'Subscript and superscript attach to one base');
assert(context.renderLatex('\\alpha_0^{-1}', false).includes('<msubsup>'), 'Inverse fine-structure notation stays together');
assert(context.renderLatex('\\left\\langle x\\right\\rangle', false).includes('⟨'), 'Angle brackets have valid Unicode');
assert(context.renderLatex('\\frac{1}{\\sqrt{x}}', true).includes('<mfrac>'), 'Fractions and radicals use MathML');
assert(context.renderLatex('(x)', false).includes('stretchy="false"'), 'Ordinary parentheses do not stretch to the height of nearby expressions');
assert(context.renderLatex('\\left(\\frac{x}{y}\\right)', true).includes('stretchy="true"'), 'Explicit left/right delimiters stretch around fractions');
console.log('Passed: ' + sections.length + ' complete sections, ' + equations + ' equations, ' + contentsLinks + ' exact contents destinations, 24 scene mappings, offline parity, balanced math, no visible raw TeX, wrapped equations, nested text, links, and code.');
