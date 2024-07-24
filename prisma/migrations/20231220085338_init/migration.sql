-- CreateTable
CREATE TABLE `product` (
    `Kode_Barang` VARCHAR(191) NOT NULL,
    `Nama_Barang` VARCHAR(255) NOT NULL,
    `Harga_Barang` INTEGER NOT NULL,
    `Jumlah_Barang` INTEGER NOT NULL,
    `Image` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `product_Kode_Barang_key`(`Kode_Barang`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
