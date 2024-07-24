-- CreateTable
CREATE TABLE `Address` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Street` VARCHAR(255) NULL,
    `City` VARCHAR(255) NULL,
    `Province` VARCHAR(255) NULL,
    `Country` VARCHAR(255) NOT NULL,
    `Postal_code` VARCHAR(255) NULL,
    `ContactId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Address` ADD CONSTRAINT `Address_ContactId_fkey` FOREIGN KEY (`ContactId`) REFERENCES `Contact`(`idco`) ON DELETE RESTRICT ON UPDATE CASCADE;
