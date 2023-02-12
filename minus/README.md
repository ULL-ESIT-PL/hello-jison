## Simple interpreter

ECMA 6 version:

``` 
➜  minus git:(master) npm run test-mjs

> hello-jison@1.0.0 test-mjs
> npm run build; ./minus/use_minus.mjs ./minus/input.minus


> hello-jison@1.0.0 build
> jison minus/minus.jison minus/minus.l -o minus/minus.js

[ 3, 2, 96, 4 ]
```

CommonJS version:

```
➜  minus git:(master) ✗ npm run test-simple

> hello-jison@1.0.0 test-simple
> npm run build; ./minus/use_minus.js


> hello-jison@1.0.0 build
> jison minus/minus.jison minus/minus.l -o minus/minus.js

[
  0
]
```
