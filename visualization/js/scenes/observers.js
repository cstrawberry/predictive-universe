/*
 * Observers: frame-consistent predictive work, perspectival cost, and the
 * bounded biasing hypothesis.
 * Appendices N and M, Section 9 of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var C = PU.color;
  var data = PU.data;

  /* ------------------------------------------------------------ predictors */
  PU.scenes.register('predictors', {
    camera: { theta: 0, phi: 0.36, dist: 220 },
    draw: function (out, t) {
      var A = [-92, 0, 0];
      var B = [92, 0, 0];
      var gap = 184;

      g.wireSphere(out, 26, [1, 0.75, 0.15, 0.12], A);
      g.wireSphere(out, 22, [0.29, 0.62, 1, 0.12], B);
      g.point(out, A, [1, 0.58, 0.28, 0.85], 28 + Math.sin(t * 1.6) * 3);
      g.point(out, B, [0.45, 0.68, 1, 0.78], 24 + Math.sin(t * 1.4 + 1) * 2);

      /* Two registered views of work: kinematic load and predictive resources. */
      var aCount = 7 + Math.floor((Math.sin(t * 0.22) + 1) * 4);
      for (var i = 0; i < aCount; i++) {
        var sa = data.predictors.a[i];
        var aa = sa.a + t * sa.speed;
        var ap = [A[0] + Math.cos(aa) * sa.r, A[1] + sa.y + Math.sin(aa * 1.7) * 6, A[2] + Math.sin(aa) * sa.r];
        g.line(out, A, ap, [1, 0.75, 0.15, 0.16]);
        g.point(out, ap, [1, 0.75, 0.15, 0.72], 7);
      }
      for (var j = 0; j < 5; j++) {
        var sb = data.predictors.b[j];
        var ba = sb.a - t * sb.speed;
        var bp = [B[0] + Math.cos(ba) * sb.r, B[1] + sb.y + Math.sin(ba * 1.5) * 5, B[2] + Math.sin(ba) * sb.r];
        g.line(out, B, bp, [0.29, 0.62, 1, 0.14]);
        g.point(out, bp, [0.29, 0.62, 1, 0.7], 6);
      }

      /* The connecting pulses place both descriptions on one work ledger. */
      g.line(out, A, B, [0.9, 0.95, 1, 0.08]);
      for (var k = 0; k < 10; k++) {
        var f = (t * 0.31 + k * 0.11) % 1;
        g.point(out, [A[0] + gap * f, Math.sin(f * Math.PI) * 12, Math.sin(t + k) * 5], [1, 0.95, 0.84, 0.82], 6);
        g.point(out, [B[0] - gap * f, -Math.sin(f * Math.PI) * 12, Math.cos(t + k) * 5], [0.72, 0.86, 1, 0.7], 5.5);
      }

      /* A boundary where the required work rises sharply. */
      g.basisRing(out, 72, [1, 0.23, 0.31, 0.09], [0, -64, 0], [1, 0, 0], [0, 0, 1], 96);
      for (var p = 0; p < 28; p++) {
        var pa = (p / 28) * Math.PI * 2 + t * 0.2;
        var pr = 72 + Math.sin(p + t) * 5;
        g.point(out, [Math.cos(pa) * pr, -64, Math.sin(pa) * pr], [1, 0.23, 0.31, 0.25], 3.5);
      }
    }
  });

  /* ---------------------------------------------------------- perspectival */
  PU.scenes.register('perspectival', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      g.wireSphere(out, 28, [0.29, 0.62, 1, 0.19]);
      g.point(out, [0, 0, 0], [0.29, 0.62, 1, 0.72], 24);

      /* A branch-scoped cost profile over reflexivity and SPAP proximity. */
      for (var i = 0; i < 8; i++) {
        var h = i < 4 ? i * 3 : Math.pow(i - 2, 2.15);
        var col = i < 4 ? [0.2, 0.83, 0.6, 0.18] : i < 6 ? [1, 0.75, 0.15, 0.16] : [1, 0.23, 0.31, 0.16];
        g.basisRing(out, 28 + i * 13, col, [0, h, 0], [1, 0, 0], [0, 0, 1], 96);
      }

      /* The certified diagonal construction approaches the SPAP boundary. */
      var wallY = 58;
      g.basisRing(out, 92, [1, 0.23, 0.31, 0.13], [0, wallY, 0], [1, 0, 0], [0, 0, 1], 120);
      g.basisRing(out, 92, [1, 0.23, 0.31, 0.06], [0, wallY + 36, 0], [1, 0, 0], [0, 0, 1], 120);
      for (var w = 0; w < 24; w++) {
        var wa = (w / 24) * Math.PI * 2;
        g.line(out, [Math.cos(wa) * 92, wallY, Math.sin(wa) * 92], [Math.cos(wa) * 92, wallY + 36, Math.sin(wa) * 92], [1, 0.23, 0.31, 0.05]);
      }

      /* Packets mark external, self-model, and certified diagonal updates. */
      var packets = [
        { c: [0.2, 0.83, 0.6], r: 35, y: 2, size: 4 },
        { c: [0.2, 0.83, 0.6], r: 44, y: 5, size: 4 },
        { c: [1, 0.75, 0.15], r: 62, y: 18, size: 5 },
        { c: [1, 0.75, 0.15], r: 72, y: 30, size: 5 },
        { c: [1, 0.23, 0.31], r: 90, y: 66, size: 6 },
        { c: [1, 0.23, 0.31], r: 98, y: 72, size: 5 }
      ];
      for (var p = 0; p < packets.length; p++) {
        var pk = packets[p];
        var pa = t * 0.32 + (p * Math.PI * 2) / packets.length;
        var pos = [Math.cos(pa) * pk.r, pk.y + Math.sin(t + p) * 4, Math.sin(pa) * pk.r];
        g.point(out, pos, [pk.c[0], pk.c[1], pk.c[2], 0.86], pk.size * 2);
        g.line(out, pos, [0, 0, 0], [pk.c[0], pk.c[1], pk.c[2], 0.08]);
      }

      for (var k = 0; k < 110; k++) {
        var ka = (k / 110) * Math.PI * 2 + t * 0.22;
        var kf = (t * 0.38 + k * 0.017) % 1;
        var kr = 104 - kf * 76;
        g.point(out, [Math.cos(ka) * kr, (1 - kf) * 10, Math.sin(ka) * kr], [0.2, 0.83, 0.6, (1 - kf) * 0.28], 3.2);
      }
    }
  });

  /* --------------------------------------------------------- consciousness */
  PU.scenes.register('consciousness', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      /* Integrated aggregate: an icosahedral shell of coupled units. */
      var gr = (1 + Math.sqrt(5)) / 2;
      var raw = [
        [-1, gr, 0], [1, gr, 0], [-1, -gr, 0], [1, -gr, 0],
        [0, -1, gr], [0, 1, gr], [0, -1, -gr], [0, 1, -gr],
        [gr, 0, -1], [gr, 0, 1], [-gr, 0, -1], [-gr, 0, 1]
      ];
      var verts = [];
      for (var v = 0; v < raw.length; v++) {
        var m = 62 / Math.hypot(raw[v][0], raw[v][1], raw[v][2]);
        verts.push([raw[v][0] * m, raw[v][1] * m, raw[v][2] * m]);
      }
      for (var a = 0; a < verts.length; a++) {
        for (var b = a + 1; b < verts.length; b++) {
          if (PU.math.dist3(verts[a], verts[b]) < 78) g.line(out, verts[a], verts[b], [0.66, 0.33, 0.97, 0.13]);
        }
      }
      for (var q = 0; q < verts.length; q++) {
        g.point(out, verts[q], C.phase[(q + Math.floor(t * 2)) % 3], 7.5);
      }

      for (var i = 0; i < 96; i++) {
        var ia = i * 2.399 + t * 0.08;
        var iy = -54 + (i / 95) * 108;
        var ir = Math.sqrt(Math.max(0, 1 - Math.pow(iy / 58, 2))) * 58;
        g.point(out, [Math.cos(ia) * ir, iy, Math.sin(ia) * ir], C.phase[(i + Math.floor(t * 2 + i * 0.03)) % 3], 3.5);
      }

      /* The declared bounded-bias branch keeps operational CC below 0.5. */
      for (var r = 0; r < 5; r++) {
        g.basisRing(out, 38 + r * 15, [0.66, 0.33, 0.97, 0.08 - r * 0.008], [0, 0, 0], [1, 0, 0], [0, Math.sin(r * 0.7 + t * 0.05) * 0.25, 1], 96);
      }

      /* The proposed context-bias field. */
      for (var k = 0; k < 80; k++) {
        var ka = (k / 80) * Math.PI * 2;
        var kr = 64 + Math.cos(ka * 2 + t * 0.7) * 12;
        g.point(out, [Math.cos(ka) * kr, -100, Math.sin(ka) * kr], [0.2, 0.83, 0.6, 0.22], 3.4);
      }
    }
  });
})(window.PU);
