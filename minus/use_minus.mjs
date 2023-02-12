#!/usr/bin/env node
import { program } from "commander";
import { createRequire } from "module";
const require = createRequire(import.meta.url);
const { version } = require("../package.json");
import minus from "./minus.js";
const fs = require('fs/promises');

async function transpile(inputFile, outputFile) {
  try {
    let input = await fs.readFile(inputFile, 'utf-8')
    const output = minus.parse(input)
    if (outputFile === undefined) {
      console.log(output);
      return;
    }
    await fs.writeFile(outputFile, output)
  } catch (e) {
    let m = e.message
    console.error(m)
  }
}


program
  .version(version)
  .argument("<filename>", 'file with the original code')
  .option("-o, --output <filename>", "file in which to write the output")
  .action((filename, options) => {
    transpile(filename, options.output);
  });

program.parse(process.argv);
