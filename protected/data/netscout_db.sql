/*
Navicat MySQL Data Transfer

Source Server         : my local mysql connection
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : netscout_db

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2015-02-10 19:03:07
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
-- Table structure for `datacentres`
-- ----------------------------
DROP TABLE IF EXISTS `datacentres`;
CREATE TABLE `datacentres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datacenter_name` varchar(30) DEFAULT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datacentres
-- ----------------------------
INSERT INTO `datacentres` VALUES ('1', null, '212.65.42.34');
INSERT INTO `datacentres` VALUES ('2', 'DC', '12333333');
INSERT INTO `datacentres` VALUES ('3', 'rtrtrtr', '343434');
INSERT INTO `datacentres` VALUES ('4', 'dc1', '213.23.23.34');

-- ----------------------------
-- Table structure for `dc_user`
-- ----------------------------
DROP TABLE IF EXISTS `dc_user`;
CREATE TABLE `dc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dc_user
-- ----------------------------
INSERT INTO `dc_user` VALUES ('1', '4', '5');

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
INSERT INTO `labels_trl` VALUES ('6', '3', '2', 'Pagrindinis');
INSERT INTO `labels_trl` VALUES ('7', '4', '1', 'About us');
INSERT INTO `labels_trl` VALUES ('8', '4', '2', 'Apie mus');
INSERT INTO `labels_trl` VALUES ('9', '5', '1', 'Products');
INSERT INTO `labels_trl` VALUES ('10', '5', '2', 'Produktai');
INSERT INTO `labels_trl` VALUES ('11', '6', '1', 'Contacts');
INSERT INTO `labels_trl` VALUES ('12', '6', '2', 'Kontaktai');
INSERT INTO `labels_trl` VALUES ('13', '7', '1', 'Account');
INSERT INTO `labels_trl` VALUES ('14', '7', '2', 'Prisijungimas');

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
) ENGINE=InnoDB AUTO_INCREMENT=456 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of numbers
-- ----------------------------
INSERT INTO `numbers` VALUES ('4', 'URSR-BBJU-JWD1', '1', null);
INSERT INTO `numbers` VALUES ('5', 'KN4E-0B5C-Z4AU', '1', null);
INSERT INTO `numbers` VALUES ('6', '0TWD-9KTX-A3CW', '1', null);
INSERT INTO `numbers` VALUES ('7', '7OEB-LZ9O-J7UV', '1', null);
INSERT INTO `numbers` VALUES ('8', 'N4EF-0XU9-8BHX', '1', null);
INSERT INTO `numbers` VALUES ('9', 'EK6A-3CAX-GWNP', '1', null);
INSERT INTO `numbers` VALUES ('10', 'XK4W-NX7O-S0CG', '1', null);
INSERT INTO `numbers` VALUES ('11', 'KRLV-QGBY-FZKB', '1', null);
INSERT INTO `numbers` VALUES ('12', 'GMS2-Z8YT-R7HL', '1', null);
INSERT INTO `numbers` VALUES ('13', 'YDE1-C069-32RU', '1', null);
INSERT INTO `numbers` VALUES ('14', 'TMU6-3QWF-AJ1Y', '1', null);
INSERT INTO `numbers` VALUES ('15', '81ZG-8PO4-6ITR', '1', null);
INSERT INTO `numbers` VALUES ('16', 'EVGI-RT64-JS3T', '1', null);
INSERT INTO `numbers` VALUES ('17', 'MRUA-D6FS-L1I0', '1', null);
INSERT INTO `numbers` VALUES ('18', 'NT47-EGY1-5GSS', '1', null);
INSERT INTO `numbers` VALUES ('19', 'RX4M-TSBI-N50T', '1', null);
INSERT INTO `numbers` VALUES ('20', 'O6IB-XFHF-S4ZA', '1', null);
INSERT INTO `numbers` VALUES ('21', 'G7AW-YY7J-003Q', '1', null);
INSERT INTO `numbers` VALUES ('22', 'TPSE-VNM1-A3GN', '1', null);
INSERT INTO `numbers` VALUES ('23', 'QTLN-6YYC-9S78', '1', null);
INSERT INTO `numbers` VALUES ('24', 'Z07I-SYI6-YF1X', '1', null);
INSERT INTO `numbers` VALUES ('25', '4TBS-KY9D-4DSN', '1', null);
INSERT INTO `numbers` VALUES ('26', '9LM6-OEYW-6SCF', '1', null);
INSERT INTO `numbers` VALUES ('27', '56Z1-GLDH-DGOX', '1', null);
INSERT INTO `numbers` VALUES ('28', 'SRF2-1ZR7-Z18X', '1', null);
INSERT INTO `numbers` VALUES ('29', 'HOR7-LYRQ-41UZ', '1', null);
INSERT INTO `numbers` VALUES ('30', '7QBG-X404-U0BF', '1', null);
INSERT INTO `numbers` VALUES ('31', '2N1D-8NKE-FBOI', '1', null);
INSERT INTO `numbers` VALUES ('32', '6CQ4-NYM8-EUNC', '1', null);
INSERT INTO `numbers` VALUES ('33', 'J7ND-MVST-YILN', '1', null);
INSERT INTO `numbers` VALUES ('34', '7K88-VZP5-L2FK', '1', null);
INSERT INTO `numbers` VALUES ('35', 'OREZ-TB3I-6MHT', '1', null);
INSERT INTO `numbers` VALUES ('36', 'K00W-4COE-MYXE', '1', null);
INSERT INTO `numbers` VALUES ('37', '9NRI-RTLU-A9FX', '1', null);
INSERT INTO `numbers` VALUES ('38', 'ODQW-0HC4-F3C6', '1', null);
INSERT INTO `numbers` VALUES ('39', 'JNJX-PIZJ-PO8R', '1', null);
INSERT INTO `numbers` VALUES ('40', 'WMHT-5B8E-U8NR', '1', null);
INSERT INTO `numbers` VALUES ('41', 'QC9L-7364-4H13', '1', null);
INSERT INTO `numbers` VALUES ('42', 'TYWP-3HCN-DJI6', '1', null);
INSERT INTO `numbers` VALUES ('43', 'F3YN-MRCU-2JXD', '1', null);
INSERT INTO `numbers` VALUES ('44', 'YEY2-6Y4B-97QX', '1', null);
INSERT INTO `numbers` VALUES ('45', '5UE7-BXF2-Q0HU', '1', null);
INSERT INTO `numbers` VALUES ('46', 'V8TB-P74X-OMFR', '1', null);
INSERT INTO `numbers` VALUES ('47', '616G-WM2P-P1FO', '1', null);
INSERT INTO `numbers` VALUES ('48', 'K39G-UE45-6696', '1', null);
INSERT INTO `numbers` VALUES ('49', 'T9Z6-48UV-GJYE', '1', null);
INSERT INTO `numbers` VALUES ('50', 'N4XK-1IUJ-HOA2', '1', null);
INSERT INTO `numbers` VALUES ('51', 'C0DD-FKO5-3RAM', '1', null);
INSERT INTO `numbers` VALUES ('52', '7KUJ-2GD1-KFJY', '1', null);
INSERT INTO `numbers` VALUES ('53', 'YCF9-YH6N-WG1S', '1', null);
INSERT INTO `numbers` VALUES ('54', 'GZR3-0YOS-722A', '2', null);
INSERT INTO `numbers` VALUES ('55', '6LVM-I7C7-96E2', '2', null);
INSERT INTO `numbers` VALUES ('56', '16CN-F0XN-OTB3', '2', null);
INSERT INTO `numbers` VALUES ('57', '4HVH-GDJO-VC2D', '2', null);
INSERT INTO `numbers` VALUES ('58', 'JTX3-0EAC-9EW6', '2', null);
INSERT INTO `numbers` VALUES ('59', '97FK-6PT4-S7KY', '2', null);
INSERT INTO `numbers` VALUES ('60', '9LLL-D6F6-ATBR', '2', null);
INSERT INTO `numbers` VALUES ('61', 'VS34-R3PE-E49N', '2', null);
INSERT INTO `numbers` VALUES ('62', 'MZCV-F0EP-9NC7', '2', null);
INSERT INTO `numbers` VALUES ('63', 'O2S0-DO57-L8ID', '2', null);
INSERT INTO `numbers` VALUES ('64', '058M-Y8CI-UB5G', '2', null);
INSERT INTO `numbers` VALUES ('65', 'T250-H4MX-QF3V', '2', null);
INSERT INTO `numbers` VALUES ('66', 'VFQ1-Q418-OZ7M', '2', null);
INSERT INTO `numbers` VALUES ('67', 'KYSX-QIVD-N0OQ', '2', null);
INSERT INTO `numbers` VALUES ('68', 'SE1R-YJ7F-KLEL', '2', null);
INSERT INTO `numbers` VALUES ('69', 'M3BL-K669-EEQZ', '2', null);
INSERT INTO `numbers` VALUES ('70', 'LX5J-196B-BJ14', '2', null);
INSERT INTO `numbers` VALUES ('71', 'CDGD-KUMU-ZI9W', '2', null);
INSERT INTO `numbers` VALUES ('72', '1IMC-RFEL-JCTG', '2', null);
INSERT INTO `numbers` VALUES ('73', 'DVKA-R2XX-MKKO', '2', null);
INSERT INTO `numbers` VALUES ('74', 'GGPF-7A3J-E7YT', '2', null);
INSERT INTO `numbers` VALUES ('75', 'YTYL-C5BR-JUUM', '2', null);
INSERT INTO `numbers` VALUES ('76', '0ZO1-R4JD-7GOF', '2', null);
INSERT INTO `numbers` VALUES ('77', 'CHTK-MB4N-0KCZ', '2', null);
INSERT INTO `numbers` VALUES ('78', '1BQF-L6ZC-68AK', '2', null);
INSERT INTO `numbers` VALUES ('79', 'S3EF-UTIS-B0DZ', '2', null);
INSERT INTO `numbers` VALUES ('80', 'QS6U-PNQM-W0HJ', '2', null);
INSERT INTO `numbers` VALUES ('81', 'XG8W-SGOE-4WCK', '2', null);
INSERT INTO `numbers` VALUES ('82', '8J6X-URPM-3FU7', '2', null);
INSERT INTO `numbers` VALUES ('83', 'UV1U-6XB0-WX4X', '2', null);
INSERT INTO `numbers` VALUES ('84', '5QG3-QPQO-UNY7', '2', null);
INSERT INTO `numbers` VALUES ('85', '5XKU-XDJ3-VDD4', '2', null);
INSERT INTO `numbers` VALUES ('86', '7P0I-NRYB-ED36', '2', null);
INSERT INTO `numbers` VALUES ('87', '7W6A-4KWC-G9FM', '2', null);
INSERT INTO `numbers` VALUES ('88', 'Q4DS-8KT3-WKDA', '2', null);
INSERT INTO `numbers` VALUES ('89', 'L3JE-MNLG-31N1', '2', null);
INSERT INTO `numbers` VALUES ('90', 'YFDW-D6FL-LHNV', '2', null);
INSERT INTO `numbers` VALUES ('91', 'WFLT-L49J-S0GT', '2', null);
INSERT INTO `numbers` VALUES ('92', 'D4AV-7ECD-NCQM', '2', null);
INSERT INTO `numbers` VALUES ('93', 'IX94-LAJC-A66K', '2', null);
INSERT INTO `numbers` VALUES ('94', 'JSEK-ANXP-XYUN', '2', null);
INSERT INTO `numbers` VALUES ('95', '47BP-FXZ4-ET4E', '2', null);
INSERT INTO `numbers` VALUES ('96', '32OH-6GXU-O5PF', '2', null);
INSERT INTO `numbers` VALUES ('97', '8XER-XXUS-AXCY', '2', null);
INSERT INTO `numbers` VALUES ('98', 'J3S7-58I3-AHCJ', '2', null);
INSERT INTO `numbers` VALUES ('99', 'JLMZ-S7G6-RGE9', '2', null);
INSERT INTO `numbers` VALUES ('100', 'R6RU-HR05-6AI9', '2', null);
INSERT INTO `numbers` VALUES ('101', 'OVRD-G9MQ-0MA3', '2', null);
INSERT INTO `numbers` VALUES ('102', 'CIIW-W0HX-MRYJ', '2', null);
INSERT INTO `numbers` VALUES ('103', 'U3K0-TPD3-SXT9', '2', null);
INSERT INTO `numbers` VALUES ('106', 'DI6Y-NND4-63QA', '3', null);
INSERT INTO `numbers` VALUES ('107', '421D-19PV-1XJQ', '3', null);
INSERT INTO `numbers` VALUES ('108', 'PQWF-3YMY-U91Q', '3', null);
INSERT INTO `numbers` VALUES ('109', '1X0S-9LXJ-NJJQ', '3', null);
INSERT INTO `numbers` VALUES ('110', 'H8LM-MVAY-ORMS', '3', null);
INSERT INTO `numbers` VALUES ('111', 'VSHP-X9ET-01AQ', '3', null);
INSERT INTO `numbers` VALUES ('112', 'YHOI-WDHR-J46L', '3', null);
INSERT INTO `numbers` VALUES ('113', '5KRL-G0PU-NBXX', '3', null);
INSERT INTO `numbers` VALUES ('114', 'FVYZ-0FPJ-6EOR', '3', null);
INSERT INTO `numbers` VALUES ('115', '3MU6-IFOY-LN3L', '3', null);
INSERT INTO `numbers` VALUES ('116', '4NN9-A98J-TUCH', '3', null);
INSERT INTO `numbers` VALUES ('117', 'W7ZR-AQKD-682Z', '3', null);
INSERT INTO `numbers` VALUES ('118', 'B2NX-3BZO-NG2T', '3', null);
INSERT INTO `numbers` VALUES ('119', 'KEI2-6NEN-C4B9', '3', null);
INSERT INTO `numbers` VALUES ('120', 'FBD5-7640-38Q3', '3', null);
INSERT INTO `numbers` VALUES ('121', 'YER3-0597-8GV7', '3', null);
INSERT INTO `numbers` VALUES ('122', 'WTO9-V494-HYQL', '3', null);
INSERT INTO `numbers` VALUES ('123', '6OMJ-C754-CWES', '3', null);
INSERT INTO `numbers` VALUES ('124', 'QTIA-DL7U-BSR1', '3', null);
INSERT INTO `numbers` VALUES ('125', 'LVXG-HQB1-L1BB', '3', null);
INSERT INTO `numbers` VALUES ('126', '13Q6-EKX5-ROP6', '3', null);
INSERT INTO `numbers` VALUES ('127', 'P3GR-C50T-AHQU', '3', null);
INSERT INTO `numbers` VALUES ('128', 'LBFT-WDG5-8XOW', '3', null);
INSERT INTO `numbers` VALUES ('129', '9MEH-1PIV-6WBJ', '3', null);
INSERT INTO `numbers` VALUES ('130', 'REOG-CZX3-3SXE', '3', null);
INSERT INTO `numbers` VALUES ('131', 'KLWU-LHJJ-AOQL', '3', null);
INSERT INTO `numbers` VALUES ('132', 'OF0I-J7JI-PZTB', '3', null);
INSERT INTO `numbers` VALUES ('133', 'H7Z4-SXLO-XHT5', '3', null);
INSERT INTO `numbers` VALUES ('134', 'QY5B-JRSD-8V90', '3', null);
INSERT INTO `numbers` VALUES ('135', '4ROI-2DMJ-F87C', '3', null);
INSERT INTO `numbers` VALUES ('136', '090M-6Z4L-T965', '3', null);
INSERT INTO `numbers` VALUES ('137', 'P705-5VF3-57EV', '3', null);
INSERT INTO `numbers` VALUES ('138', 'NUNR-3UFN-ITGV', '3', null);
INSERT INTO `numbers` VALUES ('139', 'BVX8-HKJ6-I0KG', '3', null);
INSERT INTO `numbers` VALUES ('140', 'CUPG-G34T-ENFV', '3', null);
INSERT INTO `numbers` VALUES ('141', 'UEMM-Z5WJ-Y32K', '3', null);
INSERT INTO `numbers` VALUES ('142', 'BZJ7-7Z4E-7U5M', '3', null);
INSERT INTO `numbers` VALUES ('143', 'DRIT-CIII-68MI', '3', null);
INSERT INTO `numbers` VALUES ('144', 'QANE-5AJG-9ASS', '3', null);
INSERT INTO `numbers` VALUES ('145', '86BY-U9N0-9EQO', '3', null);
INSERT INTO `numbers` VALUES ('146', '8YYZ-QHF6-2M83', '3', null);
INSERT INTO `numbers` VALUES ('147', 'VDZF-F7PE-M40Q', '3', null);
INSERT INTO `numbers` VALUES ('148', 'RK1N-OHDU-RE1K', '3', null);
INSERT INTO `numbers` VALUES ('149', 'U8QI-8GGX-U2VH', '3', null);
INSERT INTO `numbers` VALUES ('150', 'YJ0F-ETII-LCGW', '3', null);
INSERT INTO `numbers` VALUES ('151', 'B4GB-YNK0-BUEP', '3', null);
INSERT INTO `numbers` VALUES ('152', 'S61L-5O4E-TQPC', '3', null);
INSERT INTO `numbers` VALUES ('153', 'LCD4-T80C-OWOI', '3', null);
INSERT INTO `numbers` VALUES ('154', 'SFD6-BFSO-S05V', '3', null);
INSERT INTO `numbers` VALUES ('155', '4R62-TR34-SLNE', '3', null);
INSERT INTO `numbers` VALUES ('156', 'JE0Q-1QXG-SOLF', '4', null);
INSERT INTO `numbers` VALUES ('157', 'PVQZ-9CLY-GSVP', '4', null);
INSERT INTO `numbers` VALUES ('158', 'R6S1-271D-ZXWI', '4', null);
INSERT INTO `numbers` VALUES ('159', 'BX0S-OAO0-YNKM', '4', null);
INSERT INTO `numbers` VALUES ('160', 'M2WE-O5EP-KAC9', '4', null);
INSERT INTO `numbers` VALUES ('161', '6AQ8-TNNH-HGFA', '4', null);
INSERT INTO `numbers` VALUES ('162', 'N01T-9OU5-28RX', '4', null);
INSERT INTO `numbers` VALUES ('163', 'U296-P0BJ-GGE3', '4', null);
INSERT INTO `numbers` VALUES ('164', '95IF-VJ1N-HD1C', '4', null);
INSERT INTO `numbers` VALUES ('165', 'U2YM-5FQ1-4UUQ', '4', null);
INSERT INTO `numbers` VALUES ('166', '289G-JGRR-1ERL', '4', null);
INSERT INTO `numbers` VALUES ('167', 'ZKE7-4X9A-VXG2', '4', null);
INSERT INTO `numbers` VALUES ('168', '0JKA-Y9O4-I1DC', '4', null);
INSERT INTO `numbers` VALUES ('169', '0DS4-B5G7-SYIT', '4', null);
INSERT INTO `numbers` VALUES ('170', '8NKM-0SOW-Z9GC', '4', null);
INSERT INTO `numbers` VALUES ('171', 'GLZ6-AQV3-V55D', '4', null);
INSERT INTO `numbers` VALUES ('172', 'ZTJP-Z709-Q98U', '4', null);
INSERT INTO `numbers` VALUES ('173', 'JI9L-AUP9-CSN2', '4', null);
INSERT INTO `numbers` VALUES ('174', 'HAPR-2TYI-CZ1J', '4', null);
INSERT INTO `numbers` VALUES ('175', 'BWML-R9WG-3840', '4', null);
INSERT INTO `numbers` VALUES ('176', 'AC1L-VQV0-PY9O', '4', null);
INSERT INTO `numbers` VALUES ('177', 'C3ID-QTAH-C4UT', '4', null);
INSERT INTO `numbers` VALUES ('178', '4PVR-KKL3-NCQ7', '4', null);
INSERT INTO `numbers` VALUES ('179', 'T5IY-0JNN-RMD5', '4', null);
INSERT INTO `numbers` VALUES ('180', '0ET7-RXFD-HOEX', '4', null);
INSERT INTO `numbers` VALUES ('181', '9WJV-Q97M-Y196', '4', null);
INSERT INTO `numbers` VALUES ('182', 'IX1J-4A5K-DHZR', '4', null);
INSERT INTO `numbers` VALUES ('183', 'WFHN-DF5D-2DYI', '4', null);
INSERT INTO `numbers` VALUES ('184', 'PLB4-GX8V-1Q7T', '4', null);
INSERT INTO `numbers` VALUES ('185', 'RT6I-8KM4-QSH6', '4', null);
INSERT INTO `numbers` VALUES ('186', 'ZU8U-4LWN-CWPQ', '4', null);
INSERT INTO `numbers` VALUES ('187', 'Z6L2-T9G8-P2UZ', '4', null);
INSERT INTO `numbers` VALUES ('188', '4VGI-C3EM-7O25', '4', null);
INSERT INTO `numbers` VALUES ('189', 'Q55H-BMWE-ZPZA', '4', null);
INSERT INTO `numbers` VALUES ('190', '5HMZ-VJKT-I1M2', '4', null);
INSERT INTO `numbers` VALUES ('191', 'EQS2-WW4F-07ZN', '4', null);
INSERT INTO `numbers` VALUES ('192', 'YX7O-6Q4Y-WVMI', '4', null);
INSERT INTO `numbers` VALUES ('193', 'M1RH-I4P2-YBTH', '4', null);
INSERT INTO `numbers` VALUES ('194', 'KG0A-4VUM-UD71', '4', null);
INSERT INTO `numbers` VALUES ('195', 'DCMO-N01F-KWCV', '4', null);
INSERT INTO `numbers` VALUES ('196', 'Z630-8EF4-5HXX', '4', null);
INSERT INTO `numbers` VALUES ('197', '3XOL-XN9W-Y5T0', '4', null);
INSERT INTO `numbers` VALUES ('198', 'FWNI-WL27-KJZI', '4', null);
INSERT INTO `numbers` VALUES ('199', 'WSK8-TYLQ-V39V', '4', null);
INSERT INTO `numbers` VALUES ('200', 'YW9X-KCVT-P2RT', '4', null);
INSERT INTO `numbers` VALUES ('201', 'S75U-TBT6-8HWP', '4', null);
INSERT INTO `numbers` VALUES ('202', '0B4R-OXS5-4VJ9', '4', null);
INSERT INTO `numbers` VALUES ('203', 'V8MY-UNRI-J74T', '4', null);
INSERT INTO `numbers` VALUES ('204', 'XHI7-GL2J-32K4', '4', null);
INSERT INTO `numbers` VALUES ('205', 'D36U-67O0-I8GV', '4', null);
INSERT INTO `numbers` VALUES ('206', 'MLK5-LZ6X-02MK', '5', null);
INSERT INTO `numbers` VALUES ('207', '14Q2-7VVY-NHW3', '5', null);
INSERT INTO `numbers` VALUES ('208', 'YP21-5RCR-YC0O', '5', null);
INSERT INTO `numbers` VALUES ('209', 'BPXS-YJEJ-W2BX', '5', null);
INSERT INTO `numbers` VALUES ('210', 'Q0DL-MAX1-LKZ6', '5', null);
INSERT INTO `numbers` VALUES ('211', '3MJM-YU1G-A0I8', '5', null);
INSERT INTO `numbers` VALUES ('212', 'VKD3-W9MM-2IPW', '5', null);
INSERT INTO `numbers` VALUES ('213', 'N3LI-CERL-D96P', '5', null);
INSERT INTO `numbers` VALUES ('214', 'F0BY-RI4X-133O', '5', null);
INSERT INTO `numbers` VALUES ('215', 'KL7W-DWLK-94DM', '5', null);
INSERT INTO `numbers` VALUES ('216', 'FDHA-P5SL-GT3D', '5', null);
INSERT INTO `numbers` VALUES ('217', 'MY4P-N4BO-ISNZ', '5', null);
INSERT INTO `numbers` VALUES ('218', 'NCUK-MI7Z-IHO3', '5', null);
INSERT INTO `numbers` VALUES ('219', 'Z0JG-1BMD-2A6K', '5', null);
INSERT INTO `numbers` VALUES ('220', 'EJG9-X2RW-7W6D', '5', null);
INSERT INTO `numbers` VALUES ('221', '1DGD-54UB-OE88', '5', null);
INSERT INTO `numbers` VALUES ('222', '5XYJ-PWU7-X9QW', '5', null);
INSERT INTO `numbers` VALUES ('223', 'J116-5JOY-3LIR', '5', null);
INSERT INTO `numbers` VALUES ('224', '3J2O-D7CB-MRS1', '5', null);
INSERT INTO `numbers` VALUES ('225', 'OAOF-NF1Y-Q3JA', '5', null);
INSERT INTO `numbers` VALUES ('226', '9U7Q-3JPZ-LQ17', '5', null);
INSERT INTO `numbers` VALUES ('227', 'LCV6-EV94-W9TQ', '5', null);
INSERT INTO `numbers` VALUES ('228', 'EM7S-09BD-VW8F', '5', null);
INSERT INTO `numbers` VALUES ('229', '0P18-SYB7-SN6U', '5', null);
INSERT INTO `numbers` VALUES ('230', '31G2-BWJF-JD7U', '5', null);
INSERT INTO `numbers` VALUES ('231', 'D7US-XM97-QBVM', '5', null);
INSERT INTO `numbers` VALUES ('232', 'XJFY-2ZCO-AVFT', '5', null);
INSERT INTO `numbers` VALUES ('233', '7Y0R-VEIV-ZOKA', '5', null);
INSERT INTO `numbers` VALUES ('234', 'VXVS-S1VE-XKQ6', '5', null);
INSERT INTO `numbers` VALUES ('235', 'VEWK-RDGV-XYJA', '5', null);
INSERT INTO `numbers` VALUES ('236', '62QM-X82Z-YD85', '5', null);
INSERT INTO `numbers` VALUES ('237', 'M9CS-1S8S-0V4G', '5', null);
INSERT INTO `numbers` VALUES ('238', 'U3O5-0L2Q-IY4I', '5', null);
INSERT INTO `numbers` VALUES ('239', 'R8ZB-S1DK-IK0F', '5', null);
INSERT INTO `numbers` VALUES ('240', '671H-6KJ6-3BSZ', '5', null);
INSERT INTO `numbers` VALUES ('241', '0RNT-JIH6-RV31', '5', null);
INSERT INTO `numbers` VALUES ('242', '9HVW-4NMO-0QUX', '5', null);
INSERT INTO `numbers` VALUES ('243', 'VEIW-SSU9-YJST', '5', null);
INSERT INTO `numbers` VALUES ('244', 'GOL8-6UHK-N4MM', '5', null);
INSERT INTO `numbers` VALUES ('245', 'S5QR-11UH-9A5H', '5', null);
INSERT INTO `numbers` VALUES ('246', '0OM1-WXJM-Y8R7', '5', null);
INSERT INTO `numbers` VALUES ('247', 'SCM9-IGZS-PB55', '5', null);
INSERT INTO `numbers` VALUES ('248', 'G30F-ELX1-KZOZ', '5', null);
INSERT INTO `numbers` VALUES ('249', 'MXNO-LQN3-321S', '5', null);
INSERT INTO `numbers` VALUES ('250', '86QN-MRY4-A1M9', '5', null);
INSERT INTO `numbers` VALUES ('251', 'XR1H-I33S-QT3L', '5', null);
INSERT INTO `numbers` VALUES ('252', 'M3XW-TOW5-DSUD', '5', null);
INSERT INTO `numbers` VALUES ('253', 'X23I-VKZS-TKTT', '5', null);
INSERT INTO `numbers` VALUES ('254', '4WG6-LYD0-CKJV', '5', null);
INSERT INTO `numbers` VALUES ('255', '52FV-8BKA-NQ3K', '5', null);
INSERT INTO `numbers` VALUES ('256', 'WK1Q-FI12-1760', '6', null);
INSERT INTO `numbers` VALUES ('257', 'SHL1-BINK-QL6H', '6', null);
INSERT INTO `numbers` VALUES ('258', 'MDKB-23M0-PJO2', '6', null);
INSERT INTO `numbers` VALUES ('259', 'KUMF-9QSK-YHZG', '6', null);
INSERT INTO `numbers` VALUES ('260', '4RKK-ZTEV-0BUS', '6', null);
INSERT INTO `numbers` VALUES ('261', 'EJPC-P6B0-HJQW', '6', null);
INSERT INTO `numbers` VALUES ('262', '4RZH-CRQC-VWFL', '6', null);
INSERT INTO `numbers` VALUES ('263', 'W02U-5H44-V4K2', '6', null);
INSERT INTO `numbers` VALUES ('264', 'RBUT-0UXV-E29D', '6', null);
INSERT INTO `numbers` VALUES ('265', '3WWX-UL6L-V07V', '6', null);
INSERT INTO `numbers` VALUES ('266', 'JD71-ZNU5-PJZF', '6', null);
INSERT INTO `numbers` VALUES ('267', 'IZ7J-TFNQ-EWVP', '6', null);
INSERT INTO `numbers` VALUES ('268', 'NUZP-D6JF-YGO3', '6', null);
INSERT INTO `numbers` VALUES ('269', '6MZG-G3JP-KWYJ', '6', null);
INSERT INTO `numbers` VALUES ('270', 'XHA7-AT6F-2CPF', '6', null);
INSERT INTO `numbers` VALUES ('271', '31GW-QGI1-RGHM', '6', null);
INSERT INTO `numbers` VALUES ('272', 'KJHV-P1FD-DBLK', '6', null);
INSERT INTO `numbers` VALUES ('273', 'KW1W-QU07-TR7W', '6', null);
INSERT INTO `numbers` VALUES ('274', 'AQVQ-5DO2-VSWT', '6', null);
INSERT INTO `numbers` VALUES ('275', 'DJ78-6QU7-7ZJ3', '6', null);
INSERT INTO `numbers` VALUES ('276', 'ZBHP-FEEF-0BJ1', '6', null);
INSERT INTO `numbers` VALUES ('277', 'RNLY-1GSZ-YDUG', '6', null);
INSERT INTO `numbers` VALUES ('278', 'UIZ8-QEWN-36TK', '6', null);
INSERT INTO `numbers` VALUES ('279', 'XGHB-MA3R-79E7', '6', null);
INSERT INTO `numbers` VALUES ('280', '4IKI-CMC1-DNZM', '6', null);
INSERT INTO `numbers` VALUES ('281', '484L-3F1T-9VFM', '6', null);
INSERT INTO `numbers` VALUES ('282', '3MJU-JA2U-2Y7G', '6', null);
INSERT INTO `numbers` VALUES ('283', 'O7R0-S6UE-EF8X', '6', null);
INSERT INTO `numbers` VALUES ('284', '14FI-O99G-CVAR', '6', null);
INSERT INTO `numbers` VALUES ('285', 'OMUW-RRRU-6D22', '6', null);
INSERT INTO `numbers` VALUES ('286', 'LJK7-LR13-ENUZ', '6', null);
INSERT INTO `numbers` VALUES ('287', 'AOF1-4UF0-7LY5', '6', null);
INSERT INTO `numbers` VALUES ('288', 'FWK5-28C7-1LY2', '6', null);
INSERT INTO `numbers` VALUES ('289', 'ODFY-SMDJ-PSW3', '6', null);
INSERT INTO `numbers` VALUES ('290', 'BSKB-Z5IF-HUA5', '6', null);
INSERT INTO `numbers` VALUES ('291', '69PY-H9T3-W5OI', '6', null);
INSERT INTO `numbers` VALUES ('292', 'HAIR-Q1XM-2I3L', '6', null);
INSERT INTO `numbers` VALUES ('293', 'FLWM-D1N6-0278', '6', null);
INSERT INTO `numbers` VALUES ('294', 'ZEX9-A8M8-LBNL', '6', null);
INSERT INTO `numbers` VALUES ('295', 'YVVC-ZJLX-QMPB', '6', null);
INSERT INTO `numbers` VALUES ('296', 'VTIZ-FBVW-1W3J', '6', null);
INSERT INTO `numbers` VALUES ('297', 'SQ3V-8J6B-JJ6X', '6', null);
INSERT INTO `numbers` VALUES ('298', '7GH3-FJVV-QGQN', '6', null);
INSERT INTO `numbers` VALUES ('299', '7GWF-H9OO-N1ZC', '6', null);
INSERT INTO `numbers` VALUES ('300', 'AM3X-H3XD-V9Q6', '6', null);
INSERT INTO `numbers` VALUES ('301', 'HBFA-YZB6-DG9T', '6', null);
INSERT INTO `numbers` VALUES ('302', 'BHMO-WA7P-PKDE', '6', null);
INSERT INTO `numbers` VALUES ('303', 'UJQV-YC4X-ZCLK', '6', null);
INSERT INTO `numbers` VALUES ('304', 'CALW-B12I-LYKI', '6', null);
INSERT INTO `numbers` VALUES ('305', 'DUYI-D1RJ-UFX9', '6', null);
INSERT INTO `numbers` VALUES ('306', 'HCYQ-INSJ-MNWS', '7', null);
INSERT INTO `numbers` VALUES ('307', '2682-LMBI-CT2O', '7', null);
INSERT INTO `numbers` VALUES ('308', '22ZN-0900-WQNX', '7', null);
INSERT INTO `numbers` VALUES ('309', 'XBUW-RC12-PP90', '7', null);
INSERT INTO `numbers` VALUES ('310', 'FPYW-6517-OH23', '7', null);
INSERT INTO `numbers` VALUES ('311', '3HZ5-6H7G-6DRM', '7', null);
INSERT INTO `numbers` VALUES ('312', 'SG2Q-7L5C-54GM', '7', null);
INSERT INTO `numbers` VALUES ('313', 'WXX4-391Y-01TO', '7', null);
INSERT INTO `numbers` VALUES ('314', 'DMNE-CSKQ-OXRK', '7', null);
INSERT INTO `numbers` VALUES ('315', 'VX1S-YURH-0OFG', '7', null);
INSERT INTO `numbers` VALUES ('316', 'FX5U-0IJE-4ZPD', '7', null);
INSERT INTO `numbers` VALUES ('317', 'L87F-SS5U-IK49', '7', null);
INSERT INTO `numbers` VALUES ('318', '428Z-IA2N-ZMRJ', '7', null);
INSERT INTO `numbers` VALUES ('319', 'C3TB-5D9S-S12G', '7', null);
INSERT INTO `numbers` VALUES ('320', 'XYJ3-LMP7-3ADS', '7', null);
INSERT INTO `numbers` VALUES ('321', '4QV8-P21K-G488', '7', null);
INSERT INTO `numbers` VALUES ('322', 'F1B7-ALL2-YXHE', '7', null);
INSERT INTO `numbers` VALUES ('323', 'VN7C-IM4J-O5P1', '7', null);
INSERT INTO `numbers` VALUES ('324', 'J4WG-TW6V-P8JW', '7', null);
INSERT INTO `numbers` VALUES ('325', 'ZKEL-UPSL-ZZ3Z', '7', null);
INSERT INTO `numbers` VALUES ('326', 'M7DB-IT1R-UL3U', '7', null);
INSERT INTO `numbers` VALUES ('327', 'CWO8-JPV8-XOIK', '7', null);
INSERT INTO `numbers` VALUES ('328', 'UX6Y-NVZL-7HI7', '7', null);
INSERT INTO `numbers` VALUES ('329', 'VAU0-F6LR-9PVN', '7', null);
INSERT INTO `numbers` VALUES ('330', '7R7D-NVS6-CY4T', '7', null);
INSERT INTO `numbers` VALUES ('331', 'QHCF-KH1S-9DB2', '7', null);
INSERT INTO `numbers` VALUES ('332', 'M5Q1-09FX-9OYE', '7', null);
INSERT INTO `numbers` VALUES ('333', 'QWFP-8UGJ-524B', '7', null);
INSERT INTO `numbers` VALUES ('334', 'CZ81-C507-884P', '7', null);
INSERT INTO `numbers` VALUES ('335', 'C2PH-1A7T-G2IM', '7', null);
INSERT INTO `numbers` VALUES ('336', '45ZD-7QF3-8K77', '7', null);
INSERT INTO `numbers` VALUES ('337', 'DU5P-49N0-O3H5', '7', null);
INSERT INTO `numbers` VALUES ('338', 'J11L-VB59-7M5N', '7', null);
INSERT INTO `numbers` VALUES ('339', 'P7XP-XRQY-YIHA', '7', null);
INSERT INTO `numbers` VALUES ('340', 'E6I7-C0OQ-EP98', '7', null);
INSERT INTO `numbers` VALUES ('341', 'NF6S-OQSK-JS7Z', '7', null);
INSERT INTO `numbers` VALUES ('342', 'UNJX-27R0-SAET', '7', null);
INSERT INTO `numbers` VALUES ('343', '75M7-VSSF-K6H7', '7', null);
INSERT INTO `numbers` VALUES ('344', 'OSUR-KDSY-09IA', '7', null);
INSERT INTO `numbers` VALUES ('345', '21OE-8UG4-G8LU', '7', null);
INSERT INTO `numbers` VALUES ('346', '7BBC-GPBO-FVMT', '7', null);
INSERT INTO `numbers` VALUES ('347', '5MLC-ZUQA-F7E1', '7', null);
INSERT INTO `numbers` VALUES ('348', 'NZFN-7V6H-71HL', '7', null);
INSERT INTO `numbers` VALUES ('349', '9BOF-FUMX-CBML', '7', null);
INSERT INTO `numbers` VALUES ('350', '10KD-6NSR-UD3P', '7', null);
INSERT INTO `numbers` VALUES ('351', 'KXNH-PM75-Q1TO', '7', null);
INSERT INTO `numbers` VALUES ('352', 'ZXWW-0PI2-SBBX', '7', null);
INSERT INTO `numbers` VALUES ('353', 'JBDO-5MA0-P46W', '7', null);
INSERT INTO `numbers` VALUES ('354', 'IJX6-KKDP-STCT', '7', null);
INSERT INTO `numbers` VALUES ('355', 'OC0C-5U3O-RBUL', '7', null);
INSERT INTO `numbers` VALUES ('356', 'FEXH-L5K5-A8IY', '8', null);
INSERT INTO `numbers` VALUES ('357', 'OZTI-2OZI-KUBW', '8', null);
INSERT INTO `numbers` VALUES ('358', 'Q552-MVE3-VOBE', '8', null);
INSERT INTO `numbers` VALUES ('359', 'KTTY-A665-GA4R', '8', null);
INSERT INTO `numbers` VALUES ('360', 'WI85-INGZ-219A', '8', null);
INSERT INTO `numbers` VALUES ('361', 'RKNQ-BJ1C-YUGR', '8', null);
INSERT INTO `numbers` VALUES ('362', 'CRB0-S5MT-ZFU4', '8', null);
INSERT INTO `numbers` VALUES ('363', '2CXM-VACD-J32Z', '8', null);
INSERT INTO `numbers` VALUES ('364', 'U4LI-Y7VK-LPBA', '8', null);
INSERT INTO `numbers` VALUES ('365', 'E7XP-BGIF-9MJX', '8', null);
INSERT INTO `numbers` VALUES ('366', 'AT61-DK73-0T4S', '8', null);
INSERT INTO `numbers` VALUES ('367', 'P7X3-08QD-O6UW', '8', null);
INSERT INTO `numbers` VALUES ('368', 'G02Y-3LQC-KJHG', '8', null);
INSERT INTO `numbers` VALUES ('369', 'AXK4-9COP-ZW2C', '8', null);
INSERT INTO `numbers` VALUES ('370', '6FEW-9QKS-IBTS', '8', null);
INSERT INTO `numbers` VALUES ('371', '40MW-M6G7-6NAA', '8', null);
INSERT INTO `numbers` VALUES ('372', 'JRL9-XDCQ-0TQ2', '8', null);
INSERT INTO `numbers` VALUES ('373', 'XIXT-1DCE-2JMM', '8', null);
INSERT INTO `numbers` VALUES ('374', '9HVO-J6M9-730M', '8', null);
INSERT INTO `numbers` VALUES ('375', '37NG-LZKI-CFZ6', '8', null);
INSERT INTO `numbers` VALUES ('376', 'T9KH-CQIR-EW1T', '8', null);
INSERT INTO `numbers` VALUES ('377', 'ZBW0-H477-YXTR', '8', null);
INSERT INTO `numbers` VALUES ('378', 'TSTG-1A0P-4LLA', '8', null);
INSERT INTO `numbers` VALUES ('379', '07AL-6AAG-MED7', '8', null);
INSERT INTO `numbers` VALUES ('380', 'RMPP-KLAJ-DISN', '8', null);
INSERT INTO `numbers` VALUES ('381', 'KYKB-9IGL-2XTV', '8', null);
INSERT INTO `numbers` VALUES ('382', '1FH4-UQSW-I0K1', '8', null);
INSERT INTO `numbers` VALUES ('383', 'N264-C2I3-7QUE', '8', null);
INSERT INTO `numbers` VALUES ('384', 'BA0A-FEE7-FVJO', '8', null);
INSERT INTO `numbers` VALUES ('385', 'YQWR-8TF1-0HMO', '8', null);
INSERT INTO `numbers` VALUES ('386', 'ILF7-EGCR-YYBW', '8', null);
INSERT INTO `numbers` VALUES ('387', 'UDTQ-ANTV-10SD', '8', null);
INSERT INTO `numbers` VALUES ('388', 'CFOU-V4ZE-T0NL', '8', null);
INSERT INTO `numbers` VALUES ('389', 'YG5K-G8HW-3Q3N', '8', null);
INSERT INTO `numbers` VALUES ('390', '1SYF-1QJC-BESK', '8', null);
INSERT INTO `numbers` VALUES ('391', '56HV-QCDU-VRVX', '8', null);
INSERT INTO `numbers` VALUES ('392', 'J88G-9XOA-ZDXS', '8', null);
INSERT INTO `numbers` VALUES ('393', '5Q5R-SK4L-AY12', '8', null);
INSERT INTO `numbers` VALUES ('394', 'PHOL-FA5Z-HZ8J', '8', null);
INSERT INTO `numbers` VALUES ('395', 'AK56-VPN8-OHVI', '8', null);
INSERT INTO `numbers` VALUES ('396', 'NGLD-9SNJ-UPV8', '8', null);
INSERT INTO `numbers` VALUES ('397', 'BD92-407L-JGNE', '8', null);
INSERT INTO `numbers` VALUES ('398', '811L-GMDR-XI4T', '8', null);
INSERT INTO `numbers` VALUES ('399', 'M8WW-76JC-6ZJX', '8', null);
INSERT INTO `numbers` VALUES ('400', 'VT3A-HQ8A-2Y3F', '8', null);
INSERT INTO `numbers` VALUES ('401', '31VL-IYU5-T3D8', '8', null);
INSERT INTO `numbers` VALUES ('402', '8DIE-J2OS-X4TX', '8', null);
INSERT INTO `numbers` VALUES ('403', '2TFZ-9ZHG-6ZGJ', '8', null);
INSERT INTO `numbers` VALUES ('404', '1NAS-LCGA-0XYM', '8', null);
INSERT INTO `numbers` VALUES ('405', '1P7X-XI7R-BQG7', '8', null);
INSERT INTO `numbers` VALUES ('406', 'H7VW-48XW-HQMT', '9', null);
INSERT INTO `numbers` VALUES ('407', '9ZEQ-OU88-GNMG', '9', null);
INSERT INTO `numbers` VALUES ('408', 'SAHY-F1BU-LT3O', '9', null);
INSERT INTO `numbers` VALUES ('409', 'ZX9L-T6U6-TZ7J', '9', null);
INSERT INTO `numbers` VALUES ('410', '74F7-PXCJ-FNIE', '9', null);
INSERT INTO `numbers` VALUES ('411', 'R2TK-T7UO-YIP0', '9', null);
INSERT INTO `numbers` VALUES ('412', 'XY8C-XPMT-HKVQ', '9', null);
INSERT INTO `numbers` VALUES ('413', '2M5Y-NG9T-Q6E5', '9', null);
INSERT INTO `numbers` VALUES ('414', '7D8C-L517-V2J3', '9', null);
INSERT INTO `numbers` VALUES ('415', 'H9WV-EAVU-39OU', '9', null);
INSERT INTO `numbers` VALUES ('416', 'KS87-Y3W2-AP4K', '9', null);
INSERT INTO `numbers` VALUES ('417', 'TPLP-8X61-A7ER', '9', null);
INSERT INTO `numbers` VALUES ('418', 'A0A1-3BHM-2L1P', '9', null);
INSERT INTO `numbers` VALUES ('419', '0TL0-AF7T-RFHR', '9', null);
INSERT INTO `numbers` VALUES ('420', 'Q8I2-2WWI-4TPA', '9', null);
INSERT INTO `numbers` VALUES ('421', 'RZK3-9VJ6-IF98', '9', null);
INSERT INTO `numbers` VALUES ('422', 'U5TH-2QOM-F69F', '9', null);
INSERT INTO `numbers` VALUES ('423', 'Q5DG-HESH-GUFI', '9', null);
INSERT INTO `numbers` VALUES ('424', 'DXAB-RRR1-TGDG', '9', null);
INSERT INTO `numbers` VALUES ('425', 'VI8R-TVZO-ZME5', '9', null);
INSERT INTO `numbers` VALUES ('426', 'WUPR-OQLA-Q908', '9', null);
INSERT INTO `numbers` VALUES ('427', '3HWT-D4IG-OFQ6', '9', null);
INSERT INTO `numbers` VALUES ('428', 'K2YF-5AY5-0T2W', '9', null);
INSERT INTO `numbers` VALUES ('429', 'AU7J-I2OL-TTBS', '9', null);
INSERT INTO `numbers` VALUES ('430', 'OI9H-Y0CJ-B9P1', '9', null);
INSERT INTO `numbers` VALUES ('431', '02BL-SSN9-T7NO', '9', null);
INSERT INTO `numbers` VALUES ('432', 'SQTW-52J3-WZOC', '9', null);
INSERT INTO `numbers` VALUES ('433', 'PEXG-VCNL-CKNU', '9', null);
INSERT INTO `numbers` VALUES ('434', '9NNK-N7D4-XD1D', '9', null);
INSERT INTO `numbers` VALUES ('435', '1OEM-J7NR-BNH3', '9', null);
INSERT INTO `numbers` VALUES ('436', 'X5H8-WD9S-ECAI', '9', null);
INSERT INTO `numbers` VALUES ('437', '4TXW-7YW6-KRZ5', '9', null);
INSERT INTO `numbers` VALUES ('438', 'S64Q-DKU0-JRKZ', '9', null);
INSERT INTO `numbers` VALUES ('439', '25IY-E8F5-2QFT', '9', null);
INSERT INTO `numbers` VALUES ('440', 'XL1M-9AGU-T74E', '9', null);
INSERT INTO `numbers` VALUES ('441', 'MESE-NNG9-E0EW', '9', null);
INSERT INTO `numbers` VALUES ('442', 'V3CL-GH86-BJ4H', '9', null);
INSERT INTO `numbers` VALUES ('443', '5Q5D-2SN9-6XF6', '9', null);
INSERT INTO `numbers` VALUES ('444', '3UUJ-WRRC-4FI1', '9', null);
INSERT INTO `numbers` VALUES ('445', 'Z1YN-ZBEK-7IPT', '9', null);
INSERT INTO `numbers` VALUES ('446', 'AA8T-CXTK-X1SK', '9', null);
INSERT INTO `numbers` VALUES ('447', '4ZQK-DTJB-H0ZZ', '9', null);
INSERT INTO `numbers` VALUES ('448', '0IN5-N3XO-77VS', '9', null);
INSERT INTO `numbers` VALUES ('449', 'LU35-3FR2-MZC7', '9', null);
INSERT INTO `numbers` VALUES ('450', 'GW0S-H6CJ-0BGP', '9', null);
INSERT INTO `numbers` VALUES ('451', 'YAWY-KISJ-QP5S', '9', null);
INSERT INTO `numbers` VALUES ('452', '6R0L-2IXH-33ZB', '9', null);
INSERT INTO `numbers` VALUES ('453', '93ZE-0M3M-C829', '9', null);
INSERT INTO `numbers` VALUES ('454', 'O158-0NVU-3WZ2', '9', null);
INSERT INTO `numbers` VALUES ('455', '1HW7-K1I8-895L', '9', null);

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
  `activation_date` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_licence
-- ----------------------------
INSERT INTO `user_licence` VALUES ('11', '5', '454', '1423568967');
INSERT INTO `user_licence` VALUES ('12', '5', '452', '1423568996');
INSERT INTO `user_licence` VALUES ('13', '5', '4', '1423572982');
