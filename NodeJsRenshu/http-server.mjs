import http from "http";
import { threadId, Worker } from "worker_threads";
const Data = JSON.stringify({
    Id: "000",
    Username: "Lin shiang",
    Password: "hara",
});
const Data2 = JSON.stringify({
    Id: "001",
    Username: "Long shiang",
    Password: "Yubahara",
})
const Data3 = JSON.stringify({
    Id: "002",
    Username: "XIn xiu",
    Password: "Kiramisa",
})
const Data4 = JSON.stringify({
    Id: "003",
    Username: "Lin Xiao",
    Password: "Saiyki",
})
const Server = http.createServer((request, respone) => {



    if (request.url == "/zenbu") {
        respone.write(Data);
        respone.write(Data2);
        respone.write(Data3);
        respone.write(Data4);
        respone.end();
    }
    if (request.method == "POST") {
        request.addListener("data", (data) => {
            respone.setHeader("Content-Type", "application/json"),
                respone.write(data);
            respone.end();
        })
    } else {

    }
});
Server.listen(41786);



