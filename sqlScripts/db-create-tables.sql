-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

DROP TABLE IF EXISTS `mydb`.`members` ;

CREATE TABLE IF NOT EXISTS `mydb`.`members` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(55) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(55) NOT NULL,
  `profile_img_path` VARCHAR(255) NULL,
  `joined_date` DATETIME NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `mydb`.`images` ;

CREATE TABLE IF NOT EXISTS `mydb`.`images` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `fime_path` VARCHAR(255) NOT NULL,
  `alt` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`image_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `mydb`.`categories` ;

CREATE TABLE IF NOT EXISTS `mydb`.`categories` (
  `category_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `mydb`.`posts` ;

CREATE TABLE IF NOT EXISTS `mydb`.`posts` (
  `post_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `summary` VARCHAR(1000) NULL,
  `content` TEXT NOT NULL,
  `published_date` DATETIME NOT NULL,
  `category_id` TINYINT NOT NULL,
  `member_id` INT NOT NULL,
  `image_id` INT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_articles_members_idx` (`member_id` ASC),
  INDEX `fk_articles_images1_idx` (`image_id` ASC),
  INDEX `fk_articles_categories1_idx` (`category_id` ASC),
  CONSTRAINT `fk_articles_members`
    FOREIGN KEY (`member_id`)
    REFERENCES `mydb`.`members` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_articles_images1`
    FOREIGN KEY (`image_id`)
    REFERENCES `mydb`.`images` (`image_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_articles_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`categories` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
