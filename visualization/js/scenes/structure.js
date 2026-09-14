/*
 * Structure selection: the D=4 channel gate, the gauge block split, and the
 * sector-labelled defects that sit on top of them.
 * Appendices Z, G, and R/T/Z of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var C = PU.color;
  var data = PU.data;

  /* ------------------------------------------------------------------- dim */
  PU.scenes.register('dim', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      /* M=24 <= K(D): the 24-cell is a four-dimensional feasibility witness. */
      var pts = [];
      for (var i = 0; i < data.roots24.length; i++) pts.push(data.project4(data.roots24[i], t, 62));

      g.point(out, [0, 0, 0], [1, 0.23, 0.31, 0.5], 22);
      for (var p = 0; p < pts.length; p++) {
        var col = p < 12 ? [0.29, 0.62, 1, 0.82] : [0.66, 0.33, 0.97, 0.82];
        g.line(out, [0, 0, 0], pts[p], [col[0], col[1], col[2], 0.14]);
        g.point(out, pts[p], col, 8);
      }
      for (var a = 0; a < pts.length; a++) {
        for (var b = a + 1; b < pts.length; b++) {
          if (Math.hypot(pts[a][0] - pts[b][0], pts[a][1] - pts[b][1], pts[a][2] - pts[b][2]) < 90) {
            g.line(out, pts[a], pts[b], [0, 0.9, 1, 0.07]);
          }
        }
      }
      g.basisRing(out, 118, [1, 0.75, 0.15, 0.12], [0, 0, 0], [1, 0, 0], [0, 0, 1], 120);
    }
  });

  /* ----------------------------------------------------------------- gauge */
  PU.scenes.register('gauge', {
    camera: { theta: 0, phi: 0.36, dist: 265 },
    draw: function (out, t) {
      /* Inactive memory blocks C^3, C^2, C^1 -> su(3), su(2), u(1). */
      var sectors = [
        { x: -92, n: 8, r: 37, c: [1, 0.23, 0.31, 0.78], ring: [1, 0.23, 0.31, 0.16] },
        { x: 14, n: 3, r: 31, c: [1, 0.75, 0.15, 0.82], ring: [1, 0.75, 0.15, 0.17] },
        { x: 98, n: 1, r: 24, c: [0.2, 0.83, 0.6, 0.85], ring: [0.2, 0.83, 0.6, 0.18] }
      ];

      /* Active kernel C^2 above the split. */
      g.point(out, [-18, 48, 0], [0.66, 0.33, 0.97, 0.9], 11);
      g.point(out, [18, 48, 0], [0.66, 0.33, 0.97, 0.9], 11);
      g.line(out, [-18, 48, 0], [18, 48, 0], [0.66, 0.33, 0.97, 0.32]);

      for (var s = 0; s < sectors.length; s++) {
        var sec = sectors[s];
        g.basisRing(out, sec.r, sec.ring, [sec.x, -22, 0], [1, 0, 0], [0, 0, 1], 96);
        for (var i = 0; i < sec.n; i++) {
          var a = t * (0.25 + 0.04 * s) + (i / sec.n) * Math.PI * 2;
          var p = [sec.x + Math.cos(a) * sec.r, -22 + Math.sin(a * 2) * 8, Math.sin(a) * sec.r];
          g.point(out, p, sec.c, s === 0 ? 7 : s === 1 ? 9 : 12);
          g.line(out, [0, 24, 0], p, [sec.c[0], sec.c[1], sec.c[2], 0.13]);
        }
      }

      /* 8 + 3 + 1 generators counted out along the lower ring. */
      for (var k = 0; k < 12; k++) {
        var ka = (k / 12) * Math.PI * 2 + t * 0.18;
        g.point(out, [Math.cos(ka) * 116, -64, Math.sin(ka) * 36], k < 8 ? [1, 0.23, 0.31, 0.42] : k < 11 ? [1, 0.75, 0.15, 0.45] : [0.2, 0.83, 0.6, 0.5], 4.5);
      }
    }
  });

  /* ------------------------------------------------------------- particles */
  PU.scenes.register('particles', {
    camera: { theta: 0, phi: 0.36, dist: 305 },
    draw: function (out, t) {
      /* Coded background: concentric hex-like shells of code positions. */
      var nodes = [];
      for (var shell = 0; shell < 5; shell++) {
        var count = shell === 0 ? 1 : shell * 6;
        for (var i = 0; i < count; i++) {
          var a = count === 1 ? 0 : (i / count) * Math.PI * 2;
          nodes.push([Math.cos(a) * shell * 18, 0, Math.sin(a) * shell * 18]);
        }
      }
      for (var na = 0; na < nodes.length; na++) {
        for (var nb = na + 1; nb < nodes.length; nb++) {
          if (Math.hypot(nodes[na][0] - nodes[nb][0], nodes[na][2] - nodes[nb][2]) < 21) {
            g.line(out, nodes[na], nodes[nb], [0.29, 0.62, 1, 0.06]);
          }
        }
      }

      /* Three conditional sector-labelled candidate excitations. */
      var defects = [
        { c: [1, 0.23, 0.31, 0.9], r: 32, size: 6 },
        { c: [1, 0.75, 0.15, 0.9], r: 52, size: 5 },
        { c: [0.2, 0.83, 0.6, 0.9], r: 72, size: 4 }
      ];
      function defectAt(idx) {
        var a = t * 0.35 + (idx * Math.PI * 2) / 3;
        return [Math.cos(a) * defects[idx].r, 22 + Math.sin(t + idx) * 8, Math.sin(a) * defects[idx].r];
      }

      for (var n = 0; n < nodes.length; n++) {
        var disturbed = 0;
        for (var d = 0; d < defects.length; d++) {
          var dp = defectAt(d);
          var dist = Math.hypot(nodes[n][0] - dp[0], nodes[n][2] - dp[2]);
          disturbed = Math.max(disturbed, Math.max(0, 1 - dist / 28));
        }
        g.point(out, nodes[n], disturbed ? [1, 0.23, 0.31, 0.35 + disturbed * 0.42] : [0.29, 0.62, 1, 0.36], 4.8 + disturbed * 3);
      }
      for (var q = 0; q < defects.length; q++) {
        var qp = defectAt(q);
        g.point(out, qp, defects[q].c, defects[q].size * 2.4);
        g.basisRing(out, defects[q].size * 5, [defects[q].c[0], defects[q].c[1], defects[q].c[2], 0.12], qp, [1, 0, 0], [0, 0, 1], 36);
      }

      /* Mass hierarchy ring: structure constrains it, certificates fix it. */
      var prev = null;
      for (var m = 0; m < 8; m++) {
        var ma = (m / 8) * Math.PI * 2 + t * 0.11;
        var mp = [Math.cos(ma) * 50, -72, Math.sin(ma) * 50];
        g.point(out, mp, C.hsl(0.56 + m * 0.045, 0.65, 0.55, 0.72), 5 + m * 0.9);
        if (prev) g.line(out, prev, mp, [0.29, 0.62, 1, 0.11]);
        prev = mp;
      }
    }
  });
})(window.PU);
