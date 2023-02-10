# Compiler Basics

This repo contains four examples:

* The first one in folder`minus` is a simple interpreter for infix arithmetic expressions with the minus operator only
  * See files `minus.jison`, `minus.l` and  `use_minus.js`
* The example in folder `location`  shows how to access to the location of tokens, how to pass information from outside to an action, how to deal with lexical errors and a few tricks to improve error messages
  * See files `minus-error-management.jison`, `minus-error-management.l` and  `main.js`
  * The `err.js` file contains the error message function
* The example in folder `ast` is a translator from infix arithmetic expressions to JavaScript
  * `minus-ast.jison` builds a Espree compatible AST using `minus.l` and the helpers in `ast-build.js`
  * Check <a href="https://astexplorer.net/" target="_blank">astexplorer.net demo</a> to explore the shape of the ASTs
  * The lexical analyzer `minus.l` is used by both examples
* The `ast-*.json` files contain examples of Espree ASTs
* The example in folder `prec` illustrates the use of the `%prec` directive to resolve conflicts
  * See files `prec.jison`, `prec.l` and  `use_prec.js`
  * The `prec-*.json` files contain examples of Espree ASTs
  * 
## package.json scripts to run the examples

```
hello-jison git:(master) npm run
Lifecycle scripts included in hello-jison@1.0.0:
  test
    npm run tojs; node ast/salida.js

available via `npm run-script`:
  test-simple
    npm run build; ./minus/use_minus.js
  tojs
    npm run build-ast; ./ast/ast2js.js | tee ast/salida.js
  build-ast
    npm run compile-ast; ./ast/use_minus.js > ast/ast.json; cat ast/ast.json
  build
    jison minus/minus.jison minus/minus.l -o minus/minus.js
  loc
    jison location/minus-error-management.jison location/minus-error-management.l -o location/minus.js
  debug
    jison minus/minus.jison minus/minus.l -o minus/minus.js --debug
  dfa
    bison -v minus.jison; rm -f minus.tab.jison
  prec
    jison prec/uminus.jison prec/minus.l -o prec/uminus.js; prec/use-prec.js
  compile-ast
    jison ast/minus-ast.jison ast/minus-ast.l -o ast/minus.js
  clean
    rm -f ast/ast.json ast/salida.js ast/minus.js location/minus.js
```

## Install the dependencies:

```
npm i
```

## References

* [Repo ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk)
* [crguezl/hello-jison](https://github.com/crguezl/hello-jison)
* [Espree](https://github.com/eslint/espree)
  * [Options for parse and tokenize methods](https://github.com/eslint/espree#options)
* <a href="https://astexplorer.net/" target="_blank">astexplorer.net demo</a>
* [idgrep.js](https://github.com/ULL-ESIT-GRADOII-PL/esprima-pegjs-jsconfeu-talk/blob/master/idgrep.js)
* [Introducción a los Compiladores](https://ull-esit-gradoii-pl.github.io/temas/introduccion-a-pl/esprima.html) con Jison y Espree