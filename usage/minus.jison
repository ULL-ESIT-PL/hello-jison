// compile it with: npx jison minus.jison minus.l -o minus.js
%left '-'

%token N OP COMMA
%%
es: le EOF { return $1; }
;

le: le COMMA e  { $$ = $le.concat($e); }
  | e         { $$ = [$1]; }
;

e: 
    e OP N   { $$ = $e1 - $N; }
  | N         { $$ = Number($1); }
;