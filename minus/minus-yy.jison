/*
See the README.md file for instructions on how to run this code
npx jison minus-yy.jison minus.l -o minus.js
 
> minus = require("./minus.js")
{
  parser: { yy: {} },
  Parser: [Function: Parser],
  parse: [Function (anonymous)],
  main: [Function: commonjsMain]
}
> minus.parser.yy.myval = 99
99
> minus.parse('3-2-1')
e ->N 99
e ->N 99
e ->N 99
e -> e - e 99
e -> e - e 99
true
*/
%right '-'
%%
e: 
    e '-' e  { console.log(`e -> e - e ${yy.myval}`)}
  | N        {console.log(`e ->N ${yy.myval}`)}
;