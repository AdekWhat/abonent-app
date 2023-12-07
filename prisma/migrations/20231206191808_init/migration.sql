-- CreateTable
CREATE TABLE `Addresses` (
    `AdressID` BIGINT NOT NULL AUTO_INCREMENT,
    `Address` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`AdressID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Abonents` (
    `AbonentID` BIGINT NOT NULL AUTO_INCREMENT,
    `PIB` VARCHAR(255) NOT NULL,
    `AdressID` BIGINT NOT NULL,

    PRIMARY KEY (`AbonentID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PhoneNumbers` (
    `PhoneNumberID` BIGINT NOT NULL AUTO_INCREMENT,
    `SimCardID` INTEGER NOT NULL,
    `PhoneNumber` VARCHAR(255) NOT NULL,
    `ActivationDate` DATETIME(3) NOT NULL,
    `ExpiryDate` DATETIME(3) NOT NULL,
    `AbonentID` BIGINT NOT NULL,
    `Balance` DECIMAL(10, 2) NOT NULL,

    PRIMARY KEY (`PhoneNumberID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PhoneNumbersTariffPlans` (
    `AbonentTariffPlanrID` BIGINT NOT NULL AUTO_INCREMENT,
    `PhoneNumberID` BIGINT NOT NULL,
    `TariffPlanID` BIGINT NOT NULL,
    `ExpiredDate` DATETIME(3) NOT NULL,
    `CreatedAt` DATETIME(3) NOT NULL,
    `Price` INTEGER NOT NULL,

    PRIMARY KEY (`AbonentTariffPlanrID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TariffPlanServices` (
    `TariffPlanServiceID` BIGINT NOT NULL AUTO_INCREMENT,
    `TariffPlanID` BIGINT NOT NULL,
    `ServiceID` BIGINT NOT NULL,

    PRIMARY KEY (`TariffPlanServiceID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TariffPlans` (
    `TariffPlanID` BIGINT NOT NULL AUTO_INCREMENT,
    `TariffPlanName` VARCHAR(255) NOT NULL,
    `ActivationDate` DATETIME(3) NOT NULL,
    `ExpiryDate` DATETIME(3) NOT NULL,
    `Price` DECIMAL(10, 2) NOT NULL,
    `ValidityDays` INTEGER NOT NULL,

    PRIMARY KEY (`TariffPlanID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Services` (
    `ServiceID` BIGINT NOT NULL AUTO_INCREMENT,
    `ServiceName` VARCHAR(255) NOT NULL,
    `Cost` DECIMAL(10, 2) NOT NULL,
    `BillingMethod` VARCHAR(50) NOT NULL,
    `ActivationDate` DATETIME(3) NOT NULL,
    `ExpiryDate` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ServiceID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Abonents` ADD CONSTRAINT `Abonents_AdressID_fkey` FOREIGN KEY (`AdressID`) REFERENCES `Addresses`(`AdressID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PhoneNumbers` ADD CONSTRAINT `PhoneNumbers_AbonentID_fkey` FOREIGN KEY (`AbonentID`) REFERENCES `Abonents`(`AbonentID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PhoneNumbersTariffPlans` ADD CONSTRAINT `PhoneNumbersTariffPlans_PhoneNumberID_fkey` FOREIGN KEY (`PhoneNumberID`) REFERENCES `PhoneNumbers`(`PhoneNumberID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PhoneNumbersTariffPlans` ADD CONSTRAINT `PhoneNumbersTariffPlans_TariffPlanID_fkey` FOREIGN KEY (`TariffPlanID`) REFERENCES `TariffPlans`(`TariffPlanID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TariffPlanServices` ADD CONSTRAINT `TariffPlanServices_TariffPlanID_fkey` FOREIGN KEY (`TariffPlanID`) REFERENCES `TariffPlans`(`TariffPlanID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TariffPlanServices` ADD CONSTRAINT `TariffPlanServices_ServiceID_fkey` FOREIGN KEY (`ServiceID`) REFERENCES `Services`(`ServiceID`) ON DELETE RESTRICT ON UPDATE CASCADE;
