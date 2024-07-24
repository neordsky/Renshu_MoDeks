import net from "net";

const client = net.createConnection({ port: 3000, host: "localhost" });

client.addListener("data", (data) => {
    console.info(data.toString());
});
client.write("Liu xin\r\n");