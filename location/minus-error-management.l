%%
\s+     /* skip whites */;
[0-9]+        return 'NUMBER';
'-'           return '-';
(.|\n)        return 'UNEXPECTED';
<<EOF>>       return 'EOF';
