/* Dependency-free regression checks for moving annotation targets. */
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const root = path.resolve(__dirname, '..');

class Element {
  constructor(tag = 'div') {
    this.tagName = tag;
    this.children = [];
    this.listeners = {};
    this.attributes = {};
    this.style = { setProperty() {} };
    this.classList = { remove() {}, toggle() {} };
    this.hidden = false;
    this.clientWidth = 640;
    this.clientHeight = 360;
    this.boxWidth = tag === 'button' ? 140 : 280;
    this.boxHeight = tag === 'button' ? 32 : 160;
  }
  get offsetWidth() { return this.hidden || this.parentElement?.hidden ? 0 : this.boxWidth; }
  get offsetHeight() { return this.hidden || this.parentElement?.hidden ? 0 : this.boxHeight; }
  appendChild(child) { this.children.push(child); child.parentElement = this; }
  removeChild(child) { this.children.splice(this.children.indexOf(child), 1); }
  addEventListener(type, fn) { (this.listeners[type] ||= []).push(fn); }
  dispatch(type, event = {}) { for (const fn of this.listeners[type] || []) fn({ target: this, stopPropagation() {}, ...event }); }
  setAttribute(name, value) { this.attributes[name] = value; }
  matches() { return !!this.focusVisible; }
  contains(target) { return target === this || this.children.some(child => child.contains(target)); }
  getBoundingClientRect() { return { left: 100, top: 40 }; }
}
const win = new Element();
const context = {
  window: win,
  document: { createElement: tag => new Element(tag) }
};
win.PU = { camera: { project: point => ({ x: point[0], y: point[1] }) } };
vm.createContext(context);
for (const file of ['visualization/js/ui/dom.js', 'visualization/js/ui/annotation-layer.js']) {
  vm.runInContext(fs.readFileSync(path.join(root, file), 'utf8'), context);
}
const stage = new Element();
const container = new Element();
container.id = 'labels';
container.hidden = true;
stage.appendChild(container);
const overlay = win.PU.annotationLayer.build(container);
const positions = [[-0.6, 0.2], [0.6, 0.2], [0, -0.5]];
const entry = { color: '#fff', rgb: '255,255,255' };
const notes = positions.map((_, i) => ({ label: 'Label ' + i, plain: 'Description ' + i, at: () => positions[i] }));
overlay.setScene(entry, notes);
overlay.setVisible(true);
let time = 0;
overlay.update(time);
const buttons = () => container.children.filter(el => el.tagName === 'button');
const point = el => {
  const match = el.style.transform.match(/translate\((-?[\d.]+)px,(-?[\d.]+)px\)/);
  return { x: Number(match[1]), y: Number(match[2]) };
};
const snapshot = () => buttons().map(el => [el.style.transform, el.style.visibility]);
const tick = () => overlay.update(time += 1 / 60);
const distance = (a, b) => Math.hypot(a.x - b.x, a.y - b.y);
function checkLayout() {
  const visible = buttons().filter(el => el.style.visibility === 'visible');
  for (const el of visible) {
    const p = point(el);
    assert(p.x >= el.boxWidth / 2 + 7.9 && p.x <= container.clientWidth - el.boxWidth / 2 - 7.9);
    assert(p.y >= el.boxHeight / 2 + 7.9 && p.y <= container.clientHeight - el.boxHeight / 2 - 7.9);
  }
  for (let i = 0; i < visible.length; i++) for (let j = i + 1; j < visible.length; j++) {
    const a = point(visible[i]), b = point(visible[j]);
    assert(Math.abs(a.x - b.x) * 2 >= visible[i].boxWidth + visible[j].boxWidth + 9.8 ||
      Math.abs(a.y - b.y) * 2 >= visible[i].boxHeight + visible[j].boxHeight + 7.8, 'Labels overlap');
  }
}
checkLayout();

// Abruptly moving anchors cannot teleport labels or cover another target.
positions[0] = [0.8, -0.7];
positions[1] = [-0.8, 0.7];
for (let frame = 0; frame < 90; frame++) {
  const before = buttons().map(point);
  tick();
  buttons().forEach((el, i) => assert(distance(before[i], point(el)) <= 80 / 60 + 0.15, 'Label jumped'));
  checkLayout();
}

// Hold before the pointer reaches the pill, then resume when it leaves.
const first = buttons()[0];
let p = point(first);
stage.dispatch('pointermove', { pointerType: 'mouse', buttons: 0, clientX: 100 + p.x, clientY: 40 + p.y - first.boxHeight / 2 - 20 });
const near = snapshot();
for (let i = 0; i < 30; i++) tick();
assert.deepEqual(snapshot(), near, 'Labels moved while approaching');
stage.dispatch('pointerleave');
tick();

// Keyboard focus and touch presses each protect the same hit target.
first.focusVisible = true;
first.dispatch('focus');
let held = snapshot();
for (let i = 0; i < 15; i++) tick();
assert.deepEqual(snapshot(), held, 'Focused labels moved');
first.dispatch('blur');
first.dispatch('pointerdown', { pointerType: 'touch' });
held = snapshot();
for (let i = 0; i < 15; i++) tick();
assert.deepEqual(snapshot(), held, 'Touch target moved before release');
win.dispatch('pointercancel');
tick();

// An open note remains readable even if its animated anchor disappears.
first.dispatch('click');
const popup = container.children[0];
assert.equal(first.attributes['aria-expanded'], 'true');
assert.equal(popup.hidden, false);
assert(popup.innerHTML.includes('Description 0'));
held = snapshot();
positions[0] = null;
for (let i = 0; i < 30; i++) tick();
assert.deepEqual(snapshot(), held, 'Open note lost its target');
assert(Number.parseFloat(popup.style.top) >= 8);
assert(Number.parseFloat(popup.style.top) + popup.boxHeight <= container.clientHeight - 8);
first.dispatch('click');
tick();
assert.equal(popup.hidden, true);
assert.equal(first.attributes['aria-expanded'], 'false');
assert.equal(first.style.visibility, 'hidden');

// Measure real widths after reveal, pack coincident anchors, and fit a resize.
const cluster = Array.from({ length: 5 }, (_, i) => ({ label: 'Cluster ' + i, plain: 'Cluster note', at: [0, 0] }));
overlay.setVisible(false);
overlay.setScene(entry, cluster);
buttons().forEach(el => { el.boxWidth = 180; el.boxHeight = 44; });
overlay.setVisible(true);
tick();
assert.equal(buttons().filter(el => el.style.visibility === 'visible').length, 5);
checkLayout();
container.clientWidth = 320;
container.clientHeight = 360;
tick();
assert.equal(buttons().filter(el => el.style.visibility === 'visible').length, 5);
checkLayout();
overlay.setVisible(false);
assert.equal(container.hidden, true);
assert.equal(popup.hidden, true);

// Cogito's M marker uses the fixed downstream point drawn by its scene.
win.PU.data = { gravitySurfaceY: () => 0, terrainHeight: () => 0 };
vm.runInContext(fs.readFileSync(path.join(root, 'visualization/js/content/annotations.js'), 'utf8'), context);
const m = win.PU.annotations.cogito.find(note => note.label === 'M = 24');
assert.deepEqual(Array.from(m.at), [72, -54, -28]);
console.log('Annotation checks passed: bounded motion, spacing, pointer approach, keyboard focus, touch press, note persistence, hidden measurement, resize, and fixed M = 24 anchor.');

