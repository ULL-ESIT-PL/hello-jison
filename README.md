# Compiler Basics

## Simple grammar to illustrate Jison

Install the dependencies:

```
npm i
```

Usage:

```
➜  hello-jison git:(master) ✗ npm run test-simple

> hello-jison@1.0.0 test-simple
> npm run build; ./use_minus.js


> hello-jison@1.0.0 build
> jison minus.jison minus.l -o minus.js

0
```

## Example of a Simple Translator from Infix minus expressions to JavaScript

```
➜  hello-jison git:(master) ✗ npm run test       

> hello-jison@1.0.0 test
> npm run tojs; node salida.js


> hello-jison@1.0.0 tojs
> npm run build-ast; ./ast2js.js > salida.js; cat salida.js


> hello-jison@1.0.0 build-ast
> npm run compile-ast; ./use_minus.js > ast.json; cat ast.json


> hello-jison@1.0.0 compile-ast
> jison minus-ast.jison minus.l -o minus.js

{
  "type": "Program",
  "body": [
    {
      "type": "ExpressionStatement",
      "expression": {
        "type": "CallExpression",
        "callee": {
          "type": "MemberExpression",
          "object": {
            "type": "Identifier",
            "name": "console"
          },
          "property": {
            "type": "Identifier",
            "name": "log"
          },
          "computed": false
        },
        "arguments": [
          {
            "type": "BinaryExpression",
            "left": {
              "type": "BinaryExpression",
              "left": {
                "type": "Literal",
                "value": 2,
                "raw": "2"
              },
              "operator": "-",
              "right": {
                "type": "Literal",
                "value": 1,
                "raw": "1"
              }
            },
            "operator": "-",
            "right": {
              "type": "Literal",
              "value": 1,
              "raw": "1"
            }
          }
        ]
      }
    }
  ],
  "sourceType": "script"
}
console.log(2 - 1 - 1);
0
```