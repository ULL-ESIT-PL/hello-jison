%lex
%%
\s+         {/* skip whitespace */}
[0-9]+      {return 'NAT';}
"+"         {return '+';}
<<EOF>>     {return 'EOF';} 
/lex

%%
S: 
      E EOF   { return yy.queue }
    ;
E
    : E '+' T { yy.queue.unshift(`E=>E+T ('+' at col ${@2.first_column})`)}
    | T       { yy.queue.unshift('E=>T')}
    ;

T
    : NAT     { yy.queue.unshift(`T=>NAT(${$NAT} at col ${@NAT.first_column})`)}
    ;

