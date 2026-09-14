/*
 * Scene index: the grouped list of scenes down the left of the shell.
 */
(function (PU) {
  'use strict';

  var esc = PU.dom.escapeHtml;

  function build(root, onSelect) {
    var html = ['<div class="viz-index-title">Scenes</div>'];
    var group = null;
    for (var i = 0; i < PU.catalogue.length; i++) {
      var entry = PU.catalogue[i];
      if (entry.group !== group) {
        group = entry.group;
        html.push('<div class="viz-index-group">' + esc(group) + '</div>');
      }
      html.push(
        '<button type="button" class="viz-btn" data-scene="' + esc(entry.key) + '"' +
        ' style="--viz-color:' + esc(entry.color) + ';--viz-rgb:' + esc(entry.rgb) + '">' +
        '<span class="viz-btn-num">' + (i + 1 < 10 ? '0' : '') + (i + 1) + '</span>' +
        '<span class="viz-btn-mark" aria-hidden="true"></span>' +
        '<span class="viz-btn-label">' + esc(entry.label) + '</span>' +
        '</button>'
      );
    }
    root.innerHTML = html.join('');

    root.addEventListener('click', function (event) {
      var button = event.target.closest('[data-scene]');
      if (!button) return;
      onSelect(button.dataset.scene);
    });

    return {
      setActive: function (key) {
        var buttons = root.querySelectorAll('.viz-btn');
        for (var b = 0; b < buttons.length; b++) {
          var on = buttons[b].dataset.scene === key;
          buttons[b].classList.toggle('is-active', on);
          buttons[b].setAttribute('aria-current', on ? 'true' : 'false');
          if (on) {
            // Scroll this index only; scrollIntoView also moves an embedding reader.
            var item = buttons[b].getBoundingClientRect();
            var panel = root.getBoundingClientRect();
            if (item.top < panel.top) root.scrollTop += item.top - panel.top;
            else if (item.bottom > panel.bottom) root.scrollTop += item.bottom - panel.bottom;
            if (item.left < panel.left) root.scrollLeft += item.left - panel.left;
            else if (item.right > panel.right) root.scrollLeft += item.right - panel.right;
          }
        }
      }
    };
  }

  PU.indexPanel = { build: build };
})(window.PU);
