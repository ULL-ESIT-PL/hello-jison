%{
const { buildRoot, buildBinaryExpression, buildLiteral } = require('./ast-build');
%}

%left '-'
%%
es: e { return buildRoot($1); }
;

e: 
    e '-' e  { $$ = buildBinaryExpression($1, '-', $3)  }
  | N        { $$ = buildLiteral($1); }
;