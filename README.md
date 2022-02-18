# Compiler Basics

This repo contains two examples:

* The first one is a simple interpreter for infix arithmetic expressions with the minus operator only
  * See files `minus.jison`, `minus.l` and  `use_minus.js`
* The second is a translator from infix arithmetic expressions to JavaScript
  * `minus-ast.jison` builds a Espree compatible AST using `minus.l` and the helpers in `ast-build.js`
  * The lexical analyzer `minus.l` is reused
* The `ast-*.json` files contain examples of Espree ASTs
  
## package.json scripts to run the examples

```

➜  hello-jison git:(master) ✗ npm run
Lifecycle scripts included in hello-jison@1.0.0:
  test
    npm run tojs; node salida.js

available via `npm run-script`:
  test-simple
    npm run build; ./use_minus.js
  tojs
    npm run build-ast; ./ast2js.js > salida.js; cat salida.js
  build-ast
    npm run compile-ast; ./use_minus.js > ast.json; cat ast.json
  build
    jison minus.jison minus.l -o minus.js
  debug
    jison minus.jison minus.l -o minus.js --debug
  dfa
    bison -v minus.jison; rm -f minus.tab.jison
  compile-ast
    jison minus-ast.jison minus.l -o minus.js
```

## First Example. Simple interpreter

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

## Second Example. A Simple Translator from Infix minus expressions to JavaScript

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

## References

* [Repo ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk)
* [crguezl/hello-jison](https://github.com/crguezl/hello-jison)
* [Espree](https://github.com/eslint/espree)
  * [Options for parse and tokenize methods](https://github.com/eslint/espree#options)
* <a href="https://astexplorer.net/" target="_blank">astexplorer.net demo</a>
* [idgrep.js](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk/blob/master/idgrep.js)
* [Introducción a los Compiladores](https://ull-esit-gradoii-pl.github.io/temas/introduccion-a-pl/esprima.html) con Jison y Espree