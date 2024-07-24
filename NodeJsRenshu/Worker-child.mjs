import { threadId, parentPort } from "worker_threads";

parentPort.addListener("message", (message) => {
    console.info(message);
});
