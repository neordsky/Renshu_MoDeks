-- CreateTable
CREATE TABLE `users` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Username` VARCHAR(200) NOT NULL,
    `Password` VARCHAR(200) NOT NULL,
    `Token` VARCHAR(200) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
