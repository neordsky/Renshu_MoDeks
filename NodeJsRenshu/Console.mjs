import { Console } from "console";
import { stderr } from "process";
import fs from "fs";

const file = fs.createWriteStream('Consoleinput.txt');

const log = new Console({
    stdout: file,
    stderr: file,
});
log.info('Ni hao ya');
log.info('jiken kaihsi')
console.info(fs.readFileSync('Consoleinput.txt'));
