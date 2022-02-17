%{

function buildRoot(child) {
  return `
{
    "type": "Program",
    "body": [
      {
        "type": "ExpressionStatement",
        "expression": ${child}
      }
    ],
    "sourceType": "script"
}
`;
}

function buildLiteral(value) {
  return `
{
    "type": "Literal",
    "value": ${value},
    "raw": "${value}"
}`
} 

function  buildBinaryExpression(left, right) {
  return `
        {
          "type": "BinaryExpression",
          "left": ${left},
          "operator": "-",
          "right": ${right}
        }
  `
}

%}

%left '-'
%%
es: e { return buildRoot($1); }
;

e: 
    e '-' e.     
    { 
      $$ = buildBinaryExpression($1, $3)
    }
  | N            { $$ = buildLiteral($1); }
;