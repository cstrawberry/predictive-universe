/*
 * Scene registry.
 *
 * A scene file calls `PU.scenes.register(key, { camera, draw, time })`. The
 * catalogue in js/content/catalogue.js owns the ordering, labels, colours and
 * prose; this registry only holds the drawing code, the camera preset, and
 * which clock the scene runs on.
 *
 *   time: 'global' (default) - seconds since the page loaded, so ambient
 *                              motion never restarts
 *   time: 'scene'            - seconds since this scene was selected, for
 *                              scenes that play a timed sequence
 */
(function (PU) {
  'use strict';

  var byKey = {};

  function register(key, scene) {
    byKey[key] = {
      key: key,
      camera: scene.camera || {},
      time: scene.time === 'scene' ? 'scene' : 'global',
      draw: scene.draw
    };
  }

  function get(key) {
    return byKey[key] || null;
  }

  function has(key) {
    return Object.prototype.hasOwnProperty.call(byKey, key);
  }

  PU.scenes = { register: register, get: get, has: has };
})(window.PU);
