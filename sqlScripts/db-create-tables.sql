
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `myblog` DEFAULT CHARACTER SET utf8 ;
USE `myblog`;

CREATE TABLE IF NOT EXISTS `myblog`.`members` (
  `member_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(55) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(55) NOT NULL,
  `profile_img_path` VARCHAR(255) NULL DEFAULT NULL,
  `joined_date` DATETIME NOT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `members` (`username`, `password`, `email`, `profile_img_path`, `joined_date`)
VALUES ("mclaughlin.damon", "013e1bba7eed37b90c22286546b21443859d7544",  "ryann.corwin@example.com", "ana-nichita-BI91NrppE38-unsplash.jpg", "2022-03-08 22:22:49");
INSERT INTO `members` (`username`, `password`, `email`, `profile_img_path`, `joined_date`)
VALUES ("alysson.connelly", "acd2b91379ea2c27a579fca308249bd2e50761f3", "anahi.schumm@example.com", "ana-nichita-BI91NrppE38-unsplash.jpg", "2023-04-15 16:05:17");
INSERT INTO `members` (`username`, `password`, `email`, `profile_img_path`, `joined_date`)
VALUES ("crawford.kshlerin", "616b9562698b01736b4c88cc61c9a373ed6b829a", "keebler.armando@example.com", "cassandra-hamer-rKV-LcPEVg4-unsplash.jpg", "2023-04-02 02:27:39");

----------------------------------------------------------

CREATE TABLE IF NOT EXISTS `myblog`.`posts` (
  `post_id` INT(11) NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `summary` VARCHAR(1000) NULL DEFAULT NULL,
  `content` TEXT NOT NULL,
  `published_date` DATETIME NOT NULL,
  `category_id` TINYINT(4) NOT NULL,
  `member_id` INT(11) NOT NULL,
  `image_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  INDEX `fk_articles_members_idx` (`member_id` ASC) VISIBLE,
  INDEX `fk_articles_images1_idx` (`image_id` ASC) VISIBLE,
  INDEX `fk_articles_categories1_idx` (`category_id` ASC) VISIBLE,
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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `myblog`.`categories` (
  `category_id` TINYINT(4) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `myblog`.`images` (
  `image_id` INT(11) NOT NULL AUTO_INCREMENT,
  `fime_path` VARCHAR(255) NOT NULL,
  `alt` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`image_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
