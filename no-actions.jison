%lex
%%
[0-9]+        return 'NUMBER';
[-+*/]        return 'OP';
.             return '';
/lex

%% 
es:  es OP es
  | NUMBER ;

