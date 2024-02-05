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