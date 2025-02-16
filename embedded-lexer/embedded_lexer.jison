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
    : E '+' T { $$ = {type: yy.E, children: [$E1, { type: yy["+"], value: '+', loc: @1}, $T]} }
    | T       { $$ = {type: yy.E, children: [$T]} }
    ;

T
    : NAT     { $$ = { type: yy.T, children: [{ type: yy.NAT, value: $NAT, loc: @NAT}] } }
    ;

