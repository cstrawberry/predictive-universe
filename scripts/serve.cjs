/* Local, read-only preview: node scripts/serve.cjs [port] */
const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const root = path.resolve(__dirname, '..');
const types = { '.html': 'text/html', '.css': 'text/css', '.js': 'text/javascript', '.md': 'text/plain', '.png': 'image/png', '.svg': 'image/svg+xml', '.pdf': 'application/pdf' };
http.createServer((request, response) => {
  if (request.method !== 'GET' && request.method !== 'HEAD') { response.writeHead(405); response.end(); return; }
  let pathname;
  try { pathname = decodeURIComponent(new URL(request.url, 'http://localhost').pathname); }
  catch (_) { response.writeHead(400); response.end(); return; }
  let file = path.resolve(root, '.' + pathname);
  const relative = path.relative(root, file);
  if (relative.startsWith('..') || path.isAbsolute(relative) || relative.split(/[\\/]/).some(part => part.startsWith('.'))) {
    response.writeHead(403); response.end(); return;
  }
  try {
    if (fs.statSync(file).isDirectory()) file = path.join(file, 'index.html');
    const content = fs.readFileSync(file);
    response.writeHead(200, { 'Content-Type': (types[path.extname(file)] || 'application/octet-stream') + '; charset=utf-8', 'Cache-Control': 'no-cache' });
    response.end(request.method === 'HEAD' ? undefined : content);
  } catch (_) { response.writeHead(404); response.end('Not found'); }
}).listen(Number(process.argv[2] || 4173), '127.0.0.1', () => console.log('Paper preview: http://127.0.0.1:' + (process.argv[2] || 4173)));
