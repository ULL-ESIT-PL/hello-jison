#!/usr/bin/env node
const escodegen = require('escodegen');
const ast = require(process.argv[2] || './ast.json');

const js = escodegen.generate(ast);
console.log(js);