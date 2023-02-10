
%left '-'
%%
e:  e '-' e { console.log('e->e-e') } 
 | '-' e  { console.log('e->-e') }
 | N { console.log(`N(${$1}) (at column ${@1.first_column})`) }
;