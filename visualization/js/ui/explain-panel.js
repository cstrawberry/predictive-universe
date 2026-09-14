/*
 * Explanation drawer: plain-language copy, the paper's own wording behind a
 * disclosure, and the list of annotated elements for the current scene.
 */
(function (PU) {
  'use strict';

  var esc = PU.dom.escapeHtml;
  var paragraphs = PU.dom.paragraphs;

  function build(shell, refs, onClose) {
    var scroller = refs.panel.querySelector('.viz-hud-scroll');
    var scrollFrame = null;
    refs.close.addEventListener('click', function () { onClose(); });
    refs.panel.addEventListener('pointerdown', function (e) { e.stopPropagation(); });

    // Keep the selected heading and the start of its text in the drawer's view.
    // Capture native toggle events, which also cover keyboard activation.
    refs.details.addEventListener('toggle', function (event) {
      var details = event.target;
      if (!details.matches('details.viz-details') || !details.open) return;
      if (scrollFrame !== null) window.cancelAnimationFrame(scrollFrame);
      scrollFrame = window.requestAnimationFrame(function () {
        scrollFrame = null;
        if (!details.open || !refs.details.contains(details) || refs.panel.getAttribute('aria-hidden') !== 'false') return;
        var heading = details.querySelector('summary');
        scroller.scrollTop += heading.getBoundingClientRect().top - scroller.getBoundingClientRect().top - 16;
      });
    }, true);

    return {
      render: function (entry, notes) {
        if (scrollFrame !== null) window.cancelAnimationFrame(scrollFrame);
        scrollFrame = null;
        refs.kicker.textContent = entry.title;
        refs.summary.textContent = entry.summary;
        refs.copy.innerHTML = paragraphs(entry.copy);

        var html = '<details class="viz-details"><summary>In the paper’s terms</summary>' +
          '<div class="viz-details-body">' + paragraphs(entry.technical) + '</div></details>';

        if (notes && notes.length) {
          var items = ['<details class="viz-details"><summary>Elements in this scene</summary><ul class="viz-keys">'];
          for (var i = 0; i < notes.length; i++) {
            items.push(
              '<li><h4>' + esc(notes[i].label) + '</h4>' +
              '<p>' + esc(notes[i].plain) + '</p>' +
              '<p>' + esc(notes[i].technical) + '</p></li>'
            );
          }
          items.push('</ul></details>');
          html += items.join('');
        }

        refs.details.innerHTML = html;
        scroller.scrollTop = 0;
      },
      setOpen: function (open) {
        shell.classList.toggle('is-explaining', open);
        refs.panel.setAttribute('aria-hidden', open ? 'false' : 'true');
        refs.toggle.setAttribute('aria-expanded', open ? 'true' : 'false');
      }
    };
  }

  PU.explainPanel = { build: build };
})(window.PU);
