# Example of Jison program with embedded lexer

* [embedded_lexer.jison](embedded_lexer.jison)
* [use.js](use.js)

## Usage

```bash
➜  embedded-lexer git:(master) ✗ npx jison embedded_lexer.jison; ./use.js 2+3 loc value
input: 2+3
Parse Tree:

type: "Expression"
children:
  - type: "Expression"
    children:
      - type: "Term"
        children:
          - type: "Number"
  - type: "Plus"
  - type: "Term"
    children:
      - type: "Number"
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
➜  embedded-lexer git:(master) ✗ npx jison embedded_lexer.jison; ./use.js 2+3 loc      
input: 2+3
Parse Tree:

type: "Expression"
children:
  - type: "Expression"
    children:
      - type: "Term"
        children:
          - type: "Number"
            value: "2"
  - type: "Plus"
    value: "+"
  - type: "Term"
    children:
      - type: "Number"
        value: "3"
```

## See also

* [The use of parser.yy](https://github.com/ULL-ESIT-PL/hello-jison/blob/master/minus/README.md#parseryy)
