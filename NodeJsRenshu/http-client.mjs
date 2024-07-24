import http from "http";

const URL = '';

const req = http.request(URL, {
    method: "POST",
    headers: {
        "Content-Type": "application-json",
        "Accept": "application-json",
    }
}, (response) => {
    response.addListener("data", (data) => {
        console.info(data);
    })
});
const body = JSON.stringify({
    Id : "000",
    Username: "Liu SHan",
    Password : "hiyayuu",
});
req.write(body);
req.end();