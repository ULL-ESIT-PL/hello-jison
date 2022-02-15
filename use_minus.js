#!/usr/bin/env node
const p = require("./minus").parser;

const t = p.parse(process.argv[2] || "2-1-1");
console.log(t);
