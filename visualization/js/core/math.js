/* Scalar helpers shared by the camera, the scene data, and every scene. */
(function (PU) {
  'use strict';

  function clamp(v, min, max) {
    return Math.max(min, Math.min(max, v));
  }

  /* Deterministic 32-bit LCG: the same layout is generated on every load. */
  function rng(seed) {
    var s = seed >>> 0;
    return function () {
      s = (s * 1664525 + 1013904223) >>> 0;
      return s / 4294967296;
    };
  }

  /* Cheap hash noise in [0,1), indexed by a single number. */
  function noise(n) {
    var v = (Math.sin(n * 12.9898 + 78.233) * 43758.5453) % 1;
    return v < 0 ? v + 1 : v;
  }

  function lerp(a, b, f) {
    return a + (b - a) * f;
  }

  function interp(a, b, f) {
    return [a[0] + (b[0] - a[0]) * f, a[1] + (b[1] - a[1]) * f, a[2] + (b[2] - a[2]) * f];
  }

  /* Smoothstep between two thresholds, clamped to [0,1]. */
  function smooth01(a, b, x) {
    var u = clamp((x - a) / (b - a), 0, 1);
    return u * u * (3 - 2 * u);
  }

  function easeInOut(u) {
    return u < 0.5 ? 2 * u * u : 1 - Math.pow(-2 * u + 2, 2) / 2;
  }

  function dist3(a, b) {
    return Math.hypot(a[0] - b[0], a[1] - b[1], a[2] - b[2]);
  }

  /* Uniform point inside a ball of the given radius, drawn from `random`. */
  function randSphere(radius, random) {
    var th = random() * Math.PI * 2;
    var ph = Math.acos(2 * random() - 1);
    var r = Math.cbrt(random()) * radius;
    return [Math.sin(ph) * Math.cos(th) * r, Math.sin(ph) * Math.sin(th) * r, Math.cos(ph) * r];
  }

  PU.math = {
    clamp: clamp,
    rng: rng,
    noise: noise,
    lerp: lerp,
    interp: interp,
    smooth01: smooth01,
    easeInOut: easeInOut,
    dist3: dist3,
    randSphere: randSphere
  };
})(window.PU);
