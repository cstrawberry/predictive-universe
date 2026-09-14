/* Small DOM helpers shared by the UI modules. */
(function (PU) {
  'use strict';

  function escapeHtml(value) {
    return String(value == null ? '' : value)
      .replace(/&/g, '&amp;')
      .replace(/</g, '&lt;')
      .replace(/>/g, '&gt;')
      .replace(/"/g, '&quot;');
  }

  /* Blank-line separated text -> paragraphs. */
  function paragraphs(text) {
    return String(text || '')
      .trim()
      .split(/\n{2,}/)
      .map(function (p) { return '<p>' + escapeHtml(p.trim()) + '</p>'; })
      .join('');
  }

  function byId(id) {
    return document.getElementById(id);
  }

  PU.dom = { escapeHtml: escapeHtml, paragraphs: paragraphs, byId: byId };
})(window.PU);
