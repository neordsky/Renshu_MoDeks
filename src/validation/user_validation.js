import Joi from "joi";

export const RegisterVali = Joi.object({
    Id: Joi.number().max(200).required(),
    Username: Joi.string().max(200).required(),
    Password: Joi.string().max(200).required(),


});

export const LoginVail = Joi.object({
    Username: Joi.string().max(200).required(),
    Password: Joi.string().max(200).required(),


});

export const CheTo = Joi.object({
    Token: Joi.string().max(200).required()
});

export const ValiPro = Joi.object({
    Kode_Barang: Joi.number().max(200).required(),
    Nama_Barang: Joi.string().max(200).required(),
    Harga_Barang: Joi.number().max(200).required(),
    Jumlah_Barang: Joi.number().max(200).required(),
    Image: Joi.string().max(200).required(),
    Jenis: Joi.string().max(200).required()
});

export const findprovali = Joi.object({
    Nama_Barang: Joi.string().max(200).required()
});

export const Delepro = Joi.object({
    Kode_Barang: Joi.string().max(200).required(),
    Nama_Barang: Joi.string().max(200).required(),
});

export const ValiLoginPetugas = Joi.object({
    username: Joi.string().max(32).required(),
    password: Joi.string().max(255).required()
});

export const ValiCreatPetugas = Joi.object({
    username: Joi.string().max(32).required(),
    password: Joi.string().max(255).required(),
    telp: Joi.string().max(13).required(),
    nama_petugas: Joi.string().max(35).required(),
    level: Joi.string().max(8).required()
})

/// AWAL METTHOD FOR MASYARAKAT
export const ValiRegiMasya = Joi.object({
    nik: Joi.string().max(16).required(),
    nama_lengkap: Joi.string().max(35).required(),
    username: Joi.string().max(32).required(),
    password: Joi.string().max(255).required(),
    telp: Joi.string().max(13).required(),
    level: Joi.string().max(15).required()



});

export const ValiLoginMasya = Joi.object({
    username: Joi.string().max(32).required(),
    password: Joi.string().max(255).required(),
})

