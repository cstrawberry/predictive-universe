/*
 * Colours are plain [r, g, b, a] arrays in 0..1, authored against the dark
 * stage and blended additively by the renderer.
 */
(function (PU) {
  'use strict';

  function fromHex(hex, a) {
    var n = parseInt(String(hex).replace('#', ''), 16);
    return [((n >> 16) & 255) / 255, ((n >> 8) & 255) / 255, (n & 255) / 255, a];
  }

  function hsl(h, s, l, a) {
    var r;
    var g;
    var b;
    if (s === 0) {
      r = g = b = l;
    } else {
      var hue = function (p, q, t) {
        if (t < 0) t += 1;
        if (t > 1) t -= 1;
        if (t < 1 / 6) return p + (q - p) * 6 * t;
        if (t < 1 / 2) return q;
        if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
        return p;
      };
      var q2 = l < 0.5 ? l * (1 + s) : l + s - l * s;
      var p2 = 2 * l - q2;
      r = hue(p2, q2, h + 1 / 3);
      g = hue(p2, q2, h);
      b = hue(p2, q2, h - 1 / 3);
    }
    return [r, g, b, a];
  }

  /* Cycle-phase palette: predict, verify, update. */
  var phase = [
    [0.29, 0.62, 1, 0.95],
    [0, 0.9, 1, 0.95],
    [0.66, 0.33, 0.97, 0.95]
  ];

  PU.color = {
    fromHex: fromHex,
    hsl: hsl,
    phase: phase
  };
})(window.PU);
