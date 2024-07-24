import { PrismaClient } from "@prisma/client";
import { winst } from "./logging.js";

export const Prisma = new PrismaClient({
    log: [
        {
            emit: 'event',
            level: 'query'

        },
        {
            emit: 'event',
            level: 'error'
        },
        {
            emit: 'event',
            level: 'info'
        },
        {
            emit: 'event',
            level: 'warn'
        }
    ]
});

Prisma.$on('query', (q) => {
    winst.info(q);
});
Prisma.$on('error', (e) => {
    winst.error(e);
});
Prisma.$on('info', (i) => {
    winst.info(i);
});
Prisma.$on('warn', (w) => {
    winst.warn(w);
})