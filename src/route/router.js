import Express from "express";
import { CreatePro, DeleteApi, DeletePro, GetPro, LoginMasyaControl, LoginPetugasController, LoginUser, RegisMasyaControl, RegisPetugas, Register, ShowApi, UpdateApi, UpdatePro, findDoug, findHon, findnomi, findtabe, finpro, konget } from '../controller/user-controller.js'
import path from 'path';
export const Exrout = Express.Router();

//For User
Exrout.post('/api/users/post', Register);
Exrout.get('/api/users/get', ShowApi);
Exrout.delete('/api/users/delte', DeleteApi);
Exrout.put('/api/users/put', UpdateApi);
Exrout.get('/api/users/login', LoginUser);
Exrout.get('/api/users/konget', konget);



//For Produk 
Exrout.get('/api/product/get', GetPro);
Exrout.post('/api/product/post', CreatePro);
Exrout.get('/api/product/find', finpro);
Exrout.delete('/api/product/delete', DeletePro);
Exrout.put('/api/product/put', UpdatePro)
Exrout.get('/api/product/get/tabemono', findtabe);
Exrout.get('/api/product/get/nomimono', findnomi);
Exrout.get('/api/product/get/alat', findDoug);
Exrout.get('/api/product/get/buku', findHon);

// Exrout.use('/image', Express.static(path.join(path.dirname('Images'))));
// Exrout.get('/image', Express.static(path.join(path.dirname('Images'))));

///FOR PETUGAS

Exrout.get('/api/petugas/login', LoginPetugasController);
Exrout.post('/api/petugas/register', RegisPetugas);


//FOR MASYARAKAT

Exrout.get('/api/masyarakat/login', LoginMasyaControl);
Exrout.post('/api/masyarakat/register', RegisMasyaControl)