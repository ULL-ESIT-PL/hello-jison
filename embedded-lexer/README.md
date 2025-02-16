# Example of Jison program with embedded lexer

* [embedded_lexer.jison](embedded_lexer.jison)
* [use.js](use.js)

## Usage

```bash
➜  embedded-lexer git:(master) npx jison embedded_lexer.jison; ./use.js
[
  "E=>E+T",
  "T=>NAT",
  "E=>E+T",
  "T=>NAT",
  "E=>T",
  "T=>NAT"
]
```

An example with an error:

```bash
➜  embedded-lexer git:(master) ✗ npx jison embedded_lexer.jison; ./use.js 2+
Parse error on line 1:
2+
--^
Expecting 'NAT', got 'EOF'
```


## See also

* [The use of parser.yy](https://github.com/ULL-ESIT-PL/hello-jison/blob/master/minus/README.md#parseryy)
