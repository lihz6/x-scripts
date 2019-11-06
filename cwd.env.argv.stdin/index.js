#!/usr/bin/env node

console.log(process.cwd());
console.log(process.env.PATH);

// [0]: realpath $(which node)
// [1]: __filename, path to this script
for (const arg of process.argv.slice(2)) {
  console.log(arg);
}

require('readline')
  .createInterface({
    input: process.stdin
  })
  .on('line', line => {
    console.log(line);
  });
