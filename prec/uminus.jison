
%left '-'
%left STRONG
%%
e:  e '-' e { console.log('e->e-e') } 
 | '-' e  %prec STRONG { console.log('e->-e') }
 | NUMBER { console.log(`NUMBER(${$1}) (at column ${@1.first_column})`) }
;