import { threadId, Worker } from "worker_threads";

const wor1 = new Worker("./NodeJsRenshu/Worker-child.mjs");
wor1.postMessage("Ni hao ya");