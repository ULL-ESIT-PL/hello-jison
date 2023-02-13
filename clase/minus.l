%%
\s     /* skip whites */;
[0-9]+        return 'N';
[-+*/,()]     return yytext;
<<EOF>>       return 'EOF';
