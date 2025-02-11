
%left '-'
%left STRONG
%%
e:  e '-' e { console.log(`e->e-e ${@2.first_column}`) } 
 | '-' e  %prec STRONG { console.log(`e->-e ${@1.first_column}`) }
 | NUMBER { console.log(`e->NUMBER(${$1}) (at column ${@1.first_column})`) }
;