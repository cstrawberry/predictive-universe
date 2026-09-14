/*
 * Self-reference: the SPAP boundary and a registered physical reset branch.
 * Section 4 and Section 7.5 of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var M = PU.math;
  var C = PU.color;

  /* ------------------------------------------------------------------ spap */
  PU.scenes.register('spap', {
    camera: { theta: 0, phi: 0.36, dist: 255 },
    draw: function (out, t) {
      /* Two strands of one loop: the forecast and its diagonal negation. */
      function loop(a, side, lift) {
        var r = 92 + side * 13 * Math.cos(a * 0.5 + t * 0.09);
        return [
          Math.cos(a) * r,
          lift + side * 18 * Math.sin(a * 0.5 + t * 0.09) + Math.sin(a * 2 + t * 0.18) * 5,
          Math.sin(a) * r * 0.72
        ];
      }

      for (var i = 0; i < 150; i++) {
        var r0 = 120 + M.noise(i * 7) * 180;
        var a0 = M.noise(i * 7 + 1) * Math.PI * 2;
        var y0 = (M.noise(i * 7 + 2) - 0.5) * 155;
        g.point(out, [Math.cos(a0) * r0, y0, Math.sin(a0) * r0], [0.48, 0.54, 0.72, 0.025 + M.noise(i) * 0.04], 1.2 + M.noise(i + 3) * 1.5);
      }

      var left = [];
      var right = [];
      var center = [];
      for (var s = 0; s <= 192; s++) {
        var a = (s / 192) * Math.PI * 2;
        left.push(loop(a, -1, 6));
        right.push(loop(a, 1, 6));
        center.push(loop(a, 0, 6));
        if (s === 0) continue;
        var phase = s / 192;
        var c1 = phase < 0.52 ? [0.25, 0.72, 1, 0.31] : [1, 0.25, 0.33, 0.25];
        var c2 = phase < 0.52 ? [0, 0.9, 1, 0.25] : [1, 0.36, 0.22, 0.31];
        g.line(out, left[s - 1], left[s], c1);
        g.line(out, right[s - 1], right[s], c2);
        if (s % 2 === 0) g.quad(out, left[s - 1], left[s], right[s], right[s - 1], phase < 0.52 ? [0.05, 0.18, 0.28, 0.026] : [0.28, 0.04, 0.05, 0.032]);
        if (s % 12 === 0) g.line(out, left[s], right[s], [0.9, 0.95, 1, 0.055]);
      }
      g.path(out, center, [0.75, 0.82, 1, 0.055]);

      /* Prediction and its NOT branch converge on the same update. */
      var pred = loop(t * 0.52, 1, 6);
      var anti = loop(t * 0.52 + Math.PI, -1, 6);
      g.point(out, pred, [0, 0.9, 1, 0.98], 17 + Math.sin(t * 2.2) * 2);
      g.point(out, anti, [1, 0.23, 0.31, 0.94], 15 + Math.sin(t * 2.2 + 1.8) * 2);
      g.line(out, pred, [0, 4, 0], [0, 0.9, 1, 0.2]);
      g.line(out, anti, [0, 4, 0], [1, 0.23, 0.31, 0.18]);

      var u = (Math.sin(t * 0.72) + 1) * 0.5;
      var clash = M.easeInOut(M.smooth01(0.52, 0.98, u));
      var predIn = M.interp(pred, [0, 4, 0], clash);
      var antiIn = M.interp(anti, [0, 4, 0], clash);
      g.line(out, pred, predIn, [0, 0.9, 1, 0.32]);
      g.line(out, anti, antiIn, [1, 0.23, 0.31, 0.32]);
      g.point(out, predIn, [0, 0.9, 1, 0.7], 9 + clash * 8);
      g.point(out, antiIn, [1, 0.23, 0.31, 0.7], 9 + clash * 8);

      var corePulse = 0.78 + 0.22 * Math.sin(t * 3.4);
      g.point(out, [0, 4, 0], [1, 0.23, 0.31, 0.9], 28 + 24 * clash + corePulse * 4);
      for (var w = 0; w < 4; w++) g.wireSphere(out, 18 + w * 13 + clash * 16, [1, 0.23, 0.31, 0.08 - w * 0.01 + clash * 0.035], [0, 4, 0]);

      /* The three role registers feeding the contested update. */
      var regs = [[-62, -58, -30], [0, -74, 0], [62, -58, 30]];
      for (var q = 0; q < 3; q++) {
        g.point(out, regs[q], C.phase[q], 13 + Math.sin(t * 1.7 + q) * 1.5);
        g.line(out, regs[q], [0, 4, 0], [C.phase[q][0], C.phase[q][1], C.phase[q][2], 0.1]);
      }
      for (var e = 0; e < 3; e++) g.line(out, regs[e], regs[(e + 1) % 3], [0.66, 0.48, 1, 0.12]);

      /* A conditional physical reset follows the structural diagonal event. */
      var merge = [0, -64, 0];
      g.line(out, [0, 4, 0], merge, [1, 0.75, 0.15, 0.33]);
      g.point(out, merge, [1, 0.75, 0.15, 0.9], 18 + clash * 8);
      g.basisRing(out, 34 + clash * 26, [1, 0.75, 0.15, 0.18 + clash * 0.12], merge, [1, 0, 0], [0, 0, 1], 96);

      for (var k = 0; k < 92; k++) {
        var kf = (t * 0.18 + k * 0.028) % 1;
        var ka = k * 0.62 + t * 0.45;
        var kr = 24 + kf * 150;
        g.point(out, [Math.cos(ka) * kr, -64 + Math.sin(kf * Math.PI) * 42, Math.sin(ka) * kr * 0.64], [1, 0.58, 0.16, (1 - kf) * (0.28 + 0.3 * clash)], 3.2 + 4.5 * (1 - kf));
      }
      for (var arc = 0; arc < 10; arc++) {
        var pts = [];
        for (var j = 0; j < 36; j++) {
          var jf = j / 35;
          var ja = -Math.PI * 0.8 + jf * Math.PI * 1.6 + arc * 0.07;
          pts.push([Math.cos(ja) * (28 + jf * 118), -64 + Math.sin(jf * Math.PI) * 36, Math.sin(ja) * (18 + jf * 74)]);
        }
        g.path(out, pts, arc % 2 ? [1, 0.75, 0.15, 0.075] : [1, 0.23, 0.31, 0.06]);
      }
    }
  });

  /* --------------------------------------------------------------- entropy */
  PU.scenes.register('entropy', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      var inputs = [[-105, 42, -34], [-105, 14, 34], [-105, -14, -34], [-105, -42, 34]];
      var outputs = [[112, 28, 0], [112, -28, 0]];
      var mid = [0, 0, 0];

      for (var i = 0; i < inputs.length; i++) {
        g.point(out, inputs[i], [0.29, 0.62, 1, 0.9], 8);
        g.line(out, inputs[i], mid, [0.29, 0.62, 1, 0.18]);
      }
      for (var o = 0; o < outputs.length; o++) {
        g.point(out, outputs[o], [0.66, 0.33, 0.97, 0.9], 12);
        g.line(out, mid, outputs[o], [0.66, 0.33, 0.97, 0.18]);
      }
      g.point(out, mid, [1, 0.23, 0.31, 0.7], 28 + Math.sin(t * 2) * 4);

      /* Uniform prescribed-ready example: four pairs map to two retained results. */
      var paths = [];
      for (var a = 0; a < inputs.length; a++) paths.push([inputs[a], mid]);
      for (var b = 0; b < outputs.length; b++) paths.push([mid, outputs[b]]);
      for (var k = 0; k < 90; k++) {
        var path = paths[k % paths.length];
        var f = (t * 0.45 + k * 0.037) % 1;
        g.point(out, M.interp(path[0], path[1], f), k < 56 ? [0, 0.9, 1, (1 - f) * 0.42] : [0.66, 0.33, 0.97, (1 - f) * 0.42], 4.5);
      }

      /* Ideal reset heat scale for the displayed uniform ensemble. */
      for (var h = 0; h < 70; h++) {
        var ha = (h / 70) * Math.PI * 2 + t * 0.6;
        var hr = 34 + h * 0.7;
        g.point(out, [Math.cos(ha) * hr, Math.sin(ha * 3) * 10, Math.sin(ha) * hr], [1, 0.45, 0.18, 0.22 * (1 - h / 70)], 3.5);
      }
    }
  });
})(window.PU);
