import Express from "express";
import { Exrout } from "../route/router.js";
import { Errormid } from "../Error-midleware/Error-middleware.js";
import path from "path";

export const App = Express();
App.use(Express.json());
App.use(Exrout);
App.use(Errormid);
App.use('/image', Express.static('Images'));
