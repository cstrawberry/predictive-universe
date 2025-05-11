// predictive-universe/vite.config.js
import { defineConfig } from 'vite';

export default defineConfig({
  root: 'visualization',

  build: {
    outDir: '../dist',
    emptyOutDir: true,
  },

  server: {

    open: true // Automatically open in browser when running 'npm run dev'
  }
});