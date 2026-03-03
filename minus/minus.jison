// compile it with: npx jison minus.jison minus.l -o minus.js
// ./use_minus.js '8-3-1, 9-4'
%left '-'

%%
es: le EOF { return $1; }
;

le: le ',' e  { $$ = $le.concat($e); }
  | e         { $$ = [$1]; }
;

e: 
    e[left] '-' e[right]   { /* illustrates alias usage */ $$ = $left - $right; }
  | N         { $$ = Number($1); }
;