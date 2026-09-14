/* Keep the manuscript table of contents linked to rendered heading anchors. */
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const root = path.resolve(__dirname, '..');
const docs = path.join(root, 'docs/paper');
const context = { renderLatex: () => '' };
vm.createContext(context);
vm.runInContext(fs.readFileSync(path.join(root, 'paper/markdown.js'), 'utf8'), context);
const indexes = new Map();
const clean = text => text.replace(/\*\*/g, '').replace(/[.:]\s*$/, '').trim();
const unnumbered = text => clean(text).replace(/^\d+(?:\.\d+)*[a-z]?[.):]?\s+/i, '');
const normalize = text => context.markdownHeadingSlug(unnumbered(text)).replace(/-+$/, '');
const identifier = text => unnumbered(text).match(/^(?:theorem|lemma|corollary|proposition|definition|principle|axiom|remark|thesis|construction|resolution record|conjecture|observation|claim|example|assumption|hypothesis|prediction|convention)\s+[a-z]*\.?\d[\w.-]*/i)?.[0].replace(/[.:]+$/, '').toLowerCase();
function indexFor(file) {
  if (indexes.has(file)) return indexes.get(file);
  const anchors = [];
  const html = context.renderMarkdown(fs.readFileSync(path.join(docs, file), 'utf8'), { onAnchor: anchor => anchors.push(anchor) });
  const ids = new Set([...html.matchAll(/\bid="([^"]+)"/g)].map(match => match[1]));
  for (const anchor of anchors) assert(ids.has(anchor.id), file + ': missing ' + anchor.id);
  for (const anchor of anchors) { anchor.key = normalize(anchor.label); anchor.ref = identifier(anchor.label); }
  indexes.set(file, anchors);
  return anchors;
}
const contentsPath = path.join(docs, 'contents.md');
const source = fs.readFileSync(contentsPath, 'utf8');
const unresolved = [];
let links = 0;
const updated = source.replace(/\[([^\]\n]+)\]\(([^)\n]+\.md)(?:#([^)]*))?\)/g, (original, label, file, fragment) => {
  const anchors = indexFor(file);
  const key = normalize(label);
  let matches = anchors.filter(anchor => clean(anchor.label) === clean(label));
  if (matches.length !== 1) matches = anchors.filter(anchor => anchor.key === key);
  if (matches.length !== 1) {
    const ref = identifier(label);
    if (ref) matches = anchors.filter(anchor => anchor.ref === ref);
  }
  if (matches.length !== 1) {
    const sectionNumber = clean(label).match(/^(?:[A-Z]\.)?\d+(?:\.\d+)*[a-z]?(?=\s)/)?.[0];
    if (sectionNumber) matches = anchors.filter(anchor => clean(anchor.label).startsWith(sectionNumber + ' '));
  }
  if (matches.length !== 1 && /^Appendix [A-Z]$/.test(label)) matches = anchors.slice(0, 1).filter(anchor => clean(anchor.label).toLowerCase().startsWith(label.toLowerCase()));
  if (matches.length !== 1 && !identifier(label)) matches = anchors.filter(anchor => anchor.key.includes(key));
  if (matches.length !== 1) {
    if (fragment && anchors.some(anchor => anchor.id === fragment)) { links++; return original; }
    unresolved.push({ file, label, matches: matches.map(anchor => anchor.label) });
    return original;
  }
  links++;
  return '[' + label + '](' + file + '#' + matches[0].id + ')';
});
if (unresolved.length) {
  console.error(JSON.stringify(unresolved, null, 2));
  console.error(unresolved.length + ' unresolved entries; no files changed.');
  process.exitCode = 1;
} else if (process.argv.includes('--check')) {
  assert.equal(updated, source, 'Run node scripts/link-contents.cjs to refresh table-of-contents anchors.');
  console.log('Verified ' + links + ' table-of-contents links to specific manuscript locations.');
} else {
  fs.writeFileSync(contentsPath, updated);
  console.log('Linked ' + links + ' table-of-contents entries to specific manuscript locations.');
}
