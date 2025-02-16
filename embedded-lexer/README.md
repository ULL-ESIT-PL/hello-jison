# Example of Jison program with embedded lexer

* [embedded_lexer.jison](embedded_lexer.jison)
* [use.js](use.js)

## Usage

Omitting the fields `loc` and `value`:

```bash
➜  embedded-lexer git:(master) npx jison embedded_lexer.jison; ./use.js 2+3 loc 
input: 2+3
Parse Tree:

type: "Expression"
rightside:
  - type: "Expression"
    rightside:
      - type: "Term"
        rightside:
          - type: "Number"
            value: "2"
  - type: "Plus"
    value: "+"
  - type: "Term"
    rightside:
      - type: "Number"
        value: "3"
```

An example with an error:

```bash
➜  embedded-lexer git:(develop) ✗ npx jison embedded_lexer.jison; ./use.js 2+
input: 2+
Parse error on line 1:
2+
--^
Expecting 'NAT', got 'EOF'
```

Example showing values:

```bash
➜  embedded-lexer git:(master) ✗  npx jison embedded_lexer.jison; ./use.js 2+3 loc      
input: 2+3
Parse Tree:

type: "Expression"
rightside:
  - type: "Expression"
    rightside:
      - type: "Term"
        rightside:
          - type: "Number"
            value: "2"
  - type: "Plus"
    value: "+"
  - type: "Term"
    rightside:
      - type: "Number"
        value: "3"
```

## See also

* [The use of parser.yy](https://github.com/ULL-ESIT-PL/hello-jison/blob/master/minus/README.md#parseryy)
