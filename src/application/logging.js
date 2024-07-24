import winston from "winston";

export const winst = new winston.createLogger({
    level: 'info',
    format: winston.format.json(),
    transports: [
        new winston.transports.Console({})
    ]
}); 