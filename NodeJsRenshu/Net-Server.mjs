import net from "net";

const Sever = net.createServer((client) => {
    console.info('Tsunagaru');
    client.on("data", (data) => {
        console.info(data.toString());
        client.write('ni hao ' + data.toString() + '\r\n');
    })
});
Sever.listen(3000, "localhost");

const client = net.createConnection({ port: 3000, host: "localhost" });
client.addListener("data", (data) => {
    console.info(data.toString());
});
client.write("Liu xin\r\n");
