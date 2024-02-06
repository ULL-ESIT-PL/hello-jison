## Location

In a given rule, several constructs can be used to access the locations of the elements being matched. The location of the nth component of the right hand side is `@n`, while the location of the left hand side grouping is `@$`.

The location object has attributes: 

- `first_line`, 
- `first_column`, 
- `last_line`, 
- `last_column`

## The grammar

It is important to keep the actions in a grammar as simple as possible and isolate the code in a separated file.

```js
%{
  errorMsg = require('./err.js');
%}

%left UNEXPECTED
%left '-'
%%
es: e <<EOF>> { return $1; }
;

e: 
    e '-' e        { $$ = $1 - $3; }
  | NUMBER         { $$ = Number($1); }
  /* error management rules */
  | UNEXPECTED { errorMsg({ rule: 'UNEXPECTED', token: $1, ...@1 }) }     // a-3
  | e UNEXPECTED { errorMsg({ rule: 'e UNEXPECTED', token: $2, ...@2 }) } // 4*2
;
```

Errors due to unexpected character are managed by the last two rules


## Lexical rules

We create a token `UNEXPECTED` to catch the unexpected characters. It absorbs all the characters until the end.

```js
%%
\s+     /* skip whites */;
[0-9]+        return 'NUMBER';
'-'           return '-';
(.|\n)+       return 'UNEXPECTED';
```

## Catching Syntactic errors

The `error` token is not fully implemented in Jison.
A way to survive is to catch the exception produced by the parser and keep in control of the error messages

```js
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
```

Notice the way the input is made available to the `errorMsg` function.

## Error messages

The contents of the `err.js` file:

```js 
module.exports = function errorMsg({rule, token, first_line, first_column, last_line, last_column}) {
  
  let upto = token.indexOf('\n')
  if (upto == -1) upto = token.length;
  let prefix = token.slice(0, upto);

  console.error(
    `Unexpected "${prefix}" at line ${first_line} column ${first_column} of input: "${errorMsg.input}"`);
  if (rule) console.error(`Rule: ${rule}`);
  process.exit(1);
}
```

Notice the access to the input string through the `errorMsg.input` variable.

## Execution

```
➜  location git:(master) ✗ npm run loc        

> hello-jison@1.0.0 loc
> jison location/minus-error-management.jison location/minus-error-management.l -o location/minus.js

➜  location git:(master) ✗ ./main.js '3 2'
Parse error on line 1:
3 2
--^
Expecting '-', got 'NUMBER'
➜  location git:(master) ✗ ./main.js '3 - 2 -'
Parse error on line 1:
3 - 2 -
-------^
Expecting 'NUMBER', got '1'
➜  location git:(master) ✗ ./main.js '-3 - 2 ' 
Parse error on line 1:
-3 - 2 
^
Expecting 'NUMBER', got '-'
➜  location git:(master) ✗ ./main.js '3 * 2'  
Unexpected "* 2" at line 1 column 2 of input: "3 * 2"
Rule: e UNEXPECTED
➜  location git:(master) ✗ ./main.js '3 - 2!'
Unexpected "!" at line 1 column 5 of input: "3 - 2!"
Rule: e UNEXPECTED
➜  location git:(master) ✗ ./main.js 'a -3'  
Unexpected "a -3" at line 1 column 0 of input: "a -3"
Rule: UNEXPECTED
➜  location git:(master) ✗ ./main.js '2-a' 
Unexpected "a" at line 1 column 2 of input: "2-a"
Rule: UNEXPECTED
➜  location git:(master) ✗ 
```