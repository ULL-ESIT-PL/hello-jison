Use GerHobbelt jison

```console
➜  usage git:(master) ✗ ls -l ../node_modules/.bin | grep jison 
lrwxr-xr-x@ 1 casianorodriguezleon  staff  32  4 mar.  20:09 jison -> ../jison-gho/dist/cli-cjs-es5.js
lrwxr-xr-x@ 1 casianorodriguezleon  staff  44  4 mar.  20:23 jison-lex -> ../@gerhobbelt/jison-lex/dist/cli-cjs-es5.js
lrwxr-xr-x@ 1 casianorodriguezleon  staff  32  4 mar.  20:17 jison2json -> ../@gerhobbelt/jison2json/cli.js
lrwxr-xr-x@ 1 casianorodriguezleon  staff  27  4 mar.  19:52 json2jison -> ../json2jison/json2jison.js
``` 

Got some trouble with `jison-lex -> ../@gerhobbelt/jison-lex/dist/cli-cjs-es5.js` had to manually change the path to `../@gerhobbelt/jison-lex/cli.js` in `node_modules/.bin/jison-lex` to get it working.

BUG: In the lexer, you can not return '-' for '-', use a name instead, e.g. OP, and return that name instead.