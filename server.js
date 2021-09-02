'use strict';

const express = require('express');
const favicon = require('express-favicon');
const path = require('path');

const port = process.env.PORT || 3000;
const isProduction = process.env.NODE_ENV === 'production';
const isTesting = process.env.TESTING === 'true';
const isDevelopment = !isProduction;

const app = express();
app.use(favicon(__dirname + '/build/favicon.ico'));

app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname, 'build')));

app.get('/health', (req, res) => res.json({ message: 'status ok' }));

app.get('/*', function (req, res) {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

const server = app.listen(port, err => {
  if (err) throw err;

  console.log(`> Ready running with express on http://localhost:${port}`);
});

server.keepAliveTimeout = 65 * 1000;
server.headersTimeout = 70 * 1000;