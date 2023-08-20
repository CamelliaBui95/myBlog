-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema myBlog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema myBlog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `myBlog` DEFAULT CHARACTER SET utf8 ;
USE `myBlog` ;

-- -----------------------------------------------------
-- Table `myBlog`.`members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myBlog`.`members` ;

CREATE TABLE IF NOT EXISTS `myBlog`.`members` (
  `member_id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(55) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(55) NOT NULL,
  `profile_img_path` VARCHAR(255) NULL,
  `joined_date` DATETIME NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myBlog`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myBlog`.`images` ;

CREATE TABLE IF NOT EXISTS `myBlog`.`images` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `fime_path` VARCHAR(255) NOT NULL,
  `alt` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`image_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myBlog`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myBlog`.`categories` ;

CREATE TABLE IF NOT EXISTS `myBlog`.`categories` (
  `category_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myBlog`.`articles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myBlog`.`articles` ;

CREATE TABLE IF NOT EXISTS `myBlog`.`articles` (
  `article_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `summary` VARCHAR(1000) NULL,
  `content` TEXT NOT NULL,
  `published_date` DATETIME NOT NULL,
  `category_id` TINYINT NOT NULL,
  `member_id` INT NOT NULL,
  `image_id` INT NULL,
  PRIMARY KEY (`article_id`),
  INDEX `fk_articles_members_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_articles_images1_idx` (`image_id` ASC) VISIBLE,
  INDEX `fk_articles_categories1_idx` (`category_id` ASC) VISIBLE,
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
