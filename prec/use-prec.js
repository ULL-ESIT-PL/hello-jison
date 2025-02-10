#!/usr/bin/env node
const p = require("./uminus").parser;

let input = process.argv[2] || "-2-3";
console.log("Input:", input);
p.parse(input);