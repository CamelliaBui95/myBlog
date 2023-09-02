SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `myblog` DEFAULT CHARACTER SET utf8mb4 ;
USE `myblog` ;

-- -----------------------------------------------------
-- Table `myblog`.`members`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myblog`.`members` ;

CREATE TABLE IF NOT EXISTS `myblog`.`members` (
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

INSERT INTO `members` (`username`, `password`, `first_name`, `last_name`, `email`, `profile_img_path`, `joined_date`)
VALUES("titus.kovacek", "03eb1d0aba182699f4608a641a478d53372a61ce", "Delphia", "Mayert", "delphia.mayertM@gmail.com", "uploads\memberImgs\alysson_profile_pic.jpg", "2023-05-13 09:20:14");

INSERT INTO `members` (`username`, `password`, `first_name`, `last_name`, `email`, `profile_img_path`, `joined_date`)
VALUES("IamBobbie", "33d3574b65d7dd5b8daa8839940b89796d8a8311", "Bobbie", "McKenzie", "bobbie.mckenzie99@gmail.com", "uploads\memberImgs\ana-nichita-BI91NrppE38-unsplash.jpg","2022-11-25 18:40:29");

INSERT INTO `members` (`username`, `password`, `first_name`, `last_name`, `email`, `profile_img_path`, `joined_date`)
VALUES("Torey95", "4199758c1cbc27c30b796d3344abbc2d21d73d21", "Torey", "Batz", "torey.batz@gmail.com", "uploads\memberImgs\cassandra-hamer-rKV-LcPEVg4-unsplash.jpg", "2023-02-08 16:51:14");



-- -----------------------------------------------------
-- Table `myblog`.`images`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myblog`.`images` ;

CREATE TABLE IF NOT EXISTS `myblog`.`images` (
  `image_id` INT NOT NULL AUTO_INCREMENT,
  `fime_path` VARCHAR(255) NOT NULL,
  `alt` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`image_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myblog`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myblog`.`categories` ;

CREATE TABLE IF NOT EXISTS `myblog`.`categories` (
  `category_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `myblog`.`posts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `myblog`.`posts` ;

CREATE TABLE IF NOT EXISTS `myblog`.`posts` (
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
    REFERENCES `myblog`.`members` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_articles_images1`
    FOREIGN KEY (`image_id`)
    REFERENCES `myblog`.`images` (`image_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_articles_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `myblog`.`categories` (`category_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
