#!/usr/bin/env node
const util = require('util');
const p = require("./embedded_lexer").parser;

p.yy.queue = [];
try {
  const t = p.parse(process.argv[2] || "2+1+1");
  console.log(JSON.stringify(t, null, 2)); 
} catch (e) {
  console.error(e.message);
}
