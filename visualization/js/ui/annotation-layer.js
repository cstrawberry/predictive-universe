/*
 * Annotation overlay.
 *
 * Labels follow projected anchors at a bounded speed. Nearby pointer input,
 * keyboard focus, and an open note hold the layout still for interaction.
 */
(function (PU) {
  'use strict';

  var esc = PU.dom.escapeHtml;

  function build(container) {
    var markers = [];
    var notes = [];
    var openIndex = -1;
    var focusIndex = -1;
    var pressed = false;
    var pointer = null;
    var lastTime = null;
    var width = 0;
    var height = 0;
    var layoutDirty = true;
    var noteWidth = 0;
    var noteHeight = 0;
    var stage = container.parentElement;

    var noteEl = document.createElement('div');
    noteEl.id = container.id + '-note';
    noteEl.className = 'viz-marker-note';
    noteEl.setAttribute('role', 'note');
    noteEl.hidden = true;
    container.appendChild(noteEl);

    function closeNote() {
      openIndex = -1;
      noteEl.hidden = true;
      for (var i = 0; i < markers.length; i++) {
        markers[i].el.classList.remove('is-open');
        markers[i].el.setAttribute('aria-expanded', 'false');
      }
    }

    function measureNote() {
      if (noteEl.hidden) return;
      noteWidth = noteEl.offsetWidth;
      noteHeight = noteEl.offsetHeight;
    }

    function positionNote() {
      if (openIndex < 0 || !markers[openIndex].ready) return;
      var marker = markers[openIndex];
      var below = marker.y + marker.h / 2 + 8;
      var top = below + noteHeight <= height - 8 ? below : marker.y - marker.h / 2 - noteHeight - 8;
      noteEl.style.left = clamp(marker.x - noteWidth / 2, 8, width - noteWidth - 8) + 'px';
      noteEl.style.top = clamp(top, 8, height - noteHeight - 8) + 'px';
    }

    function openNote(index) {
      if (openIndex === index) {
        closeNote();
        return;
      }
      openIndex = index;
      noteEl.hidden = false;
      noteEl.innerHTML = '<h3>' + esc(notes[index].label) + '</h3><p>' + esc(notes[index].plain) + '</p>';
      for (var i = 0; i < markers.length; i++) {
        markers[i].el.classList.toggle('is-open', i === index);
        markers[i].el.setAttribute('aria-expanded', i === index ? 'true' : 'false');
      }
      measureNote();
      positionNote();
    }

    stage.addEventListener('pointermove', function (event) {
      if (event.pointerType === 'touch' || event.buttons) {
        pointer = null;
        return;
      }
      var rect = container.getBoundingClientRect();
      pointer = { x: event.clientX - rect.left, y: event.clientY - rect.top };
    });
    stage.addEventListener('pointerleave', function () { pointer = null; });
    stage.addEventListener('pointerdown', function (event) {
      if (!container.contains(event.target)) {
        focusIndex = -1;
        pointer = null;
      }
    });
    window.addEventListener('pointerup', function () { pressed = false; });
    window.addEventListener('pointercancel', function () { pressed = false; });

    function setScene(entry, sceneNotes) {
      closeNote();
      focusIndex = -1;
      pressed = false;
      pointer = null;
      lastTime = null;
      for (var m = 0; m < markers.length; m++) container.removeChild(markers[m].el);
      markers = [];
      notes = sceneNotes || [];
      container.style.setProperty('--viz-color', entry.color);
      container.style.setProperty('--viz-rgb', entry.rgb);

      for (var i = 0; i < notes.length; i++) {
        var el = document.createElement('button');
        el.type = 'button';
        el.className = 'viz-marker';
        el.style.visibility = 'hidden';
        el.setAttribute('aria-expanded', 'false');
        el.setAttribute('aria-controls', noteEl.id);
        el.innerHTML = '<span class="viz-marker-dot">' + (i + 1) + '</span>' + esc(notes[i].label);
        (function (index, button) {
          button.addEventListener('pointerdown', function () { pressed = true; });
          button.addEventListener('focus', function () {
            if (button.matches(':focus-visible')) focusIndex = index;
          });
          button.addEventListener('blur', function () {
            if (focusIndex === index) focusIndex = -1;
          });
          button.addEventListener('click', function (event) {
            event.stopPropagation();
            pressed = false;
            openNote(index);
          });
        })(i, el);
        container.appendChild(el);
        markers.push({ el: el, note: notes[i], w: 0, h: 0, x: 0, y: 0, ready: false, visible: false });
      }
      measure();
    }

    /* Measure after revealing the overlay, so hidden labels never retain
       fallback widths. Subsequent frames use the cached pill dimensions. */
    function measure() {
      layoutDirty = true;
      if (container.hidden) return;
      for (var i = 0; i < markers.length; i++) {
        markers[i].w = markers[i].el.offsetWidth;
        markers[i].h = markers[i].el.offsetHeight;
      }
      measureNote();
    }

    function clamp(value, min, max) {
      return Math.max(min, Math.min(value, Math.max(min, max)));
    }

    function overlaps(a, b) {
      return Math.abs(a.x - b.x) * 2 < a.w + b.w + 10 &&
        Math.abs(a.y - b.y) * 2 < a.h + b.h + 8;
    }

    function clear(box, occupied) {
      for (var i = 0; i < occupied.length; i++) if (overlaps(box, occupied[i])) return false;
      return true;
    }

    function nearPointer() {
      if (!pointer) return false;
      for (var i = 0; i < markers.length; i++) {
        var m = markers[i];
        if (m.ready && m.visible && Math.abs(pointer.x - m.x) <= m.w / 2 + 36 &&
            Math.abs(pointer.y - m.y) <= m.h / 2 + 36) return true;
      }
      return false;
    }

    /* Choose a free gap close to the anchor and previous position. Reserving
       the other visible pills prevents a moving label from covering a target. */
    function freeTarget(marker, target, occupied) {
      if (clear(target, occupied)) return target;
      var xs = [target.x, marker.w / 2 + 8, width - marker.w / 2 - 8];
      var ys = [target.y, marker.h / 2 + 8, height - marker.h / 2 - 8];
      for (var i = 0; i < occupied.length; i++) {
        var o = occupied[i];
        xs.push(o.x - (o.w + marker.w) / 2 - 6, o.x + (o.w + marker.w) / 2 + 6);
        ys.push(o.y - (o.h + marker.h) / 2 - 5, o.y + (o.h + marker.h) / 2 + 5);
      }
      var best = null;
      var score = Infinity;
      for (var x = 0; x < xs.length; x++) {
        for (var y = 0; y < ys.length; y++) {
          var candidate = {
            x: clamp(xs[x], marker.w / 2 + 8, width - marker.w / 2 - 8),
            y: clamp(ys[y], marker.h / 2 + 8, height - marker.h / 2 - 8),
            w: marker.w, h: marker.h
          };
          if (!clear(candidate, occupied)) continue;
          var cost = Math.pow(candidate.x - target.x, 2) + Math.pow(candidate.y - target.y, 2);
          if (marker.ready) cost += 0.2 * (Math.pow(candidate.x - marker.x, 2) + Math.pow(candidate.y - marker.y, 2));
          if (cost < score) { best = candidate; score = cost; }
        }
      }
      return best;
    }

    function update(time) {
      if (!markers.length || container.hidden) return;
      var dt = lastTime == null ? 1 / 60 : clamp(time - lastTime, 0, 0.05);
      lastTime = time;
      var w = container.clientWidth;
      var h = container.clientHeight;
      if (!w || !h) return;
      var resized = width !== w || height !== h;
      width = w;
      height = h;
      if (resized) measure();
      var relayout = layoutDirty;
      if (relayout) {
        for (var r = 0; r < markers.length; r++) markers[r].ready = false;
        layoutDirty = false;
      }
      if (!relayout && (openIndex >= 0 || pressed || focusIndex >= 0 || nearPointer())) {
        positionNote();
        return;
      }

      for (var i = 0; i < markers.length; i++) {
        var marker = markers[i];
        var at = marker.note.at;
        var world = typeof at === 'function' ? at(time) : at;
        var q = world ? PU.camera.project(world) : null;
        marker.visible = !!q && Math.abs(q.x) <= 1.05 && Math.abs(q.y) <= 1.05;
        if (!marker.visible) {
          marker.el.style.visibility = 'hidden';
          marker.ready = false;
        }
        marker.projected = q;
      }

      for (var j = 0; j < markers.length; j++) {
        var current = markers[j];
        if (!current.visible) continue;
        var occupied = markers.filter(function (m) { return m !== current && m.ready && m.visible; });
        var target = freeTarget(current, {
          x: clamp((current.projected.x * 0.5 + 0.5) * width, current.w / 2 + 8, width - current.w / 2 - 8),
          y: clamp((0.5 - current.projected.y * 0.5) * height, current.h / 2 + 8, height - current.h / 2 - 8),
          w: current.w, h: current.h
        }, occupied);
        if (!target) continue;
        if (current.ready) {
          var dx = target.x - current.x;
          var dy = target.y - current.y;
          var distance = Math.hypot(dx, dy);
          var fraction = distance ? Math.min(1 - Math.exp(-6 * dt), 80 * dt / distance) : 0;
          var next = { x: current.x + dx * fraction, y: current.y + dy * fraction, w: current.w, h: current.h };
          if (!clear(next, occupied)) {
            next.y = current.y;
            if (!clear(next, occupied)) {
              next.x = current.x;
              next.y = current.y + dy * fraction;
              if (!clear(next, occupied)) next.y = current.y;
            }
          }
          current.x = next.x;
          current.y = next.y;
        } else {
          current.x = target.x;
          current.y = target.y;
          current.ready = true;
        }
        current.el.style.visibility = 'visible';
        current.el.style.transform = 'translate(-50%, -50%) translate(' + current.x.toFixed(1) + 'px,' + current.y.toFixed(1) + 'px)';
      }
      positionNote();
    }

    function setVisible(visible) {
      container.hidden = !visible;
      lastTime = null;
      pointer = null;
      if (visible) measure();
      else {
        focusIndex = -1;
        pressed = false;
        closeNote();
      }
    }

    return { setScene: setScene, update: update, setVisible: setVisible, closeNote: closeNote, measure: measure };
  }

  PU.annotationLayer = { build: build };
})(window.PU);
