
const buffer = Buffer.from("kisahaya", "utf-8");
console.info("base64" + buffer.toString("base64"));
console.info("ascii" + buffer.toString("ascii"));
console.info("base64url" + buffer.toString("base64url"));
console.info("binary" + buffer.toString("binary"));
console.info("hex" + buffer.toString("hex"));
console.info("latin1" + buffer.toString("latin1"));
console.info("ucs" + buffer.toString("ucs-2"));
console.info("ucs2" + buffer.toString("ucs2"));
console.info("utf-16l" + buffer.toString("utf-16le"));
console.info("utf-8" + buffer.toString("utf-8"));
console.info("utf16le" + buffer.toString("utf16le"));
console.info("utf8" + buffer.toString("utf8"));

const bufferNi = Buffer.from("v=b39Xqf5iyjo=", "base64");
console.info(bufferNi.toString("ascii"));