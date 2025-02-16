%lex
%%
\s+         {/* skip whitespace */}
[0-9]+      {return 'NAT';}
"+"         {return '+';}
/lex

%%
S: 
      E       { return yy.queue }
    ;
E
    : E '+' T { yy.queue.unshift('E=>E+T')}
    | T       { yy.queue.unshift('E=>T')}
    ;

T
    : NAT     { yy.queue.unshift('T=>NAT')}
    ;

