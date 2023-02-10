%{
  errorMsg = require('./err.js');
%}

%left UNEXPECTED
%left '-'
%%
es: e <<EOF>> { return $1; }
;

e: 
    e '-' e        { $$ = $1 - $3; }
  | NUMBER         { $$ = Number($1); }
  /* error management rules */
  | UNEXPECTED { errorMsg({ rule: 'UNEXPECTED', token: $1, ...@1 }) } 
  | e UNEXPECTED { errorMsg({ rule: 'e UNEXPECTED', token: $2, ...@2 }) } // 4*2
;