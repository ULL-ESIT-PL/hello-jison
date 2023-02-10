%left '-'
%left UNEXPECTED
%%
es: e { return $1; }
;

e: 
    e '-' e        { $$ = $1 - $3; }
  | N              { $$ = Number($1); }
  /* error management rules */
  | UNEXPECTED     { console.error('Unexpected token: "' + $1 + '" at column '+@1.last_column); process.exit(1);}
  | UNEXPECTED e   { console.error('Unexpected token: "' + $1 + '" at column '+@1.first_column); process.exit(1);}
  | e UNEXPECTED   { console.error('Unexpected token: ' + $2 + ' at column '+@1.last_column); process.exit(1);}
  | e UNEXPECTED e { console.error('Unexpected token: "' + $2 + '" at column '+@1.last_column); process.exit(1);}
;