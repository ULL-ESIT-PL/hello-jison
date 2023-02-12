%left '-'

%%
es: le EOF { return $1; }
;

le: le ',' e  { $$ = $1.concat($3); }
  | e         { $$ = [$1]; }
;

e: 
    e '-' e      { $$ = $1 - $3; }
  | N            { $$ = Number($1); }
;