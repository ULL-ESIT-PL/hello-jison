import transpile from "../transpile.js";
import assert from 'assert';
import * as fs from "fs/promises";
import { dirname } from 'path';
import { fileURLToPath } from 'url';

const __dirname = dirname(fileURLToPath(import.meta.url));
import Tst from './test-description.mjs';

const Test = Tst.map(t => ({
  input: __dirname + '/data/' + t.input,
  output: __dirname + '/data/' + t.output,
  expected: __dirname + '/data/' + t.expected,
  correctOut: __dirname + '/data/' + t.correctOut,
})
)

function removeSpaces(s) {
  return s.replace(/\s/g, '');
}

for (let i = 0; i < Test.length; i++) {
  it(`transpile(${Tst[i].input}, ${Tst[i].output})`, async () => {

    // Compile the input and check the output program is what expected
    await transpile(Test[i].input, Test[i].output);
    let output = await fs.readFile(Test[i].output, 'utf-8')
    let expected = await fs.readFile(Test[i].expected, 'utf-8')
    assert.equal(removeSpaces(output), removeSpaces(expected));
    await fs.unlink(Test[i].output);

    // Run the output program and check the logged output is what expected
    let correctOut = await fs.readFile(Test[i].correctOut, 'utf-8')
    let oldLog = console.log; // mocking console.log
    let result = "";
    console.log = function (...s) { result += s.join('') }
      eval(output);
      assert.equal(removeSpaces(result), removeSpaces(correctOut))
    console.log = oldLog;
  });
}


