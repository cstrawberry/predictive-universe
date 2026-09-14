/* GLSL sources, kept apart from the renderer that compiles them. */
(function (PU) {
  'use strict';

  PU.shaders = {
    pointVert: [
      'attribute vec2 aPosition;',
      'attribute vec4 aColor;',
      'attribute float aSize;',
      'uniform float uDpr;',
      'varying vec4 vColor;',
      'void main(){',
      '  gl_Position = vec4(aPosition, 0.0, 1.0);',
      '  gl_PointSize = max(1.0, aSize * uDpr);',
      '  vColor = aColor;',
      '}'
    ].join('\n'),

    /* Round, soft-edged sprite; the square corners are discarded. */
    pointFrag: [
      'precision mediump float;',
      'varying vec4 vColor;',
      'void main(){',
      '  vec2 p = gl_PointCoord * 2.0 - 1.0;',
      '  float d = dot(p, p);',
      '  if (d > 1.0) discard;',
      '  float a = (1.0 - smoothstep(0.1, 1.0, d)) * vColor.a;',
      '  gl_FragColor = vec4(vColor.rgb, a);',
      '}'
    ].join('\n'),

    flatVert: [
      'attribute vec2 aPosition;',
      'attribute vec4 aColor;',
      'varying vec4 vColor;',
      'void main(){',
      '  gl_Position = vec4(aPosition, 0.0, 1.0);',
      '  vColor = aColor;',
      '}'
    ].join('\n'),

    flatFrag: [
      'precision mediump float;',
      'varying vec4 vColor;',
      'void main(){ gl_FragColor = vColor; }'
    ].join('\n'),

    postVert: [
      'attribute vec2 aPosition;',
      'varying vec2 vUv;',
      'void main(){',
      '  vUv = aPosition * 0.5 + 0.5;',
      '  gl_Position = vec4(aPosition, 0.0, 1.0);',
      '}'
    ].join('\n'),

    /*
     * Full-screen pass. uMode 0 draws vignette, letterbox falloff, film grain
     * and the scene-change fade; uMode 1 draws the warm bloom used while a
     * scene is fading in or out.
     */
    postFrag: [
      'precision mediump float;',
      'varying vec2 vUv;',
      'uniform float uTime;',
      'uniform float uBlack;',
      'uniform float uMode;',
      'uniform float uGlow;',
      'float hash(vec2 p){ return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453); }',
      'void main(){',
      '  vec2 c = vUv - 0.5;',
      '  if (uMode > 0.5) {',
      '    float d = length(c * vec2(1.0, 1.7));',
      '    float a = (1.0 - smoothstep(0.0, 0.82, d)) * uGlow;',
      '    float n = hash(vUv * vec2(231.0, 177.0) + fract(uTime * 3.1));',
      '    vec3 gc = vec3(1.0, 0.30, 0.36);',
      '    gl_FragColor = vec4(gc, a * (0.17 + 0.05 * n));',
      '    return;',
      '  }',
      '  float r = length(c * vec2(1.12, 1.0));',
      '  float vig = smoothstep(0.42, 1.0, r) * 0.5;',
      '  float frame = (smoothstep(0.085, 0.0, vUv.y) + smoothstep(0.915, 1.0, vUv.y)) * 0.32;',
      '  float g = hash(vUv * vec2(917.0, 533.0) + fract(uTime * 7.13) * vec2(31.7, 17.3));',
      '  float grain = (g - 0.5) * 0.10;',
      '  float a = clamp(vig + frame + grain * (0.30 + vig) + uBlack, 0.0, 1.0);',
      '  gl_FragColor = vec4(0.0, 0.0, 0.0, a);',
      '}'
    ].join('\n')
  };
})(window.PU);
