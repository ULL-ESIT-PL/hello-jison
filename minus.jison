%%
es: e { return $1;}
;

e: 
    e '-' e      { $$ = $1 - $3; }
  | N            { $$ = Number($1); }
;