%%
\s+     /* skip whites */;
[0-9]+        return 'N';
'-'           return '-';
<<EOF>>       return 'EOF';
(.|\n)+       return 'UNEXPECTED';
