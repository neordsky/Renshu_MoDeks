-- CreateTable
CREATE TABLE `newusers` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Username` VARCHAR(200) NOT NULL,
    `Password` VARCHAR(200) NOT NULL,
    `Alamat` VARCHAR(200) NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
