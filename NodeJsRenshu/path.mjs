import path from "path";
const file = "https://www.youtube.com/watch?v=b39Xqf5iyjo&t=6978s";
console.info(path.dirname(file));
console.info(path.basename(file));
console.info(path.extname(file));
console.info(path.parse(file));
