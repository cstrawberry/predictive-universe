/*
 * Foundations: Cogito, Space of Becoming, PPI/PCE ledger.
 * Sections 1-3 and 6 of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var M = PU.math;
  var data = PU.data;

  /* ---------------------------------------------------------------- cogito */
  PU.scenes.register('cogito', {
    camera: { theta: 0, phi: 0.36, dist: 205 },
    draw: function (out, t) {
      /* Field of undetermined possibility around the certain point. */
      for (var i = 0; i < 150; i++) {
        var r = 70 + M.noise(i * 4) * 160;
        var a = M.noise(i * 4 + 1) * Math.PI * 2;
        var y = (M.noise(i * 4 + 2) - 0.5) * 150;
        g.point(out, [Math.cos(a) * r, y, Math.sin(a) * r], [0.62, 0.72, 0.95, 0.035 + M.noise(i + 3) * 0.045], 1.5 + M.noise(i + 8) * 1.4);
      }

      var pulse = 0.86 + 0.14 * Math.sin(t * 1.4);
      g.point(out, [0, 0, 0], [1, 0.75, 0.15, 0.92], 34 + 6 * pulse);
      g.wireSphere(out, 34, [1, 0.75, 0.15, 0.08], [0, 0, 0]);
      g.basisRing(out, 68, [1, 0.75, 0.15, 0.08], [0, 0, 0], [1, 0, 0], [0, 0, 1], 120);

      /* K0 = 3: the three role registers the loop cannot do without. */
      for (var k = 0; k < 3; k++) {
        var ka = (k * Math.PI * 2) / 3 + t * 0.22;
        var kp = [Math.cos(ka) * 54, 38 + Math.sin(t + k) * 5, Math.sin(ka) * 54];
        g.line(out, [0, 0, 0], kp, [0.29, 0.62, 1, 0.13]);
        g.point(out, kp, [0.29, 0.62, 1, 0.76], 11);
      }

      /* Downstream constants, held faint: d0, M, D. */
      var ghosts = [[-72, -54, -28], [72, -54, -28], [0, -74, 62], [0, 76, 0]];
      for (var q = 0; q < ghosts.length; q++) {
        g.line(out, [0, 0, 0], ghosts[q], q < 2 ? [1, 0.75, 0.15, 0.055] : [0.9, 0.95, 1, 0.045]);
        g.point(out, ghosts[q], q < 2 ? [1, 0.75, 0.15, 0.16] : [0.66, 0.33, 0.97, 0.12], q < 2 ? 9 : 7);
      }
    }
  });

  /* -------------------------------------------------------------- becoming */
  PU.scenes.register('becoming', {
    camera: { theta: 1.34, phi: 0.08, dist: 200 },
    draw: function (out, t) {
      var x0 = -178;
      var x1 = 132;
      var z0 = -76;
      var z1 = 76;
      var floorY = -58;
      var ceilY = 58;

      /* The alpha floor and beta ceiling drawn as breathing bounds. */
      function wall(y, base, phase) {
        var cols = 26;
        var rows = 8;
        for (var ix = 0; ix < cols; ix++) {
          for (var iz = 0; iz < rows; iz++) {
            var xa = x0 + ((x1 - x0) * ix) / cols;
            var xb = x0 + ((x1 - x0) * (ix + 1)) / cols;
            var za = z0 + ((z1 - z0) * iz) / rows;
            var zb = z0 + ((z1 - z0) * (iz + 1)) / rows;
            var u = (ix + 0.5) / cols;
            var edge = Math.pow(Math.sin(u * Math.PI), 0.58);
            var pulse = 0.72 + 0.28 * Math.sin(t * phase + u * 8 + iz * 0.7);
            g.quad(out, [xa, y, za], [xb, y, za], [xb, y, zb], [xa, y, zb], [base[0], base[1], base[2], (0.014 + edge * 0.033) * pulse]);
          }
        }
        for (var lx = 0; lx <= 48; lx++) {
          var x = x0 + ((x1 - x0) * lx) / 48;
          var lu = lx / 48;
          var ledge = Math.pow(Math.sin(lu * Math.PI), 0.55);
          g.line(out, [x, y, z0], [x, y, z1], [base[0], base[1], base[2], 0.035 + ledge * 0.08]);
        }
        for (var lz = 0; lz <= 14; lz++) {
          var z = z0 + ((z1 - z0) * lz) / 14;
          g.line(out, [x0, y, z], [x1, y, z], [base[0], base[1], base[2], 0.045]);
        }
      }

      wall(floorY, [1, 0.26, 0.12], 1.7);
      wall(ceilY, [0.35, 0.58, 1], 0.9);

      for (var s = 0; s < 150; s++) {
        g.point(out, [
          -210 + M.noise(s * 3) * 390,
          -110 + M.noise(s * 3 + 1) * 220,
          -130 + M.noise(s * 3 + 2) * 260
        ], [0.64, 0.56, 0.82, 0.06 + M.noise(s) * 0.08], 1.2 + M.noise(s + 7) * 1.3);
      }

      var edges = [z0, z1];
      for (var e = 0; e < edges.length; e++) {
        var z2 = edges[e];
        g.line(out, [x0, floorY, z2], [x1, floorY, z2], [1, 0.25, 0.12, 0.06]);
        g.line(out, [x0, ceilY, z2], [x1, ceilY, z2], [0.35, 0.58, 1, 0.06]);
        g.line(out, [x0, floorY, z2], [x0, ceilY, z2], [0.9, 0.95, 1, 0.035]);
        g.line(out, [x1, floorY, z2], [x1, ceilY, z2], [0.9, 0.95, 1, 0.035]);
      }

      /* Centre line: the target the corridor is organised around. */
      for (var c = 0; c < 36; c++) {
        var f = c / 35;
        var breath = 0.8 + 0.2 * Math.sin(t * 1.2 + c * 0.37);
        g.point(out, [x0 + (x1 - x0) * f, 0, 0], [1, 0.72, 0.28, 0.11 * breath], 5.5);
      }

      /* Each mover is one predictor tracked across the band. Some fail out
         through the floor, some freeze against the ceiling. */
      for (var i = 0; i < data.becoming.length; i++) {
        var m = data.becoming[i];
        var mf = (m.phase + t * m.speed) % 1;
        var mx = x0 + (x1 - x0) * mf;
        var centerPull = Math.sin(Math.PI * mf);
        var osc = Math.sin(t * 0.8 + m.phase * 6.28) + 0.55 * Math.sin(mf * Math.PI * 6 + m.phase * 9.1);
        var my = m.baseY + osc * m.amp * (0.45 + 0.55 * centerPull);
        var mz = m.lane + Math.sin(t * 0.42 + i) * 5;
        var state = 'alive';
        var mix = 0;
        if (m.risk < 0.075 && mf > 0.56) {
          state = 'failing';
          mix = M.smooth01(0.56, 0.82, mf);
          my = my * (1 - mix) + (-54 + Math.sin(t * 2.1 + i) * 2) * mix;
        } else if (m.risk < 0.15 && mf > 0.5) {
          state = 'frozen';
          mix = M.smooth01(0.5, 0.78, mf);
          my = my * (1 - mix) + (54 + Math.sin(t * 1.1 + i) * 1.5) * mix;
        }
        var d = M.clamp(my / 54, -1, 1);
        var col;
        if (state === 'failing') col = [1, 0.22 * (1 - mix), 0.08, 0.38 + 0.42 * mix];
        else if (state === 'frozen') col = [0.42, 0.68, 1, 0.34 + 0.34 * mix];
        else if (d < 0) {
          var warm = -d;
          col = [0.92 + warm * 0.08, 0.76 - warm * 0.46, 0.44 - warm * 0.25, 0.58];
        } else {
          col = [0.92 - d * 0.42, 0.76 - d * 0.16, 0.44 + d * 0.48, 0.56];
        }
        g.point(out, [mx, my, mz], col, state === 'alive' ? 5.2 + centerPull * 2.6 : 5.8 + mix * 3.8);
        if (i % 7 === 0) g.line(out, [mx, 0, mz * 0.2], [mx, my, mz], [col[0], col[1], col[2], 0.06 + 0.06 * mix]);
      }
    }
  });

  /* ---------------------------------------------------------------- ledger */
  PU.scenes.register('ledger', {
    camera: { theta: 0, phi: 0.24, dist: 230 },
    draw: function (out, t) {
      var leftX = -132;
      var midX = -8;
      var rightX = 112;
      var statuses = [
        { p: [rightX, 58, 0], c: [0.2, 0.83, 0.6, 0.74], r: 24, rate: 0.36 },
        { p: [rightX, 8, 0], c: [1, 0.75, 0.15, 0.68], r: 20, rate: 0.5 },
        { p: [rightX, -42, 0], c: [1, 0.23, 0.31, 0.58], r: 16, rate: 0.65 }
      ];

      /* Left: finite records entering the ledger. */
      for (var row = 0; row < 6; row++) {
        var y = 54 - row * 21;
        var z = row % 2 ? 28 : -28;
        var p = [leftX, y, z];
        var target = [midX, y * 0.35, z * 0.45];
        g.point(out, p, [0.62, 0.74, 1, 0.58], 7.5);
        g.line(out, p, target, [0.62, 0.74, 1, 0.08]);
        g.point(out, M.interp(p, target, (t * 0.2 + row * 0.12) % 1), [0.9, 0.95, 1, 0.7], 4.5);
      }

      /* Middle: the response quotient collapsing surplus labels. */
      for (var q = 0; q < 4; q++) {
        var qa = t * 0.28 + (q * Math.PI) / 2;
        var qp = [midX + Math.cos(qa) * 28, Math.sin(qa * 1.4) * 10, Math.sin(qa) * 28];
        g.point(out, qp, [0.66, 0.33, 0.97, 0.66], 9);
        g.line(out, qp, [midX, 0, 0], [0.66, 0.33, 0.97, 0.12]);
      }
      g.wireSphere(out, 32, [0.66, 0.33, 0.97, 0.12], [midX, 0, 0]);
      g.point(out, [midX, 0, 0], [1, 0.75, 0.15, 0.82], 16);

      /* Right: certificate gates, closed through amber to open. */
      for (var s = 0; s < statuses.length; s++) {
        var st = statuses[s];
        g.basisRing(out, st.r + Math.sin(t * st.rate + s) * 2, [st.c[0], st.c[1], st.c[2], 0.18], st.p, [1, 0, 0], [0, 0, 1], 72);
        g.point(out, st.p, st.c, 12);
        g.line(out, [midX, 0, 0], st.p, [st.c[0], st.c[1], st.c[2], 0.09]);
      }
      for (var k = 0; k < 18; k++) {
        var tp = statuses[k % statuses.length].p;
        var kp = M.interp([midX, 0, 0], tp, (t * 0.16 + k * 0.07) % 1);
        g.point(out, kp, k % 3 === 0 ? [0.2, 0.83, 0.6, 0.55] : k % 3 === 1 ? [1, 0.75, 0.15, 0.52] : [1, 0.23, 0.31, 0.42], 3.8);
      }

      g.basisRing(out, 72, [0.29, 0.62, 1, 0.06], [48, 0, 0], [1, 0, 0], [0, 0, 1], 96);
      g.basisRing(out, 95, [1, 0.23, 0.31, 0.045], [48, 0, 0], [1, 0, 0], [0, 0.35, 1], 96);
    }
  });
})(window.PU);
