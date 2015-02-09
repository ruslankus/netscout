/*
Navicat MySQL Data Transfer

Source Server         : my local mysql connection
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : netscout_db

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-02-09 15:30:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` longtext,
  `f_name` longtext,
  `l_name` longtext,
  `password` longtext,
  `full_key` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('5', 'Test', 'Vasia', 'Pupkin', '$1$WT4.nR2.$CHdd7aZsUz/.QA9TQYSfK.', '4321-4321-4321');
INSERT INTO `customers` VALUES ('6', 'vasia', 'Dima ', 'Hitrov', '$1$Cq2.ja5.$unlIAvy34YnBnXjymTBqe1', '4444-4444-4444');

-- ----------------------------
-- Table structure for `labels`
-- ----------------------------
DROP TABLE IF EXISTS `labels`;
CREATE TABLE `labels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of labels
-- ----------------------------
INSERT INTO `labels` VALUES ('1', 'login');
INSERT INTO `labels` VALUES ('2', 'password');
INSERT INTO `labels` VALUES ('3', 'main');
INSERT INTO `labels` VALUES ('4', 'about_us');
INSERT INTO `labels` VALUES ('5', 'about_product');
INSERT INTO `labels` VALUES ('6', 'contacts');
INSERT INTO `labels` VALUES ('7', 'account');

-- ----------------------------
-- Table structure for `labels_trl`
-- ----------------------------
DROP TABLE IF EXISTS `labels_trl`;
CREATE TABLE `labels_trl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of labels_trl
-- ----------------------------
INSERT INTO `labels_trl` VALUES ('1', '1', '1', 'Login');
INSERT INTO `labels_trl` VALUES ('2', '1', '2', 'Login');
INSERT INTO `labels_trl` VALUES ('3', '2', '1', 'Password');
INSERT INTO `labels_trl` VALUES ('4', '2', '2', 'Slaptazodis');
INSERT INTO `labels_trl` VALUES ('5', '3', '1', 'Main');
INSERT INTO `labels_trl` VALUES ('6', '3', '2', null);
INSERT INTO `labels_trl` VALUES ('7', '4', '1', 'About us');
INSERT INTO `labels_trl` VALUES ('8', '4', '2', null);
INSERT INTO `labels_trl` VALUES ('9', '5', '1', 'Products');
INSERT INTO `labels_trl` VALUES ('10', '5', '2', null);
INSERT INTO `labels_trl` VALUES ('11', '6', '1', 'Contacts');
INSERT INTO `labels_trl` VALUES ('12', '6', '2', null);
INSERT INTO `labels_trl` VALUES ('13', '7', '1', 'Account');
INSERT INTO `labels_trl` VALUES ('14', '7', '2', null);

-- ----------------------------
-- Table structure for `languages`
-- ----------------------------
DROP TABLE IF EXISTS `languages`;
CREATE TABLE `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lng_name` longtext NOT NULL,
  `lng_prefix` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of languages
-- ----------------------------
INSERT INTO `languages` VALUES ('1', 'English', 'en');
INSERT INTO `languages` VALUES ('2', 'Lietuviu', 'lt');

-- ----------------------------
-- Table structure for `license_types`
-- ----------------------------
DROP TABLE IF EXISTS `license_types`;
CREATE TABLE `license_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_number` varchar(25) DEFAULT NULL,
  `decription` varchar(255) DEFAULT NULL,
  `user_limit` tinyint(4) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of license_types
-- ----------------------------
INSERT INTO `license_types` VALUES ('1', 'NET02-01LGT0010-00001', 'Netscout Server Monitoring Tool', '10', 'Light Edition limited to 10 Users');
INSERT INTO `license_types` VALUES ('2', 'NET02-01LGT0050-00002', 'Netscout Server Monitoring Tool', '50', 'Light Edition limited to 50 Users');
INSERT INTO `license_types` VALUES ('3', 'NET02-01LGT0100-00003', 'Netscout Server Monitoring Tool', '100', 'Light Edition limited to 100 Users');
INSERT INTO `license_types` VALUES ('4', 'NET02-01STD0010-00004', 'Netscout Server Monitoring Tool', '10', 'Standard Edition limited to 10 Users');
INSERT INTO `license_types` VALUES ('5', 'NET02-01STD0050-00005', 'Netscout Server Monitoring Tool', '50', 'Standard Edition limited to 50 Users');
INSERT INTO `license_types` VALUES ('6', 'NET02-01STD0100-00006', 'Netscout Server Monitoring Tool', '100', 'StandardEdition limited to 100 Users');
INSERT INTO `license_types` VALUES ('7', 'NET02-01PRF0010-00007', 'Netscout Server Monitoring Tool', '10', 'Professional Edition limited to 10 Users');
INSERT INTO `license_types` VALUES ('8', 'NET02-01PRF0050-00008', 'Netscout Server Monitoring Tool', '50', 'Professional Edition limited to 50 Users');
INSERT INTO `license_types` VALUES ('9', 'NET02-01PRF0100-00009', 'Netscout Server Monitoring Tool', '100', 'Professional Edition limited to 100 Users');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` longtext,
  `route` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', 'main', null);
INSERT INTO `menu` VALUES ('2', 'about_us', null);
INSERT INTO `menu` VALUES ('3', 'about_product', null);
INSERT INTO `menu` VALUES ('4', 'contacts', null);
INSERT INTO `menu` VALUES ('5', 'account', 'service');

-- ----------------------------
-- Table structure for `numbers`
-- ----------------------------
DROP TABLE IF EXISTS `numbers`;
CREATE TABLE `numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lic_number` varchar(15) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `used` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of numbers
-- ----------------------------
INSERT INTO `numbers` VALUES ('1', '1234-1234-1234', '1', '1');
INSERT INTO `numbers` VALUES ('2', '4321-4321-4321', '3', null);
INSERT INTO `numbers` VALUES ('3', '4444-4444-4444', '5', null);

-- ----------------------------
-- Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `content` longtext,
  `template` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', '1', null, 'index');
INSERT INTO `pages` VALUES ('2', '2', null, 'about_us');
INSERT INTO `pages` VALUES ('3', '3', null, 'about_product');
INSERT INTO `pages` VALUES ('4', '4', null, 'contacts');
INSERT INTO `pages` VALUES ('5', '5', null, 'account');

-- ----------------------------
-- Table structure for `user_licence`
-- ----------------------------
DROP TABLE IF EXISTS `user_licence`;
CREATE TABLE `user_licence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `lic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_licence
-- ----------------------------
INSERT INTO `user_licence` VALUES ('4', '5', '2');
INSERT INTO `user_licence` VALUES ('5', '6', '3');
