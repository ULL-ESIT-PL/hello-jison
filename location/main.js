#!/usr/bin/env node
const p = require("./minus").parser;
const errorMsg = require("./err");
try {
    let input = process.argv[2] || "2-1-1"
    errorMsg.input = input;
    const t = p.parse(input);
    console.log(JSON.stringify(t, null, 2));
} catch(e) {
    let m = e.message.replace(/\s*'UNEXPECTED'\s*,?/, '')
    console.error(m);
}
