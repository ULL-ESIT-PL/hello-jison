#!/usr/bin/env node
const p = require("./minus").parser;

try {
    const t = p.parse(process.argv[2] || "2-1-1");
    console.log(JSON.stringify(t, null, 2));
} catch(e) {
    let m = e.message.replace(/\s*'UNEXPECTED'\s*,?/, '')
    console.error(m);
}
