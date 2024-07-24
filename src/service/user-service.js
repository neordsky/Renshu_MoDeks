import { validate } from "../validation/validation.js"
import { CheTo, Delepro, LoginVail, RegisterVali, ValiCreatPetugas, ValiLoginMasya, ValiLoginPetugas, ValiPro, ValiRegiMasya, findprovali } from "../validation/user_validation.js"
import { Prisma } from "../application/Database.js";
import { ResponsError } from "../Error/response-error.js";
import bcrypt from "bcrypt";
import { request } from "express";
import { v4 as uuid } from "uuid";
import multer from "multer";

export const Multer = multer
export const filestorage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'Images');
    },
    filename: (req, file, cb) => {
        cb(null, new Date().toString(), + '-' + file.originalname);
    }
})

export const filefilter = (req, file, cb) => {
    if (file.mimetype === 'image.jpg' || file.mimetype === 'image.png' || file.mimetype === 'image.jpeg') {
        cb(null, true)

    } else {
        cb(null, false)
    }
}

export const imgfi = async (request) => {
    const fi = Prisma.newProduct.findFirst({

    })
}
//For User 
export const register = async (request) => {
    const user = validate(RegisterVali, request);
    const countuser = Prisma.users.count({
        where: {
            Id: user.Id,
            Username: user.Username
        }
    });
    if (countuser === 1) {
        throw new ResponsError(400, "Username or Id is already..!");
    }

    user.Password = await bcrypt.hash(user.Password, 10);

    return Prisma.users.create({
        data: user,
        select: {
            Id: true,
            Username: true,
            Password: true,


        }
    });

}
export const FindHon = async (request) => {
    const find = await Prisma.newProduct.findMany({
        where: {
            Jenis: "Buku"
        },
        select: {
            Kode_Barang: true,
            Nama_Barang: true,
            Harga_Barang: true,
            Jumlah_Barang: true,
            Jenis: true,
            Image: true
        }

    });
    if (!find) {
        throw new ResponsError(400, "Not Found..!")
    }

    return find;

}
export const Finddougu = async (request) => {
    const find = await Prisma.newProduct.findMany({
        where: {
            Jenis: "Alat"
        },
        select: {
            Kode_Barang: true,
            Nama_Barang: true,
            Harga_Barang: true,
            Jumlah_Barang: true,
            Jenis: true,
            Image: true
        }

    });
    if (!find) {
        throw new ResponsError(400, "Not Found..!")
    }

    return find;

}
export const FindNomi = async (request) => {
    const find = await Prisma.newProduct.findMany({
        where: {
            Jenis: "Minuman"
        },
        select: {
            Kode_Barang: true,
            Nama_Barang: true,
            Harga_Barang: true,
            Jumlah_Barang: true,
            Jenis: true,
            Image: true
        }

    });
    if (!find) {
        throw new ResponsError(400, "Not Found..!")
    }

    return find;




}
export const FindTabemono = async (request) => {
    const find = await Prisma.newProduct.findMany({
        where: {
            Jenis: "Makanan"
        },
        select: {
            Kode_Barang: true,
            Nama_Barang: true,
            Harga_Barang: true,
            Jumlah_Barang: true,
            Image: true,
            Jenis: true




        }
    });
    if (!find) {
        throw new ResponsError(400, "Product Not Found..!");
    }
    return find;
}
export const Delete = async (request) => {
    const user = validate(RegisterVali, request);
    const Check = await Prisma.newusers.findUnique({
        where: {
            Id: user.Id,
            Username: user.Username
        },
        select: {
            Id: true,
            Username: true
        }
    });
    if (!Check) {
        throw new ResponsError(400, "User is Not Found..!");
    }
    const process = await Prisma.users.delete({
        where: {
            Id: user.Id,
            Username: user.Username
        }
    });

    return process;



}

export const update = async (request) => {
    const user = validate(RegisterVali, request);

    const uppro = await Prisma.users.update({
        where: {
            Id: user.Id,
        },
        data: {
            Id: user.Id,
            Username: user.Username,
            Password: user.Password,
            Alamat: user.Alamat

        },
        select: {
            Id: true,
            Username: true,
            Password: true,
            Alamat: true
        }
    });
    return uppro;
}

export const Loginuser = async (request) => {
    const user = validate(LoginVail, request);
    const Login = await Prisma.users.findFirst({
        where: {

            Username: user.Username,


        },
        select: {

            Username: true,
            Password: true,
            Id: true

        }
    });
    if (!Login) {
        throw new ResponsError(401, "Username Or password Is Wrong..!");
    }
    // const ispass = bcrypt.compare(user.Password, Login.Password);
    // if (!ispass) {
    //     throw ResponsError(401, "Username Or Password Is Wrong..!")
    // }
    const ChePas = await bcrypt.compare(user.Password, Login.Password)
    if (!ChePas) {
        throw new ResponsError(401, "Username Or Password Is Wrong..!");
    }
    const token = uuid();

    return Prisma.users.update({
        data: {
            Token: token
        },
        where: {
            Id: Login.Id,

        },
        select: {
            Token: true
        }
    });
}

export const whget = async (req) => {
    const val = validate(CheTo, req);
    const quer = await Prisma.users.findFirst({
        where: {
            Token: val.Token

        },
        select: {
            Username: true,
            Password: true,
            Id: true
        }
    });
    return quer;

}

export const CreateProduk = async (request) => {
    const Produk = validate(ValiPro, request);
    const countid = Prisma.newProduct.count({
        where: {
            Kode_Barang: Produk.Kode_Barang
        }
    });
    if (countid === 1) {
        throw new ResponsError(400, "Kode_Barang is already..!")
    }
    const Cre = await Prisma.newProduct.create({
        data: Produk,
        select: {
            Kode_Barang: true,
            Nama_Barang: true,
            Harga_Barang: true,
            Jumlah_Barang: true,
            Image: true,
            Jenis: true
        }
    });
    return Cre;
}

export const FindPro = async (request) => {
    const Produk = validate(findprovali, request);
    const Find = await Prisma.newProduct.findMany({
        where: {
            Nama_Barang: Produk.Nama_Barang
        },

        select: {
            Kode_Barang: true,
            Nama_Barang: true,
            Harga_Barang: true,
            Jumlah_Barang: true,
            Image: true,
            Jenis: true
        }
    });
    if (!Find) {
        throw new ResponsError(400, "Nama Barang is NOt Found...! ");
    }
    return Find;
}

export const UpdatePo = async (request) => {
    const Produk = validate(ValiPro, request);
    const Update = await Prisma.newProduct.update({
        where: {
            Kode_Barang: Produk.Kode_Barang
        },
        data: {
            Kode_Barang: Produk.Kode_Barang,
            Nama_Barang: Produk.Nama_Barang,
            Harga_Barang: Produk.Harga_Barang,
            Jumlah_Barang: Produk.Jumlah_Barang,
            Image: Produk.Image,
            Jenis: Produk.Jenis

        },
        select: {
            Kode_Barang: true,
            Nama_Barang: true,
            Harga_Barang: true,
            Jumlah_Barang: true,
            Image: true,
            Jenis: true
        }
    });
    return Update;
}

export const DelPro = async (request) => {
    const Produk = validate(Delepro, request);
    const Check = await Prisma.newProduct.findUnique({
        where: {
            Kode_Barang: Produk.Kode_Barang,
            Nama_Barang: Produk.Nama_Barang
        },
        select: {
            Kode_Barang: true,
            Nama_Barang: true
        }
    });
    if (!Check) {
        throw new ResponsError(401, "Produk is Not Fouund...!");
    }
    const Proces = await Prisma.product.delete({
        where: {
            Kode_Barang: Produk.Kode_Barang,
            Nama_Barang: Produk.Nama_Barang
        }
    });
    return Proces;
}


///METTHOD FOR PETUGAS
///METTHOD FOR PETUGAS
///METTHOD FOR PETUGAS
///METTHOD FOR PETUGAS


export const LoginPetugasService = async (request) => {
    const Petugas = validate(ValiLoginPetugas, request);
    const ceh = await Prisma.petugas.findFirst({
        where: {
            username: Petugas.username,

        },
        select: {
            level: true,
            username: true,
            password: true,
            telp: true,
            nama_petugas: true,
            id_petugas: true

        }

    });
    if (!ceh) {
        throw new ResponsError(404, "Not Founds")
    }
    const pasche = await bcrypt.compare(Petugas.password, ceh.password)
    if (!pasche) {
        throw new ResponsError(404, "Username or Password is wrong")
    }



    return ceh;
}

export const CreateAccountPetugas = async (request) => {
    const Petugas = validate(ValiCreatPetugas, request);
    // const che = Prisma.petugas.findFirst({
    //     where: {
    //         username: Petugas.username
    //     }

    // });
    // if (che) {
    //     throw new ResponsError(303, "Username Has Exist")
    // }

    Petugas.password = await bcrypt.hash(Petugas.password, 10);

    const cmd = await Prisma.petugas.create({
        data: Petugas,
        select: {
            username: true,
            nama_petugas: true,
            level: true,
            telp: true,
            password: true
        }
    })
    return cmd;
}


///AKHIR METTHOD FOR PETUGAS///
///AKHIR METTHOD FOR PETUGAS
///AKHIR METTHOD FOR PETUGAS
///AKHIR METTHOD FOR PETUGAS

/// AWAL METTHOD FOR MASYARAKAT
/// AWAL METTHOD FOR MASYARAKAT
/// AWAL METTHOD FOR MASYARAKAT

export const RegisterMasyarakatService = async (request) => {
    const Masya = validate(ValiRegiMasya, request);
    const kesan = await Prisma.masyarakat.count({
        where: {
            username: Masya.username

        }
    });
    if (kesan === 1) {
        throw new ResponsError(201, "Username Has Already Exist")

    }
    const cmdn = await Prisma.masyarakat.findFirst({
        where: {
            nik: Masya.nik

        },
        select: {
            username: true,
            password: true,
            nama_lengkap: true,
            telp: true,
            nik: true,
            level: true

        }
    });
    if (cmdn) {
        throw new ResponsError(404, "Nik is Unik key")
    }

    Masya.password = await bcrypt.hash(Masya.password, 10);

    return Prisma.masyarakat.create({
        data: Masya,
        select: {
            username: true,
            password: true,
            nama_lengkap: true,
            telp: true,
            nik: true,
            level: true

        }
    })


}

export const LoginMasyarakatService = async (request) => {
    const Masya = validate(ValiLoginMasya, request);

    const cmd = await Prisma.masyarakat.findFirst({
        where: {
            username: Masya.username

        },
        select: {
            username: true,
            password: true,
            nama_lengkap: true,
            telp: true,
            nik: true,
            level: true

        }
    });
    if (!cmd) {
        throw new ResponsError(404, "Username or password")
    }

    const pasbry = await bcrypt.compare(Masya.password, cmd.password);
    if (!pasbry) {
        throw new ResponsError(404, "Username or Password is Wrong")
    }

    const toke = uuid()

    return Prisma.masyarakat.update({
        where: {
            nik: cmd.nik

        },
        data: {
            token: toke
        },
        select: {
            username: true,
            password: true,
            nama_lengkap: true,
            telp: true,
            nik: true,
            level: true,

            token: true

        }

    })
}
