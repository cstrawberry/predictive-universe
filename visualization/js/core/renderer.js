/*
 * WebGL 1 renderer. Three tiny programs (points, lines, triangles) plus a
 * full-screen post pass. No extensions, no external libraries.
 */
(function (PU) {
  'use strict';

  function compile(gl, type, src) {
    var s = gl.createShader(type);
    gl.shaderSource(s, src);
    gl.compileShader(s);
    if (!gl.getShaderParameter(s, gl.COMPILE_STATUS)) {
      throw new Error(gl.getShaderInfoLog(s));
    }
    return s;
  }

  function link(gl, vs, fs) {
    var p = gl.createProgram();
    gl.attachShader(p, compile(gl, gl.VERTEX_SHADER, vs));
    gl.attachShader(p, compile(gl, gl.FRAGMENT_SHADER, fs));
    gl.linkProgram(p);
    if (!gl.getProgramParameter(p, gl.LINK_STATUS)) {
      throw new Error(gl.getProgramInfoLog(p));
    }
    return p;
  }

  function attribs(gl, program, names) {
    var map = {};
    for (var i = 0; i < names.length; i++) map[names[i]] = gl.getAttribLocation(program, names[i]);
    return map;
  }

  function uniforms(gl, program, names) {
    var map = {};
    for (var i = 0; i < names.length; i++) map[names[i]] = gl.getUniformLocation(program, names[i]);
    return map;
  }

  function create(canvas) {
    var gl = canvas.getContext('webgl', { antialias: true, alpha: false }) ||
      canvas.getContext('experimental-webgl', { antialias: true, alpha: false });
    if (!gl) return null;

    var src = PU.shaders;
    var points = link(gl, src.pointVert, src.pointFrag);
    var lines = link(gl, src.flatVert, src.flatFrag);
    var tris = link(gl, src.flatVert, src.flatFrag);
    var post = link(gl, src.postVert, src.postFrag);

    var loc = {
      points: { a: attribs(gl, points, ['aPosition', 'aColor', 'aSize']), u: uniforms(gl, points, ['uDpr']) },
      lines: { a: attribs(gl, lines, ['aPosition', 'aColor']) },
      tris: { a: attribs(gl, tris, ['aPosition', 'aColor']) },
      post: {
        a: attribs(gl, post, ['aPosition']),
        u: uniforms(gl, post, ['uTime', 'uBlack', 'uMode', 'uGlow'])
      }
    };

    var buf = {
      pPos: gl.createBuffer(), pCol: gl.createBuffer(), pSize: gl.createBuffer(),
      lPos: gl.createBuffer(), lCol: gl.createBuffer(),
      tPos: gl.createBuffer(), tCol: gl.createBuffer(),
      quad: gl.createBuffer()
    };

    gl.bindBuffer(gl.ARRAY_BUFFER, buf.quad);
    gl.bufferData(gl.ARRAY_BUFFER, new Float32Array([-1, -1, 1, -1, -1, 1, 1, 1]), gl.STATIC_DRAW);
    gl.enable(gl.BLEND);
    gl.blendFunc(gl.SRC_ALPHA, gl.ONE);

    function dpr() {
      return Math.min(window.devicePixelRatio || 1, 2);
    }

    function resize() {
      var rect = canvas.getBoundingClientRect();
      var ratio = dpr();
      var w = Math.max(1, Math.floor(rect.width * ratio));
      var h = Math.max(1, Math.floor(rect.height * ratio));
      if (canvas.width !== w || canvas.height !== h) {
        canvas.width = w;
        canvas.height = h;
      }
      gl.viewport(0, 0, w, h);
      PU.camera.aspect = w / Math.max(1, h);
    }

    function upload(buffer, data, attr, size) {
      gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
      gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(data), gl.DYNAMIC_DRAW);
      gl.enableVertexAttribArray(attr);
      gl.vertexAttribPointer(attr, size, gl.FLOAT, false, 0, 0);
    }

    /*
     * `fade` is 1 for a fully revealed scene and 0 at the darkest point of a
     * transition; the post pass turns it into a dip to black plus a bloom.
     */
    function draw(out, time, fade) {
      gl.clearColor(0, 0, 0, 1);
      gl.clear(gl.COLOR_BUFFER_BIT);
      gl.blendFunc(gl.SRC_ALPHA, gl.ONE);

      if (out.tp.length) {
        gl.useProgram(tris);
        upload(buf.tPos, out.tp, loc.tris.a.aPosition, 2);
        upload(buf.tCol, out.tc, loc.tris.a.aColor, 4);
        gl.drawArrays(gl.TRIANGLES, 0, out.tp.length / 2);
      }

      if (out.lp.length) {
        gl.useProgram(lines);
        upload(buf.lPos, out.lp, loc.lines.a.aPosition, 2);
        upload(buf.lCol, out.lc, loc.lines.a.aColor, 4);
        gl.drawArrays(gl.LINES, 0, out.lp.length / 2);
      }

      if (out.pp.length) {
        gl.useProgram(points);
        gl.uniform1f(loc.points.u.uDpr, dpr());
        upload(buf.pPos, out.pp, loc.points.a.aPosition, 2);
        upload(buf.pCol, out.pc, loc.points.a.aColor, 4);
        upload(buf.pSize, out.ps, loc.points.a.aSize, 1);
        gl.drawArrays(gl.POINTS, 0, out.pp.length / 2);
      }

      gl.useProgram(post);
      var qa = loc.post.a.aPosition;
      for (var i = 0; i < 4; i++) if (i !== qa) gl.disableVertexAttribArray(i);
      gl.bindBuffer(gl.ARRAY_BUFFER, buf.quad);
      gl.enableVertexAttribArray(qa);
      gl.vertexAttribPointer(qa, 2, gl.FLOAT, false, 0, 0);
      gl.uniform1f(loc.post.u.uTime, time);
      gl.uniform1f(loc.post.u.uBlack, 1 - fade);
      gl.uniform1f(loc.post.u.uMode, 0);
      gl.uniform1f(loc.post.u.uGlow, 0);
      gl.blendFunc(gl.ZERO, gl.ONE_MINUS_SRC_ALPHA);
      gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);

      var glow = Math.pow(Math.max(0, 1 - fade), 1.6);
      if (glow > 0.003) {
        gl.uniform1f(loc.post.u.uMode, 1);
        gl.uniform1f(loc.post.u.uGlow, glow);
        gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
        gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4);
      }

      gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
    }

    return { gl: gl, resize: resize, draw: draw };
  }

  PU.renderer = { create: create };
})(window.PU);
