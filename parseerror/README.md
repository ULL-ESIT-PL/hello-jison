# Example of Jison program with customized Error management

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