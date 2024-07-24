-- CreateTable
CREATE TABLE `NewProduct` (
    `Kode_Barang` INTEGER NOT NULL AUTO_INCREMENT,
    `Nama_Barang` VARCHAR(255) NOT NULL,
    `Harga_Barang` INTEGER NOT NULL,
    `Jumlah_Barang` INTEGER NOT NULL,
    `Jenis` VARCHAR(255) NOT NULL,
    `Image` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `NewProduct_Kode_Barang_key`(`Kode_Barang`),
    PRIMARY KEY (`Kode_Barang`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
