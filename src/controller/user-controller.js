import { Prisma } from '../application/Database.js';
import { CreateAccountPetugas, CreateProduk, DelPro, Delete, FindHon, FindNomi, FindPro, FindTabemono, Finddougu, LoginMasyarakatService, LoginPetugasService, Loginuser, RegisterMasyarakatService, UpdatePo, register, update, whget } from '../service/user-service.js';

export const Register = async (req, res, next) => {
    try {
        const Kekka = await register(req.body);
        res.status(200).json({
            data: Kekka
        })
    } catch (error) {
        next(error);
    }

}

export const ShowApi = async (req, res, next) => {
    try {
        const show = await Prisma.users.findMany();
        res.status(200).json({
            data: show
        })
    } catch (error) {
        next(error)
    }
}


export const DeleteApi = async (req, res, next) => {
    try {
        const del = await Delete(req.body);
        res.status(200).json({
            data: 'Succes Delete'
        });
    } catch (error) {
        next(error);
    }
}

export const UpdateApi = async (req, res, next) => {
    try {
        const Up = await update(req.body);
        res.status(200).json({
            data: Up
        });
    } catch (error) {
        next(error);
    }
}
export const konget = async (req, res, next) => {
    try {
        const log = await whget(req.body);
        res.status(200).json({
            data: log
        })
    } catch (error) {
        next(error);
    }
}

export const LoginUser = async (req, res, next) => {
    try {
        const log = await Loginuser(req.body);
        res.status(200).json({
            data: log
        });
    } catch (error) {
        next(error);
    }
}

export const CreatePro = async (req, res, next) => {
    try {
        const Cre = await CreateProduk(req.body);
        res.status(200).json({
            data: Cre
        })
    } catch (error) {
        next(error);
    }
}

export const UpdatePro = async (req, res, next) => {
    try {
        const up = await UpdatePo(req.body);
        res.status(200).json({
            data: up
        })
    } catch (error) {
        next(error);
    }
}


export const finpro = async (req, res, next) => {
    try {
        const fin = await FindPro(req.body);
        res.status(200).json({
            data: fin
        })
    } catch (error) {
        next(error);
    }
}

export const GetPro = async (req, res, next) => {
    try {
        const Get = await Prisma.newProduct.findMany();
        res.status(200).json({
            data: Get
        })
    } catch (error) {
        next(error);
    }
}

export const DeletePro = async (req, res, next) => {
    try {
        const Del = await DelPro(req.body);
        res.status(200).json({
            Data: "SUcces Delete"
        })
    } catch (error) {
        next(error);
    }
}

export const GetPropopu = async (req, res, next) => {
    try {

    } catch (error) {
        next(error)
    }
}
export const findtabe = async (req, res, next) => {
    try {
        const fi = await FindTabemono(req.body);
        res.status(200).json({
            data: fi
        })
    } catch (error) {
        next(error);

    }
}
export const findnomi = async (req, res, next) => {
    try {
        const fi = await FindNomi(req.body);
        res.status(200).json({
            data: fi
        })
    } catch (error) {
        next(error);
    }
}
export const findHon = async (req, res, next) => {
    try {
        const fi = await FindHon(req.body);
        res.status(200).json({
            data: fi
        })
    } catch (error) {
        next(error);
    }
}
export const findDoug = async (req, res, next) => {
    try {
        const fi = await Finddougu(req.body);
        res.status(200).json({
            data: fi
        })
    } catch (error) {
        next(error);
    }
}

export const LoginPetugasController = async (req, res, next) => {
    try {
        const gto = await LoginPetugasService(req.body);
        res.status(200).json({
            data: gto
        });
    } catch (error) {
        next(error);
    }
}

export const RegisPetugas = async (req, res, next) => {
    try {
        const gow = await CreateAccountPetugas(req.body);
        res.status(200).json({
            data: gow
        });
    } catch (error) {
        next(error);
    }
}


////AWAL METHOD MASYARAT
export const RegisMasyaControl = async (req, res, next) => {
    try {
        const rge = await RegisterMasyarakatService(req.body);
        res.status(200).json({
            data: rge
        })
    } catch (error) {
        next(error);
    }
}

export const LoginMasyaControl = async (req, res, next) => {
    try {
        const log = await LoginMasyarakatService(req.body);
        res.status(200).json({
            data: log
        })
    } catch (error) {
        next(error);
    }
}
