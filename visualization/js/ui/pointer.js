/*
 * Pointer, wheel and touch handling for the stage.
 *
 * On touch, the first few pixels of a drag decide whether the gesture orbits
 * the scene or scrolls the page, so the visualisation never traps the reader.
 */
(function (PU) {
  'use strict';

  function attach(canvas, camera) {
    var drag = false;
    var lastX = 0;
    var lastY = 0;
    var startX = 0;
    var startY = 0;
    var mode = null;
    var pinchDist = 0;

    canvas.addEventListener('mousedown', function (e) {
      drag = true;
      lastX = e.clientX;
      lastY = e.clientY;
    });

    window.addEventListener('mousemove', function (e) {
      if (!drag) return;
      camera.orbit(e.clientX - lastX, e.clientY - lastY);
      lastX = e.clientX;
      lastY = e.clientY;
    });

    window.addEventListener('mouseup', function () { drag = false; });

    canvas.addEventListener('wheel', function (e) {
      e.preventDefault();
      camera.zoom(e.deltaY);
    }, { passive: false });

    canvas.addEventListener('touchstart', function (e) {
      if (e.touches.length === 2) {
        drag = false;
        mode = 'pinch';
        pinchDist = Math.hypot(e.touches[0].clientX - e.touches[1].clientX, e.touches[0].clientY - e.touches[1].clientY);
        return;
      }
      if (e.touches.length !== 1) {
        drag = false;
        mode = null;
        return;
      }
      drag = false;
      mode = null;
      startX = lastX = e.touches[0].clientX;
      startY = lastY = e.touches[0].clientY;
    }, { passive: true });

    canvas.addEventListener('touchmove', function (e) {
      if (mode === 'pinch' && e.touches.length === 2) {
        e.preventDefault();
        var d = Math.hypot(e.touches[0].clientX - e.touches[1].clientX, e.touches[0].clientY - e.touches[1].clientY);
        camera.zoom((pinchDist - d) * 2.4);
        pinchDist = d;
        return;
      }
      if (e.touches.length !== 1) {
        drag = false;
        mode = null;
        return;
      }
      var touch = e.touches[0];
      var totalX = touch.clientX - startX;
      var totalY = touch.clientY - startY;
      if (!mode) {
        if (Math.hypot(totalX, totalY) < 9) return;
        mode = Math.abs(totalX) > Math.abs(totalY) * 1.2 ? 'orbit' : 'scroll';
        drag = mode === 'orbit';
      }
      if (mode === 'scroll') {
        drag = false;
        lastX = touch.clientX;
        lastY = touch.clientY;
        return;
      }
      e.preventDefault();
      camera.orbit(touch.clientX - lastX, touch.clientY - lastY);
      lastX = touch.clientX;
      lastY = touch.clientY;
    }, { passive: false });

    function end() {
      drag = false;
      mode = null;
    }

    canvas.addEventListener('touchend', end);
    canvas.addEventListener('touchcancel', end);

    return { isDragging: function () { return drag; } };
  }

  PU.pointer = { attach: attach };
})(window.PU);
