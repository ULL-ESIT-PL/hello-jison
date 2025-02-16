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
