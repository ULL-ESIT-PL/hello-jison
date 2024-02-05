## Grammar

See Section [Precedencia y Asociatividad](https://crguezl.github.io/pl-html/node57.html#section:prioridades) of the old PL notes.

```js

%left '-'
%left STRONG
%%
e:  e '-' e { console.log('e->e-e') } 
 | '-' e  %prec STRONG { console.log('e->-e') }
 | NUMBER { console.log(`NUMBER(${$1}) (at column ${@1.first_column})`) }
;
```

## Execution

The input is `-2-3`:

```
➜  hello-jison git:(questionnaire) ✗ npm run prec

> hello-jison@1.0.0 prec
> jison prec/uminus.jison prec/minus.l -o prec/uminus.js; prec/use-prec.js

NUMBER(2) (at column 1)
e->-e
NUMBER(3) (at column 3)
e->e-e
```

## Location

In a given rule, several constructs can be used to access the locations of the elements being matched. 

- The location of the nth component of the right hand side is `@n`, while 
- the location of the left hand side grouping is `@$`.

The location object has attributes: 

- `first_line`, 
- `first_column`, 
- `last_line`, 
- `last_column`

```js
%left '-'
%left STRONG
%%
e:  e '-' e { console.log('e->e-e') } 
 | '-' e  %prec STRONG { console.log('e->-e') }
 | NUMBER { console.log(`NUMBER(${$1}) (at column ${@1.first_column})`) }
;
```