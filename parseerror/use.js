#!/usr/bin/env node
const parser = require("./parseError").parser;
parser.yy = {
    E: "Expression", 
    T: "Term", 
    NAT: "Number", 
    "+": "Plus"
};
parser.yy.parseError = function(msg, hash) {
  console.error("******************msg********************");
  console.log(msg);
  console.error("******************hash.errStr********************");
  console.log(hash.errStr);
  console.error("******************hash.loc********************");
  console.error(hash.loc);
  console.error("******************hash.expected********************");
  console.error(hash.expected);
  process.exit(1);
}

try {
  let input = process.argv[2] || "2+";
  console.error("input:", input);
  const t = parser.parse(input);
  console.error("Parse Tree:\n")
  console.log(JSON.stringify(t, null, 2));
} catch (e) {
  console.error(e.message);
}
