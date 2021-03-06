-- MySQL Script generated by MySQL Workbench
-- Thu Mar 23 11:07:34 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema passerelle_memoire_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `passerelle_memoire_db` ;

-- -----------------------------------------------------
-- Schema passerelle_memoire_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `passerelle_memoire_db` DEFAULT CHARACTER SET utf8 ;
USE `passerelle_memoire_db` ;

-- -----------------------------------------------------
-- Table `passerelle_memoire_db`.`witness`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `passerelle_memoire_db`.`witness` ;

CREATE TABLE IF NOT EXISTS `passerelle_memoire_db`.`witness` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT NOW(),
  `description` VARCHAR(255) NULL DEFAULT 'Null',
  `image` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `passerelle_memoire_db`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `passerelle_memoire_db`.`video` ;

CREATE TABLE IF NOT EXISTS `passerelle_memoire_db`.`video` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `source` VARCHAR(100) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT NOW(),
  `description` VARCHAR(255) NULL DEFAULT NULL,
  `witness_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_video_witness_idx` (`witness_id` ASC),
  CONSTRAINT `fk_video_witness`
    FOREIGN KEY (`witness_id`)
    REFERENCES `passerelle_memoire_db`.`witness` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `passerelle_memoire_db`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `passerelle_memoire_db`.`category` ;

CREATE TABLE IF NOT EXISTS `passerelle_memoire_db`.`category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `color` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `passerelle_memoire_db`.`video_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `passerelle_memoire_db`.`video_category` ;

CREATE TABLE IF NOT EXISTS `passerelle_memoire_db`.`video_category` (
  `video_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`video_id`, `category_id`),
  INDEX `fk_video_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_video_has_category_video1_idx` (`video_id` ASC),
  CONSTRAINT `fk_video_has_category_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `passerelle_memoire_db`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `passerelle_memoire_db`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `passerelle_memoire_db`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `passerelle_memoire_db`.`user` ;

CREATE TABLE IF NOT EXISTS `passerelle_memoire_db`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstanme` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL DEFAULT '',
  `avatar_source` VARCHAR(100) NULL DEFAULT 'images/avatar_default.png',
  `mail` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `passerelle_memoire_db`.`document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `passerelle_memoire_db`.`document` ;

CREATE TABLE IF NOT EXISTS `passerelle_memoire_db`.`document` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(100) NOT NULL,
  `date` DATETIME NOT NULL DEFAULT NOW(),
  `content` VARCHAR(255) NULL DEFAULT NULL,
  `type` ENUM('text', 'photo', 'document') NOT NULL,
  `validated` TINYINT NOT NULL,
  `video_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_document_video1_idx` (`video_id` ASC),
  INDEX `fk_document_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_document_video1`
    FOREIGN KEY (`video_id`)
    REFERENCES `passerelle_memoire_db`.`video` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_document_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `passerelle_memoire_db`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
