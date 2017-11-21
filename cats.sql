-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema webtech
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema webtech
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `webtech` DEFAULT CHARACTER SET utf8 ;
USE `webtech` ;

-- -----------------------------------------------------
-- Table `webtech`.`cat_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`cat_image` (
  `catImageID` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(250) NULL DEFAULT NULL,
  `image` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`catImageID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`cat_profile`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`cat_profile` (
  `catID` INT(11) NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NULL DEFAULT NULL,
  `eye_color` VARCHAR(45) NULL DEFAULT NULL,
  `tail_length` VARCHAR(45) NULL DEFAULT NULL,
  `sex` VARCHAR(45) NULL DEFAULT NULL,
  `coat` VARCHAR(45) NULL DEFAULT NULL,
  `temperent` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `image` LONGBLOB NULL DEFAULT NULL,
  `imagename` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`catID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`cat_profile_has_cat_image`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`cat_profile_has_cat_image` (
  `cat_profile_catID` INT(11) NOT NULL AUTO_INCREMENT,
  `cat_image_catImageID` INT(11) NOT NULL,
  PRIMARY KEY (`cat_profile_catID`, `cat_image_catImageID`),
  INDEX `fk_cat_profile_has_cat_image_cat_image1_idx` (`cat_image_catImageID` ASC),
  INDEX `fk_cat_profile_has_cat_image_cat_profile_idx` (`cat_profile_catID` ASC),
  CONSTRAINT `fk_cat_profile_has_cat_image_cat_image1`
    FOREIGN KEY (`cat_image_catImageID`)
    REFERENCES `webtech`.`cat_image` (`catImageID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cat_profile_has_cat_image_cat_profile`
    FOREIGN KEY (`cat_profile_catID`)
    REFERENCES `webtech`.`cat_profile` (`catID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`post` (
  `postID` INT(11) NOT NULL AUTO_INCREMENT,
  `postUserName` VARCHAR(45) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `postImageURL` VARCHAR(200) NULL DEFAULT NULL,
  `postVideoURL` VARCHAR(200) NULL DEFAULT NULL,
  `datePosted` DATETIME NULL DEFAULT NULL,
  `image` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`postID`))
ENGINE = InnoDB
AUTO_INCREMENT = 61
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`comments` (
  `commentID` INT(11) NOT NULL AUTO_INCREMENT,
  `post_postID` INT(11) NOT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `text` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`commentID`),
  INDEX `fk_comments_post1_idx` (`post_postID` ASC),
  CONSTRAINT `fk_comments_post1`
    FOREIGN KEY (`post_postID`)
    REFERENCES `webtech`.`post` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`events` (
  `eventID` INT(11) NOT NULL AUTO_INCREMENT,
  `eventName` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `startdatetime` DATETIME NULL DEFAULT NULL,
  `enddatetime` DATETIME NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `counter` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`eventID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`users` (
  `userID` INT(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `user_type` VARCHAR(45) NULL DEFAULT NULL,
  `warnings` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`events_has_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`events_has_users` (
  `events_eventID` INT(11) NOT NULL,
  `users_userID` INT(11) NOT NULL,
  `going` VARCHAR(1) NULL DEFAULT NULL,
  `interested` VARCHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`events_eventID`, `users_userID`),
  INDEX `fk_events_has_users_users1_idx` (`users_userID` ASC),
  INDEX `fk_events_has_users_events1_idx` (`events_eventID` ASC),
  CONSTRAINT `fk_events_has_users_events1`
    FOREIGN KEY (`events_eventID`)
    REFERENCES `webtech`.`events` (`eventID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_has_users_users1`
    FOREIGN KEY (`users_userID`)
    REFERENCES `webtech`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`reportsID`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`reportsID` (
  `reportsID` INT(11) NOT NULL AUTO_INCREMENT,
  `report_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`reportsID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`user_avatar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`user_avatar` (
  `avatarID` INT(11) NOT NULL AUTO_INCREMENT,
  `image` LONGBLOB NULL DEFAULT NULL,
  `created` DATETIME NULL DEFAULT NULL,
  `users_userID` INT(11) NOT NULL,
  PRIMARY KEY (`avatarID`),
  INDEX `fk_user_avatar_users1_idx` (`users_userID` ASC),
  CONSTRAINT `fk_user_avatar_users1`
    FOREIGN KEY (`users_userID`)
    REFERENCES `webtech`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `webtech`.`users_has_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `webtech`.`users_has_post` (
  `users_userID` INT(11) NOT NULL AUTO_INCREMENT,
  `post_postID` INT(11) NOT NULL,
  PRIMARY KEY (`users_userID`, `post_postID`),
  INDEX `fk_users_has_post_post1_idx` (`post_postID` ASC),
  INDEX `fk_users_has_post_users1_idx` (`users_userID` ASC),
  CONSTRAINT `fk_users_has_post_post1`
    FOREIGN KEY (`post_postID`)
    REFERENCES `webtech`.`post` (`postID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_post_users1`
    FOREIGN KEY (`users_userID`)
    REFERENCES `webtech`.`users` (`userID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
