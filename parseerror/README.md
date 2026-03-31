# Example of Jison program with customized Error management

See [use.js](./use.js) and [parseError.jison](./parseError.jison) for an example of how to use the custom error management in a Jison parser. 

The example shows how to attach a custom `parseError` function to the parser as also other properties that can be used inside the 
semantic actions of the grammar. 


```js 
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
```

All the attributes in the `yy` property of the parser are available in the semantic actions of the grammar:

```js
E
    : E '+' T { $$ = {type: yy.E, rightside: [$E, { type: yy["+"], value: '+', loc: @1}, $T]} }
    | T       { $$ = {type: yy.E, rightside: [$T]} }
    ;
```

Here  follows the output of running the example with an input that causes a parse error:
```
➜  parseerror git:(master) ✗ npx jison parseError.jison
JISON output for module [parseError] has been written to file: parseError.js
➜  parseerror git:(master) ✗ ./use.js '2+'
input: 2+
******************msg********************
Parse error on line 1: 
2+
--^
Expecting "NAT", "T", got unexpected end of input
******************hash.errStr********************
Parse error on line 1: 
2+
--^
Expecting "NAT", "T", got unexpected end of input
******************hash.loc********************
{
  first_line: 1,
  first_column: 2,
  last_line: 1,
  last_column: 2,
  range: [ 2, 2 ]
}
******************hash.expected********************
[ '"NAT"', '"T"' ]
```