/*
 * Cosmology: the scale-dependent dark-sector benchmark and a conditional
 * false-vacuum bounce calculation.
 * Appendices I, L and U of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var M = PU.math;
  var C = PU.color;
  var data = PU.data;

  /* ------------------------------------------------------------------ dark */
  PU.scenes.register('dark', {
    camera: { theta: 0, phi: 0.36, dist: 335 },
    draw: function (out, t) {
      /* Visible matter: a three-armed spiral. */
      for (var i = 0; i < 760; i++) {
        var arm = i % 3;
        var q = i / 760;
        var a = q * 5.6 + (arm * Math.PI * 2) / 3 + t * 0.035;
        var r = 6 + q * 112;
        var spread = 1 + q * 11;
        var jx = (M.noise(i * 3) - 0.5) * spread;
        var jz = (M.noise(i * 3 + 1) - 0.5) * spread;
        var jy = (M.noise(i * 3 + 2) - 0.5) * spread * 0.18;
        g.point(out, [Math.cos(a) * r + jx, jy, Math.sin(a) * r + jz], C.hsl(0.57 + q * 0.08, 0.55, 0.42 + M.noise(i) * 0.26, 0.68), 1.9);
      }
      g.point(out, [0, 0, 0], [0.29, 0.36, 1, 0.48], 30);

      /* Effective response, drawn as a model layer rather than a substance. */
      g.wireSphere(out, 128, [0.2, 0.2, 0.7, 0.045]);
      for (var h = 0; h < 5; h++) {
        g.basisRing(out, 44 + h * 19, C.hsl(0.08 + h * 0.03, 0.7, 0.45 + h * 0.04, 0.1 - h * 0.01), [0, 0, 0], [1, 0, 0], [0, 0, 1], 120);
      }
      /* Acceleration scale tied to cosmological parameters on this branch. */
      g.basisRing(out, 92, [1, 0.75, 0.15, 0.13], [0, 0, 0], [1, 0, 0], [0, 0, 1], 120);

      /* Flat rotation markers: the empirical tension being addressed. */
      for (var k = 0; k < 64; k++) {
        var ka = (k / 64) * Math.PI * 2 + t * 0.5;
        var kr = 42 + (k / 64) * 76;
        var kp = [Math.cos(ka) * kr, 18 + Math.sin(ka * 2) * 4, Math.sin(ka) * kr];
        g.point(out, kp, [0, 0.9, 1, 0.52], 4.2);
        g.line(out, kp, [Math.cos(ka + 0.12) * kr, 18, Math.sin(ka + 0.12) * kr], [0, 0.9, 1, 0.08]);
      }
    }
  });

  /* ---------------------------------------------------------------- vacuum */
  PU.scenes.register('vacuum', {
    camera: { theta: 0, phi: 0.36, dist: 230 },
    draw: function (out, t) {
      var scaleY = 0.72;
      var offY = -22;
      function surf(x, z) { return [x, data.terrainHeight(x, z) * scaleY + offY, z]; }

      /* Effective-potential sketch for the conditional bounce calculation. */
      for (var x = -120; x < 120; x += 12) {
        for (var z = -120; z < 120; z += 12) {
          var a = surf(x, z);
          var b = surf(x + 12, z);
          var c = surf(x + 12, z + 12);
          var d = surf(x, z + 12);
          var mid = (a[1] + b[1] + c[1] + d[1]) * 0.25;
          var glow = Math.max(0, 1 - Math.hypot(x, z) / 170);
          var warm = M.smooth01(-44, -14, mid);
          g.quad(out, a, b, c, d, [0.08 + warm * 0.24, 0.09 + warm * 0.11, 0.16 + warm * 0.04, 0.032 + glow * 0.028]);
        }
      }
      for (var gx = -120; gx <= 120; gx += 20) {
        var prevZ = null;
        for (var z1 = -120; z1 <= 120; z1 += 8) {
          var pz = surf(gx, z1);
          if (prevZ) g.line(out, prevZ, pz, [0.29, 0.62, 1, 0.08]);
          prevZ = pz;
        }
      }
      for (var gz = -120; gz <= 120; gz += 20) {
        var prevX = null;
        for (var x1 = -120; x1 <= 120; x1 += 8) {
          var px = surf(x1, gz);
          if (prevX) g.line(out, prevX, px, [0.66, 0.33, 0.97, 0.07]);
          prevX = px;
        }
      }

      /* A marked false-vacuum state and comparison extrema. */
      for (var v = 0; v < data.vacuumValleys.length; v++) {
        var vv = data.vacuumValleys[v];
        var vy = data.terrainHeight(vv[0], vv[1]) * scaleY + offY + 6;
        g.point(out, [vv[0], vy, vv[1]], v === 0 ? [1, 0.75, 0.15, 0.72] : [0.45, 0.68, 1, 0.28], v === 0 ? 14 : 8);
      }

      /* Euclidean bounce profile, shown on a slow cycle. */
      var ph = (t % 18) / 18;
      var grow = M.smooth01(0.12, 0.42, ph) * (1 - M.smooth01(0.86, 1, ph));
      var center = [0, data.terrainHeight(0, 0) * scaleY + offY + 12, 0];
      g.wireSphere(out, 12 + grow * 54, [1, 0.62, 0.28, 0.18 * grow], center);
      g.basisRing(out, 24 + grow * 76, [1, 0.75, 0.15, 0.12 * grow], center, [1, 0, 0], [0, 0, 1], 96);
      for (var k = 0; k < 80; k++) {
        var ka = (k / 80) * Math.PI * 2 + t * 0.5;
        var kr = 12 + grow * (24 + k * 0.7);
        g.point(out, [Math.cos(ka) * kr, center[1] + Math.sin(ka * 3) * 8, Math.sin(ka) * kr], [1, 0.55, 0.22, 0.24 * grow], 3.4);
      }
    }
  });
})(window.PU);
