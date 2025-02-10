const escodegen = require('escodegen');
const p = require("./minus").parser;
const fs = require('fs/promises');

module.exports = async function transpile(inputFile, outputFile) {
  let input = await fs.readFile(inputFile, 'utf-8')
  let ast = null;
  try {
    ast = p.parse(input);
  } catch (e) {
    console.error(e.message);
    return;
  }
  const output = escodegen.generate(ast);
  if (outputFile === undefined) {
      console.log(output);
      return;
  }
  await fs.writeFile(outputFile, output)
}

