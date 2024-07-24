import readline from "readline";
import http from "http";
import process from "process";


process.report.reportOnFatalError = true;
process.report.reportOnSignal = true;
process.report.reportOnUncaughtException = true;
process.report.filename = "ReportEror.json";
function Erorrre() {
    throw new Error("Yabaa");

}
Erorrre();
const input = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

input.question("Sho hua ya? : ", (SHo) => {
    console.info(SHo.toString());
    input.close();

});


