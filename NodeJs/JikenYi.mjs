import process from "process";
import http from "http";
import readline from "readline";
import fs from "fs/promises";
import path from "path";
const buffer = await fs.readFile("NodeJs/JikenYi.mjs");
console.info(buffer.toString());
// const input = readline.createInterface({

// })

const server = http.createServer((request, response) => {
    console.info(request.method);
    console.info(request.url);
    response.write('Yokoso');
    response.write(buffer.toString());

    response.end();
});

server.listen(3000);