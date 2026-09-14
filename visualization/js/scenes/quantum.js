/*
 * Quantum branch: Bloch sphere, spinor double cover, Golay-protected records.
 * Section 8, Appendix G, Section 13.9 of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;

  /* --------------------------------------------------------------- quantum */
  PU.scenes.register('quantum', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      g.wireSphere(out, 86, [0.29, 0.62, 1, 0.2]);
      g.basisRing(out, 86, [0, 0.9, 1, 0.12], [0, 0, 0], [1, 0, 0], [0, 0, 1], 96);

      var th = 1.05 + Math.sin(t * 0.55) * 0.48;
      var ph = t * 0.82;
      var tip = [Math.sin(th) * Math.cos(ph) * 86, Math.cos(th) * 86, Math.sin(th) * Math.sin(ph) * 86];
      g.line(out, [0, 0, 0], tip, [0, 0.9, 1, 0.56]);
      g.point(out, tip, [0, 0.9, 1, 0.96], 14);
      g.point(out, [0, 86, 0], [0.29, 0.62, 1, 0.5], 8);
      g.point(out, [0, -86, 0], [0.66, 0.33, 0.97, 0.5], 8);

      /* Born weights for the two poles, read off the polar angle. */
      var p0 = Math.pow(Math.cos(th / 2), 2);
      var p1 = Math.pow(Math.sin(th / 2), 2);
      for (var i = 0; i < 90; i++) {
        var a = (i / 90) * Math.PI * 2;
        var r0 = 34 + 28 * (p0 + 0.25 * Math.sin(a * 2 + t));
        var r1 = 34 + 28 * (p1 - 0.25 * Math.sin(a * 2 + t));
        g.point(out, [Math.cos(a) * r0, 112, Math.sin(a) * r0], [0.29, 0.62, 1, 0.22 + 0.35 * p0], 4);
        g.point(out, [Math.cos(a) * r1, -112, Math.sin(a) * r1], [0.66, 0.33, 0.97, 0.18 + 0.35 * p1], 4);
      }

      /* Phase spokes: the amplitude carries direction, not just weight. */
      for (var k = 0; k < 12; k++) {
        var ka = (k / 12) * Math.PI * 2 + t * 0.25;
        g.line(out, [0, 0, 0], [Math.cos(ka) * 86, Math.sin(ka * 2) * 28, Math.sin(ka) * 86], [0.66, 0.33, 0.97, 0.08]);
      }
    }
  });

  /* ---------------------------------------------------------------- spinor */
  PU.scenes.register('spinor', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      g.wireSphere(out, 84, [0.29, 0.62, 1, 0.18]);

      /* One traversal covers 4 pi: the state only returns after two turns. */
      var prev = null;
      for (var i = 0; i <= 220; i++) {
        var u = (i / 220) * Math.PI * 4 + t * 0.1;
        var p = [Math.cos(u) * 58, Math.sin(u / 2) * 46, Math.sin(u) * 58];
        if (prev) g.line(out, prev, p, i < 110 ? [0.29, 0.62, 1, 0.32] : [0.66, 0.33, 0.97, 0.32]);
        prev = p;
      }

      var uu = (t * 0.85) % (Math.PI * 4);
      var tip = [Math.cos(uu) * 66, Math.sin(uu / 2) * 54, Math.sin(uu) * 66];
      var mate = [tip[0], -tip[1], tip[2]];
      g.line(out, [0, 0, 0], tip, [0, 0.9, 1, 0.6]);
      g.point(out, tip, [0, 0.9, 1, 1], 14);
      /* A 2 pi shift reaches the other lift sheet over one spatial orientation. */
      g.line(out, [0, 0, 0], mate, [1, 0.23, 0.31, 0.24]);
      g.point(out, mate, [1, 0.23, 0.31, 0.86], 11);
    }
  });

  /* ----------------------------------------------------------------- golay */
  PU.scenes.register('golay', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      /* 24 coordinates in a 4 x 6 grid: 12 information, 12 parity. */
      var nodes = [];
      for (var i = 0; i < 24; i++) {
        nodes.push([((i % 6) - 2.5) * 34, (1.5 - Math.floor(i / 6)) * 30, 0]);
      }

      /* Chosen systematic representative G=[I|P] from Appendix Z. */
      var parity = [
        [0,1,1,1,1,1,1,1,1,1,1,1],
        [1,1,1,0,1,1,1,0,0,0,1,0],
        [1,1,0,1,1,1,0,0,0,1,0,1],
        [1,0,1,1,1,0,0,0,1,0,1,1],
        [1,1,1,1,0,0,0,1,0,1,1,0],
        [1,1,1,0,0,0,1,0,1,1,0,1],
        [1,1,0,0,0,1,0,1,1,0,1,1],
        [1,0,0,0,1,0,1,1,0,1,1,1],
        [1,0,0,1,0,1,1,0,1,1,1,0],
        [1,0,1,0,1,1,0,1,1,1,0,0],
        [1,1,0,1,1,0,1,1,1,0,0,0],
        [1,0,1,1,0,1,1,1,0,0,0,1]
      ];
      var dependencies = [];
      for (var row = 0; row < 12; row++) {
        for (var col = 0; col < 12; col++) {
          if (!parity[row][col]) continue;
          dependencies.push([row, col]);
          g.line(out, nodes[row], nodes[col + 12], [0.66, 0.33, 0.97, 0.035]);
        }
      }
      for (var n = 0; n < nodes.length; n++) {
        g.point(out, nodes[n], n < 12 ? [0.29, 0.62, 1, 0.85] : [0.66, 0.33, 0.97, 0.85], 10);
      }

      /* Animated syndrome paths follow relations in the displayed matrix. */
      for (var p = 0; p < 18; p++) {
        var relation = dependencies[(p * 7) % dependencies.length];
        var a = nodes[relation[0]];
        var b = nodes[relation[1] + 12];
        var f = (t * 0.45 + p * 0.08) % 1;
        g.point(out, [a[0] + (b[0] - a[0]) * f, a[1] + (b[1] - a[1]) * f, 12 * Math.sin(f * Math.PI)], [0, 0.9, 1, 0.55], 5);
      }

      g.ring(out, 128, [0.29, 0.62, 1, 0.09], Math.PI / 2);
    }
  });
})(window.PU);
