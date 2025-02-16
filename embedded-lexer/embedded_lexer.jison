%{
let queue = [];
%}

%lex
%%
\s+         {/* skip whitespace */}
[0-9]+      {return 'NAT';}
"+"         {return '+';}
/lex

%%
S: 
      E       { return queue }
    ;
E
    : E '+' T { queue.unshift('E=>E+T')}
    | T       { queue.unshift('E=>T')}
    ;

T
    : NAT     { queue.unshift('T=>NAT')}
    ;

