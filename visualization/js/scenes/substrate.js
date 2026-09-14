/*
 * Substrate: the Minimal Predictive Unit, the network it forms, and the
 * PCE relaxation that makes that network regular.
 * Sections 5 and 7, Appendix C of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var M = PU.math;
  var C = PU.color;
  var data = PU.data;

  /* ------------------------------------------------------------------- mpu */
  PU.scenes.register('mpu', {
    camera: { theta: 0, phi: 0.36, dist: 300 },
    draw: function (out, t) {
      /* d0 = 8: three binary roles, eight distinguishable carrier states. */
      var pts = [];
      for (var i = 0; i < 8; i++) {
        pts.push([((i & 1) * 2 - 1) * 36, (((i >> 1) & 1) * 2 - 1) * 36, (((i >> 2) & 1) * 2 - 1) * 36]);
      }
      for (var e = 0; e < data.cubeEdges.length; e++) {
        g.line(out, pts[data.cubeEdges[e][0]], pts[data.cubeEdges[e][1]], [0.29, 0.62, 1, 0.18]);
      }
      for (var p = 0; p < pts.length; p++) {
        g.point(out, pts[p], C.phase[(p + Math.floor(t * 2)) % 3], 9);
      }

      /* M = 2ab = 24 interface channels reaching out of the unit. */
      for (var c = 0; c < 24; c++) {
        var a = (c / 24) * Math.PI * 2;
        var phi = Math.acos((2 * ((c * 13) % 24)) / 23 - 1);
        var dir = [Math.sin(phi) * Math.cos(a), Math.cos(phi), Math.sin(phi) * Math.sin(a)];
        var cp = [dir[0] * 112, dir[1] * 76, dir[2] * 112];
        g.line(out, [0, 0, 0], cp, [0, 0.9, 1, 0.13]);
        g.point(out, cp, [0, 0.9, 1, 0.45], 5);
      }

      /* State, prediction and control registers below the carrier. */
      var regs = [[-54, 0, 0], [0, 0, 0], [54, 0, 0]];
      for (var r = 0; r < regs.length; r++) {
        g.point(out, [regs[r][0], regs[r][1] - 72 + Math.sin(t + r) * 5, regs[r][2]], [C.phase[r][0], C.phase[r][1], C.phase[r][2], 0.9], 12);
      }
    }
  });

  /* --------------------------------------------------------------- network */
  PU.scenes.register('network', {
    camera: { theta: 0, phi: 0.36, dist: 455 },
    draw: function (out, t) {
      var net = data.network;

      for (var s = 0; s < net.stars.length; s++) {
        var star = net.stars[s];
        g.point(out, star.p, [0.45, 0.62, 0.9, 0.25 + star.b * 0.35], star.size * 1.3);
      }
      for (var f = 0; f < net.filaments.length; f++) {
        g.path(out, net.filaments[f], [0.18, 0.32, 0.55, 0.08]);
      }

      for (var c = 0; c < net.clusters.length; c++) {
        var cl = net.clusters[c];
        g.point(out, cl.center, C.hsl(cl.hue, 0.5, 0.3, 0.08), cl.size * 3.2);
        for (var e = 0; e < cl.edges.length; e++) {
          g.line(out, cl.nodes[cl.edges[e][0]].p, cl.nodes[cl.edges[e][1]].p, C.hsl(cl.hue, 0.45, 0.42, 0.18));
        }
        for (var n = 0; n < cl.nodes.length; n++) {
          var node = cl.nodes[n];
          /* Each node steps through predict -> verify -> update. */
          if (Math.sin(t * 2 + node.off) > 0.985) node.phase = (node.phase + 1) % 3;
          var pulse = 0.72 + Math.sin(t * 3 + node.off) * 0.28;
          var col = C.phase[node.phase];
          g.point(out, node.p, [col[0] * pulse, col[1] * pulse, col[2] * pulse, 0.85], node.size * 1.4);
        }
      }
    }
  });

  /* ---------------------------------------------------------------- pcegeo */
  PU.scenes.register('pcegeo', {
    camera: { theta: 0, phi: 0.36, dist: 215 },
    draw: function (out, t) {
      /* Nodes slide between their irregular start and their lattice target. */
      var relax = M.easeInOut(0.5 + 0.5 * Math.sin(t * 0.28 - Math.PI / 2));
      var nodes = data.pce;

      for (var i = 0; i < nodes.length; i++) {
        var n = nodes[i];
        var p = M.interp(n.chaos, n.target, relax);
        var jitter = Math.sin(t + n.phase) * 22 * (1 - relax);
        g.point(out, [p[0], p[1] + jitter, p[2]], [1 - relax * 0.7, 0.23 + 0.55 * relax, 0.31 + 0.69 * relax, 0.62], 5.5);
        g.point(out, n.chaos, [1, 0.23, 0.31, 0.08 * (1 - relax)], 3);
        g.point(out, n.target, [0.29, 0.9, 1, 0.1 + 0.2 * relax], 2.8);
      }

      for (var a = 0; a < nodes.length; a++) {
        for (var b = a + 1; b < nodes.length; b++) {
          var ta = nodes[a].target;
          var tb = nodes[b].target;
          if (Math.hypot(ta[0] - tb[0], ta[2] - tb[2]) >= 22) continue;
          g.line(out, M.interp(nodes[a].chaos, ta, relax), M.interp(nodes[b].chaos, tb, relax), [0.29, 0.9, 1, 0.12 * relax]);
        }
      }

      for (var k = 0; k < nodes.length; k += 3) {
        var n0 = nodes[k];
        var n1 = nodes[k + 1];
        var n2 = nodes[k + 2];
        if (!n0 || !n1 || !n2) continue;
        g.tri(out,
          M.interp(n0.chaos, n0.target, relax),
          M.interp(n1.chaos, n1.target, relax),
          M.interp(n2.chaos, n2.target, relax),
          [0.29, 0.9, 1, 0.025 * relax]);
      }

      g.basisRing(out, 142, [1, 0.75, 0.15, 0.07], [0, 0, 0], [1, 0, 0], [0, 0, 1], 120);
    }
  });
})(window.PU);
