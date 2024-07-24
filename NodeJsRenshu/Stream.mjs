import fs from "fs";
// const tsuluru = fs.createWriteStream("Yi.txt");
// tsuluru.write('Ni hao\n');
// tsuluru.write('Zao Shang Hao');
// tsuluru.end();
const yomu = fs.createReadStream('Yi.txt');
yomu.addListener("data", (data) => {
    const kai = data.toString();
    console.info(kai);
})