CREATE DATABASE relationtest;
USE relationtest;

DROP TABLE IF EXISTS `articles`;
DROP TABLE IF EXISTS `article_categories`;
DROP TABLE IF EXISTS `article_to_categories`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `article_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_62A97E9727ACA70` (`parent_id`),
  CONSTRAINT `FK_62A97E9727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `article_categories` (`id`) ON DELETE SET NULL
) ;


CREATE TABLE `article_to_categories` (
  `article_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`article_id`,`category_id`),
  KEY `IDX_9A1B4BB07294869C` (`article_id`),
  KEY `IDX_9A1B4BB012469DE2` (`category_id`),
  CONSTRAINT `FK_9A1B4BB012469DE2` FOREIGN KEY (`category_id`) REFERENCES `article_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_9A1B4BB07294869C` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE
) ;

INSERT INTO `relationtest`.`article_categories` (`id`, `title`) VALUES (1, 'Root Category');

INSERT INTO `relationtest`.`article_categories` (`id`, `parent_id`, `title`) VALUES (2, 1, 'Sub-Category to root');

INSERT INTO `relationtest`.`article_categories` (`id`, `parent_id`, `title`) VALUES (3, 2, 'Sub-Category Level 2');

INSERT INTO `relationtest`.`article_categories` (`id`, `title`) VALUES (4, 'Root Category #2');

INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (1,'Article #1', 'This is content of article #1');

INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (2,'Article #2', 'This is content of article #2');
INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (3,'Article #3', 'This is content of article #3');
INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (4,'Article #4', 'This is content of article #4');
INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (5,'Article #5', 'This is content of article #5');
INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (6,'Article #6', 'This is content of article #6');
INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (7,'Article #7', 'This is content of article #7');
INSERT INTO `relationtest`.`articles` (`id`, `title`, `content`) VALUES (8,'Article #8', 'This is content of article #8');

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (1, 1);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (2, 2);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (3, 3);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (4, 4);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (5, 1);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (5, 4);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (6, 1);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (7, 2);

INSERT INTO `relationtest`.`article_to_categories` (`article_id`, `category_id`) VALUES (8, 3);