-- CreateTable
CREATE TABLE `petugas` (
    `id_petugas` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_petugas` VARCHAR(35) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `telp` VARCHAR(13) NOT NULL,
    `level` VARCHAR(13) NOT NULL,

    PRIMARY KEY (`id_petugas`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
