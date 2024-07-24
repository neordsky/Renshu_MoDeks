import { ResponsError } from "../Error/response-error.js";


export const Errormid = async (err, req, res, next) => {
    if (!err) {
        next();
        return;
    }
    if (err instanceof ResponsError) {
        res.status(400).json({
            error: err.message
        }).end();
    } else {
        res.status(500).json({
            error: err.message
        }).end();
    }
}
