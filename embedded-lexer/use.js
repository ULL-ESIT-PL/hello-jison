#!/usr/bin/env node
const p = require("./embedded_lexer").parser;

let input = process.argv[2] || "2+1+1";
try {
  console.error("input:", input);
  p.yy = {E: "Expression", T: "Term", NAT: "Number", "+": "Plus"};
  const t = p.parse(process.argv[2] || input);
  console.error("Parse Tree:\n")
  console.log(JSON.stringify(t, null, 2)); 
} catch (e) {
  console.error(e.message);
}
