import Zlip from "zlib";
import fs from "fs";
const file = fs.readFileSync('Stream.mjs');
const hengka = Zlip.gzipSync(file);
/* fs.writeFileSync('Zlipcom.txt', hengka); */
console.info(hengka);
const fle = fs.readFileSync('Zlipcom.txt');
const heng = Zlip.unzipSync(fle);
/* fs.writeFileSync('Zlipcom.txt', hengka); */
console.info(heng.toString());