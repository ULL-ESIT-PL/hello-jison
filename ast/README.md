# A Simple Translator from Infix minus expressions to JavaScript

Install dependencies and run the tests:

```
➜  hello-jison git:(master) cd ast
➜  ast git:(master) npm test

> hello-jison@1.0.0 test
> cd ast && npx mocha test/test.mjs



  ✓ transpile(test1.calc, out1.js)
  ✓ transpile(test2.calc, out2.js)
  ✓ transpile(test3.calc, out3.js)

  3 passing (13ms)
```

## test folder

In this folder we have the `data` folder with 
- the input files `test1.calc`, `test2.calc` and `test3.calc` 
- the expected javascript output files `correct1.js`, `correct2.js` and `correct3.js`
- the expected output files `correct-out1.txt`, `correct-out2.txt` and `correct-out3.txt`.
```
➜  ast git:(master) tree test
test
├── data
│   ├── correct-out1.txt
│   ├── correct-out2.txt
│   ├── correct-out3.txt
│   ├── correct1.js
│   ├── correct2.js
│   ├── correct3.js
│   ├── test1.calc
│   ├── test2.calc
│   └── test3.calc
├── test-description.mjs
└── test.mjs

1 directory, 11 files
```

The script `calc2js.mjs` is a simple translator from infix minus expressions to JavaScript:

```                                                                                
➜  ast git:(master) ✗ ./calc2js.mjs --help
Usage: calc2js [options] <filename>

Arguments:
  filename                 file with the original code

Options:
  -V, --version            output the version number
  -o, --output <filename>  file in which to write the output
  -h, --help               display help for command
➜  ast git:(master) ✗ cat test/data/test1.calc 
4 - 2 - 1
➜  ast git:(master) ✗ ./calc2js.mjs test/data/test1.calc    
console.log(4 - 2 - 1);
```

## useminus.js

The script [useminus.js](useminus.js) is a simple parser from infix minus expressions producing a espree compatible AST:

```
ast git:(master) ./use_minus.js "2-1-1" > ast.json
```

See the file [ast.json](ast.json) for the output of the command above.

## ast2js.js

The script [ast2js.js](ast2js.js) uses [escodegen.generate](https://github.com/estools/escodegen/wiki/API) to traverse a espree compatible AST producing as output the corresponding JavaScript that 
wraps the JS expression of the AST in a `console.log` statement:

```
➜  ast git:(master) ✗ ./ast2js.js './ast.json'
console.log(2 - 1 - 1);
```

## ast-build.js

### buildLiteral

It is simple to build the tree for a literal:

```js
function buildLiteral(value) {
  return {
    type: "Literal",
    value: Number(value),
    raw: value,
  };
}
```

### buildBinaryExpression

To build the tree for a binary expression, we build the left and right children and then the binary expression itself:

```js
function buildBinaryExpression(left, op, right) {
  return {
    type: "BinaryExpression",
    left: left,
    operator: op,
    right: right,
  };
}
```

### buildRoot

The function `buildRoot` in [ast-build.js](ast-build.js) wraps the JS expression of the AST in a `console.log` statement.:

```js
function buildRoot(child) {
  return {
    type: "Program",
    body: [
      {
        type: "ExpressionStatement",
        expression: {
          type: "CallExpression",
          callee: {
            type: "MemberExpression",
            object: {
              type: "Identifier",
              name: "console",
            },
            property: {
              type: "Identifier",
              name: "log",
            },
            computed: false,
          },
          arguments: [child],
        },
      },
    ],
    sourceType: "script",
  };
}
```