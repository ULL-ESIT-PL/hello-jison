#!/usr/bin/env node
const util = require('util');
const p = require("./embedded_lexer").parser;

let input = process.argv[2] || "2+1+1";
try {
  console.log("input:", input);
  p.yy.queue = [];
  const t = p.parse(process.argv[2] || input);
  console.log("Derivation:\n", JSON.stringify(t, null, 2)); 
} catch (e) {
  console.error(e.message);
}
