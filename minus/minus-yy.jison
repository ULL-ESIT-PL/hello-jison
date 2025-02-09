%right '-'
%%
e: 
    e '-' e  { console.log(`e -> e - e ${yy.myval}`)}
  | N        {console.log(`e ->N ${yy.myval}`)}
;