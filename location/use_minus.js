#!/usr/bin/env node
const p = require("./minus").parser;
const input = process.argv[2] || "2-a-b-1"
const t = p.parse(input);
console.log(JSON.stringify(t, null, 2));
