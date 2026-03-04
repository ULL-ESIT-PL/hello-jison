// npx jison2json minus.jison minus.l -o minus.json
var fs = require("fs");
var jison = require("jison");

var grammar = require("./minus.json");
var parser = new jison.Parser(grammar);

module.exports = parser;

if (require.main === module) {
    var input = process.argv[2] || '8-3,2-1'; // [5, 1]
    var parsed = parser.parse(input);
    console.log(parsed);
}