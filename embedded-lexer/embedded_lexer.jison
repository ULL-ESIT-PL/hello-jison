%lex
%%
\s+         {/* skip whitespace */}
[0-9]+      {return 'NAT';}
"+"         {return '+';}
<<EOF>>     {return 'EOF';} 
/lex

%%
S: 
      E EOF   { return $E }
    ;
E
    : E '+' T { $$ = {type: yy.E, rightside: [$E, { type: yy["+"], value: '+', loc: @1}, $T]} }
    | T       { $$ = {type: yy.E, rightside: [$T]} }
    ;

T
    : NAT     { $$ = { type: yy.T, rightside: [{ type: yy.NAT, value: $NAT, loc: @NAT}] } }
    ;

