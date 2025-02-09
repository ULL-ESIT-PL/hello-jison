%right '-'
%%
e: 
    e '-' e  { console.log(`e -> e - e ${JSON.stringify(@2)}`) }
  | N        { console.log(`e ->N ${JSON.stringify(@1)}`) }
;