-- CreateTable
CREATE TABLE `tanggapan` (
    `id_tanggapan` INTEGER NOT NULL AUTO_INCREMENT,
    `id_pengaduan` INTEGER NOT NULL,
    `tgl_tanggapan` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `tanggapan` VARCHAR(255) NOT NULL,
    `id_petugas` INTEGER NOT NULL,

    PRIMARY KEY (`id_tanggapan`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
