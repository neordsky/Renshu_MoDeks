-- CreateTable
CREATE TABLE `pengaduan` (
    `id_pengaduan` INTEGER NOT NULL AUTO_INCREMENT,
    `tgl_pengaduan` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `nik` VARCHAR(16) NOT NULL,
    `judul_laporan` VARCHAR(255) NOT NULL,
    `isi_laporan` VARCHAR(255) NOT NULL,
    `foto` VARCHAR(255) NOT NULL,
    `status` VARCHAR(20) NOT NULL,

    PRIMARY KEY (`id_pengaduan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
