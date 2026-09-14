/*
 * Predictive Universe visualisations.
 *
 * Every file attaches to this single global. Plain classic scripts are used
 * instead of ES modules so that `index.html` can be opened straight from disk
 * (file://) without a server, a bundler, or any third-party library.
 *
 * Load order is declared once, in index.html:
 *   core -> content -> scenes -> ui -> app
 */
window.PU = window.PU || {};
