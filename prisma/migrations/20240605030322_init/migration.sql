-- CreateTable
CREATE TABLE `masyarakat` (
    `nik` VARCHAR(16) NOT NULL,
    `nama_lengkap` VARCHAR(35) NOT NULL,
    `username` VARCHAR(32) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `telp` VARCHAR(13) NOT NULL,
    `level` VARCHAR(15) NOT NULL,
    `token` VARCHAR(255) NULL,

    PRIMARY KEY (`nik`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
