-- MySQL Script generated by MySQL Workbench
-- Mon Aug  1 18:17:45 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema musicity
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema musicity
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `musicity` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `musicity` ;

-- -----------------------------------------------------
-- Table `musicity`.`profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicity`.`profile` (
  `username` VARCHAR(45) NOT NULL,
  `fullName` VARCHAR(60) NOT NULL,
  `password` VARCHAR(8) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `gender` VARCHAR(1) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musicity`.`music`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicity`.`music` (
  `musicId` INT NOT NULL AUTO_INCREMENT,
  `songName` VARCHAR(45) NOT NULL,
  `songInfo` TEXT(1024) NOT NULL,
  `image` VARCHAR(100) NOT NULL,
  `songGenre` VARCHAR(100) NOT NULL,
  `songLink` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`musicId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `musicity`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `musicity`.`comment` (
  `commentId` INT NOT NULL AUTO_INCREMENT,
  `musicId` INT NOT NULL,
  `commentUsername` VARCHAR(45) NOT NULL,
  `review` TEXT(1024) NULL,
  `rating` INT NOT NULL,
  `datePosted` VARCHAR(65) NOT NULL,
  PRIMARY KEY (`commentId`),
  INDEX `FK_username_idx` (`commentUsername` ASC) INVISIBLE,
  INDEX `FK_comment_id_idx` (`musicId` ASC) VISIBLE,
  UNIQUE INDEX `comment_id_UNIQUE` (`commentId` ASC) VISIBLE,
  CONSTRAINT `FK_username`
    FOREIGN KEY (`commentUsername`)
    REFERENCES `musicity`.`profile` (`username`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_music_id`
    FOREIGN KEY (`musicId`)
    REFERENCES `musicity`.`music` (`musicId`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;