#!/usr/bin/env node
const YAML = require('json-to-pretty-yaml');
const p = require("./embedded_lexer").parser;
// Remaining arguments are keys to omit from the output
let omit = new Set(process.argv.slice(3)); // Example: use.js 2+1 loc value

function replace(key, value) {
    if (omit.has(key)) return undefined;
    return value;
}

function yaml2string(t, replace) {
  let result = JSON.parse(JSON.stringify(t, replace, 2));
  return YAML.stringify(result);
}

let input = process.argv[2] || "2+1";
try {
  console.error("input:", input);
  p.yy = {E: "Expression", T: "Term", NAT: "Number", "+": "Plus"};
  const t = p.parse(input);
  console.error("Parse Tree:\n")
  console.log(yaml2string(t, replace));
} catch (e) {
  console.error(e.message);
}
