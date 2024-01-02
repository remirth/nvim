// @ts-check
import {execSync} from 'child_process';
const [_, __, path, find, replace] = process.argv;

// DO NOT JUDGE ME FOR BEING A NODE SCRIPT KIDDY.
// FOR SOME REASON WSL DOES NOT WANT TO RUN INSIDE LUA BUT IS FINE RUNNING IN NODE

const cmd = `bash -c "find ${path} -type f -exec sed -i 's/${find}/${replace}/g' {} \\;"`
execSync(cmd, {stdio: 'inherit'})
console.log(`Replaced ${find} with ${replace} in ${path}`)



