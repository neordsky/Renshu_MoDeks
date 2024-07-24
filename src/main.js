import { App } from "./application/App.js";
import { winst } from "./application/logging.js";
import Express from "express";
import path from 'path';


App.listen(2000, () => {
    winst.info('Application is runn');
    console.log('satrat');
});

App.use('/image', Express.static(path.join(path.dirname('Images'))));