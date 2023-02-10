#!/usr/bin/env node
const p = require("./uminus").parser;

p.parse(process.argv[2] || "-2-3");