/*
 * Orbit camera.
 *
 * Projection is done on the CPU: scenes emit world-space points, `project`
 * turns them into clip space, and the renderer uploads flat arrays. That keeps
 * every shader trivial and avoids shipping a matrix library.
 */
(function (PU) {
  'use strict';

  var clamp = PU.math.clamp;

  function Camera() {
    this.theta = 0;
    this.phi = 0.36;
    this.dist = 300;
    this.targetTheta = 0;
    this.targetPhi = 0.36;
    this.targetDist = 300;
    this.baseDist = 300;
    this.zoomOffset = 0;
    /* Slow drift added on top of the user's orbit, per scene. */
    this.dTheta = 0;
    this.dPhi = 0;
    this.roll = 0;
    this.aspect = 1;
  }

  Camera.prototype.applyPreset = function (preset) {
    var theta = preset && preset.theta != null ? preset.theta : 0;
    var phi = preset && preset.phi != null ? preset.phi : 0.36;
    var dist = preset && preset.dist != null ? preset.dist : 300;
    this.targetTheta = theta;
    this.targetPhi = phi;
    this.baseDist = dist;
    this.zoomOffset = 0;
    this.targetDist = dist;
    /* Start slightly off the mark so the scene eases into place. */
    this.theta = theta - 0.5;
    this.phi = phi + 0.12;
    this.dist = dist * 1.3;
  };

  Camera.prototype.orbit = function (dx, dy) {
    this.targetTheta += dx * 0.006;
    this.targetPhi = clamp(this.targetPhi + dy * 0.005, -1.15, 1.15);
  };

  Camera.prototype.zoom = function (delta) {
    this.zoomOffset = clamp(this.zoomOffset + delta * 0.55, -this.baseDist * 0.42, 1100 - this.baseDist);
    this.targetDist = clamp(this.baseDist + this.zoomOffset, 130, 1100);
  };

  /*
   * Exponential ease toward the target. The per-second rates are converted
   * with 1 - exp(-rate * dt) so the motion is identical at any frame rate.
   */
  Camera.prototype.settle = function (dt) {
    var step = dt == null ? 1 / 60 : dt;
    var slow = 1 - Math.exp(-4.35 * step);
    var slower = 1 - Math.exp(-3.71 * step);
    this.theta += (this.targetTheta - this.theta) * slow;
    this.phi += (this.targetPhi - this.phi) * slow;
    this.dist += (this.targetDist - this.dist) * slower;
  };

  /* World point -> {x, y} in clip space, plus depth and a size scale. */
  Camera.prototype.project = function (p) {
    var th = this.theta + this.dTheta;
    var ph = this.phi + this.dPhi;
    var cy = Math.cos(th);
    var sy = Math.sin(th);
    var cx = Math.cos(ph);
    var sx = Math.sin(ph);
    var x = p[0] * cy + p[2] * sy;
    var z = -p[0] * sy + p[2] * cy;
    var y = p[1];
    var y2 = y * cx - z * sx;
    var z2 = y * sx + z * cx + this.dist;
    if (z2 < 12) return null;
    if (this.roll) {
      var cr = Math.cos(this.roll);
      var sr = Math.sin(this.roll);
      var rx = x * cr - y2 * sr;
      y2 = x * sr + y2 * cr;
      x = rx;
    }
    var f = 1.38;
    return { x: (x / z2) * f / this.aspect, y: (y2 / z2) * f, z: z2, s: 520 / z2 };
  };

  /* Fade distant geometry so depth reads without a depth buffer. */
  Camera.prototype.depthCue = function (z) {
    return clamp(1.32 - (z - this.dist * 0.55) / (this.dist * 1.7), 0.3, 1.1);
  };

  PU.Camera = Camera;
  PU.camera = new Camera();
})(window.PU);
