/* 
Compile first to JSON:

   npx jison2json minus.jison minus.l -o minus.json
   node use-jison.cjs
    
bug: You can not return '-' for '-', use a name instead, e.g. OP, and return that name instead. 
*/
%%
\s     /* skip whites */;
[0-9]+        return 'N';
'-'           return 'OP';
','           return 'COMMA';
<<EOF>>       return 'EOF';
