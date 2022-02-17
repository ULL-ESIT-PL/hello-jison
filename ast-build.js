function buildRoot(child) {
  return {
    type: "Program",
    body: [
      {
        type: "ExpressionStatement",
        expression: {
          type: "CallExpression",
          callee: {
            type: "MemberExpression",
            object: {
              type: "Identifier",
              name: "console",
            },
            property: {
              type: "Identifier",
              name: "log",
            },
            computed: false,
          },
          arguments: [child],
        },
      },
    ],
    sourceType: "script",
  };
}

function buildLiteral(value) {
  return {
    type: "Literal",
    value: Number(value),
    raw: value,
  };
}

function buildBinaryExpression(left, right) {
  return {
    type: "BinaryExpression",
    left: left,
    operator: "-",
    right: right,
  };
}

module.exports = {
    buildRoot,
    buildBinaryExpression,
    buildLiteral
}