# Example of Jison program with embedded lexer

* [embedded_lexer.jison](embedded_lexer.jison)
* [use.js](use.js)

## Usage

```bash
➜  embedded-lexer git:(develop) ✗ npx jison embedded_lexer.jison; ./use.js                  
input: 2+1+1
Parse Tree:

{
  "type": "Expression",
  "children": [
    {
      "type": "Expression",
      "children": [
        {
          "type": "Expression",
          "children": [
            {
              "type": "Term",
              "children": {
                "type": "Number",
                "value": "2",
                "loc": {
                  "first_line": 1,
                  "last_line": 1,
                  "first_column": 0,
                  "last_column": 1
                }
              }
            }
          ]
        },
        {
          "type": "Plus",
          "value": "+",
          "loc": {
            "first_line": 1,
            "last_line": 1,
            "first_column": 0,
            "last_column": 1
          }
        },
        {
          "type": "Term",
          "children": {
            "type": "Number",
            "value": "1",
            "loc": {
              "first_line": 1,
              "last_line": 1,
              "first_column": 2,
              "last_column": 3
            }
          }
        }
      ]
    },
    {
      "type": "Plus",
      "value": "+",
      "loc": {
        "first_line": 1,
        "last_line": 1,
        "first_column": 0,
        "last_column": 3
      }
    },
    {
      "type": "Term",
      "children": {
        "type": "Number",
        "value": "1",
        "loc": {
          "first_line": 1,
          "last_line": 1,
          "first_column": 4,
          "last_column": 5
        }
      }
    }
  ]
}
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


## See also

* [The use of parser.yy](https://github.com/ULL-ESIT-PL/hello-jison/blob/master/minus/README.md#parseryy)
