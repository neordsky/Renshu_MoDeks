import EventEmitter from "events";


const Emit = new EventEmitter()
Emit.addListener('Saiho', (hito) => {
    console.info('ni shi shui' + hito);
});
Emit.addListener('Nidai', (mono) => {
    console.info('doko ni suitanda' + mono)
});
Emit.emit('Nidai', 'Hikaru');
