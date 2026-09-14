/*
 * Backbone: the K0 cascade.
 *
 * Six timed stages replay the dependency chain Cogito -> K0=3 -> d0=8 ->
 * active/inactive split -> M=24 -> D=4. The stage machinery is exposed as
 * `PU.cascade` so the annotation overlay can track the same points.
 * Sections 5 and 7, Appendix Z of docs/paper.
 */
(function (PU) {
  'use strict';

  var g = PU.geom;
  var M = PU.math;
  var C = PU.color;
  var data = PU.data;

  var stages = [
    { name: 'cogito', dur: 2.5 },
    { name: 'bits3', dur: 2.5 },
    { name: 'cube8', dur: 3 },
    { name: 'split', dur: 2.5 },
    { name: 'modes24', dur: 3 },
    { name: 'cell24', dur: 11 }
  ];
  var total = 0;
  for (var s0 = 0; s0 < stages.length; s0++) total += stages[s0].dur;

  var blank = { pos: [0, 0, 0, 0], size: 0, color: [0.62, 0.72, 1, 0], alpha: 0 };

  function stageAt(t) {
    var tt = ((t % total) + total) % total;
    for (var i = 0; i < stages.length; i++) {
      if (tt < stages[i].dur) return { index: i, stage: stages[i], progress: tt / stages[i].dur };
      tt -= stages[i].dur;
    }
    return { index: 0, stage: stages[0], progress: 0 };
  }

  /* Where each of the 24 tracked points belongs during a given stage. */
  function targets(name) {
    var out = new Array(24);
    for (var z = 0; z < 24; z++) out[z] = null;

    if (name === 'cogito') {
      out[0] = { pos: [0, 0, 0, 0], size: 30, color: [1, 0.76, 0.22, 1], alpha: 1 };
    } else if (name === 'bits3') {
      for (var b = 0; b < 3; b++) {
        var ba = (b / 3) * Math.PI * 2;
        out[b] = { pos: [4 * Math.cos(ba), 4 * Math.sin(ba), 0, 0], size: 18, color: [0.42, 0.82, 1, 1], alpha: 1 };
      }
    } else if (name === 'cube8' || name === 'split') {
      var e = 3.5;
      for (var c = 0; c < 8; c++) {
        var p = [((c >> 2) & 1) ? e : -e, ((c >> 1) & 1) ? e : -e, (c & 1) ? e : -e, 0];
        var active = c < 2;
        out[c] = name === 'split'
          ? { pos: p, size: active ? 23 : 11, color: active ? [1, 0.78, 0.22, 1] : [0.34, 0.44, 0.72, 0.78], alpha: 1 }
          : { pos: p, size: 14, color: [0.66, 0.48, 1, 0.92], alpha: 1 };
      }
    } else if (name === 'modes24' || name === 'cell24') {
      for (var m = 0; m < 24; m++) {
        var v = data.roots24[m];
        out[m] = {
          pos: [v[0] * 3, v[1] * 3, v[2] * 3, v[3] * 3],
          size: name === 'cell24' ? 12 : 13,
          color: C.hsl((Math.floor(m / 4) / 6) * 0.78, 0.82, 0.63, 1),
          alpha: 1
        };
      }
    }
    return out;
  }

  function mixTarget(prev, cur, f) {
    var a = prev || blank;
    var b = cur || blank;
    var pos = [];
    for (var i = 0; i < 4; i++) pos[i] = a.pos[i] + (b.pos[i] - a.pos[i]) * f;
    return {
      pos: pos,
      size: a.size + (b.size - a.size) * f,
      color: [
        a.color[0] + (b.color[0] - a.color[0]) * f,
        a.color[1] + (b.color[1] - a.color[1]) * f,
        a.color[2] + (b.color[2] - a.color[2]) * f,
        a.color[3] + (b.color[3] - a.color[3]) * f
      ],
      alpha: a.alpha + (b.alpha - a.alpha) * f
    };
  }

  function pointPosition(i, t) {
    var st = stageAt(t);
    var prev = targets(st.index ? stages[st.index - 1].name : st.stage.name);
    var cur = targets(st.stage.name);
    var point = mixTarget(prev[i], cur[i], M.easeInOut(M.smooth01(0, 0.72, st.progress)));
    var p4 = st.stage.name === 'cell24' ? data.rot4(point.pos, t * 0.38, t * 0.25) : point.pos;
    return data.perspective4(p4);
  }

  PU.cascade = { stages: stages, stageAt: stageAt, pointPosition: pointPosition };

  PU.scenes.register('cascade', {
    camera: { theta: 0, phi: 0.3, dist: 255 },
    time: 'scene',
    draw: function (out, t) {
      for (var i = 0; i < 180; i++) {
        var r = 130 + M.noise(i * 5) * 90;
        var a = M.noise(i * 5 + 1) * Math.PI * 2;
        var ph = Math.acos(2 * M.noise(i * 5 + 2) - 1);
        g.point(out, [r * Math.sin(ph) * Math.cos(a), r * Math.sin(ph) * Math.sin(a), r * Math.cos(ph)], [0.6, 0.68, 0.88, 0.07 + M.noise(i) * 0.07], 1.2 + M.noise(i + 11) * 1.6);
      }

      var st = stageAt(t);
      var name = st.stage.name;
      var prev = targets(st.index ? stages[st.index - 1].name : name);
      var cur = targets(name);
      var mix = M.easeInOut(M.smooth01(0, 0.72, st.progress));
      var rotating = name === 'cell24';

      var pts = [];
      for (var k = 0; k < 24; k++) {
        var point = mixTarget(prev[k], cur[k], mix);
        var p4 = rotating ? data.rot4(point.pos, t * 0.38, t * 0.25) : point.pos;
        pts.push({
          p: data.perspective4(p4),
          c: [point.color[0], point.color[1], point.color[2], point.color[3] * point.alpha],
          size: point.size,
          alpha: point.alpha
        });
      }

      if (name === 'cube8' || name === 'split') {
        var cubeAlpha = name === 'cube8' ? M.smooth01(0.12, 0.45, st.progress) : 0.52 + 0.2 * Math.sin(t * 2);
        for (var e = 0; e < data.cubeEdges.length; e++) {
          g.line(out, pts[data.cubeEdges[e][0]].p, pts[data.cubeEdges[e][1]].p, [0.66, 0.48, 1, 0.2 * cubeAlpha]);
        }
      }

      if (name === 'modes24' || name === 'cell24') {
        var cellAlpha = name === 'cell24' ? M.smooth01(0.04, 0.34, st.progress) : 0.42;
        if (name === 'modes24') {
          for (var m = 0; m < 24; m++) g.line(out, [0, 0, 0], pts[m].p, [pts[m].c[0], pts[m].c[1], pts[m].c[2], 0.08]);
        }
        for (var re = 0; re < data.root24Edges.length; re++) {
          g.line(out, pts[data.root24Edges[re][0]].p, pts[data.root24Edges[re][1]].p, [0, 0.9, 1, 0.1 * cellAlpha]);
        }
        g.basisRing(out, 118, [1, 0.75, 0.15, 0.08 * cellAlpha], [0, 0, 0], [1, 0, 0], [0, 0, 1], 120);
      }

      /* The active/inactive split: two states pull away from the other six. */
      if (name === 'split') {
        g.line(out, pts[0].p, pts[1].p, [1, 0.75, 0.15, 0.38]);
        for (var sp = 2; sp < 8; sp++) g.line(out, pts[1].p, pts[sp].p, [0.29, 0.62, 1, 0.08]);
      }

      for (var d = 0; d < pts.length; d++) {
        if (pts[d].alpha > 0.015) g.point(out, pts[d].p, pts[d].c, Math.max(0.5, pts[d].size));
      }

      /* Progress track along the bottom of the stage. */
      for (var q = 0; q < stages.length; q++) {
        var x = -90 + q * 36;
        var on = q <= st.index;
        var active = q === st.index;
        if (q > 0) g.line(out, [x - 36, -126, 0], [x, -126, 0], on ? [1, 0.75, 0.15, 0.15] : [0.62, 0.72, 0.95, 0.07]);
        g.point(out, [x, -126, 0], active ? [1, 0.75, 0.15, 0.88] : on ? [0.29, 0.62, 1, 0.58] : [0.62, 0.72, 0.95, 0.22], active ? 8 : 5);
      }
    }
  });
})(window.PU);
