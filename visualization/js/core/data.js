/*
 * Precomputed scene data.
 *
 * Everything here is generated once, from a fixed seed, so the layouts are
 * identical on every load and scenes stay cheap to redraw each frame.
 */
(function (PU) {
  'use strict';

  var M = PU.math;
  var rnd = M.rng(12031986);
  var sphere = function (r) { return M.randSphere(r, rnd); };

  /* ---- MPU substrate: field stars, clustered aggregates, filaments ---- */
  var network = { stars: [], clusters: [], filaments: [] };

  for (var i = 0; i < 900; i++) {
    network.stars.push({ p: sphere(2300 + rnd() * 1700), size: 0.6 + rnd() * 1.4, b: 0.25 + rnd() * 0.65 });
  }

  for (var c = 0; c < 20; c++) {
    var center = [(rnd() - 0.5) * 760, (rnd() - 0.5) * 520, (rnd() - 0.5) * 760];
    var size = 28 + rnd() * 62;
    var count = 24 + Math.floor(rnd() * 54);
    var nodes = [];
    var edges = [];
    for (var n = 0; n < count; n++) {
      var o = sphere(size);
      nodes.push({
        p: [center[0] + o[0], center[1] + o[1], center[2] + o[2]],
        phase: Math.floor(rnd() * 3),
        off: rnd() * 6.28,
        size: 2 + rnd() * 2.4
      });
    }
    for (var a = 0; a < nodes.length; a++) {
      for (var b = a + 1; b < nodes.length; b++) {
        if (M.dist3(nodes[a].p, nodes[b].p) < size * 0.58 && rnd() < 0.28) edges.push([a, b]);
      }
    }
    network.clusters.push({ center: center, size: size, hue: 0.58 + rnd() * 0.12, nodes: nodes, edges: edges });
  }

  for (var f = 0; f < 28; f++) {
    var pts = [];
    var fx = (rnd() - 0.5) * 950;
    var fy = (rnd() - 0.5) * 650;
    var fz = (rnd() - 0.5) * 950;
    for (var s = 0; s < 7; s++) {
      pts.push([fx, fy, fz]);
      fx += (rnd() - 0.5) * 260;
      fy += (rnd() - 0.5) * 190;
      fz += (rnd() - 0.5) * 260;
    }
    network.filaments.push(pts);
  }

  /* ---- Space of Becoming: predictors drifting through the viability band ---- */
  var becoming = [];
  for (var k = 0; k < 220; k++) {
    becoming.push({
      phase: rnd(),
      lane: (rnd() - 0.5) * 116,
      baseY: (rnd() - 0.5) * 18,
      drift: (rnd() - 0.5) * 1.4,
      bias: rnd(),
      speed: 0.044 + rnd() * 0.036,
      risk: rnd(),
      amp: 10 + rnd() * 18
    });
  }

  /* ---- Predictive horizon: substrate split across a boundary ---- */
  var horizon = { nodes: [], links: [] };
  for (var h = 0; h < 420; h++) {
    var hy = (rnd() - 0.5) * 56 + (rnd() > 0.5 ? 22 : -22);
    horizon.nodes.push({ p: [(rnd() - 0.5) * 210, hy, (rnd() - 0.5) * 160], side: hy > 0 ? 1 : -1, phase: rnd() * 6.28 });
  }
  for (var hl = 0; hl < 300; hl++) {
    var hi = Math.floor(rnd() * horizon.nodes.length);
    var hj = Math.floor(rnd() * horizon.nodes.length);
    if (hi !== hj) horizon.links.push([hi, hj]);
  }

  /* ---- PCE geometry: each node has an irregular start and a lattice target ---- */
  var pce = [];
  for (var q = -8; q <= 8; q++) {
    for (var r = -5; r <= 5; r++) {
      var target = [(q + r * 0.5) * 18, 0, r * 15.6];
      if (Math.hypot(target[0], target[2]) >= 155) continue;
      pce.push({
        target: target,
        chaos: [target[0] + (rnd() - 0.5) * 130, (rnd() - 0.5) * 58, target[2] + (rnd() - 0.5) * 96],
        phase: rnd() * 6.28
      });
    }
  }

  /* ---- Prediction relativity: internal structure of two predictors ---- */
  var predictors = { a: [], b: [] };
  for (var p = 0; p < 16; p++) {
    predictors.a.push({ r: 22 + rnd() * 18, a: rnd() * 6.28, y: (rnd() - 0.5) * 26, speed: 0.35 + rnd() * 0.45 });
    predictors.b.push({ r: 18 + rnd() * 12, a: rnd() * 6.28, y: (rnd() - 0.5) * 20, speed: 0.25 + rnd() * 0.3 });
  }

  /* ---- D4 root system: the 24 interface modes, M = 2ab = 24 ---- */
  var roots24 = [];
  for (var ri = 0; ri < 4; ri++) {
    for (var rj = ri + 1; rj < 4; rj++) {
      for (var sa = -1; sa <= 1; sa += 2) {
        for (var sb = -1; sb <= 1; sb += 2) {
          var v = [0, 0, 0, 0];
          v[ri] = sa;
          v[rj] = sb;
          roots24.push(v);
        }
      }
    }
  }

  /* Edges of the 24-cell: root pairs at squared distance 2. */
  var root24Edges = [];
  for (var ei = 0; ei < roots24.length; ei++) {
    for (var ej = ei + 1; ej < roots24.length; ej++) {
      var d2 = 0;
      for (var ek = 0; ek < 4; ek++) d2 += Math.pow(roots24[ei][ek] - roots24[ej][ek], 2);
      if (Math.abs(d2 - 2) < 0.01) root24Edges.push([ei, ej]);
    }
  }

  /* Edges of a 3-cube: corners differing in exactly one bit. */
  var cubeEdges = [];
  for (var ci = 0; ci < 8; ci++) {
    for (var cj = ci + 1; cj < 8; cj++) {
      var dd = ci ^ cj;
      if (dd === 1 || dd === 2 || dd === 4) cubeEdges.push([ci, cj]);
    }
  }

  /* ---- Shared surfaces ---- */

  /* Effective-potential sketch: smooth ripple with Gaussian local minima. */
  var vacuumValleys = [
    [0, 0, 42, 2800], [70, 38, 24, 2200], [-72, 42, 26, 2100], [58, -76, 24, 2350],
    [-86, -28, 22, 2000], [92, -10, 19, 1850], [-38, -86, 22, 2050]
  ];

  function terrainHeight(x, z) {
    var y = Math.sin(x * 0.055) * Math.cos(z * 0.07) * 18 + Math.sin(x * 0.13 + 1.3) * Math.cos(z * 0.11 - 0.7) * 9;
    for (var i2 = 0; i2 < vacuumValleys.length; i2++) {
      var vv = vacuumValleys[i2];
      var dx = x - vv[0];
      var dz = z - vv[1];
      y -= Math.exp(-(dx * dx + dz * dz) / vv[3]) * vv[2];
    }
    return y;
  }

  /* Gravity well: cost concentration read as a depression in the cost sheet. */
  function gravitySurfaceY(x, z) {
    var d = Math.hypot(x, z);
    return -80 - 1350 / (d + 44) + Math.sin(x * 0.034 + z * 0.018) * 2.6;
  }

  /* Rotate a 4-vector in the (x0,x1) and (x2,x3) planes. */
  function rot4(v, a, b) {
    var ca = Math.cos(a);
    var sa = Math.sin(a);
    var cb = Math.cos(b);
    var sb = Math.sin(b);
    return [ca * v[0] - sa * v[1], sa * v[0] + ca * v[1], cb * v[2] - sb * v[3], sb * v[2] + cb * v[3]];
  }

  /* Oblique 4D -> 3D projection used by the D=4 gate scene. */
  function project4(v, t, scale) {
    scale = scale || 62;
    var a = t * 0.28;
    var ca = Math.cos(a);
    var sa = Math.sin(a);
    var b = t * 0.19;
    var cb = Math.cos(b);
    var sb = Math.sin(b);
    var x0 = v[0] * ca - v[3] * sa;
    var x3 = v[0] * sa + v[3] * ca;
    var x1 = v[1] * cb - v[2] * sb;
    var x2 = v[1] * sb + v[2] * cb;
    return [(x0 + 0.36 * x3) * scale, (x1 + 0.2 * x3) * scale, (x2 - 0.26 * x3) * scale];
  }

  /* Perspective 4D -> 3D projection used by the cascade scene. */
  function perspective4(v, scale) {
    scale = scale || 25;
    var d = 10;
    var s2 = d / (d - v[3]);
    return [v[0] * s2 * scale, v[1] * s2 * scale, v[2] * s2 * scale];
  }

  PU.data = {
    network: network,
    becoming: becoming,
    horizon: horizon,
    pce: pce,
    predictors: predictors,
    roots24: roots24,
    root24Edges: root24Edges,
    cubeEdges: cubeEdges,
    vacuumValleys: vacuumValleys,
    terrainHeight: terrainHeight,
    gravitySurfaceY: gravitySurfaceY,
    rot4: rot4,
    project4: project4,
    perspective4: perspective4
  };
})(window.PU);
