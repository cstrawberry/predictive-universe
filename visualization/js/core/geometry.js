/*
 * Drawing primitives.
 *
 * Scenes never touch WebGL. They append to a frame buffer object
 * (`PU.geom.buffer()`) whose flat arrays are uploaded once per frame:
 *   pp/pc/ps -> point position, colour, size
 *   lp/lc    -> line position, colour
 *   tp/tc    -> triangle position, colour
 */
(function (PU) {
  'use strict';

  function buffer() {
    return { pp: [], pc: [], ps: [], lp: [], lc: [], tp: [], tc: [] };
  }

  function point(out, p, color, size) {
    var cam = PU.camera;
    var q = cam.project(p);
    if (!q || Math.abs(q.x) > 1.5 || Math.abs(q.y) > 1.5) return;
    var c = color;
    var d = cam.depthCue(q.z);
    out.pp.push(q.x, q.y);
    out.pc.push(c[0], c[1], c[2], c[3] * d);
    out.ps.push(Math.max(0.7, size * q.s));
  }

  function line(out, a, b, color) {
    var cam = PU.camera;
    var pa = cam.project(a);
    var pb = cam.project(b);
    if (!pa || !pb) return;
    var c = color;
    var da = cam.depthCue(pa.z);
    var db = cam.depthCue(pb.z);
    out.lp.push(pa.x, pa.y, pb.x, pb.y);
    out.lc.push(c[0], c[1], c[2], c[3] * da, c[0], c[1], c[2], c[3] * db);
  }

  function tri(out, a, b, c, ca, cb, cc) {
    var cam = PU.camera;
    var pa = cam.project(a);
    var pb = cam.project(b);
    var pc = cam.project(c);
    if (!pa || !pb || !pc) return;
    var A = ca;
    var B = cb || ca;
    var C = cc || ca;
    out.tp.push(pa.x, pa.y, pb.x, pb.y, pc.x, pc.y);
    out.tc.push(
      A[0], A[1], A[2], A[3] * cam.depthCue(pa.z),
      B[0], B[1], B[2], B[3] * cam.depthCue(pb.z),
      C[0], C[1], C[2], C[3] * cam.depthCue(pc.z)
    );
  }

  function quad(out, a, b, c, d, color) {
    tri(out, a, b, c, color);
    tri(out, a, c, d, color);
  }

  function path(out, pts, color) {
    for (var i = 1; i < pts.length; i++) line(out, pts[i - 1], pts[i], color);
  }

  /* Circle in the plane spanned by u and v, centred on `center`. */
  function basisRing(out, r, color, center, u, v, segments) {
    center = center || [0, 0, 0];
    u = u || [1, 0, 0];
    v = v || [0, 0, 1];
    segments = segments || 96;
    var prev = null;
    var first = null;
    for (var i = 0; i <= segments; i++) {
      var a = (i / segments) * Math.PI * 2;
      var ca = Math.cos(a) * r;
      var sa = Math.sin(a) * r;
      var p = [
        center[0] + u[0] * ca + v[0] * sa,
        center[1] + u[1] * ca + v[1] * sa,
        center[2] + u[2] * ca + v[2] * sa
      ];
      if (i === 0) first = p;
      if (prev) line(out, prev, p, color);
      prev = p;
    }
    if (prev && first) line(out, prev, first, color);
  }

  /* Horizontal circle with an optional tilt about the x axis. */
  function ring(out, r, color, tilt, y, segments) {
    tilt = tilt || 0;
    y = y || 0;
    segments = segments || 96;
    var prev = null;
    var first = null;
    for (var i = 0; i <= segments; i++) {
      var a = (i / segments) * Math.PI * 2;
      var p = [Math.cos(a) * r, y + Math.sin(a) * Math.sin(tilt) * r, Math.sin(a) * Math.cos(tilt) * r];
      if (i === 0) first = p;
      if (prev) line(out, prev, p, color);
      prev = p;
    }
    if (prev && first) line(out, prev, first, color);
  }

  function wireSphere(out, r, color, center) {
    center = center || [0, 0, 0];
    basisRing(out, r, color, center, [1, 0, 0], [0, 0, 1], 96);
    basisRing(out, r, color, center, [1, 0, 0], [0, 1, 0], 96);
    basisRing(out, r, color, center, [0, 1, 0], [0, 0, 1], 96);
    basisRing(out, r * 0.72, [color[0], color[1], color[2], color[3] * 0.55], center, [1, 0, 0], [0, 0.55, 0.83], 96);
  }

  /* Axis-aligned wireframe cube; returns its eight corners. */
  function cube(out, size, color, center) {
    center = center || [0, 0, 0];
    var p = [];
    for (var i = 0; i < 8; i++) {
      p.push([
        center[0] + ((i & 1) * 2 - 1) * size,
        center[1] + (((i >> 1) & 1) * 2 - 1) * size,
        center[2] + (((i >> 2) & 1) * 2 - 1) * size
      ]);
    }
    for (var a = 0; a < 8; a++) {
      for (var b = a + 1; b < 8; b++) {
        var d = a ^ b;
        if (d === 1 || d === 2 || d === 4) line(out, p[a], p[b], color);
      }
    }
    return p;
  }

  PU.geom = {
    buffer: buffer,
    point: point,
    line: line,
    tri: tri,
    quad: quad,
    path: path,
    ring: ring,
    basisRing: basisRing,
    wireSphere: wireSphere,
    cube: cube
  };
})(window.PU);
