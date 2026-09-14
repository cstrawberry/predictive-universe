/*
 * Application entry point.
 *
 * Owns the frame loop, the scene transition, and the wiring between the
 * renderer and the three UI modules. Loaded last; everything it needs is
 * already on `PU` by the time it runs.
 */
(function (PU) {
  'use strict';

  var M = PU.math;
  var byId = PU.dom.byId;

  var FALLBACK_SCENE = 'cogito';
  var embedded = new URLSearchParams(location.search).get('embed') === '1' && window.parent !== window;
  var parentOrigin = location.origin === 'null' ? '*' : location.origin;

  function requestedScene() {
    var hash = (location.hash || '').replace('#', '');
    if (hash && PU.catalogueByKey[hash]) return hash;
    var match = /[?&]scene=([A-Za-z0-9_-]+)/.exec(location.search);
    if (match && PU.catalogueByKey[match[1]]) return match[1];
    return FALLBACK_SCENE;
  }

  function boot() {
    var shell = byId('vizShell');
    var canvas = byId('vizCanvas');
    var stage = byId('vizStage');
    var fallback = byId('noWebgl');
    if (!shell || !canvas) return;

    var renderer = PU.renderer.create(canvas);
    if (!renderer) {
      shell.hidden = true;
      if (fallback) fallback.classList.add('is-visible');
      return;
    }

    var reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    var refs = {
      panel: byId('vizHud'),
      toggle: byId('vizExplainToggle'),
      close: byId('vizHudClose'),
      kicker: byId('vizHudTitle'),
      summary: byId('vizHudSummary'),
      copy: byId('vizHudCopy'),
      details: byId('vizHudDetails')
    };

    var explain = PU.explainPanel.build(shell, refs, function () { setExplaining(false); });
    var annotations = PU.annotationLayer.build(byId('vizAnnotations'));
    var indexPanel = PU.indexPanel.build(byId('vizIndex'), function (key) { setScene(key); });
    var pointer = PU.pointer.attach(canvas, PU.camera);

    var titleEl = byId('vizStageName');
    var sourceEl = byId('vizStageSource');
    var annotationsToggle = byId('vizAnnotationsToggle');

    /*
     * All scene timing is in seconds off a wall clock, not off a frame
     * counter, so animations run at the same speed whatever the display
     * refresh rate is and whatever the browser throttles rAF to.
     */
    var startedAt = now();
    function now() {
      return (window.performance && window.performance.now ? window.performance.now() : Date.now()) / 1000;
    }
    function clock() {
      return now() - startedAt;
    }

    var state = {
      key: null,
      entry: null,
      scene: null,
      notes: [],
      sceneStart: 0,
      revealStart: 0,
      fadeStart: 0,
      fade: 0,
      pending: null,
      explaining: false,
      annotating: false
    };

    /* ------------------------------------------------------------ scenes */

    function applyScene(key) {
      var entry = PU.catalogueByKey[key];
      var scene = PU.scenes.get(key);
      if (!entry || !scene) return;

      state.key = key;
      state.entry = entry;
      state.scene = scene;
      state.notes = PU.annotations[key] || [];
      state.sceneStart = clock();

      PU.camera.applyPreset(scene.camera);

      titleEl.textContent = entry.title;
      sourceEl.textContent = entry.source;
      stage.style.setProperty('--viz-color', entry.color);
      stage.style.setProperty('--viz-rgb', entry.rgb);

      indexPanel.setActive(key);
      explain.render(entry, state.notes);
      annotations.setScene(entry, state.notes);
      annotations.setVisible(state.annotating);

      if (location.hash !== '#' + key) {
        try {
          history.replaceState(null, '', '#' + key);
        } catch (e) {
          location.hash = key;
        }
      }
      if (embedded) window.parent.postMessage({ channel: 'pu-visualization', type: 'scene', key: key }, parentOrigin);
    }

    /* Scene changes dip through black rather than cutting. */
    function setScene(key) {
      if (!PU.catalogueByKey[key] || !PU.scenes.has(key)) key = FALLBACK_SCENE;
      if (!state.key) {
        state.revealStart = clock();
        applyScene(key);
        return;
      }
      if (key === state.key && !state.pending) return;
      if (state.explaining) setExplaining(false);
      if (state.pending) {
        state.pending = key;
        indexPanel.setActive(key);
        return;
      }
      state.pending = key;
      state.fadeStart = clock();
      indexPanel.setActive(key);
    }

    /* --------------------------------------------------------------- ui */

    function setExplaining(open) {
      state.explaining = open;
      explain.setOpen(open);
    }

    function setAnnotating(on) {
      state.annotating = on;
      annotations.setVisible(on);
      annotationsToggle.setAttribute('aria-pressed', on ? 'true' : 'false');
    }

    refs.toggle.addEventListener('click', function () { setExplaining(true); });
    annotationsToggle.addEventListener('click', function () { setAnnotating(!state.annotating); });

    window.addEventListener('keydown', function (e) {
      if (e.key !== 'Escape') return;
      if (state.explaining) setExplaining(false);
      else annotations.closeNote();
    });

    window.addEventListener('hashchange', function () {
      var key = (location.hash || '').replace('#', '');
      if (key && PU.catalogueByKey[key] && key !== state.key) setScene(key);
    });

    canvas.addEventListener('pointerdown', function () { annotations.closeNote(); });

    /* ------------------------------------------------------------- loop */

    function advance(t) {
      renderer.resize();

      if (state.pending) {
        var k = M.smooth01(0, 0.42, t - state.fadeStart);
        state.fade = 1 - k;
        if (k >= 1) {
          var next = state.pending;
          state.pending = null;
          state.revealStart = t;
          applyScene(next);
        }
      } else {
        state.fade = M.smooth01(0, 1.15, t - state.revealStart);
      }

      var cam = PU.camera;
      var sceneT = t - state.sceneStart;

      var dt = Math.min(0.1, Math.max(0, t - lastFrameAt));
      lastFrameAt = t;

      if (!reduceMotion) {
        if (!pointer.isDragging()) cam.targetTheta += (state.key === 'becoming' ? 0.021 : 0.063) * dt;
        var dolly = -Math.sin(sceneT * 0.16) * Math.max(6, cam.baseDist * 0.05);
        cam.targetDist = M.clamp(cam.baseDist + cam.zoomOffset + dolly, 130, 1100);
        cam.dTheta = Math.sin(sceneT * 0.061) * 0.022 + Math.sin(sceneT * 0.23) * 0.005;
        cam.dPhi = Math.cos(sceneT * 0.087) * 0.014 + Math.sin(sceneT * 0.19) * 0.004;
        cam.roll = Math.sin(sceneT * 0.052) * 0.011 + (1 - state.fade) * (state.pending ? 0.018 : -0.035);
      } else {
        cam.targetDist = M.clamp(cam.baseDist + cam.zoomOffset, 130, 1100);
      }
      cam.settle(dt);

      if (!state.scene) return;
      var sceneTime = state.scene.time === 'scene' ? sceneT : t;
      var out = PU.geom.buffer();
      state.scene.draw(out, sceneTime);
      renderer.draw(out, t, state.fade);
      if (state.annotating) annotations.update(sceneTime);
    }

    var lastFrameAt = 0;
    var running = true;
    var panelVisible = true;
    function tick() {
      if (running) advance(clock());
      requestAnimationFrame(tick);
    }

    document.addEventListener('visibilitychange', function () {
      running = !document.hidden && panelVisible;
    });

    window.addEventListener('message', function (event) {
      if (!embedded || event.source !== window.parent || (parentOrigin !== '*' && event.origin !== parentOrigin)) return;
      var message = event.data;
      if (!message || message.channel !== 'pu-reader') return;
      if (message.type === 'visibility') {
        panelVisible = message.visible === true;
        running = !document.hidden && panelVisible;
        if (running) { lastFrameAt = clock(); renderer.resize(); annotations.measure(); }
      }
      if (message.type === 'scene' && PU.catalogueByKey[message.key]) setScene(message.key);
    });

    window.addEventListener('resize', function () {
      renderer.resize();
      annotations.measure();
    });

    renderer.resize();
    setScene(requestedScene());
    setAnnotating(false);
    tick();
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', boot, { once: true });
  } else {
    boot();
  }
})(window.PU);
