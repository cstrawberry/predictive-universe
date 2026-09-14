/*
 * Spacetime: causal cones, the gravitational cost sheet, predictive horizons,
 * and the black-hole information channel.
 * Sections 11-12, Appendices E and K of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var M = PU.math;
  var data = PU.data;
  var surfaceY = data.gravitySurfaceY;

  /* ------------------------------------------------------------ relativity */
  PU.scenes.register('relativity', {
    camera: { theta: 0, phi: 0.36, dist: 280 },
    draw: function (out, t) {
      var r = 82;
      var h = 98;

      /* Future and past cones bounded by the network's finite signal speed. */
      g.basisRing(out, r, [0.29, 0.62, 1, 0.18], [0, h, 0], [1, 0, 0], [0, 0, 1], 96);
      g.basisRing(out, r, [0.66, 0.33, 0.97, 0.14], [0, -h, 0], [1, 0, 0], [0, 0, 1], 96);
      for (var i = 0; i < 32; i++) {
        var a = (i / 32) * Math.PI * 2;
        g.line(out, [0, 0, 0], [Math.cos(a) * r, h, Math.sin(a) * r], [0.29, 0.62, 1, 0.14]);
        g.line(out, [0, 0, 0], [Math.cos(a) * r, -h, Math.sin(a) * r], [0.66, 0.33, 0.97, 0.11]);
      }

      /* One worldline through the emergent causal order. */
      var world = [];
      for (var w = 0; w <= 80; w++) {
        world.push([Math.sin(w * 0.16 + t * 0.35) * 13, -112 + (w / 80) * 224, Math.cos(w * 0.11 + t * 0.2) * 13]);
      }
      g.path(out, world, [1, 0.75, 0.15, 0.32]);

      /* Mass read as maintenance cost of relational information. */
      for (var k = 0; k < 5; k++) {
        var ka = t * 0.32 + (k * Math.PI * 2) / 5;
        var kp = [Math.cos(ka) * 48, Math.sin(t + k) * 16, Math.sin(ka) * 48];
        g.point(out, kp, [1, 0.75, 0.15, 0.78], 7);
        g.line(out, [0, 0, 0], kp, [1, 0.75, 0.15, 0.13]);
      }

      for (var x = -2; x <= 2; x++) {
        g.line(out, [x * 36, 0, -96], [x * 36, 0, 96], [0.9, 0.95, 1, 0.05]);
        g.line(out, [-96, 0, x * 36], [96, 0, x * 36], [0.9, 0.95, 1, 0.05]);
      }
    }
  });

  /* --------------------------------------------------------------- gravity */
  PU.scenes.register('gravity', {
    camera: { theta: 0, phi: 0.32, dist: 285 },
    time: 'scene',
    draw: function (out, t) {
      for (var s = 0; s < 140; s++) {
        var sr = 170 + M.noise(s * 5) * 260;
        var sa = M.noise(s * 5 + 1) * Math.PI * 2;
        var sy = (M.noise(s * 5 + 2) - 0.5) * 220;
        g.point(out, [Math.cos(sa) * sr, sy, Math.sin(sa) * sr], [0.45, 0.58, 0.82, 0.025 + M.noise(s + 4) * 0.035], 1.2 + M.noise(s + 8) * 1.5);
      }
      for (var h = 0; h < 38; h++) {
        var ha = (h / 38) * Math.PI * 2 + t * 0.018;
        var hr = 78 + M.noise(h) * 72;
        g.basisRing(out, 16 + M.noise(h + 2) * 30, [0.5, 0.66, 1, 0.032], [Math.cos(ha) * hr, Math.sin(t * 0.2 + h) * 20 - 12, Math.sin(ha) * hr], [1, 0, 0], [0, 0.28, 1], 48);
      }

      /* The cost sheet: predictive transport gets expensive near the source. */
      var step = 18;
      var lim = 150;
      function surf(x, z) { return [x, surfaceY(x, z), z]; }

      for (var qx = -lim; qx < lim; qx += step) {
        for (var qz = -lim; qz < lim; qz += step) {
          var d = Math.hypot(qx + step * 0.5, qz + step * 0.5);
          var well = Math.max(0, 1 - d / 190);
          g.quad(out, surf(qx, qz), surf(qx + step, qz), surf(qx + step, qz + step), surf(qx, qz + step),
            [0.04 + well * 0.23, 0.075 + well * 0.08, 0.15 + well * 0.02, 0.018 + well * 0.032]);
        }
      }
      for (var gx = -lim; gx <= lim; gx += step) {
        var prevZ = null;
        for (var z1 = -lim; z1 <= lim; z1 += 7.5) {
          var pz = surf(gx, z1);
          if (prevZ) g.line(out, prevZ, pz, [0.29, 0.62, 1, 0.085]);
          prevZ = pz;
        }
      }
      for (var gz = -lim; gz <= lim; gz += step) {
        var prevX = null;
        for (var x1 = -lim; x1 <= lim; x1 += 7.5) {
          var px = surf(x1, gz);
          if (prevX) g.line(out, prevX, px, [0.66, 0.33, 0.97, 0.064]);
          prevX = px;
        }
      }

      for (var v = 0; v < 150; v++) {
        var va = (v / 150) * Math.PI * 2 + t * 0.09;
        var vr = 34 + v * 0.58;
        var vx = Math.cos(va) * vr;
        var vz = Math.sin(va) * vr;
        g.point(out, [vx, surfaceY(vx, vz) + 14 + Math.sin(v * 0.27 + t) * 5, vz], [0.66, 0.33, 0.97, 0.08 * (1 - v / 170)], 2.8);
      }

      /* Source: concentrated update and maintenance cost. */
      var source = [0, -52, 0];
      var well0 = [0, surfaceY(0, 0) + 9, 0];
      g.line(out, source, well0, [1, 0.32, 0.22, 0.22]);
      for (var b = 0; b < 4; b++) g.wireSphere(out, 24 + b * 13 + Math.sin(t * 0.8 + b) * 2, [1, 0.23, 0.31, 0.045 - b * 0.006], source);
      g.point(out, source, [1, 0.42, 0.18, 0.88], 38 + Math.sin(t * 1.5) * 3);
      g.point(out, well0, [1, 0.75, 0.15, 0.3], 18);
      g.basisRing(out, 64, [1, 0.75, 0.15, 0.22], well0, [1, 0, 0], [0, 0, 1], 132);
      g.basisRing(out, 104, [1, 0.23, 0.31, 0.12], well0, [1, 0, 0], [0, 0, 1], 132);
      g.basisRing(out, 138, [0.29, 0.62, 1, 0.055], well0, [1, 0, 0], [0, 0, 1], 132);

      for (var e = 0; e < 28; e++) {
        var ea = (e / 28) * Math.PI * 2;
        var ex = Math.cos(ea) * 102;
        var ez = Math.sin(ea) * 102;
        g.line(out, source, [ex, surfaceY(ex, ez) + 5, ez], [1, 0.23, 0.31, 0.075]);
      }

      /* Test particles following the low-cost geometry. */
      for (var p = 0; p < 76; p++) {
        var pa = (p / 76) * Math.PI * 2 + t * 0.42;
        var pr = 42 + p * 0.82;
        var pf = (t * 0.32 + p * 0.017) % 1;
        var px2 = Math.cos(pa + pf * 0.72) * pr;
        var pz2 = Math.sin(pa + pf * 0.72) * pr;
        g.point(out, [px2, surfaceY(px2, pz2) + 11 + Math.sin(pf * Math.PI) * 22, pz2], [0, 0.9, 1, 0.42 * (1 - p / 96)], 3.8);
      }
      for (var k = 0; k < 8; k++) {
        var pts = [];
        for (var j = 0; j < 48; j++) {
          var u = j / 47;
          var ja = t * 0.14 + (k * Math.PI * 2) / 8 + u * 1.75;
          var jr = 34 + u * 118;
          var jx = Math.cos(ja) * jr;
          var jz = Math.sin(ja) * jr;
          pts.push([jx, surfaceY(jx, jz) + 17 + Math.sin(u * Math.PI) * 26, jz]);
        }
        g.path(out, pts, k % 2 ? [1, 0.75, 0.15, 0.075] : [0.45, 0.72, 1, 0.07]);
      }
    }
  });

  /* --------------------------------------------------------------- horizon */
  PU.scenes.register('horizon', {
    camera: { theta: 0, phi: 0.36, dist: 240 },
    draw: function (out, t) {
      /* Saddle boundary: accessible response on one side, not the other. */
      function h(x, z) { return 0.004 * (x * x - z * z); }

      var gridN = 16;
      var step = 14;
      for (var ix = -gridN; ix < gridN; ix++) {
        for (var iz = -gridN; iz < gridN; iz++) {
          var x = ix * step;
          var z = iz * step;
          var dist = Math.hypot(x + step * 0.5, z + step * 0.5);
          g.quad(out,
            [x, h(x, z), z],
            [x + step, h(x + step, z), z],
            [x + step, h(x + step, z + step), z + step],
            [x, h(x, z + step), z + step],
            [0.66, 0.33, 0.97, 0.055 * Math.max(0, 1 - dist / 250)]);
        }
      }
      for (var xi = -5; xi <= 5; xi++) {
        var prevA = null;
        for (var ja = -42; ja <= 42; ja += 4) {
          var pa = [xi * 22, h(xi * 22, ja * 2), ja * 2];
          if (prevA) g.line(out, prevA, pa, [0.66, 0.33, 0.97, 0.12]);
          prevA = pa;
        }
      }
      for (var zi = -4; zi <= 4; zi++) {
        var prevB = null;
        for (var jb = -55; jb <= 55; jb += 5) {
          var pb = [jb * 2, h(jb * 2, zi * 22), zi * 22];
          if (prevB) g.line(out, prevB, pb, [0.66, 0.33, 0.97, 0.1]);
          prevB = pb;
        }
      }

      /* The same MPU substrate on both sides of the boundary. */
      var nodes = data.horizon.nodes;
      var links = data.horizon.links;
      for (var l = 0; l < links.length; l++) {
        var na = nodes[links[l][0]];
        var nb = nodes[links[l][1]];
        if (!na || !nb) continue;
        g.line(out,
          [na.p[0], h(na.p[0], na.p[2]) + na.p[1], na.p[2]],
          [nb.p[0], h(nb.p[0], nb.p[2]) + nb.p[1], nb.p[2]],
          na.side === nb.side ? (na.side > 0 ? [0.29, 0.62, 1, 0.045] : [0.66, 0.33, 0.97, 0.04]) : [1, 0.75, 0.15, 0.08]);
      }
      for (var n = 0; n < nodes.length; n++) {
        var nd = nodes[n];
        g.point(out, [nd.p[0], h(nd.p[0], nd.p[2]) + nd.p[1], nd.p[2]], nd.side > 0 ? [0.29, 0.62, 1, 0.46] : [0.66, 0.33, 0.97, 0.32], 2.8 + Math.sin(t * 2 + nd.phase));
      }

      /* Quanta crossing the boundary, each crossing an entry in the ledger. */
      for (var q = 0; q < 92; q++) {
        var qa = q * 0.37 + t * 0.7;
        var qr = 20 + (q % 18) * 4;
        var qf = (t * 0.19 + q * 0.027) % 1;
        var qx = Math.cos(qa) * qr;
        var qz = Math.sin(qa) * qr;
        var qy = 68 - 136 * qf;
        var hy = h(qx, qz);
        g.point(out, [qx, hy + qy, qz], [1, 0.75, 0.15, (1 - Math.abs(qf - 0.5)) * 0.8], 4.8);
        if (Math.abs(qy) < 5) g.basisRing(out, 8 + qf * 18, [1, 0.75, 0.15, 0.1 * (1 - qf)], [qx, hy, qz], [1, 0, 0], [0, 0, 1], 32);
      }
    }
  });

  /* ------------------------------------------------------------- blackhole */
  PU.scenes.register('blackhole', {
    camera: { theta: 0, phi: 0.36, dist: 230 },
    draw: function (out, t) {
      /* Accretion sheet. */
      for (var i = 0; i < 64; i++) {
        var a0 = (i / 64) * Math.PI * 2;
        var a1 = ((i + 1) / 64) * Math.PI * 2;
        g.quad(out,
          [Math.cos(a0) * 28, 0, Math.sin(a0) * 18],
          [Math.cos(a1) * 28, 0, Math.sin(a1) * 18],
          [Math.cos(a1) * 116, -12, Math.sin(a1) * 48],
          [Math.cos(a0) * 116, -12, Math.sin(a0) * 48],
          [1, 0.36, 0.09, 0.035]);
      }
      g.basisRing(out, 58, [1, 0.62, 0.22, 0.36], [0, 0, 0], [1, 0, 0], [0, 0.16, 0.72], 160);
      g.basisRing(out, 82, [1, 0.35, 0.12, 0.13], [0, 0, 0], [1, 0, 0], [0, 0.13, 0.62], 160);

      for (var d = 0; d < 460; d++) {
        var q = d / 460;
        var dr = 28 + q * 88;
        var da = d * 2.399 + t * (1.2 - q * 0.9);
        var hot = 1 - q;
        g.point(out, [Math.cos(da) * dr, Math.sin(da * 2 + t) * 3 - 8 * q, Math.sin(da) * dr * 0.42], [1, 0.42 + 0.35 * hot, 0.14, 0.32 + 0.38 * hot], 2.2 + hot * 2.2);
      }

      for (var sgn = -1; sgn <= 1; sgn += 2) {
        for (var j = 0; j < 24; j++) {
          var ja = (j / 24) * Math.PI * 2;
          g.line(out, [Math.cos(ja) * 10, 0, Math.sin(ja) * 10], [Math.cos(ja) * 28, sgn * (52 + j * 0.9), Math.sin(ja) * 28], [0.45, 0.72, 1, 0.06]);
        }
        g.point(out, [0, sgn * 66, 0], [0.45, 0.72, 1, 0.22], 28);
      }

      /* Perspectival channels: retained globally, hard to recover outside. */
      for (var k = 0; k < 30; k++) {
        var ka = (k / 30) * Math.PI * 2 + t * 0.08;
        var pts = [];
        for (var s = 0; s < 18; s++) {
          var u = s / 17;
          var r2 = 42 + u * 96;
          var th = ka + u * 0.75 * Math.sin(k);
          pts.push([Math.cos(th) * r2, 8 + u * 64 + Math.sin(u * 6 + t + k) * 7, Math.sin(th) * r2]);
        }
        g.path(out, pts, [0.45, 0.72, 1, 0.09]);
        var f = (t * 0.18 + k * 0.031) % 1;
        var seg = Math.floor(f * (pts.length - 1));
        g.point(out, M.interp(pts[seg], pts[Math.min(seg + 1, pts.length - 1)], f * (pts.length - 1) - seg), [0.65, 0.85, 1, 0.62], 4.5);
      }

      /* Page curve, drawn as an open question rather than a closed result. */
      for (var p = 0; p < 60; p++) {
        var pf = p / 59;
        var pa = -Math.PI + pf * Math.PI * 1.2;
        g.point(out, [-96 + pf * 190, 56 + Math.sin(pa) * 34, Math.cos(pa) * 14], [0.29, 0.62, 1, 0.22 + Math.sin(pf * Math.PI) * 0.32], 3.6);
      }
    }
  });
})(window.PU);
