# Simple grammar to illustrate Jison

Install the dependencies:

```
npm i
```

Usage:

```
✗ npm test 5-2-1

> hello-jison@1.0.0 test
> npm run compile; ./use_minus.js "5-2-1"


> hello-jison@1.0.0 compile
> jison minus.jison minus.l -o minus.js

2
```