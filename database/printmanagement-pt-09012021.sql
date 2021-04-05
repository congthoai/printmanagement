/*
Navicat MySQL Data Transfer

Source Server         : 139.162.123.138New
Source Server Version : 80022
Source Host           : 139.162.123.138:3306
Source Database       : printmanagement

Target Server Type    : MYSQL
Target Server Version : 80022
File Encoding         : 65001

Date: 2021-01-09 03:01:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `costdate` datetime DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `unit` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cost
-- ----------------------------
INSERT INTO `cost` VALUES ('1', 'admin', '2021-01-01 22:15:33', null, 'admin', '2021-01-01 22:15:33', '20201223-101442', '2020-12-23 10:14:42', 'keo 502', '33000', '10', '330000', 'chai');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `customertype_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qcxvwr050d5ln74t92r3bl0n0` (`customertype_id`),
  CONSTRAINT `FK_qcxvwr050d5ln74t92r3bl0n0` FOREIGN KEY (`customertype_id`) REFERENCES `customertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', null, null, null, null, null, null, 'KH200826235330', null, 'A CHÍ CỜ ĐỎ', null, null, '4');
INSERT INTO `customer` VALUES ('2', null, null, null, null, null, null, 'KH200826235349', null, 'A ĐĂNG TÂN HIỆP', null, null, '2');
INSERT INTO `customer` VALUES ('3', null, null, null, null, null, null, 'KH200826235400', null, 'A HOÀI', null, null, '6');
INSERT INTO `customer` VALUES ('4', null, null, null, null, null, null, 'KH200826235410', null, 'A HOÀN THẠNH THẮNG', null, null, '6');
INSERT INTO `customer` VALUES ('5', null, null, null, null, null, null, 'KH200826235415', null, 'A KHOA', null, null, '6');
INSERT INTO `customer` VALUES ('6', null, null, null, null, null, null, 'KH200826235419', null, 'A LONG', null, null, '6');
INSERT INTO `customer` VALUES ('7', null, null, null, null, null, null, 'KH200826235430', null, 'A NAM', null, null, '6');
INSERT INTO `customer` VALUES ('8', null, null, null, null, null, null, 'KH200826235447', null, 'A NGUYÊN TÂN HIỆP', null, null, '7');
INSERT INTO `customer` VALUES ('9', null, null, null, null, null, null, 'KH200826235511', null, 'A TÂM', null, null, '6');
INSERT INTO `customer` VALUES ('10', null, null, null, null, null, null, 'KH200826235519', null, 'A THÉP', null, null, '7');
INSERT INTO `customer` VALUES ('11', null, null, null, null, null, null, 'KH200826235523', null, 'A THƯƠNG', null, null, '7');
INSERT INTO `customer` VALUES ('12', null, null, null, 'admin', '2021-01-01 11:58:00', '', 'KH200826235527', '', 'BVĐK VĨNH THẠNH', '', null, '7');
INSERT INTO `customer` VALUES ('13', null, null, null, null, null, null, 'KH200826235539', null, 'CÔ TÂM PGD', null, null, '8');
INSERT INTO `customer` VALUES ('14', null, null, null, null, null, null, 'KH200826235544', null, 'CÔNG THỨC', null, null, '8');
INSERT INTO `customer` VALUES ('15', null, null, null, null, null, null, 'KH200826235559', null, 'CPA', null, null, '3');
INSERT INTO `customer` VALUES ('16', null, null, null, null, null, null, 'KH200826235601', null, 'CTY TẤN HƯNG', null, null, '3');
INSERT INTO `customer` VALUES ('17', null, null, null, 'admin', '2021-01-01 10:52:52', '', 'KH200826235607', '', 'CTY TÂN THÀNH', '', null, '1');
INSERT INTO `customer` VALUES ('18', null, null, null, null, null, null, 'KH200826235616', null, 'CTY VĨNH KIM', null, null, '1');
INSERT INTO `customer` VALUES ('19', null, null, null, null, null, null, 'KH200826235620', null, 'CHỊ HẠNH', null, null, '6');
INSERT INTO `customer` VALUES ('20', null, null, null, null, null, null, 'KH200826235630', null, 'CHỊ TÂM', null, null, '3');
INSERT INTO `customer` VALUES ('21', null, null, null, null, null, null, 'KH200826235634', null, 'CHỊ TRINH_TT THẠNH AN', null, null, '7');
INSERT INTO `customer` VALUES ('22', null, null, null, null, null, null, 'KH200826235645', null, 'CHÚ DUYÊN', null, null, '5');
INSERT INTO `customer` VALUES ('23', null, null, null, null, null, null, 'KH200826235655', null, 'DECAL PHƯƠNG', null, null, '6');
INSERT INTO `customer` VALUES ('24', null, null, null, null, null, null, 'KH200826235658', null, 'DUY TÂN', null, null, '8');
INSERT INTO `customer` VALUES ('25', null, null, null, null, null, null, 'KH200826235707', null, 'ĐÔNG Á', null, null, '7');
INSERT INTO `customer` VALUES ('26', null, null, null, null, null, null, 'KH200826235710', null, 'ĐỨC LIÊN', null, null, '3');
INSERT INTO `customer` VALUES ('29', null, null, null, 'admin', '2021-01-01 10:54:01', '', 'KH200826235736', '', 'HOAN', '', null, '5');
INSERT INTO `customer` VALUES ('30', null, null, null, null, null, null, 'KH200826235738', null, 'HOÀNG ĐĂNG', null, null, '8');
INSERT INTO `customer` VALUES ('31', null, null, null, null, null, null, 'KH200826235751', null, 'HOÀNG LONG', null, null, '5');
INSERT INTO `customer` VALUES ('32', null, null, null, null, null, null, 'KH200826235754', null, 'HUYỆN ĐOÀN', null, null, '7');
INSERT INTO `customer` VALUES ('33', null, null, null, null, null, null, 'KH200826235806', null, 'HỮU NGHĨA', null, null, '8');
INSERT INTO `customer` VALUES ('34', null, null, null, null, null, null, 'KH200826235816', null, 'KIM LÂM', null, null, '8');
INSERT INTO `customer` VALUES ('35', null, null, null, null, null, null, 'KH200826235824', null, 'KHÁCH', null, null, '7');
INSERT INTO `customer` VALUES ('36', null, null, null, null, null, null, 'KH200826235836', null, 'KHÁNH THY', null, null, '6');
INSERT INTO `customer` VALUES ('37', null, null, null, 'admin', '2021-01-01 10:56:20', '', 'KH200826235839', '', 'KHOA', '', null, '4');
INSERT INTO `customer` VALUES ('38', null, null, null, null, null, null, 'KH200826235841', null, 'LÚA GIỐNG THÁI BÌNH', null, null, '10');
INSERT INTO `customer` VALUES ('39', null, null, null, null, null, null, 'KH200826235855', null, 'MN TT THẠNH AN', null, null, '7');
INSERT INTO `customer` VALUES ('40', null, null, null, null, null, null, 'KH200826235900', null, 'MN TT THẠNH AN 1', null, null, '7');
INSERT INTO `customer` VALUES ('41', null, null, null, null, null, null, 'KH200826235905', null, 'MN THẠNH AN 1', null, null, '7');
INSERT INTO `customer` VALUES ('42', null, null, null, null, null, null, 'KH200826235913', null, 'MN THẠNH AN 2', null, null, '7');
INSERT INTO `customer` VALUES ('43', null, null, null, null, null, null, 'KH200826235917', null, 'MN THẠNH LỢI 1', null, null, '7');
INSERT INTO `customer` VALUES ('44', null, null, null, null, null, null, 'KH200826235920', null, 'MN THẠNH LỢI 2', null, null, '7');
INSERT INTO `customer` VALUES ('45', null, null, null, null, null, null, 'KH200826235925', null, 'MN THẠNH TIẾN', null, null, '7');
INSERT INTO `customer` VALUES ('46', null, null, null, null, null, null, 'KH200826235942', null, 'MN THẠNH THẮNG 1', null, null, '7');
INSERT INTO `customer` VALUES ('47', null, null, null, null, null, null, 'KH200826235952', null, 'MN THẠNH THẮNG 2', null, null, '7');
INSERT INTO `customer` VALUES ('48', null, null, null, null, null, null, 'KH200826235956', null, 'MTK', null, null, '3');
INSERT INTO `customer` VALUES ('49', null, null, null, null, null, null, 'KH200826235958', null, 'NGHI', null, null, '7');
INSERT INTO `customer` VALUES ('50', null, null, null, null, null, null, 'KH200827000007', null, 'NGỌC LIÊN', null, null, '7');
INSERT INTO `customer` VALUES ('51', null, null, null, null, null, null, 'KH200827000012', null, 'QC MINH CHIẾN', null, null, '5');
INSERT INTO `customer` VALUES ('52', null, null, null, null, null, null, 'KH200827000016', null, 'TTVH', null, null, '5');
INSERT INTO `customer` VALUES ('53', null, null, null, null, null, null, 'KH200827000027', null, 'TH TT THẠNH AN 1', null, null, '7');
INSERT INTO `customer` VALUES ('54', null, null, null, null, null, null, 'KH200827000037', null, 'TH THẠNH AN 3', null, null, '7');
INSERT INTO `customer` VALUES ('55', null, null, null, null, null, null, 'KH200827000054', null, 'TH THẠNH TIẾN 1', null, null, '7');
INSERT INTO `customer` VALUES ('56', null, null, null, null, null, null, 'KH200827000058', null, 'TH THẠNH THẮNG 1', null, null, '7');
INSERT INTO `customer` VALUES ('57', null, null, null, null, null, null, 'KH200827000101', null, 'TH THẠNH THẮNG 2', null, null, '7');
INSERT INTO `customer` VALUES ('58', null, null, null, null, null, null, 'KH200827000106', null, 'THẦY CHUYÊN', null, null, '5');
INSERT INTO `customer` VALUES ('59', null, null, null, null, null, null, 'KH200827000114', null, 'THẦY PHONG_THCS TT THẠNH AN', null, null, '7');
INSERT INTO `customer` VALUES ('60', null, null, null, null, null, null, 'KH200827000121', null, 'THCS TT THẠNH AN 1', null, null, '7');
INSERT INTO `customer` VALUES ('61', null, null, null, null, null, null, 'KH200827000134', null, 'THCS TT VĨNH THẠNH', null, null, '9');
INSERT INTO `customer` VALUES ('62', null, null, null, null, null, null, 'KH200827000141', null, 'THCS THẠNH AN', null, null, '7');
INSERT INTO `customer` VALUES ('63', null, null, null, null, null, null, 'KH200827000152', null, 'THCS THẠNH LỢI', null, null, '7');
INSERT INTO `customer` VALUES ('64', null, null, null, null, null, null, 'KH200827000156', null, 'THCS THẠNH TIẾN', null, null, '7');
INSERT INTO `customer` VALUES ('65', null, null, null, null, null, null, 'KH200827000207', null, 'THỊ ĐOÀN THẠNH AN', null, null, '7');
INSERT INTO `customer` VALUES ('66', null, null, null, null, null, null, 'KH200827000215', null, 'THPT THẠNH AN', null, null, '7');
INSERT INTO `customer` VALUES ('67', null, null, null, null, null, null, 'KH200827000225', null, 'THPT THẠNH THẮNG', null, null, '7');
INSERT INTO `customer` VALUES ('68', null, null, null, null, null, null, 'KH200827000232', null, 'TRANG ĐÀI', null, null, '6');
INSERT INTO `customer` VALUES ('69', null, null, null, null, null, null, 'KH200827000242', null, 'TRẦN KIỆT', null, null, '2');
INSERT INTO `customer` VALUES ('70', null, null, null, null, null, null, 'KH200827000245', null, 'TRƯỜNG AN', null, null, '5');
INSERT INTO `customer` VALUES ('71', null, null, null, null, null, null, 'KH200827000254', null, 'TRƯỜNG THỌ', null, null, '8');
INSERT INTO `customer` VALUES ('72', null, null, null, null, null, null, 'KH200827000257', null, 'UBND XÃ THẠNH LỢI', null, null, '7');
INSERT INTO `customer` VALUES ('73', null, null, null, null, null, null, 'KH200827000312', null, 'VẠN PHÚC', null, null, '8');
INSERT INTO `customer` VALUES ('74', null, null, null, null, null, null, 'KH200827000320', null, 'VIETTEL', null, null, '9');
INSERT INTO `customer` VALUES ('75', null, null, null, null, null, null, 'KH200827000323', null, 'VINAPHONE', null, null, '9');
INSERT INTO `customer` VALUES ('76', null, null, null, null, null, null, 'KH200827000336', null, 'XÃ THẠNH AN', null, null, '6');
INSERT INTO `customer` VALUES ('77', null, null, null, null, null, null, 'KH200827000346', null, 'XÃ THẠNH LỢI', null, null, '7');
INSERT INTO `customer` VALUES ('78', null, null, null, null, null, null, 'KH200827000351', null, 'XÃ THẠNH QUỚI', null, null, '6');
INSERT INTO `customer` VALUES ('79', null, null, null, null, null, null, 'KH200827000356', null, 'XÃ THẠNH TIẾN', null, null, '6');
INSERT INTO `customer` VALUES ('80', null, null, null, null, null, null, 'KH200827000406', null, 'XUÂN PHONG', null, null, '9');
INSERT INTO `customer` VALUES ('81', null, null, null, null, null, null, 'KH200828153302', null, 'CÔNG TÂN', null, null, '8');
INSERT INTO `customer` VALUES ('82', null, null, null, null, null, null, 'KH200829173412', null, 'QUANG TUẤN', null, null, '8');
INSERT INTO `customer` VALUES ('83', null, null, null, null, null, null, 'KH200916092702', null, 'SALON CHÂU', null, null, '7');
INSERT INTO `customer` VALUES ('84', null, null, null, null, null, null, 'KH200921103306', null, 'THPT VĨNH THẠNH', null, null, '7');
INSERT INTO `customer` VALUES ('85', null, null, null, null, null, null, 'KH201001082005', null, 'HOÀNG VÂN_SÓC TRĂNG', null, null, '6');
INSERT INTO `customer` VALUES ('86', null, null, null, null, null, null, 'KH201001111907', null, 'ĐẠI', null, null, '6');
INSERT INTO `customer` VALUES ('87', null, null, null, null, null, null, 'KH201006112811', null, 'VĂN HẢO', null, null, '11');
INSERT INTO `customer` VALUES ('88', null, null, null, null, null, null, 'KH201014105044', null, 'CHỊ XUYẾN', null, null, '7');
INSERT INTO `customer` VALUES ('89', null, null, null, null, null, null, 'KH201015155901', null, 'TRUNG TÍNH', null, null, '11');
INSERT INTO `customer` VALUES ('90', null, null, null, null, null, null, 'KH201023105459', null, 'CHẢ LỤA KIM NGÂN', null, null, '12');
INSERT INTO `customer` VALUES ('91', null, null, null, null, null, null, 'KH201110223132', null, 'XÃ THẠNH TRỊ (CHÚ THANH)', null, null, '7');
INSERT INTO `customer` VALUES ('92', null, null, null, null, null, null, 'KH201116221806', null, 'MN TT VĨNH THẠNH', null, null, '7');
INSERT INTO `customer` VALUES ('93', null, null, null, null, null, null, 'KH201204234000', null, 'TH VĨNH BÌNH 2', null, null, '7');
INSERT INTO `customer` VALUES ('96', 'admin', '2021-01-08 14:11:48', null, 'admin', '2021-01-08 14:11:48', 'Zalo Minh Nhật', 'KH0091-21108021148', '', 'QC GIA PHÁT', '0836692626', null, '2');

-- ----------------------------
-- Table structure for customertype
-- ----------------------------
DROP TABLE IF EXISTS `customertype`;
CREATE TABLE `customertype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customertype
-- ----------------------------
INSERT INTO `customertype` VALUES ('1', null, null, null, 'admin', '2021-01-01 10:52:25', 'dac-biet', 'Đặc biệt (23-27-50-70-90)');
INSERT INTO `customertype` VALUES ('2', null, null, null, 'admin', '2020-12-31 23:50:27', 'vip-23-33', 'VIP 3 (23-33-45-65-70-90)');
INSERT INTO `customertype` VALUES ('3', null, null, null, 'admin', '2020-12-31 23:50:09', 'vip-23', 'VIP 2 (23-30-45-60-70-80)');
INSERT INTO `customertype` VALUES ('4', null, null, null, 'admin', '2020-12-31 23:49:58', 'vip-20', 'VIP 1 (20-25-30-45-60-70-90)');
INSERT INTO `customertype` VALUES ('5', null, null, null, 'admin', '2021-01-01 00:25:45', 'vip-27', 'Thân thiết 1 (27-37-50-70-90)');
INSERT INTO `customertype` VALUES ('6', null, null, null, 'admin', '2020-12-31 23:58:51', 'than-thiet', 'Thân thiết 2 (30-40-50-70-90)');
INSERT INTO `customertype` VALUES ('7', null, null, null, null, null, 'khach-le', 'Khách lẻ');
INSERT INTO `customertype` VALUES ('8', null, null, null, null, null, 'trai-hom', 'Trại hòm');
INSERT INTO `customertype` VALUES ('9', null, null, null, null, null, 'than-thiet-25', 'Thân thiết 25');
INSERT INTO `customertype` VALUES ('10', null, null, null, null, null, 'lua-giong', 'Lúa giống');
INSERT INTO `customertype` VALUES ('11', null, null, null, null, null, 'vo-lai', 'VỎ LÃI');
INSERT INTO `customertype` VALUES ('12', null, null, null, null, null, 'cha-lua', 'Chả lụa');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', null, null, null, null, null, 'bang-ron', 'BĂNG RÔN');
INSERT INTO `item` VALUES ('2', null, null, null, null, null, 'bang-hieu', 'BẢNG HIỆU');
INSERT INTO `item` VALUES ('3', null, null, null, null, null, 'bang-hieu-bat-day', 'BẢNG HIỆU BẠT DÀY');
INSERT INTO `item` VALUES ('4', null, null, null, null, null, 'decal', 'DECAL');
INSERT INTO `item` VALUES ('5', null, null, null, null, null, 'decal-be', 'DECAL BẾ');
INSERT INTO `item` VALUES ('6', null, null, null, null, null, 'decal-can-bong', 'DECAL CÁN BÓNG');
INSERT INTO `item` VALUES ('7', null, null, null, null, null, 'decal-can-bong-be', 'DECAL CÁN BÓNG BẾ');
INSERT INTO `item` VALUES ('8', null, null, null, null, null, 'decal-trong', 'DECAL TRONG');
INSERT INTO `item` VALUES ('9', null, null, null, null, null, 'decal-trong-be', 'DECAL TRONG BẾ');
INSERT INTO `item` VALUES ('10', null, null, null, null, null, 'decal-trong-can-bong', 'DECAL TRONG CÁN BÓNG');
INSERT INTO `item` VALUES ('11', null, null, null, null, null, 'decal-trong-can-bong-be', 'DECAL TRONG CÁN BÓNG BẾ');
INSERT INTO `item` VALUES ('12', null, null, null, null, null, 'decal-trong-can-trang', 'DECAL TRONG CÁN TRẮNG');
INSERT INTO `item` VALUES ('13', null, null, null, null, null, 'pp', 'PP');
INSERT INTO `item` VALUES ('14', null, null, null, null, null, 'pp-can-bong', 'PP CÁN BÓNG');
INSERT INTO `item` VALUES ('15', null, null, null, null, null, 'bat-trang', 'BẠT TRẮNG');
INSERT INTO `item` VALUES ('16', null, null, null, null, null, 'decal-trang', 'DECAL TRẮNG');
INSERT INTO `item` VALUES ('17', null, null, null, null, null, 'mang-bong', 'MÀNG BÓNG');
INSERT INTO `item` VALUES ('18', null, null, null, null, null, 'cat-decal', 'CẮT DECAL');
INSERT INTO `item` VALUES ('19', null, null, null, null, null, 'bat-xam', 'BẠT XÁM');
INSERT INTO `item` VALUES ('20', null, null, null, null, null, 'bat-mai-che', 'BẠT MÁI CHE');
INSERT INTO `item` VALUES ('21', null, null, null, null, null, 'decal-thanh-gia', 'DECAL THÁNH GIÁ');
INSERT INTO `item` VALUES ('22', null, null, null, null, null, '1-hop-card', '1 HỘP CARD');
INSERT INTO `item` VALUES ('23', null, null, null, null, null, '2-hop-card', '2 HỘP CARD');
INSERT INTO `item` VALUES ('24', null, null, null, null, null, '5-hop-card', '5 HỘP CARD');
INSERT INTO `item` VALUES ('25', null, null, null, null, null, 'bang-hieu-in-may-nho', 'BẢNG HIỆU IN MÁY NHỎ');
INSERT INTO `item` VALUES ('26', null, null, null, null, null, 'decal-can-bong-tot', 'DECAL CÁN BÓNG TỐT');
INSERT INTO `item` VALUES ('27', null, null, null, null, null, 'tem-lon', 'TEM LỚN');
INSERT INTO `item` VALUES ('28', null, null, null, null, null, 'tem-nho', 'TEM NHỎ');
INSERT INTO `item` VALUES ('29', null, null, null, null, null, 'nhan-offset', 'NHÃN OFFSET');
INSERT INTO `item` VALUES ('30', null, null, null, null, null, 'in-vai-silk', 'IN VẢI SILK');
INSERT INTO `item` VALUES ('31', null, null, null, null, null, 'cat-decal-can-bong', 'CẮT DECAL CÁN BÓNG');
INSERT INTO `item` VALUES ('32', null, null, null, null, null, '5-cuon-hoa-don', '5 CUỐN HÓA ĐƠN');
INSERT INTO `item` VALUES ('33', null, null, null, null, null, 'cat-decal-gia-cong', 'CẮT DECAL GIA CÔNG');
INSERT INTO `item` VALUES ('34', null, null, null, null, null, 'rua-hinh', 'RỬA HÌNH');
INSERT INTO `item` VALUES ('35', 'admin', '2021-01-03 17:39:21', null, 'admin', '2021-01-03 17:39:21', '', 'phát tín');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('1', null, null, null, null, null, 'muc-vang-eco-singapore', 'Mực vàng ECO Singapore', '1', '1');
INSERT INTO `material` VALUES ('2', null, null, null, null, null, 'mang-bong-tot-1-27m-x-50m', 'Màng bóng tốt 1.27m x 50m', '1.27', '50');
INSERT INTO `material` VALUES ('3', null, null, null, null, null, 'decal-de-den-1-52m-x-50m', 'Decal đế đen 1.52m x 50m', '1.52', '50');
INSERT INTO `material` VALUES ('4', null, null, null, null, null, 'mang-bong-1-27m-x-50m', 'Màng bóng 1.27m x 50m', '1.27', '50');
INSERT INTO `material` VALUES ('5', null, null, null, null, null, 'giay-lot-dau-phun', 'Giấy lót đầu phun', '0', '0');
INSERT INTO `material` VALUES ('6', null, null, null, null, null, 'mang-bong-1-07m-x-50m', 'Màng bóng 1.07m x 50m', '1.07', '50');
INSERT INTO `material` VALUES ('7', null, null, null, null, null, 'decal-de-den-1-27m-x-50m', 'Decal đế đen 1.27m x 50m', '1.27', '50');
INSERT INTO `material` VALUES ('8', null, null, null, null, null, 'decal-trang-1-27m-x-50m', 'Decal trắng 1.27m x 50m', '1.27', '50');
INSERT INTO `material` VALUES ('9', null, null, null, null, null, 'decal-trong-1-52m-x-50m', 'Decal trong 1.52m x 50m', '1.52', '50');
INSERT INTO `material` VALUES ('10', null, null, null, null, null, 'bat-thuong-3-2m-x-80m', 'Bạt thường 3.2m x 80m', '3.2', '80');
INSERT INTO `material` VALUES ('11', null, null, null, null, null, 'bat-xam-3-2m-x-70m', 'Bạt xám 3.2m x 70m', '3.2', '70');
INSERT INTO `material` VALUES ('12', null, null, null, null, null, 'bat-thuong-3-0m-x-80m', 'Bạt thường 3.0m x 80m', '3', '80');
INSERT INTO `material` VALUES ('13', null, null, null, null, null, 'bat-thuong-2-8m-x-80m', 'Bạt thường 2.8m x 80m', '2.8', '80');
INSERT INTO `material` VALUES ('14', null, null, null, null, null, 'bat-thuong-2-6m-x-80m', 'Bạt thường 2.6m x 80m', '2.6', '80');
INSERT INTO `material` VALUES ('15', null, null, null, null, null, 'bat-day-3-2m-x-80m', 'Bạt dày 3.2m x 80m', '3.2', '80');
INSERT INTO `material` VALUES ('16', null, null, null, null, null, 'bat-thuong-2-2m-x-80m', 'Bạt thường 2.2m x 80m', '2.2', '80');
INSERT INTO `material` VALUES ('17', null, null, null, null, null, 'bat-day-3-2m-x-70m', 'Bạt dày 3.2m x 70m', '3.2', '70');
INSERT INTO `material` VALUES ('18', null, null, null, null, null, 'mang-bong-tot-1-52m-x-50m', 'Màng bóng tốt 1.52m x 50m', '1.52', '50');
INSERT INTO `material` VALUES ('19', null, null, null, null, null, 'muc-xanh-sk9', 'Mực xanh SK9', '1', '1');
INSERT INTO `material` VALUES ('20', null, null, null, null, null, 'muc-xanh-eco-singapore', 'Mực xanh ECO Singapore', '1', '1');
INSERT INTO `material` VALUES ('21', null, null, null, null, null, 'muc-den-eco-singapore', 'Mực đen ECO Singapore', '1', '1');
INSERT INTO `material` VALUES ('22', null, null, null, null, null, 'mang-bong-1-52m-x-50m', 'Màng bóng 1.52m x 50m', '1.52', '50');
INSERT INTO `material` VALUES ('23', null, null, null, null, null, 'decal-de-den-1-07m-x-50m', 'Decal đế đen 1.07m x 50m', '1.07', '50');
INSERT INTO `material` VALUES ('24', null, null, null, null, null, 'decal-trang-1-52m-x-50m', 'Decal trắng 1.52m x 50m', '1.52', '50');
INSERT INTO `material` VALUES ('25', null, null, null, null, null, 'decal-trang-1-07m-x-50m', 'Decal trắng 1.07m x 50m', '1.07', '50');
INSERT INTO `material` VALUES ('26', null, null, null, null, null, 'decal-trong-1-27m-x-50m', 'Decal trong 1.27m x 50m', '1.27', '50');
INSERT INTO `material` VALUES ('27', null, null, null, null, null, 'decal-trong-1-07m-x-50m', 'Decal trong 1.07m x 50m', '1.07', '50');
INSERT INTO `material` VALUES ('28', null, null, null, null, null, 'bat-xam-3-2m-x-80m', 'Bạt xám 3.2m x 80m', '3.2', '80');
INSERT INTO `material` VALUES ('29', null, null, null, null, null, 'muc-vang-sk9', 'Mực vàng SK9', '1', '1');
INSERT INTO `material` VALUES ('30', null, null, null, null, null, 'nuoc-rua-may-lon', 'Nước rửa máy lớn', '1', '1');
INSERT INTO `material` VALUES ('31', null, null, null, null, null, 'muc-do-sk7', 'Mực đỏ SK7', '1', '1');
INSERT INTO `material` VALUES ('32', null, null, null, null, null, 'muc-do-eco-singapore', 'Mực đỏ ECO Singapore', '1', '1');
INSERT INTO `material` VALUES ('33', null, null, null, null, null, 'muc-den-sk7', 'Mực đen SK7', '1', '1');
INSERT INTO `material` VALUES ('34', null, null, null, null, null, 'que-chui-dau-phun', 'Que chùi đầu phun', '1', '1');
INSERT INTO `material` VALUES ('35', null, null, null, null, null, 'nuoc-rua-may-nho', 'Nước rửa máy nhỏ', '1', '1');
INSERT INTO `material` VALUES ('36', null, null, null, null, null, 'vat', 'VAT', '1', '1');
INSERT INTO `material` VALUES ('37', null, null, null, null, null, 'pp-1-27m-x-50m', 'PP 1.27m x 50m', '1.27', '50');
INSERT INTO `material` VALUES ('38', null, null, null, null, null, 'pp-1-07m-x-50m', 'PP 1.07m x 50m', '1.07', '50');
INSERT INTO `material` VALUES ('39', null, null, null, null, null, 'pp-0-914m-x-50m', 'PP 0.914m x 50m', '0.914', '50');
INSERT INTO `material` VALUES ('40', null, null, null, null, null, 'may-can-mang', 'Máy cán màng', '1', '1');
INSERT INTO `material` VALUES ('41', null, null, null, null, null, 'bat-mai-che-han-quoc', 'Bạt mái che Hàn Quốc', '1.52', '80');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `area` float DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `debt` bigint DEFAULT NULL,
  `height` float DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `paid` bigint DEFAULT NULL,
  `paymentdate` datetime DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `width` float DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_astys1dv61mdlp0n0wx0574r2` (`customer_id`),
  KEY `FK_rg95ddumc8608v80pqy2m43h0` (`item_id`),
  CONSTRAINT `FK_astys1dv61mdlp0n0wx0574r2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_rg95ddumc8608v80pqy2m43h0` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=317 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('29', 'anonymousUser', '2021-01-01 10:32:56', '01/1/2021 10:32:56 Don hang duoc tao.&#13;21-1-01 10:35:05 Thanh toan xong.&#13;', 'admin', '2021-01-01 10:35:06', '0.95', 'DH0028-21101103256', 'A VINH + KHÁCH', '0', '0.86', '2021-01-01 10:32:56', '57000', '2021-01-01 10:35:06', '60000', '2', 'paid', '57000', '0.55', '35', '4');
INSERT INTO `orders` VALUES ('30', 'anonymousUser', '2021-01-01 10:33:52', '01/1/2021 10:33:52 Don hang duoc tao.&#13;21-1-01 10:35:05 Thanh toan xong.&#13;', 'admin', '2021-01-01 10:35:06', '1.46', 'DH0029-21101103352', 'ĐỨC HẠNH', '0', '1.21', '2021-01-01 10:33:52', '87600', '2021-01-01 10:35:05', '60000', '1', 'paid', '87600', '1.21', '35', '4');
INSERT INTO `orders` VALUES ('31', 'anonymousUser', '2021-01-01 10:34:09', '01/1/2021 10:34:08 Don hang duoc tao.&#13;21-1-01 10:35:05 Thanh toan xong.&#13;', 'admin', '2021-01-01 10:35:05', '0.95', 'DH0030-21101103408', 'A CƯỜNG', '0', '0.86', '2021-01-01 10:34:08', '57000', '2021-01-01 10:35:05', '60000', '2', 'paid', '57000', '0.55', '35', '4');
INSERT INTO `orders` VALUES ('32', 'anonymousUser', '2021-01-01 10:34:24', '01/1/2021 10:34:23 Don hang duoc tao.&#13;21-1-03 12:21:05 Thanh toan xong.&#13;', 'admin', '2021-01-03 12:21:06', '0.34', 'DH0031-21101103423', 'TRÍ SÁNG', '0', '0.58', '2021-01-01 10:34:23', '20400', '2021-01-03 12:21:06', '60000', '1', 'paid', '20400', '0.58', '35', '4');
INSERT INTO `orders` VALUES ('33', 'anonymousUser', '2021-01-01 11:05:56', '01/1/2021 11:05:55 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-01 11:05:56', '833', 'DH0032-21101110555', 'POSTER LACASOTO', '22491000', '1.7', '2020-12-26 11:05:55', '0', null, '27000', '700', 'unpaid', '22491000', '0.7', '17', '3');
INSERT INTO `orders` VALUES ('34', 'anonymousUser', '2021-01-01 11:44:21', '01/1/2021 11:44:21 Don hang duoc tao.&#13;', 'admin', '2021-01-02 07:41:47', '2.51', 'DH0033-21101114421', 'YUMY', '150600', '0.3', '2021-01-01 11:44:21', '0', null, '60000', '93', 'unpaid', '150600', '0.09', '35', '4');
INSERT INTO `orders` VALUES ('49', 'anonymousUser', '2021-01-02 10:22:12', '02/1/2021 10:22:11 Don hang duoc tao.&#13;21-1-02 10:24:29 Thanh toan xong.&#13;', 'admin', '2021-01-02 10:24:30', '1.47', 'DH006-21102102211', 'THẦY DU', '0', '0.7', '2021-01-02 10:22:12', '117600', '2021-01-02 10:24:30', '80000', '2', 'paid', '117600', '1.05', '35', '6');
INSERT INTO `orders` VALUES ('50', 'anonymousUser', '2021-01-02 10:22:23', '02/1/2021 10:22:22 Don hang duoc tao.&#13;21-1-02 10:24:29 Thanh toan xong.&#13;', 'admin', '2021-01-02 10:24:30', '0.24', 'DH007-21102102222', 'THẦY DU', '0', '0.4', '2021-01-02 10:22:22', '19200', '2021-01-02 10:24:30', '80000', '1', 'paid', '19200', '0.6', '35', '6');
INSERT INTO `orders` VALUES ('51', 'anonymousUser', '2021-01-02 10:22:38', '02/1/2021 10:22:38 Don hang duoc tao.&#13;21-1-03 12:18:48 Thanh toan xong.&#13;', 'admin', '2021-01-03 12:18:49', '2', 'DH008-21102102238', 'BIA LẠNH HỒNG YẾN', '0', '0.4', '2021-01-02 10:22:38', '120000', '2021-01-03 12:18:49', '60000', '20', 'paid', '120000', '0.25', '35', '4');
INSERT INTO `orders` VALUES ('52', 'anonymousUser', '2021-01-02 12:03:09', '02/1/2021 12:03:08 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:03:09', '101.5', 'DH009-21102120308', 'ELBON', '3045000', '14.5', '2021-01-02 12:03:08', '0', null, '30000', '1', 'unpaid', '3045000', '7', '48', '3');
INSERT INTO `orders` VALUES ('53', 'anonymousUser', '2021-01-02 12:04:15', '02/1/2021 12:04:15 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:04:15', '1.5', 'DH0010-21102120415', 'ÔNG ĐAMINH GX THÁNH GIUSE', '60000', '2.5', '2021-01-02 12:04:15', '0', null, '40000', '1', 'unpaid', '60000', '0.6', '73', '2');
INSERT INTO `orders` VALUES ('54', 'anonymousUser', '2021-01-02 12:04:31', '02/1/2021 12:04:31 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:04:31', '2.4', 'DH0011-21102120431', 'TANG LỄ+XIN CẦU CHO LH', '96000', '3', '2021-01-02 12:04:31', '0', null, '40000', '2', 'unpaid', '96000', '0.4', '73', '2');
INSERT INTO `orders` VALUES ('55', 'anonymousUser', '2021-01-02 12:04:47', '02/1/2021 12:04:46 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:04:47', '1.92', 'DH0012-21102120446', 'CÁO PHÓ+ CẦU NGUYỆN', '76800', '1.2', '2021-01-02 12:04:47', '0', null, '40000', '2', 'unpaid', '76800', '0.8', '73', '2');
INSERT INTO `orders` VALUES ('56', 'anonymousUser', '2021-01-02 12:05:01', '02/1/2021 12:05:00 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:05:01', '0.96', 'DH0013-21102120500', 'TẤM TRƯỚNG KHU', '38400', '0.8', '2021-01-02 12:05:00', '0', null, '40000', '1', 'unpaid', '38400', '1.2', '73', '2');
INSERT INTO `orders` VALUES ('57', 'anonymousUser', '2021-01-02 12:08:09', '02/1/2021 12:08:08 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:08:09', '6.72', 'DH0014-21102120808', 'CÁO PHÓ IN SẴN', '268800', '0.8', '2021-01-02 12:08:08', '0', null, '40000', '7', 'unpaid', '268800', '1.2', '81', '2');
INSERT INTO `orders` VALUES ('58', 'anonymousUser', '2021-01-02 12:08:41', '02/1/2021 12:08:40 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:08:41', '1.17', 'DH0015-21102120840', 'TÊN THÁNH', '70200', '1.16', '2021-01-02 12:08:40', '0', null, '60000', '1', 'unpaid', '70200', '1.01', '81', '4');
INSERT INTO `orders` VALUES ('59', 'anonymousUser', '2021-01-02 12:09:47', '02/1/2021 12:09:47 Don hang duoc tao.&#13;21-1-04 06:23:04 Thanh toan xong.&#13;', 'admin', '2021-01-04 18:23:04', '12', 'DH0016-21102120947', 'PHÔNG SÂN KHẤU', '0', '4', '2021-01-02 12:09:47', '276000', '2021-01-04 18:23:04', '23000', '1', 'paid', '276000', '3', '15', '2');
INSERT INTO `orders` VALUES ('60', 'anonymousUser', '2021-01-02 12:10:30', '02/1/2021 12:10:29 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:10:30', '0.79', 'DH0017-21102121029', 'NHÀ NGUYỆN', '55300', '0.89', '2021-01-02 12:10:30', '0', null, '70000', '1', 'unpaid', '55300', '0.89', '22', '6');
INSERT INTO `orders` VALUES ('61', 'anonymousUser', '2021-01-02 12:10:52', '02/1/2021 12:10:51 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:10:52', '0.6', 'DH0018-21102121051', 'DU LỊCH TUẤN HƯNG', '16200', '0.4', '2021-01-02 12:10:51', '0', null, '27000', '5', 'unpaid', '16200', '0.3', '22', '2');
INSERT INTO `orders` VALUES ('62', 'anonymousUser', '2021-01-02 12:11:20', '02/1/2021 12:11:20 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 12:11:20', '0.54', 'DH0019-21102121120', 'DU LỊCH THÀNH CÔNG', '37800', '0.6', '2021-01-02 12:11:20', '0', null, '70000', '2', 'unpaid', '37800', '0.45', '22', '6');
INSERT INTO `orders` VALUES ('63', 'anonymousUser', '2021-01-02 12:11:55', '02/1/2021 12:11:54 Don hang duoc tao.&#13;21-1-02 01:16:21 Thanh toan xong.&#13;', 'admin', '2021-01-02 13:16:22', '2', 'DH0020-21102121154', 'LOGO NĂM THÁNH GH KITO VUA', '0', '1', '2021-01-02 12:11:54', '70000', '2021-01-02 13:16:22', '35000', '2', 'paid', '70000', '1', '35', '2');
INSERT INTO `orders` VALUES ('64', 'anonymousUser', '2021-01-02 12:13:24', '02/1/2021 12:13:24 Don hang duoc tao.&#13;21-1-02 05:04:08 Thanh toan xong.&#13;', 'admin', '2021-01-02 17:04:08', '3', 'DH0021-21102121324', 'THCS & THPT THẠNH TÂY', '0', '2', '2021-01-02 12:13:24', '105000', '2021-01-02 17:04:08', '35000', '1', 'paid', '105000', '1.5', '35', '2');
INSERT INTO `orders` VALUES ('65', 'anonymousUser', '2021-01-02 12:13:51', '02/1/2021 12:13:51 Don hang duoc tao.&#13;21-1-02 01:16:21 Thanh toan xong.&#13;', 'admin', '2021-01-02 13:16:21', '3.89', 'DH0022-21102121351', 'TẤM TRƯỚNG E2', '0', '1.9', '2021-01-02 12:13:51', '136150', '2021-01-02 13:16:21', '35000', '1', 'paid', '136150', '2.05', '35', '2');
INSERT INTO `orders` VALUES ('66', 'anonymousUser', '2021-01-02 12:14:30', '02/1/2021 12:14:29 Don hang duoc tao.&#13;21-1-02 01:16:21 Thanh toan xong.&#13;', 'admin', '2021-01-02 13:16:21', '1.91', 'DH0023-21102121429', 'DỊCH VỤ DU LỊCH', '0', '0.6', '2021-01-02 12:14:29', '85950', '2021-01-02 13:16:21', '45000', '2', 'paid', '85950', '1.59', '37', '4');
INSERT INTO `orders` VALUES ('67', 'anonymousUser', '2021-01-02 14:06:24', '02/1/2021 14:06:24 Don hang duoc tao.&#13;21-1-02 03:09:47 Thanh toan xong.&#13;', 'admin', '2021-01-02 15:09:48', '6', 'DH0024-21102020624', 'THANH BÌNH FC', '0', '3', '2021-01-02 14:06:24', '210000', '2021-01-02 15:09:48', '35000', '2', 'paid', '210000', '1', '35', '1');
INSERT INTO `orders` VALUES ('69', 'anonymousUser', '2021-01-02 14:10:24', '02/1/2021 14:10:23 Don hang duoc tao.&#13;21-1-07 05:30:13 Thanh toan xong.&#13;', 'admin', '2021-01-07 17:30:13', '0.4', 'DH0026-21102021023', 'HOA', '0', '0.38', '2021-01-02 14:10:24', '32000', '2021-01-07 17:30:13', '80000', '2', 'paid', '32000', '0.52', '85', '12');
INSERT INTO `orders` VALUES ('70', 'anonymousUser', '2021-01-02 14:36:12', '02/1/2021 14:36:12 Don hang duoc tao.&#13;21-1-02 03:09:47 Thanh toan xong.&#13;', 'admin', '2021-01-02 15:09:48', '1.92', 'DH0027-21102023612', 'BÓNG ĐÁ THANH BÌNH', '0', '0.8', '2021-01-02 14:36:12', '67200', '2021-01-02 15:09:48', '35000', '2', 'paid', '67200', '1.2', '35', '1');
INSERT INTO `orders` VALUES ('71', 'anonymousUser', '2021-01-02 14:54:02', '02/1/2021 14:54:01 Don hang duoc tao.&#13;21-1-07 05:30:13 Thanh toan xong.&#13;', 'admin', '2021-01-07 17:30:13', '0.56', 'DH0028-21102025401', 'HOA', '0', '0.91', '2021-01-02 14:54:01', '44800', '2021-01-07 17:30:13', '80000', '1', 'paid', '44800', '0.61', '85', '12');
INSERT INTO `orders` VALUES ('72', 'anonymousUser', '2021-01-02 14:54:24', '02/1/2021 14:54:24 Don hang duoc tao.&#13;21-1-07 05:30:13 Thanh toan xong.&#13;', 'admin', '2021-01-07 17:30:13', '0.34', 'DH0029-21102025424', 'HOA', '0', '0.33', '2021-01-02 14:54:24', '27200', '2021-01-07 17:30:13', '80000', '2', 'paid', '27200', '0.52', '85', '12');
INSERT INTO `orders` VALUES ('73', 'anonymousUser', '2021-01-02 15:11:43', '02/1/2021 15:11:43 Don hang duoc tao.&#13;21-1-05 05:04:15 Thanh toan xong.&#13;', 'admin', '2021-01-05 17:04:16', '1.44', 'DH0030-21102031143', 'ĐIỆN TỬ TRƯỜNG GIANG', '0', '1.6', '2021-01-02 15:11:43', '50400', '2021-01-05 17:04:16', '35000', '1', 'paid', '50400', '0.9', '35', '2');
INSERT INTO `orders` VALUES ('74', 'anonymousUser', '2021-01-02 15:11:53', '02/1/2021 15:11:53 Don hang duoc tao.&#13;21-1-05 05:04:15 Thanh toan xong.&#13;', 'admin', '2021-01-05 17:04:16', '1.92', 'DH0031-21102031153', 'ĐIỆN TỬ TRƯỜNG GIANG', '0', '0.8', '2021-01-02 15:11:53', '67200', '2021-01-05 17:04:16', '35000', '2', 'paid', '67200', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('75', 'anonymousUser', '2021-01-02 15:12:04', '02/1/2021 15:12:04 Don hang duoc tao.&#13;21-1-05 05:04:15 Thanh toan xong.&#13;', 'admin', '2021-01-05 17:04:16', '3.5', 'DH0032-21102031204', 'ĐIỆN TỬ TRƯỜNG GIANG', '0', '7', '2021-01-02 15:12:04', '122500', '2021-01-05 17:04:15', '35000', '1', 'paid', '122500', '0.5', '35', '2');
INSERT INTO `orders` VALUES ('76', 'anonymousUser', '2021-01-02 15:12:17', '02/1/2021 15:12:16 Don hang duoc tao.&#13;21-1-05 05:04:15 Thanh toan xong.&#13;', 'admin', '2021-01-05 17:04:15', '0.96', 'DH0033-21102031216', 'ĐIỆN TỬ TRƯỜNG GIANG', '0', '0.6', '2021-01-02 15:12:16', '57600', '2021-01-05 17:04:15', '60000', '2', 'paid', '57600', '0.8', '35', '4');
INSERT INTO `orders` VALUES ('77', 'anonymousUser', '2021-01-02 15:56:20', '02/1/2021 15:56:20 Don hang duoc tao.&#13;21-1-02 05:03:52 Thanh toan xong.&#13;', 'admin', '2021-01-02 17:03:53', '4', 'DH0034-21102035620', 'CƠM TẤM SƯỜN NƯỚNG', '0', '4', '2021-01-02 15:56:20', '140000', '2021-01-02 17:03:52', '35000', '1', 'paid', '140000', '1', '35', '2');
INSERT INTO `orders` VALUES ('78', 'anonymousUser', '2021-01-02 15:56:40', '02/1/2021 15:56:40 Don hang duoc tao.&#13;21-1-02 05:03:52 Thanh toan xong.&#13;', 'admin', '2021-01-02 17:03:52', '0.86', 'DH0035-21102035640', 'CƠM', '0', '1.36', '2021-01-02 15:56:40', '30100', '2021-01-02 17:03:52', '35000', '1', 'paid', '30100', '0.63', '35', '2');
INSERT INTO `orders` VALUES ('79', 'anonymousUser', '2021-01-02 16:12:30', '02/1/2021 16:12:29 Don hang duoc tao.&#13;21-1-04 06:23:04 Thanh toan xong.&#13;', 'admin', '2021-01-04 18:23:04', '12', 'DH0036-21102041229', 'MỪNG 50 NĂM TÁC VỤ LM', '0', '4', '2021-01-02 16:12:29', '276000', '2021-01-04 18:23:04', '23000', '1', 'paid', '276000', '3', '15', '2');
INSERT INTO `orders` VALUES ('80', 'anonymousUser', '2021-01-02 17:11:37', '02/1/2021 17:11:37 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-02 17:11:37', '0.96', 'DH0037-21102051137', 'HỚT TÓC VĂN HỮU', '57600', '0.6', '2021-01-02 17:11:37', '0', null, '60000', '2', 'unpaid', '57600', '0.8', '48', '6');
INSERT INTO `orders` VALUES ('81', 'anonymousUser', '2021-01-03 09:14:02', '03/1/2021 09:14:02 Don hang duoc tao.&#13;21-1-03 09:54:25 Thanh toan xong.&#13;', 'admin', '2021-01-03 09:54:26', '1.8', 'DH0038-21103091402', 'SÔ 60+80', '0', '1.2', '2021-01-03 09:14:02', '126000', '2021-01-03 09:54:26', '70000', '1', 'paid', '126000', '1.5', '88', '18');
INSERT INTO `orders` VALUES ('82', 'anonymousUser', '2021-01-03 09:15:08', '03/1/2021 09:15:07 Don hang duoc tao.&#13;21-1-03 09:54:25 Thanh toan xong.&#13;', 'admin', '2021-01-03 09:54:26', '2.04', 'DH0039-21103091507', 'SÔ 3,0', '0', '1.7', '2021-01-03 09:15:08', '142800', '2021-01-03 09:54:26', '70000', '1', 'paid', '142800', '1.2', '88', '18');
INSERT INTO `orders` VALUES ('83', 'anonymousUser', '2021-01-03 09:15:39', '03/1/2021 09:15:39 Don hang duoc tao.&#13;21-1-03 09:54:25 Thanh toan xong.&#13;', 'admin', '2021-01-03 09:54:26', '1.68', 'DH0040-21103091539', 'SỐ 2,5', '0', '1.4', '2021-01-03 09:15:39', '117600', '2021-01-03 09:54:26', '70000', '1', 'paid', '117600', '1.2', '88', '18');
INSERT INTO `orders` VALUES ('84', 'anonymousUser', '2021-01-03 09:16:09', '03/1/2021 09:16:09 Don hang duoc tao.&#13;21-1-03 09:54:25 Thanh toan xong.&#13;', 'admin', '2021-01-03 09:54:26', '2.04', 'DH0041-21103091609', 'SỐ 3,5+2,6+3,8+3,1', '0', '1.7', '2021-01-03 09:16:09', '142800', '2021-01-03 09:54:26', '70000', '1', 'paid', '142800', '1.2', '88', '18');
INSERT INTO `orders` VALUES ('85', 'anonymousUser', '2021-01-03 09:58:00', '03/1/2021 09:57:59 Don hang duoc tao.&#13;21-1-03 12:19:20 Thanh toan xong.&#13;', 'admin', '2021-01-03 12:19:20', '0.24', 'DH0042-21103095759', 'CHO THUÊ NHÀ', '0', '0.6', '2021-01-03 09:57:59', '14400', '2021-01-03 12:19:20', '60000', '1', 'paid', '14400', '0.4', '11', '4');
INSERT INTO `orders` VALUES ('86', 'anonymousUser', '2021-01-03 12:14:42', '03/1/2021 12:14:42 Don hang duoc tao.&#13;21-1-03 12:19:20 Thanh toan xong.&#13;', 'admin', '2021-01-03 12:19:20', '0.12', 'DH0043-21103121442', 'HOA HƯỚNG DƯƠNG', '0', '0.6', '2021-01-03 12:14:42', '7200', '2021-01-03 12:19:20', '60000', '1', 'paid', '7200', '0.2', '35', '4');
INSERT INTO `orders` VALUES ('87', 'anonymousUser', '2021-01-03 12:15:08', '03/1/2021 12:15:07 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-03 12:15:08', '1.75', 'DH0044-21103121507', 'BÀ TÊRÊSA MARIA GX HẢI HƯNG', '70000', '2.5', '2021-01-03 12:15:07', '0', null, '40000', '1', 'unpaid', '70000', '0.7', '24', '2');
INSERT INTO `orders` VALUES ('88', 'anonymousUser', '2021-01-03 12:15:25', '03/1/2021 12:15:24 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-03 12:15:25', '3', 'DH0045-21103121524', 'TANG LỄ+BĂNG RÔN', '120000', '3', '2021-01-03 12:15:24', '0', null, '40000', '2', 'unpaid', '120000', '0.5', '24', '2');
INSERT INTO `orders` VALUES ('89', 'anonymousUser', '2021-01-03 12:16:05', '03/1/2021 12:16:04 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-03 12:16:05', '2.88', 'DH0046-21103121604', 'CÁO PHÓ+CN+TX', '115200', '0.8', '2021-01-03 12:16:04', '0', null, '40000', '3', 'unpaid', '115200', '1.2', '24', '2');
INSERT INTO `orders` VALUES ('90', 'anonymousUser', '2021-01-03 12:16:19', '03/1/2021 12:16:19 Don hang duoc tao.&#13;21-1-03 12:19:20 Thanh toan xong.&#13;', 'admin', '2021-01-03 12:19:20', '0.1', 'DH0047-21103121619', 'BÁN ĐẤT', '0', '0.4', '2021-01-03 12:16:19', '6000', '2021-01-03 12:19:20', '60000', '1', 'paid', '6000', '0.25', '35', '4');
INSERT INTO `orders` VALUES ('91', 'anonymousUser', '2021-01-03 12:16:49', '03/1/2021 12:16:48 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-03 12:16:49', '1.5', 'DH0048-21103121648', 'HIÊRÔNIMÔ GX TRINH VƯƠNG', '60000', '2.5', '2021-01-03 12:16:48', '0', null, '40000', '1', 'unpaid', '60000', '0.6', '33', '2');
INSERT INTO `orders` VALUES ('92', 'anonymousUser', '2021-01-03 12:17:11', '03/1/2021 12:17:10 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-03 12:17:11', '3', 'DH0049-21103121710', 'TANG LỄ+BĂNG RÔN', '120000', '3', '2021-01-03 12:17:10', '0', null, '40000', '2', 'unpaid', '120000', '0.5', '33', '2');
INSERT INTO `orders` VALUES ('93', 'anonymousUser', '2021-01-03 12:17:22', '03/1/2021 12:17:22 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-03 12:17:22', '0.68', 'DH0050-21103121722', 'CÁO PHÓ', '27200', '0.63', '2021-01-03 12:17:22', '0', null, '40000', '1', 'unpaid', '27200', '1.08', '33', '2');
INSERT INTO `orders` VALUES ('94', 'anonymousUser', '2021-01-03 12:17:36', '03/1/2021 12:17:36 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-03 12:17:36', '0.96', 'DH0051-21103121736', 'CHÚA THƯƠNG XÓT', '38400', '0.8', '2021-01-03 12:17:36', '0', null, '40000', '1', 'unpaid', '38400', '1.2', '33', '2');
INSERT INTO `orders` VALUES ('96', 'anonymousUser', '2021-01-03 12:35:54', '03/1/2021 12:35:53 Don hang duoc tao.&#13;21-1-05 09:45:11 Thanh toan xong.&#13;', 'admin', '2021-01-05 09:45:11', '1.48', 'DH0051-21103123553', 'XE HUY HÙNG', '0', '1.21', '2021-01-03 12:35:53', '118400', '2021-01-05 09:45:11', '80000', '1', 'paid', '118400', '1.22', '35', '6');
INSERT INTO `orders` VALUES ('97', 'anonymousUser', '2021-01-04 07:44:54', '04/1/2021 07:44:53 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 07:44:54', '0.1', 'DH0052-21104074453', 'BÁN ĐẤT', '5000', '0.4', '2021-01-03 07:44:54', '0', null, '50000', '1', 'unpaid', '5000', '0.25', '19', '4');
INSERT INTO `orders` VALUES ('98', 'anonymousUser', '2021-01-04 07:46:07', '04/1/2021 07:46:06 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 07:46:07', '1.5', 'DH0053-21104074606', 'KIỂM TRA CUỐI KỲ', '52500', '3', '2021-01-04 07:46:06', '0', null, '35000', '1', 'unpaid', '52500', '0.5', '57', '2');
INSERT INTO `orders` VALUES ('99', 'anonymousUser', '2021-01-04 07:46:26', '04/1/2021 07:46:26 Don hang duoc tao.&#13;21-1-04 07:48:12 Thanh toan xong.&#13;', 'admin', '2021-01-04 07:48:12', '0.39', 'DH0054-21104074626', 'ĐỊA CHỈ ', '0', '3.9', '2021-01-04 07:46:26', '23400', '2021-01-04 07:48:12', '60000', '1', 'paid', '23400', '0.1', '37', '6');
INSERT INTO `orders` VALUES ('100', 'anonymousUser', '2021-01-04 07:46:40', '04/1/2021 07:46:39 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 07:46:40', '1.8', 'DH0055-21104074639', 'THIỆN PHÚC IN', '108000', '5.63', '2021-01-04 07:46:39', '0', null, '60000', '1', 'unpaid', '108000', '0.32', '48', '6');
INSERT INTO `orders` VALUES ('101', 'anonymousUser', '2021-01-04 07:54:42', '04/1/2021 07:54:41 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 07:54:42', '7', 'DH0056-21104075441', 'PHÚC VƯƠNG', '490000', '0.1', '2021-01-04 07:54:41', '0', null, '70000', '1000', 'unpaid', '490000', '0.07', '31', '5');
INSERT INTO `orders` VALUES ('102', 'anonymousUser', '2021-01-04 09:10:52', '04/1/2021 09:10:52 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:10:52', '1.05', 'DH0057-21104091052', '360 CƯỚI', '63000', '3.5', '2021-01-04 09:10:52', '0', null, '60000', '1', 'unpaid', '63000', '0.3', '48', '6');
INSERT INTO `orders` VALUES ('103', 'anonymousUser', '2021-01-04 09:11:21', '04/1/2021 09:11:21 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:11:21', '1.91', 'DH0058-21104091121', '360 CƯỚI', '114600', '0.44', '2021-01-04 09:11:21', '0', null, '60000', '2', 'unpaid', '114600', '2.17', '48', '6');
INSERT INTO `orders` VALUES ('104', 'anonymousUser', '2021-01-04 09:11:32', '04/1/2021 09:11:32 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:11:32', '1.92', 'DH0059-21104091132', '360 CƯỚI', '115200', '0.8', '2021-01-04 09:11:32', '0', null, '60000', '2', 'unpaid', '115200', '1.2', '48', '6');
INSERT INTO `orders` VALUES ('105', 'anonymousUser', '2021-01-04 09:11:45', '04/1/2021 09:11:44 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:11:45', '1.12', 'DH0060-21104091144', 'TANG LỄ', '44800', '2.8', '2021-01-04 09:11:44', '0', null, '40000', '1', 'unpaid', '44800', '0.4', '73', '2');
INSERT INTO `orders` VALUES ('106', 'anonymousUser', '2021-01-04 09:11:56', '04/1/2021 09:11:55 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:11:56', '1.6', 'DH0061-21104091155', 'XIN CẦU CHO LINH HỒN', '64000', '4', '2021-01-04 09:11:55', '0', null, '40000', '1', 'unpaid', '64000', '0.4', '73', '2');
INSERT INTO `orders` VALUES ('107', 'anonymousUser', '2021-01-04 09:12:13', '04/1/2021 09:12:12 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:12:13', '1.5', 'DH0062-21104091212', 'TRẦN VĂN THƯỜNG', '60000', '2.5', '2021-01-04 09:12:12', '0', null, '40000', '1', 'unpaid', '60000', '0.6', '73', '2');
INSERT INTO `orders` VALUES ('108', 'anonymousUser', '2021-01-04 09:13:54', '04/1/2021 09:13:54 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:13:54', '2.88', 'DH0063-21104091354', 'CÁO PHÓ_CẦU NGUYỆN_KINH THÁNH', '115200', '0.8', '2021-01-04 09:13:54', '0', null, '40000', '3', 'unpaid', '115200', '1.2', '73', '2');
INSERT INTO `orders` VALUES ('110', 'anonymousUser', '2021-01-04 09:14:15', '04/1/2021 09:14:15 Don hang duoc tao.&#13;', 'admin', '2021-01-04 09:19:54', '1', 'DH0065-21104091415', 'THÁNH GIÁ', '10000', '1', '2021-01-04 09:14:15', '0', null, '10000', '1', 'unpaid', '10000', '1', '73', '21');
INSERT INTO `orders` VALUES ('111', 'anonymousUser', '2021-01-04 09:23:39', '04/1/2021 09:23:39 Don hang duoc tao.&#13;21-1-05 09:09:10 Thanh toan xong.&#13;', 'admin', '2021-01-05 09:09:11', '1.2', 'DH0065-21104092339', 'HỘI NGHỊ CÔNG AN', '0', '1.5', '2021-01-04 09:23:39', '36000', '2021-01-05 09:09:11', '30000', '1', 'paid', '36000', '0.8', '9', '2');
INSERT INTO `orders` VALUES ('112', 'anonymousUser', '2021-01-04 09:24:00', '04/1/2021 09:23:59 Don hang duoc tao.&#13;21-1-04 09:24:28 Thanh toan xong.&#13;', 'admin', '2021-01-04 09:24:29', '1.68', 'DH0066-21104092359', 'THẮNG RỬA XE', '0', '0.7', '2021-01-04 09:23:59', '100800', '2021-01-04 09:24:28', '60000', '2', 'paid', '100800', '1.2', '35', '4');
INSERT INTO `orders` VALUES ('113', 'anonymousUser', '2021-01-04 09:29:50', '04/1/2021 09:29:50 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:29:50', '0.2', 'DH0067-21104092950', 'DECAL', '12000', '0.9', '2021-01-04 09:29:50', '0', null, '60000', '1', 'unpaid', '12000', '0.22', '73', '4');
INSERT INTO `orders` VALUES ('114', 'anonymousUser', '2021-01-04 09:32:11', '04/1/2021 09:32:11 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 09:32:11', '0.96', 'DH0068-21104093211', 'CẦU NGUYỆN THÊM', '38400', '1.2', '2021-01-04 09:32:11', '0', null, '40000', '1', 'unpaid', '38400', '0.8', '73', '2');
INSERT INTO `orders` VALUES ('115', 'anonymousUser', '2021-01-04 10:18:29', '04/1/2021 10:18:28 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 10:18:29', '3.1', 'DH0069-21104101828', 'TANG LỄ_BĂNG RÔN', '124000', '3.1', '2021-01-04 10:18:28', '0', null, '40000', '2', 'unpaid', '124000', '0.5', '33', '2');
INSERT INTO `orders` VALUES ('116', 'anonymousUser', '2021-01-04 10:18:39', '04/1/2021 10:18:38 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 10:18:39', '1.5', 'DH0070-21104101838', 'NGUYỄN CÔNG THỦY', '60000', '2.5', '2021-01-04 10:18:38', '0', null, '40000', '1', 'unpaid', '60000', '0.6', '33', '2');
INSERT INTO `orders` VALUES ('117', 'anonymousUser', '2021-01-04 10:18:47', '04/1/2021 10:18:47 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 10:18:47', '0.68', 'DH0071-21104101847', 'CÁO PHÓ', '27200', '0.63', '2021-01-04 10:18:47', '0', null, '40000', '1', 'unpaid', '27200', '1.08', '33', '2');
INSERT INTO `orders` VALUES ('118', 'anonymousUser', '2021-01-04 10:18:57', '04/1/2021 10:18:56 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 10:18:57', '1.92', 'DH0072-21104101856', 'CẦU NGUYỆN_THƯƠNG XÓT', '76800', '0.8', '2021-01-04 10:18:56', '0', null, '40000', '2', 'unpaid', '76800', '1.2', '33', '2');
INSERT INTO `orders` VALUES ('119', 'anonymousUser', '2021-01-04 10:22:21', '04/1/2021 10:22:20 Don hang duoc tao.&#13;', 'admin', '2021-01-04 10:36:22', '7.28', 'DH0073-21104102220', 'TẤM TRƯỚNG', '254800', '2.6', '2021-01-04 10:22:21', '0', null, '35000', '1', 'unpaid', '254800', '2.8', '33', '1');
INSERT INTO `orders` VALUES ('120', 'anonymousUser', '2021-01-04 10:32:51', '04/1/2021 10:32:50 Don hang duoc tao.&#13;21-1-04 06:23:04 Thanh toan xong.&#13;', 'admin', '2021-01-04 18:23:04', '6.08', 'DH0074-21104103250', 'GIÁO KHU THÁNH TÂM', '0', '0.08', '2021-01-04 10:32:50', '425600', '2021-01-04 18:23:04', '70000', '950', 'paid', '425600', '0.08', '15', '5');
INSERT INTO `orders` VALUES ('122', 'anonymousUser', '2021-01-04 10:53:35', '04/1/2021 10:53:35 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 10:53:35', '0.31', 'DH0076-21104105335', 'A TIÊN', '18600', '0.95', '2021-01-04 10:53:35', '0', null, '60000', '1', 'unpaid', '18600', '0.33', '35', '4');
INSERT INTO `orders` VALUES ('126', 'anonymousUser', '2021-01-04 11:17:10', '04/1/2021 11:17:09 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 11:17:10', '0.49', 'DH0076-21104111709', 'A SƠN', '29400', '0.96', '2021-01-04 11:17:09', '0', null, '60000', '1', 'unpaid', '29400', '0.51', '35', '4');
INSERT INTO `orders` VALUES ('127', 'anonymousUser', '2021-01-04 11:20:03', '04/1/2021 11:20:03 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 11:20:03', '2.04', 'DH0077-21104112003', 'CHO THUÊ MẶT BẰNG', '55080', '2.55', '2021-01-04 11:20:03', '0', null, '27000', '1', 'unpaid', '55080', '0.8', '31', '2');
INSERT INTO `orders` VALUES ('128', 'anonymousUser', '2021-01-04 11:20:12', '04/1/2021 11:20:11 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 11:20:12', '0.02', 'DH0078-21104112011', 'SỬA', '1000', '0.2', '2021-01-04 11:20:11', '0', null, '50000', '1', 'unpaid', '1000', '0.1', '31', '4');
INSERT INTO `orders` VALUES ('129', 'anonymousUser', '2021-01-04 11:25:54', '04/1/2021 11:25:53 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 11:25:54', '0.96', 'DH0079-21104112553', 'BẢNG PHÂN CÔNG', '38400', '0.8', '2021-01-04 11:25:53', '0', null, '40000', '1', 'unpaid', '38400', '1.2', '33', '2');
INSERT INTO `orders` VALUES ('130', 'anonymousUser', '2021-01-04 13:02:28', '04/1/2021 13:02:28 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 13:02:28', '0.96', 'DH0080-21104010228', 'BÁNH XÈO NHƯ Ý', '57600', '0.6', '2021-01-04 13:02:28', '0', null, '60000', '2', 'unpaid', '57600', '0.8', '48', '6');
INSERT INTO `orders` VALUES ('132', 'anonymousUser', '2021-01-04 13:46:21', '04/1/2021 13:46:21 Don hang duoc tao.&#13;21-1-04 10:28:43 Thanh toan xong.&#13;', 'admin', '2021-01-04 22:28:44', '2.92', 'DH0082-21104014621', 'CƠM TẤM', '0', '2.15', '2021-01-04 13:46:21', '102200', '2021-01-04 22:28:44', '35000', '1', 'paid', '102200', '1.36', '35', '2');
INSERT INTO `orders` VALUES ('133', 'anonymousUser', '2021-01-04 13:55:17', '04/1/2021 13:55:16 Don hang duoc tao.&#13;21-1-04 03:51:49 Thanh toan xong.&#13;', 'admin', '2021-01-04 15:51:49', '2', 'DH0083-21104015516', 'TUẤN THẠNH QUỚI', '0', '2', '2021-01-04 13:55:16', '70000', '2021-01-04 15:51:49', '35000', '1', 'paid', '70000', '1', '35', '2');
INSERT INTO `orders` VALUES ('134', 'anonymousUser', '2021-01-04 13:55:32', '04/1/2021 13:55:32 Don hang duoc tao.&#13;21-1-08 03:41:44 Thanh toan xong.&#13;', 'admin', '2021-01-08 15:41:44', '12', 'DH0084-21104015532', 'PANO VĨNH TRINH', '0', '3', '2021-01-04 13:55:32', '420000', '2021-01-08 15:41:44', '35000', '2', 'paid', '420000', '2', '35', '2');
INSERT INTO `orders` VALUES ('135', 'anonymousUser', '2021-01-04 13:55:49', '04/1/2021 13:55:49 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 13:55:49', '2.64', 'DH0085-21104015549', 'THƯỢNG QUỲNH ANH', '92400', '2.2', '2021-01-04 13:55:49', '0', null, '35000', '1', 'unpaid', '92400', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('136', 'anonymousUser', '2021-01-04 14:06:02', '04/1/2021 14:06:02 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 14:06:02', '3', 'DH0086-21104020602', 'TH ĐÔNG HIỆP', '60000', '5', '2021-01-04 14:06:02', '0', null, '20000', '1', 'unpaid', '60000', '0.6', '1', '1');
INSERT INTO `orders` VALUES ('137', 'anonymousUser', '2021-01-04 14:06:11', '04/1/2021 14:06:10 Don hang duoc tao.&#13;', 'admin', '2021-01-04 22:20:33', '5.25', 'DH0087-21104020610', 'TH ĐÔNG HIỆP', '105000', '3.5', '2021-01-04 14:06:10', '0', null, '20000', '1', 'unpaid', '105000', '1.5', '1', '1');
INSERT INTO `orders` VALUES ('138', 'anonymousUser', '2021-01-04 14:12:53', '04/1/2021 14:12:52 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 14:12:53', '4.8', 'DH0088-21104021252', 'Y TẾ ĐÔNG HIỆP', '96000', '4', '2021-01-04 14:12:52', '0', null, '20000', '2', 'unpaid', '96000', '0.6', '1', '1');
INSERT INTO `orders` VALUES ('139', 'anonymousUser', '2021-01-04 14:22:17', '04/1/2021 14:22:17 Don hang duoc tao.&#13;21-1-04 02:25:00 Thanh toan xong.&#13;', 'admin', '2021-01-04 14:25:00', '0.59', 'DH0089-21104022217', 'CHÚ MINH', '0', '1.08', '2021-01-04 14:22:17', '35400', '2021-01-04 14:25:00', '60000', '1', 'paid', '35400', '0.55', '35', '4');
INSERT INTO `orders` VALUES ('140', 'anonymousUser', '2021-01-04 14:33:25', '04/1/2021 14:33:24 Don hang duoc tao.&#13;21-1-07 05:29:27 Thanh toan xong.&#13;', 'admin', '2021-01-07 17:29:28', '0.12', 'DH0090-21104023324', 'THUẬN HÒA', '0', '0.43', '2021-01-04 14:33:24', '9600', '2021-01-07 17:29:28', '80000', '1', 'paid', '9600', '0.29', '35', '6');
INSERT INTO `orders` VALUES ('141', 'anonymousUser', '2021-01-04 14:38:20', '04/1/2021 14:38:20 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 14:38:20', '0.12', 'DH0091-21104023820', 'DECAL DÁN NGƯỢC ', '8400', '0.3', '2021-01-04 14:38:20', '0', null, '70000', '2', 'unpaid', '8400', '0.2', '48', '12');
INSERT INTO `orders` VALUES ('142', 'anonymousUser', '2021-01-04 15:05:10', '04/1/2021 15:05:10 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 15:05:10', '0.7', 'DH0092-21104030510', 'CHÍNH SÁCH CHẤT LƯỢNG', '31500', '0.7', '2021-01-04 15:05:10', '0', null, '45000', '1', 'unpaid', '31500', '1', '1', '4');
INSERT INTO `orders` VALUES ('143', 'anonymousUser', '2021-01-04 15:05:22', '04/1/2021 15:05:22 Don hang duoc tao.&#13;', 'admin', '2021-01-04 22:20:21', '2.2', 'DH0093-21104030522', 'ĐIỆN LỰC CỜ ĐỎ', '44000', '2.2', '2021-01-04 15:05:22', '0', null, '20000', '1', 'unpaid', '44000', '1', '1', '1');
INSERT INTO `orders` VALUES ('144', 'anonymousUser', '2021-01-04 15:05:37', '04/1/2021 15:05:36 Don hang duoc tao.&#13;', 'admin', '2021-01-04 22:20:10', '8', 'DH0094-21104030536', 'HUYỆN ỦY', '160000', '5', '2021-01-04 15:05:36', '0', null, '20000', '1', 'unpaid', '160000', '1.6', '1', '1');
INSERT INTO `orders` VALUES ('145', 'anonymousUser', '2021-01-04 15:05:45', '04/1/2021 15:05:44 Don hang duoc tao.&#13;', 'admin', '2021-01-04 22:19:35', '3', 'DH0095-21104030544', 'HUYỆN ỦY', '60000', '3', '2021-01-04 15:05:44', '0', null, '20000', '1', 'unpaid', '60000', '1', '1', '1');
INSERT INTO `orders` VALUES ('146', 'anonymousUser', '2021-01-04 15:05:56', '04/1/2021 15:05:55 Don hang duoc tao.&#13;', 'admin', '2021-01-04 22:19:28', '2', 'DH0096-21104030555', 'THỚI HƯNG NHẬT', '40000', '2', '2021-01-04 15:05:55', '0', null, '20000', '1', 'unpaid', '40000', '1', '1', '1');
INSERT INTO `orders` VALUES ('147', 'anonymousUser', '2021-01-04 15:06:07', '04/1/2021 15:06:07 Don hang duoc tao.&#13;', 'admin', '2021-01-04 22:19:20', '3.2', 'DH0097-21104030607', 'THỚI HƯNG NHIỆM', '64000', '3.2', '2021-01-04 15:06:07', '0', null, '20000', '1', 'unpaid', '64000', '1', '1', '1');
INSERT INTO `orders` VALUES ('148', 'anonymousUser', '2021-01-04 15:06:17', '04/1/2021 15:06:17 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 15:06:17', '0.15', 'DH0098-21104030617', 'THỚI HƯNG NHIỆM', '6750', '0.5', '2021-01-04 15:06:17', '0', null, '45000', '1', 'unpaid', '6750', '0.3', '1', '4');
INSERT INTO `orders` VALUES ('149', 'anonymousUser', '2021-01-04 15:06:32', '04/1/2021 15:06:31 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 15:06:32', '3.22', 'DH0099-21104030631', 'HỘI NGHỊ', '112700', '2.3', '2021-01-04 15:06:31', '0', null, '35000', '1', 'unpaid', '112700', '1.4', '21', '2');
INSERT INTO `orders` VALUES ('150', 'anonymousUser', '2021-01-04 15:08:32', '04/1/2021 15:08:31 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 15:08:32', '1.08', 'DH00100-21104030831', 'BẢO HIỂM', '32400', '0.9', '2020-12-01 15:08:31', '0', null, '30000', '2', 'unpaid', '32400', '0.6', '48', '3');
INSERT INTO `orders` VALUES ('151', 'anonymousUser', '2021-01-04 15:39:08', '04/1/2021 15:39:07 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 15:39:08', '0.77', 'DH00101-21104033907', 'SÚP CUA', '53900', '1.1', '2021-01-04 15:39:07', '0', null, '70000', '1', 'unpaid', '53900', '0.7', '31', '6');
INSERT INTO `orders` VALUES ('152', 'anonymousUser', '2021-01-04 15:51:58', '04/1/2021 15:51:57 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 15:51:58', '0.81', 'DH00102-21104035157', 'CÔNG TRỌNG', '48600', '1', '2021-01-04 15:51:57', '0', null, '60000', '1', 'unpaid', '48600', '0.81', '35', '4');
INSERT INTO `orders` VALUES ('153', 'anonymousUser', '2021-01-04 16:05:34', '04/1/2021 16:05:33 Don hang duoc tao.&#13;21-1-04 10:28:43 Thanh toan xong.&#13;', 'admin', '2021-01-04 22:28:44', '0.66', 'DH00103-21104040533', 'CÁNH GÀ', '0', '0.55', '2021-01-04 16:05:33', '23100', '2021-01-04 22:28:44', '35000', '1', 'paid', '23100', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('154', 'anonymousUser', '2021-01-04 16:08:24', '04/1/2021 16:08:23 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 16:08:24', '1.7', 'DH00104-21104040823', 'BÁNH KEM SỮA TƯƠI', '59500', '0.53', '2021-01-04 16:08:24', '0', null, '35000', '2', 'unpaid', '59500', '1.6', '35', '2');
INSERT INTO `orders` VALUES ('155', 'anonymousUser', '2021-01-04 16:08:40', '04/1/2021 16:08:39 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 16:08:40', '0.27', 'DH00105-21104040839', 'MỪNG XUÂN TÂN SỬU', '18900', '0.86', '2021-01-04 16:08:39', '0', null, '70000', '1', 'unpaid', '18900', '0.31', '35', '18');
INSERT INTO `orders` VALUES ('156', 'anonymousUser', '2021-01-04 16:25:29', '04/1/2021 16:25:28 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 16:25:29', '6.84', 'DH00106-21104042528', 'MINH TỔNG', '205200', '5.7', '2021-01-04 16:25:28', '0', null, '30000', '1', 'unpaid', '205200', '1.2', '48', '3');
INSERT INTO `orders` VALUES ('157', 'anonymousUser', '2021-01-04 16:33:20', '04/1/2021 16:33:19 Don hang duoc tao.&#13;21-1-05 04:34:28 Thanh toan xong.&#13;', 'admin', '2021-01-05 16:34:29', '1.57', 'DH00107-21104043319', 'HÀO NAM NGUYÊN LIỆU TRÀ SỮA', '0', '2.15', '2021-01-04 16:33:19', '125600', '2021-01-05 16:34:29', '80000', '1', 'paid', '125600', '0.73', '35', '6');
INSERT INTO `orders` VALUES ('158', 'anonymousUser', '2021-01-04 16:43:53', '04/1/2021 16:43:52 Don hang duoc tao.&#13;21-1-04 10:28:43 Thanh toan xong.&#13;', 'admin', '2021-01-04 22:28:44', '0.08', 'DH00108-21104044352', 'QUỲNH NHƯ', '0', '0.4', '2021-01-04 16:43:52', '4800', '2021-01-04 22:28:43', '60000', '1', 'paid', '4800', '0.2', '35', '4');
INSERT INTO `orders` VALUES ('159', 'anonymousUser', '2021-01-04 16:57:50', '04/1/2021 16:57:50 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-04 16:57:50', '2.76', 'DH00109-21104045750', 'HỘI NGHỊ', '96600', '2.4', '2021-01-04 16:57:50', '0', null, '35000', '1', 'unpaid', '96600', '1.15', '67', '2');
INSERT INTO `orders` VALUES ('160', 'anonymousUser', '2021-01-05 07:42:16', '05/1/2021 07:42:15 Don hang duoc tao.&#13;21-1-05 07:50:45 Thanh toan xong.&#13;', 'admin', '2021-01-05 07:50:46', '11.2', 'DH00110-21105074215', 'CHÚC MỪNG NĂM MỚI', '0', '4', '2021-01-04 07:42:15', '392000', '2021-01-05 07:50:46', '35000', '4', 'paid', '392000', '0.7', '35', '1');
INSERT INTO `orders` VALUES ('162', 'anonymousUser', '2021-01-05 07:59:24', '05/1/2021 07:59:23 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 07:59:24', '2.76', 'DH00112-21105075923', 'HỘI NGHỊ', '96600', '2.4', '2021-01-05 07:59:23', '0', null, '35000', '1', 'unpaid', '96600', '1.15', '67', '2');
INSERT INTO `orders` VALUES ('163', 'anonymousUser', '2021-01-05 08:20:59', '05/1/2021 08:20:58 Don hang duoc tao.&#13;21-1-05 01:18:17 Thanh toan xong.&#13;', 'admin', '2021-01-05 13:18:17', '1.02', 'DH00113-21105082058', 'BÚN CHÁO', '0', '0.82', '2021-01-05 08:20:58', '35700', '2021-01-05 13:18:17', '35000', '1', 'paid', '35700', '1.24', '35', '2');
INSERT INTO `orders` VALUES ('164', 'anonymousUser', '2021-01-05 08:21:09', '05/1/2021 08:21:09 Don hang duoc tao.&#13;21-1-05 01:18:17 Thanh toan xong.&#13;', 'admin', '2021-01-05 13:18:17', '1.6', 'DH00114-21105082109', 'CÀ PHÊ NGỌC HÀ', '0', '0.8', '2021-01-05 08:21:09', '56000', '2021-01-05 13:18:17', '35000', '2', 'paid', '56000', '1', '35', '2');
INSERT INTO `orders` VALUES ('165', 'anonymousUser', '2021-01-05 08:36:29', '05/1/2021 08:36:28 Don hang duoc tao.&#13;21-1-06 03:15:51 Thanh toan xong.&#13;', 'admin', '2021-01-06 15:15:52', '1.31', 'DH00115-21105083628', 'BÁNH BAO', '0', '2.15', '2021-01-05 08:36:28', '45850', '2021-01-06 15:15:52', '35000', '1', 'paid', '45850', '0.61', '35', '2');
INSERT INTO `orders` VALUES ('166', 'anonymousUser', '2021-01-05 08:40:41', '05/1/2021 08:40:41 Don hang duoc tao.&#13;21-1-05 08:44:21 Thanh toan xong.&#13;', 'admin', '2021-01-05 08:44:21', '0.84', 'DH00116-21105084041', 'SANG TÂN HIỆP', '0', '1.2', '2021-01-05 08:40:41', '50400', '2021-01-05 08:44:21', '60000', '1', 'paid', '50400', '0.7', '35', '4');
INSERT INTO `orders` VALUES ('167', 'anonymousUser', '2021-01-05 09:12:00', '05/1/2021 09:11:59 Don hang duoc tao.&#13;21-1-05 09:31:16 Thanh toan xong.&#13;', 'admin', '2021-01-05 09:31:17', '0.5', 'DH00116-21105091159', 'MỨT ME PHƯƠNG THỦY', '0', '0.5', '2021-01-05 09:12:00', '40000', '2021-01-05 09:31:17', '80000', '1', 'paid', '40000', '1', '35', '5');
INSERT INTO `orders` VALUES ('168', 'anonymousUser', '2021-01-05 09:12:10', '05/1/2021 09:12:09 Don hang duoc tao.&#13;', 'admin', '2021-01-05 11:14:27', '2.24', 'DH00117-21105091209', 'ĐÔNG HIỆP THẢO', '44800', '2.8', '2021-01-05 09:12:09', '0', null, '20000', '1', 'unpaid', '44800', '0.8', '1', '1');
INSERT INTO `orders` VALUES ('169', 'anonymousUser', '2021-01-05 09:12:23', '05/1/2021 09:12:23 Don hang duoc tao.&#13;', 'admin', '2021-01-05 11:14:39', '8', 'DH00118-21105091223', 'HUYỆN ỦY', '160000', '5', '2021-01-05 09:12:23', '0', null, '20000', '1', 'unpaid', '160000', '1.6', '1', '1');
INSERT INTO `orders` VALUES ('170', 'anonymousUser', '2021-01-05 09:12:39', '05/1/2021 09:12:38 Don hang duoc tao.&#13;', 'admin', '2021-01-05 11:14:53', '3', 'DH00119-21105091238', 'THỊ TRẤN (MẶT TRẬN)', '60000', '3', '2021-01-05 09:12:38', '0', null, '20000', '1', 'unpaid', '60000', '1', '1', '1');
INSERT INTO `orders` VALUES ('171', 'anonymousUser', '2021-01-05 09:13:00', '05/1/2021 09:12:59 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 09:13:00', '3.2', 'DH00120-21105091259', 'THỚI HƯNG (NHIỆM)', '64000', '3.2', '2021-01-05 09:12:59', '0', null, '20000', '1', 'unpaid', '64000', '1', '1', '1');
INSERT INTO `orders` VALUES ('172', 'anonymousUser', '2021-01-05 09:13:12', '05/1/2021 09:13:11 Don hang duoc tao.&#13;21-1-07 05:29:10 Thanh toan xong.&#13;', 'admin', '2021-01-07 17:29:10', '2', 'DH00121-21105091311', 'HẬU THẠNH QUỚI', '0', '2', '2021-01-04 09:13:11', '70000', '2021-01-07 17:29:10', '35000', '1', 'paid', '70000', '1', '35', '2');
INSERT INTO `orders` VALUES ('173', 'anonymousUser', '2021-01-05 09:13:50', '05/1/2021 09:13:49 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 09:13:50', '3', 'DH00122-21105091349', 'LỄ RA QUÂN', '75000', '5', '2021-01-05 09:13:49', '0', null, '25000', '1', 'unpaid', '75000', '0.6', '75', '2');
INSERT INTO `orders` VALUES ('174', 'anonymousUser', '2021-01-05 09:14:04', '05/1/2021 09:14:03 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 09:14:04', '6', 'DH00123-21105091403', 'LỄ RA QUÂN', '150000', '3', '2021-01-05 09:14:03', '0', null, '25000', '1', 'unpaid', '150000', '2', '75', '2');
INSERT INTO `orders` VALUES ('175', 'anonymousUser', '2021-01-05 10:09:53', '05/1/2021 10:09:53 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 10:09:53', '0.7', 'DH00124-21105100953', 'CHÍNH SÁCH CHẤT LƯỢNG', '31500', '0.7', '2021-01-05 10:09:53', '0', null, '45000', '1', 'unpaid', '31500', '1', '1', '4');
INSERT INTO `orders` VALUES ('176', 'anonymousUser', '2021-01-05 10:29:35', '05/1/2021 10:29:35 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 10:29:35', '3', 'DH00125-21105102935', 'BĂNG RÔN_TANG LỄ', '120000', '3', '2021-01-05 10:29:35', '0', null, '40000', '2', 'unpaid', '120000', '0.5', '24', '2');
INSERT INTO `orders` VALUES ('177', 'anonymousUser', '2021-01-05 10:29:46', '05/1/2021 10:29:46 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 10:29:46', '1.75', 'DH00126-21105102946', 'PHẠM VĂN PHÁP', '70000', '2.5', '2021-01-05 10:29:46', '0', null, '40000', '1', 'unpaid', '70000', '0.7', '24', '2');
INSERT INTO `orders` VALUES ('178', 'anonymousUser', '2021-01-05 10:29:59', '05/1/2021 10:29:58 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 10:29:59', '2.88', 'DH00127-21105102958', 'CÁO PHÓ_THƯƠNG XÓT_KINH THÁNH', '115200', '0.8', '2021-01-05 10:29:59', '0', null, '40000', '3', 'unpaid', '115200', '1.2', '24', '2');
INSERT INTO `orders` VALUES ('179', 'anonymousUser', '2021-01-05 10:47:51', '05/1/2021 10:47:50 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 10:47:51', '1.5', 'DH00128-21105104750', 'NGÔ QUANG MINH', '60000', '2.5', '2021-01-05 10:47:50', '0', null, '40000', '1', 'unpaid', '60000', '0.6', '30', '2');
INSERT INTO `orders` VALUES ('180', 'anonymousUser', '2021-01-05 10:48:00', '05/1/2021 10:47:59 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 10:48:00', '1.2', 'DH00129-21105104759', 'TANG LỄ', '48000', '3', '2021-01-05 10:47:59', '0', null, '40000', '1', 'unpaid', '48000', '0.4', '30', '2');
INSERT INTO `orders` VALUES ('181', 'anonymousUser', '2021-01-05 10:54:47', '05/1/2021 10:54:47 Don hang duoc tao.&#13;21-1-05 11:01:26 Thanh toan xong.&#13;', 'admin', '2021-01-05 11:01:27', '0.65', 'DH00130-21105105447', 'TẤM TRƯỚNG', '0', '0.65', '2021-01-05 10:54:47', '22750', '2021-01-05 11:01:27', '35000', '1', 'paid', '22750', '1', '35', '2');
INSERT INTO `orders` VALUES ('182', 'anonymousUser', '2021-01-05 11:23:04', '05/1/2021 11:23:03 Don hang duoc tao.&#13;21-1-05 04:59:50 Thanh toan xong.&#13;', 'admin', '2021-01-05 16:59:51', '1.4', 'DH00131-21105112303', 'GAME NHẬT NGUYỆT', '0', '0.7', '2021-01-05 11:23:03', '49000', '2021-01-05 16:59:51', '35000', '2', 'paid', '49000', '1', '35', '2');
INSERT INTO `orders` VALUES ('183', 'anonymousUser', '2021-01-05 11:26:56', '05/1/2021 11:26:55 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 11:26:56', '5.66', 'DH00132-21105112655', 'ĐL ĐẠI THẮNG (CỔNG LỚN)', '339600', '4.68', '2021-01-05 11:26:55', '0', null, '60000', '1', 'unpaid', '339600', '1.21', '48', '6');
INSERT INTO `orders` VALUES ('184', 'anonymousUser', '2021-01-05 11:28:00', '05/1/2021 11:27:59 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 11:28:00', '4.02', 'DH00133-21105112759', 'ĐL ĐẠI THẮNG (CỔNG LỚN)', '241200', '1.21', '2021-01-05 11:27:59', '0', null, '60000', '1', 'unpaid', '241200', '3.32', '48', '6');
INSERT INTO `orders` VALUES ('185', 'anonymousUser', '2021-01-05 11:31:02', '05/1/2021 11:31:01 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 11:31:02', '4.49', 'DH00134-21105113101', 'ĐẠI LÝ THANH LUÂN (CỔNG NHỎ)', '269400', '3.71', '2021-01-05 11:31:01', '0', null, '60000', '1', 'unpaid', '269400', '1.21', '48', '6');
INSERT INTO `orders` VALUES ('186', 'anonymousUser', '2021-01-05 11:31:11', '05/1/2021 11:31:11 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 11:31:11', '3.3', 'DH00135-21105113111', 'ĐẠI LÝ THANH LUÂN (CỔNG NHỎ)', '198000', '1.13', '2021-01-05 11:31:11', '0', null, '60000', '1', 'unpaid', '198000', '2.92', '48', '6');
INSERT INTO `orders` VALUES ('187', 'anonymousUser', '2021-01-05 13:01:43', '05/1/2021 13:01:43 Don hang duoc tao.&#13;21-1-06 04:00:48 Thanh toan xong.&#13;', 'admin', '2021-01-06 16:00:49', '0.96', 'DH00136-21105010143', 'XÃ THẠNH AN', '0', '1.2', '2021-01-05 13:01:43', '33600', '2021-01-06 16:00:49', '35000', '1', 'paid', '33600', '0.8', '35', '2');
INSERT INTO `orders` VALUES ('188', 'anonymousUser', '2021-01-05 13:02:18', '05/1/2021 13:02:17 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 13:02:18', '72', 'DH00137-21105010217', 'PANO ĐẠI HỘI ĐẢNG ', '1800000', '6', '2021-01-05 13:02:18', '0', null, '25000', '4', 'unpaid', '1800000', '3', '1', '2');
INSERT INTO `orders` VALUES ('189', 'anonymousUser', '2021-01-05 13:28:19', '05/1/2021 13:28:19 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 13:28:19', '9.6', 'DH00138-21105012819', 'XIN CẦU CHO LINH HỒN', '384000', '4', '2021-01-05 13:28:19', '0', null, '40000', '6', 'unpaid', '384000', '0.4', '73', '2');
INSERT INTO `orders` VALUES ('190', 'anonymousUser', '2021-01-05 13:28:32', '05/1/2021 13:28:32 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 13:28:32', '6.25', 'DH00139-21105012832', 'NƠI ĐỂ XE', '250000', '0.5', '2021-01-05 13:28:32', '0', null, '40000', '50', 'unpaid', '250000', '0.25', '73', '2');
INSERT INTO `orders` VALUES ('191', 'anonymousUser', '2021-01-05 13:28:43', '05/1/2021 13:28:42 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 13:28:43', '9.6', 'DH00140-21105012842', 'CÁO PHÓ IN SẴN', '384000', '0.8', '2021-01-05 13:28:42', '0', null, '40000', '10', 'unpaid', '384000', '1.2', '73', '2');
INSERT INTO `orders` VALUES ('192', 'anonymousUser', '2021-01-05 13:45:11', '05/1/2021 13:45:11 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 13:45:11', '2', 'DH00141-21105014511', 'TÔI KHÔNG CHẾT...', '80000', '4', '2021-01-05 13:45:11', '0', null, '40000', '1', 'unpaid', '80000', '0.5', '81', '2');
INSERT INTO `orders` VALUES ('193', 'anonymousUser', '2021-01-05 13:45:27', '05/1/2021 13:45:27 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 13:45:27', '3.36', 'DH00142-21105014527', 'THIÊN ĐÀNG VINH PHÚC IN SẴN', '134400', '2.4', '2021-01-05 13:45:27', '0', null, '40000', '2', 'unpaid', '134400', '0.7', '81', '2');
INSERT INTO `orders` VALUES ('194', 'anonymousUser', '2021-01-05 14:22:36', '05/1/2021 14:22:36 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 14:22:36', '1.3', 'DH00143-21105022236', 'CẮT DECAL THÁNH GIÁ', '78000', '1', '2021-01-05 14:22:36', '0', null, '60000', '1', 'unpaid', '78000', '1.3', '81', '18');
INSERT INTO `orders` VALUES ('195', 'anonymousUser', '2021-01-05 14:57:31', '05/1/2021 14:57:30 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 14:57:31', '2.34', 'DH00144-21105025730', 'HẢI SẢN NGUYỄN HUY', '70200', '0.9', '2021-01-05 14:57:30', '0', null, '30000', '2', 'unpaid', '70200', '1.3', '19', '2');
INSERT INTO `orders` VALUES ('196', 'anonymousUser', '2021-01-05 14:57:45', '05/1/2021 14:57:44 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 14:57:45', '2', 'DH00145-21105025744', 'HẢI SẢN NGUYỄN HUY', '60000', '5', '2021-01-05 14:57:44', '0', null, '30000', '1', 'unpaid', '60000', '0.4', '19', '2');
INSERT INTO `orders` VALUES ('197', 'anonymousUser', '2021-01-05 14:57:59', '05/1/2021 14:57:58 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 14:57:59', '2', 'DH00146-21105025758', 'HẢI SẢN TƯƠI SỐNG NGUYỄN HUY', '50000', '5', '2021-01-05 14:57:58', '0', null, '25000', '1', 'unpaid', '50000', '0.4', '80', '2');
INSERT INTO `orders` VALUES ('198', 'anonymousUser', '2021-01-05 14:59:51', '05/1/2021 14:59:50 Don hang duoc tao.&#13;21-1-05 04:57:23 Thanh toan xong.&#13;', 'admin', '2021-01-05 16:57:24', '3', 'DH00147-21105025950', 'TRÀ SỮA LION', '0', '5', '2021-01-05 14:59:50', '105000', '2021-01-05 16:57:24', '35000', '1', 'paid', '105000', '0.6', '35', '2');
INSERT INTO `orders` VALUES ('199', 'anonymousUser', '2021-01-05 15:06:11', '05/1/2021 15:06:11 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 15:06:11', '2', 'DH00148-21105030611', 'HỘI NGHỊ CCVC', '50000', '2', '2021-01-05 15:06:11', '0', null, '25000', '1', 'unpaid', '50000', '1', '80', '2');
INSERT INTO `orders` VALUES ('200', 'anonymousUser', '2021-01-05 15:07:16', '05/1/2021 15:07:15 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 15:07:16', '1.2', 'DH00149-21105030715', 'BẢNG GIÁ', '84000', '1', '2021-01-05 15:07:16', '0', null, '70000', '1', 'unpaid', '84000', '1.2', '19', '6');
INSERT INTO `orders` VALUES ('201', 'anonymousUser', '2021-01-05 15:26:24', '05/1/2021 15:26:23 Don hang duoc tao.&#13;21-1-05 03:42:47 Thanh toan xong.&#13;', 'admin', '2021-01-05 15:42:47', '2.46', 'DH00150-21105032623', 'KIẾN LỢI', '0', '0.88', '2021-01-05 15:26:23', '110700', '2021-01-05 15:42:47', '45000', '2', 'paid', '110700', '1.4', '35', '3');
INSERT INTO `orders` VALUES ('202', 'anonymousUser', '2021-01-05 15:26:33', '05/1/2021 15:26:32 Don hang duoc tao.&#13;21-1-05 03:42:47 Thanh toan xong.&#13;', 'admin', '2021-01-05 15:42:47', '0.86', 'DH00151-21105032632', 'KIẾN LỢI', '0', '0.88', '2021-01-05 15:26:32', '30100', '2021-01-05 15:42:47', '35000', '1', 'paid', '30100', '0.98', '35', '2');
INSERT INTO `orders` VALUES ('203', 'anonymousUser', '2021-01-05 15:48:26', '05/1/2021 15:48:26 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-05 15:48:26', '1.39', 'DH00152-21105034826', 'CHIBI COVID', '69500', '0.98', '2021-01-05 15:48:26', '0', null, '50000', '1', 'unpaid', '69500', '1.42', '80', '4');
INSERT INTO `orders` VALUES ('204', 'anonymousUser', '2021-01-05 16:03:34', '05/1/2021 16:03:33 Don hang duoc tao.&#13;21-1-08 08:33:15 Thanh toan xong.&#13;', 'admin', '2021-01-08 20:33:15', '0.11', 'DH00153-21105040333', 'HÀNG ĐỒNG GIÁ', '0', '0.37', '2021-01-05 16:03:33', '6600', '2021-01-08 20:33:15', '60000', '1', 'paid', '6600', '0.29', '35', '4');
INSERT INTO `orders` VALUES ('205', 'anonymousUser', '2021-01-05 16:46:10', '05/1/2021 16:46:10 Don hang duoc tao.&#13;21-1-05 04:48:15 Thanh toan xong.&#13;', 'admin', '2021-01-05 16:48:15', '0.47', 'DH00154-21105044610', 'DECAL LÂN QUỚI', '0', '1.31', '2021-01-05 16:46:10', '21150', '2021-01-05 16:48:15', '45000', '1', 'paid', '21150', '0.36', '37', '4');
INSERT INTO `orders` VALUES ('206', 'anonymousUser', '2021-01-05 16:46:25', '05/1/2021 16:46:25 Don hang duoc tao.&#13;21-1-05 04:48:15 Thanh toan xong.&#13;', 'admin', '2021-01-05 16:48:15', '0.24', 'DH00155-21105044625', 'DÁN GIỎ QUÀ', '0', '1.07', '2021-01-05 16:46:25', '16800', '2021-01-05 16:48:15', '70000', '1', 'paid', '16800', '0.22', '37', '5');
INSERT INTO `orders` VALUES ('207', 'anonymousUser', '2021-01-05 16:46:36', '05/1/2021 16:46:36 Don hang duoc tao.&#13;21-1-05 04:48:14 Thanh toan xong.&#13;', 'admin', '2021-01-05 16:48:15', '0.05', 'DH00156-21105044636', 'CẮT DECAL', '0', '0.12', '2021-01-05 16:46:36', '2500', '2021-01-05 16:48:15', '50000', '1', 'paid', '2500', '0.38', '37', '18');
INSERT INTO `orders` VALUES ('208', 'anonymousUser', '2021-01-05 16:47:51', '05/1/2021 16:47:50 Don hang duoc tao.&#13;21-1-05 04:48:14 Thanh toan xong.&#13;', 'admin', '2021-01-05 16:48:15', '1', 'DH00157-21105044750', 'HÙNG PHÁT', '0', '0.2', '2021-01-05 16:47:50', '45000', '2021-01-05 16:48:15', '45000', '50', 'paid', '45000', '0.1', '37', '4');
INSERT INTO `orders` VALUES ('209', 'admin', '2021-01-05 17:06:46', '05/1/2021 17:06:46 Don hang duoc tao.&#13;21-1-05 05:07:36 Thanh toan xong.&#13;', 'admin', '2021-01-05 17:07:37', '2.92', 'DH00158-21105050646', 'CƠM TẤM', '0', '1.36', '2021-01-04 17:06:46', '102200', '2021-01-05 17:07:36', '35000', '1', 'paid', '102200', '2.15', '35', '2');
INSERT INTO `orders` VALUES ('210', 'anonymousUser', '2021-01-06 07:52:47', '06/1/2021 07:52:46 Don hang duoc tao.&#13;21-1-06 08:28:48 Thanh toan xong.&#13;', 'admin', '2021-01-06 08:28:49', '1', 'DH00158-21106075246', 'THỦY TIÊN', '0', '1', '2021-01-05 07:52:46', '90000', '2021-01-06 08:28:48', '90000', '1', 'paid', '90000', '1', '23', '7');
INSERT INTO `orders` VALUES ('211', 'anonymousUser', '2021-01-06 07:58:15', '06/1/2021 07:58:14 Don hang duoc tao.&#13;21-1-06 08:28:48 Thanh toan xong.&#13;', 'admin', '2021-01-06 08:28:48', '0.36', 'DH00159-21106075814', 'HAMBUGER', '0', '0.89', '2021-01-06 07:58:14', '18000', '2021-01-06 08:28:48', '50000', '1', 'paid', '18000', '0.41', '23', '4');
INSERT INTO `orders` VALUES ('212', 'anonymousUser', '2021-01-06 08:01:07', '06/1/2021 08:01:06 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:01:07', '6', 'DH00160-21106080106', 'CHẢ LỤA MẠNH TẨU', '300000', '1.2', '2021-01-06 08:01:06', '0', null, '50000', '5', 'unpaid', '300000', '1', '7', '4');
INSERT INTO `orders` VALUES ('213', 'anonymousUser', '2021-01-06 08:01:15', '06/1/2021 08:01:14 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:01:15', '0.32', 'DH00161-21106080114', 'TÂN HÔN', '16000', '0.57', '2021-01-06 08:01:14', '0', null, '50000', '1', 'unpaid', '16000', '0.57', '7', '4');
INSERT INTO `orders` VALUES ('214', 'anonymousUser', '2021-01-06 08:12:14', '06/1/2021 08:12:14 Don hang duoc tao.&#13;21-1-06 08:46:38 Thanh toan xong.&#13;', 'admin', '2021-01-06 08:46:38', '0.47', 'DH00162-21106081214', 'A TÚ', '0', '0.85', '2021-01-06 08:12:14', '28200', '2021-01-06 08:46:38', '60000', '1', 'paid', '28200', '0.55', '35', '4');
INSERT INTO `orders` VALUES ('215', 'anonymousUser', '2021-01-06 08:21:04', '06/1/2021 08:21:03 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:21:04', '3.36', 'DH00163-21106082103', 'PHỤ NỮ', '67200', '2.4', '2021-01-06 08:21:04', '0', null, '20000', '1', 'unpaid', '67200', '1.4', '1', '1');
INSERT INTO `orders` VALUES ('216', 'anonymousUser', '2021-01-06 08:21:14', '06/1/2021 08:21:14 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:21:14', '4.8', 'DH00164-21106082114', 'HỘI NẠN NHÂN', '96000', '4', '2021-01-06 08:21:14', '0', null, '20000', '1', 'unpaid', '96000', '1.2', '1', '1');
INSERT INTO `orders` VALUES ('217', 'anonymousUser', '2021-01-06 08:21:24', '06/1/2021 08:21:24 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:21:24', '1.47', 'DH00165-21106082124', 'CÔNG AN THỊ TRẤN', '29400', '1.81', '2021-01-06 08:21:24', '0', null, '20000', '1', 'unpaid', '29400', '0.81', '1', '1');
INSERT INTO `orders` VALUES ('218', 'anonymousUser', '2021-01-06 08:28:15', '06/1/2021 08:28:14 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:28:15', '7.5', 'DH00166-21106082814', 'MINH ĐEN', '450000', '5', '2021-01-06 08:28:14', '0', null, '60000', '1', 'unpaid', '450000', '1.5', '48', '6');
INSERT INTO `orders` VALUES ('219', 'anonymousUser', '2021-01-06 08:29:29', '06/1/2021 08:29:28 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:29:29', '1.26', 'DH00167-21106082928', 'NGUYỄN THỊ THANH', '50400', '2.1', '2021-01-06 08:29:28', '0', null, '40000', '1', 'unpaid', '50400', '0.6', '30', '2');
INSERT INTO `orders` VALUES ('220', 'anonymousUser', '2021-01-06 08:29:38', '06/1/2021 08:29:38 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:29:38', '1.5', 'DH00168-21106082938', 'TANG LỄ', '60000', '3', '2021-01-06 08:29:38', '0', null, '40000', '1', 'unpaid', '60000', '0.5', '30', '2');
INSERT INTO `orders` VALUES ('221', 'anonymousUser', '2021-01-06 08:29:52', '06/1/2021 08:29:52 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 08:29:52', '1.92', 'DH00169-21106082952', 'CÁO PHÓ_CẦU NGUYỆN', '76800', '0.8', '2021-01-06 08:29:52', '0', null, '40000', '2', 'unpaid', '76800', '1.2', '30', '2');
INSERT INTO `orders` VALUES ('222', 'anonymousUser', '2021-01-06 08:38:02', '06/1/2021 08:38:01 Don hang duoc tao.&#13;21-1-06 03:37:46 Thanh toan xong.&#13;', 'admin', '2021-01-06 15:37:47', '2.4', 'DH00170-21106083801', 'DANH SÁCH TẤM LÒNG VÀNG', '0', '2', '2021-01-06 08:38:01', '84000', '2021-01-06 15:37:47', '35000', '1', 'paid', '84000', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('223', 'anonymousUser', '2021-01-06 09:07:07', '06/1/2021 09:07:06 Don hang duoc tao.&#13;21-1-06 09:31:45 Thanh toan xong.&#13;', 'admin', '2021-01-06 09:31:46', '0.96', 'DH00171-21106090706', 'CÀ PHÊ CÔNG ĐOÀN', '0', '0.8', '2021-01-06 09:07:06', '76800', '2021-01-06 09:31:46', '80000', '1', 'paid', '76800', '1.2', '35', '6');
INSERT INTO `orders` VALUES ('224', 'anonymousUser', '2021-01-06 09:50:38', '06/1/2021 09:50:37 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 09:50:38', '3.11', 'DH00172-21106095037', 'NGUYỄN KHÁNH AN', '93300', '2.3', '2021-01-04 09:50:37', '0', null, '30000', '1', 'unpaid', '93300', '1.35', '19', '2');
INSERT INTO `orders` VALUES ('225', 'anonymousUser', '2021-01-06 10:41:40', '06/1/2021 10:41:39 Don hang duoc tao.&#13;21-1-06 03:57:58 Thanh toan xong.&#13;', 'admin', '2021-01-06 15:57:59', '1.58', 'DH00173-21106104139', 'VY LUẬN', '0', '1.98', '2021-01-06 10:41:39', '94800', '2021-01-06 15:57:59', '60000', '1', 'paid', '94800', '0.8', '35', '4');
INSERT INTO `orders` VALUES ('226', 'anonymousUser', '2021-01-06 10:57:19', '06/1/2021 10:57:18 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 10:57:19', '1.26', 'DH00174-21106105718', 'A HIẾU', '75600', '0.93', '2021-01-06 10:57:18', '0', null, '60000', '3', 'unpaid', '75600', '0.45', '35', '4');
INSERT INTO `orders` VALUES ('227', 'anonymousUser', '2021-01-06 12:58:19', '06/1/2021 12:58:18 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 12:58:19', '0.04', 'DH00175-21106125818', 'IN LẠI', '2000', '0.2', '2021-01-06 12:58:18', '0', null, '50000', '1', 'unpaid', '2000', '0.2', '31', '4');
INSERT INTO `orders` VALUES ('228', 'anonymousUser', '2021-01-06 12:58:40', '06/1/2021 12:58:40 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 12:58:40', '0.18', 'DH00176-21106125840', 'XE GỬI', '9000', '0.81', '2021-01-06 12:58:40', '0', null, '50000', '1', 'unpaid', '9000', '0.22', '31', '4');
INSERT INTO `orders` VALUES ('229', 'anonymousUser', '2021-01-06 13:18:55', '06/1/2021 13:18:55 Don hang duoc tao.&#13;21-1-06 04:34:59 Thanh toan xong.&#13;', 'admin', '2021-01-06 16:35:00', '1.68', 'DH00177-21106011855', 'HỘI NGHỊ TT THẠNH AN', '0', '1.4', '2021-01-06 13:18:55', '58800', '2021-01-06 16:35:00', '35000', '1', 'paid', '58800', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('230', 'anonymousUser', '2021-01-06 13:50:59', '06/1/2021 13:50:58 Don hang duoc tao.&#13;21-1-06 03:23:32 Thanh toan xong.&#13;', 'admin', '2021-01-06 15:23:33', '2.3', 'DH00178-21106015058', 'TRÍ MỰC', '0', '0.23', '2021-01-06 13:50:58', '103500', '2021-01-06 15:23:33', '45000', '50', 'paid', '103500', '0.2', '37', '4');
INSERT INTO `orders` VALUES ('231', 'anonymousUser', '2021-01-06 13:51:26', '06/1/2021 13:51:25 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 13:51:26', '0.15', 'DH00179-21106015125', 'BẢO TRINH', '9000', '0.38', '2021-01-06 13:51:25', '0', null, '60000', '1', 'unpaid', '9000', '0.4', '48', '6');
INSERT INTO `orders` VALUES ('232', 'anonymousUser', '2021-01-06 14:10:18', '06/1/2021 14:10:18 Don hang duoc tao.&#13;21-1-06 02:24:15 Thanh toan xong.&#13;', 'admin', '2021-01-06 14:24:16', '0.24', 'DH00180-21106021018', 'THANH TÂM', '0', '0.8', '2021-01-06 14:10:18', '19200', '2021-01-06 14:24:16', '80000', '2', 'paid', '19200', '0.15', '89', '6');
INSERT INTO `orders` VALUES ('233', 'anonymousUser', '2021-01-06 14:35:20', '06/1/2021 14:35:20 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 14:35:20', '15.75', 'DH00181-21106023520', 'THẦY THẠNH', '551250', '3.04', '2021-01-06 14:35:20', '0', null, '35000', '1', 'unpaid', '551250', '5.18', '35', '2');
INSERT INTO `orders` VALUES ('234', 'anonymousUser', '2021-01-06 14:59:44', '06/1/2021 14:59:44 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 14:59:44', '0.96', 'DH00182-21106025944', 'VIỆT TÔM', '57600', '0.8', '2021-01-06 14:59:44', '0', null, '60000', '2', 'unpaid', '57600', '0.6', '48', '6');
INSERT INTO `orders` VALUES ('235', 'anonymousUser', '2021-01-06 15:05:12', '06/1/2021 15:05:12 Don hang duoc tao.&#13;21-1-07 08:10:08 Thanh toan xong.&#13;', 'admin', '2021-01-07 08:10:08', '1.75', 'DH00183-21106030512', 'HÌNH GAME', '0', '1.75', '2021-01-06 15:05:12', '105000', '2021-01-07 08:10:08', '60000', '1', 'paid', '105000', '1', '35', '4');
INSERT INTO `orders` VALUES ('236', 'anonymousUser', '2021-01-06 15:09:08', '06/1/2021 15:09:07 Don hang duoc tao.&#13;21-1-07 04:32:59 Thanh toan xong.&#13;', 'admin', '2021-01-07 16:33:00', '1.76', 'DH00184-21106030907', 'TYTY', '0', '0.76', '2021-01-06 15:09:07', '140800', '2021-01-07 16:33:00', '80000', '2', 'paid', '140800', '1.16', '35', '6');
INSERT INTO `orders` VALUES ('237', 'anonymousUser', '2021-01-06 15:09:27', '06/1/2021 15:09:26 Don hang duoc tao.&#13;21-1-07 04:32:59 Thanh toan xong.&#13;', 'admin', '2021-01-07 16:33:00', '0.06', 'DH00185-21106030926', 'CẮT CHỮ TYTY', '0', '0.1', '2021-01-06 15:09:27', '4200', '2021-01-07 16:33:00', '70000', '1', 'paid', '4200', '0.6', '35', '18');
INSERT INTO `orders` VALUES ('238', 'anonymousUser', '2021-01-06 15:32:59', '06/1/2021 15:32:59 Don hang duoc tao.&#13;21-1-06 03:42:03 Thanh toan xong.&#13;', 'admin', '2021-01-06 15:42:03', '1.31', 'DH00186-21106033259', 'BÁNH BAO', '0', '2.15', '2021-01-06 15:32:59', '104800', '2021-01-06 15:42:03', '80000', '1', 'paid', '104800', '0.61', '35', '6');
INSERT INTO `orders` VALUES ('239', 'anonymousUser', '2021-01-06 16:01:13', '06/1/2021 16:01:12 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 16:01:13', '0.4', 'DH00187-21106040112', 'CẤM VÀO', '14000', '1', '2021-01-06 16:01:12', '0', null, '35000', '1', 'unpaid', '14000', '0.4', '35', '2');
INSERT INTO `orders` VALUES ('240', 'anonymousUser', '2021-01-06 16:12:08', '06/1/2021 16:12:08 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 16:12:08', '0.54', 'DH00188-21106041208', 'TRÀ SỮA', '32400', '1.2', '2021-01-06 16:12:08', '0', null, '60000', '1', 'unpaid', '32400', '0.45', '35', '4');
INSERT INTO `orders` VALUES ('241', 'anonymousUser', '2021-01-06 16:12:25', '06/1/2021 16:12:24 Don hang duoc tao.&#13;21-1-07 11:17:59 Thanh toan xong.&#13;', 'admin', '2021-01-07 11:18:00', '0.08', 'DH00189-21106041224', 'TRÀ SỮA', '0', '0.55', '2021-01-06 16:12:24', '8000', '2021-01-07 11:18:00', '100000', '1', 'paid', '8000', '0.15', '35', '7');
INSERT INTO `orders` VALUES ('242', 'anonymousUser', '2021-01-06 16:13:54', '06/1/2021 16:13:53 Don hang duoc tao.&#13;21-1-07 04:32:59 Thanh toan xong.&#13;', 'admin', '2021-01-07 16:32:59', '0.48', 'DH00190-21106041353', 'TYTY A4', '0', '0.2', '2021-01-06 16:13:53', '38400', '2021-01-07 16:32:59', '80000', '8', 'paid', '38400', '0.3', '35', '6');
INSERT INTO `orders` VALUES ('243', 'anonymousUser', '2021-01-06 16:50:13', '06/1/2021 16:50:12 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-06 16:50:13', '2.4', 'DH00191-21106045012', 'CÔNG AN THẠNH TIẾN', '84000', '2', '2021-01-06 16:50:12', '0', null, '35000', '1', 'unpaid', '84000', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('244', 'anonymousUser', '2021-01-07 07:48:49', '07/1/2021 07:48:49 Don hang duoc tao.&#13;21-1-07 04:47:41 Thanh toan xong.&#13;', 'admin', '2021-01-07 16:47:41', '1.44', 'DH00192-21107074849', 'LOGO NĂM THÁNH LONG THẠNH', '0', '1.2', '2021-01-07 07:48:49', '50400', '2021-01-07 16:47:41', '35000', '1', 'paid', '50400', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('245', 'anonymousUser', '2021-01-07 08:06:39', '07/1/2021 08:06:38 Don hang duoc tao.&#13;21-1-07 08:09:51 Thanh toan xong.&#13;', 'admin', '2021-01-07 08:09:51', '1.91', 'DH00193-21107080638', 'CÀ PHÊ TÒNG THANH', '0', '2.45', '2021-01-07 08:06:38', '85950', '2021-01-07 08:09:51', '45000', '1', 'paid', '85950', '0.78', '35', '3');
INSERT INTO `orders` VALUES ('246', 'anonymousUser', '2021-01-07 08:21:07', '07/1/2021 08:21:06 Don hang duoc tao.&#13;21-1-07 10:46:43 Thanh toan xong.&#13;', 'admin', '2021-01-07 10:46:44', '0.5', 'DH00194-21107082106', 'CẤM HÚT THUỐC', '0', '1.2', '2021-01-07 08:21:06', '30000', '2021-01-07 10:46:44', '60000', '1', 'paid', '30000', '0.42', '37', '6');
INSERT INTO `orders` VALUES ('247', 'anonymousUser', '2021-01-07 08:26:01', '07/1/2021 08:26:00 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 08:26:01', '0.47', 'DH00195-21107082600', 'THUẬN RẠP', '28200', '0.86', '2021-01-07 08:26:00', '0', null, '60000', '1', 'unpaid', '28200', '0.55', '35', '4');
INSERT INTO `orders` VALUES ('248', 'anonymousUser', '2021-01-07 08:31:31', '07/1/2021 08:31:30 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 08:31:31', '2.4', 'DH00196-21107083130', 'CMNM CẬU LINH', '84000', '3', '2021-01-07 08:31:30', '0', null, '35000', '2', 'unpaid', '84000', '0.4', '35', '2');
INSERT INTO `orders` VALUES ('249', 'anonymousUser', '2021-01-07 08:53:06', '07/1/2021 08:53:06 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 08:53:06', '9.6', 'DH00197-21107085306', 'CÁO PHÓ_CẦU NGUYỆN IN SẴN', '384000', '0.8', '2021-01-07 08:53:06', '0', null, '40000', '10', 'unpaid', '384000', '1.2', '24', '2');
INSERT INTO `orders` VALUES ('250', 'anonymousUser', '2021-01-07 09:23:21', '07/1/2021 09:23:21 Don hang duoc tao.&#13;21-1-07 02:52:24 Thanh toan xong.&#13;', 'admin', '2021-01-07 14:52:24', '2.4', 'DH00198-21107092321', 'HỘI NGHỊ CCVC', '0', '2', '2021-01-07 09:23:21', '72000', '2021-01-07 14:52:24', '30000', '1', 'paid', '72000', '1.2', '79', '2');
INSERT INTO `orders` VALUES ('251', 'anonymousUser', '2021-01-07 09:27:46', '07/1/2021 09:27:46 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 09:27:46', '0.06', 'DH00199-21107092746', 'NHÀ TÌNH THƯƠNG', '4200', '0.3', '2021-01-07 09:27:46', '0', null, '70000', '1', 'unpaid', '4200', '0.2', '48', '12');
INSERT INTO `orders` VALUES ('252', 'anonymousUser', '2021-01-07 09:38:52', '07/1/2021 09:38:51 Don hang duoc tao.&#13;21-1-07 10:46:43 Thanh toan xong.&#13;', 'admin', '2021-01-07 10:46:44', '0.15', 'DH00200-21107093851', 'CON VẬT', '0', '0.5', '2021-01-07 09:38:51', '9000', '2021-01-07 10:46:44', '60000', '1', 'paid', '9000', '0.3', '37', '6');
INSERT INTO `orders` VALUES ('253', 'anonymousUser', '2021-01-07 09:58:17', '07/1/2021 09:58:17 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 09:58:17', '1.92', 'DH00201-21107095817', 'KEM TÂN SG', '86400', '0.8', '2021-01-07 09:58:17', '0', null, '45000', '2', 'unpaid', '86400', '1.2', '1', '4');
INSERT INTO `orders` VALUES ('254', 'anonymousUser', '2021-01-07 10:07:45', '07/1/2021 10:07:44 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 10:07:45', '1.75', 'DH00202-21107100744', 'BÁN GỐI', '61250', '3.5', '2021-01-07 10:07:44', '0', null, '35000', '1', 'unpaid', '61250', '0.5', '35', '2');
INSERT INTO `orders` VALUES ('255', 'anonymousUser', '2021-01-07 10:22:40', '07/1/2021 10:22:40 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 10:22:40', '3', 'DH00203-21107102240', 'CHỮ THẬP ĐỎ', '60000', '3', '2021-01-07 10:22:40', '0', null, '20000', '1', 'unpaid', '60000', '1', '1', '1');
INSERT INTO `orders` VALUES ('256', 'anonymousUser', '2021-01-07 11:15:52', '07/1/2021 11:15:52 Don hang duoc tao.&#13;21-1-07 11:17:35 Thanh toan xong.&#13;', 'admin', '2021-01-07 11:17:35', '1.2', 'DH00204-21107111552', 'CHUNG TAY', '0', '3', '2021-01-07 11:15:52', '42000', '2021-01-07 11:17:35', '35000', '1', 'paid', '42000', '0.4', '35', '2');
INSERT INTO `orders` VALUES ('257', 'anonymousUser', '2021-01-07 14:35:42', '07/1/2021 14:35:41 Don hang duoc tao.&#13;21-1-07 02:36:04 Thanh toan xong.&#13;', 'admin', '2021-01-07 14:36:04', '1', 'DH00205-21107023541', 'BÚN RIÊU CUA', '0', '1', '2021-01-07 14:35:41', '35000', '2021-01-07 14:36:04', '35000', '2', 'paid', '35000', '0.5', '35', '2');
INSERT INTO `orders` VALUES ('258', 'anonymousUser', '2021-01-07 14:38:31', '07/1/2021 14:38:31 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '2.76', 'DH00206-21107023831', 'DUNG CHERRY', '0', '1.45', '2021-01-07 14:38:31', '138000', '2021-01-08 09:44:36', '50000', '2', 'paid', '138000', '0.95', '23', '4');
INSERT INTO `orders` VALUES ('259', 'anonymousUser', '2021-01-07 14:38:43', '07/1/2021 14:38:42 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '1.2', 'DH00207-21107023842', 'DECAL VI TÍNH', '0', '4', '2021-01-07 14:38:42', '60000', '2021-01-08 09:44:36', '50000', '1', 'paid', '60000', '0.3', '23', '4');
INSERT INTO `orders` VALUES ('260', 'anonymousUser', '2021-01-07 14:38:53', '07/1/2021 14:38:53 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '0.12', 'DH00208-21107023853', 'NHÃN CHAI NƯỚC', '0', '0.41', '2021-01-07 14:38:53', '6000', '2021-01-08 09:44:36', '50000', '1', 'paid', '6000', '0.29', '23', '4');
INSERT INTO `orders` VALUES ('262', 'anonymousUser', '2021-01-07 14:50:00', '07/1/2021 14:49:59 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 14:50:00', '0.56', 'DH00210-21107024959', 'TỦ BẾP', '44800', '0.91', '2021-01-07 14:49:59', '0', null, '80000', '1', 'unpaid', '44800', '0.61', '85', '12');
INSERT INTO `orders` VALUES ('263', 'anonymousUser', '2021-01-07 14:50:17', '07/1/2021 14:50:17 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 14:50:17', '0.37', 'DH00211-21107025017', 'TỦ BẾP', '29600', '0.75', '2021-01-07 14:50:17', '0', null, '80000', '1', 'unpaid', '29600', '0.49', '85', '12');
INSERT INTO `orders` VALUES ('264', 'anonymousUser', '2021-01-07 14:51:02', '07/1/2021 14:51:01 Don hang duoc tao.&#13;21-1-07 04:32:59 Thanh toan xong.&#13;', 'admin', '2021-01-07 16:32:59', '4', 'DH00212-21107025101', 'CMNM TYTY', '0', '2', '2021-01-07 14:51:01', '140000', '2021-01-07 16:32:59', '35000', '1', 'paid', '140000', '2', '35', '2');
INSERT INTO `orders` VALUES ('265', 'anonymousUser', '2021-01-07 14:52:27', '07/1/2021 14:52:26 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 14:52:27', '2.16', 'DH00212-21107025226', 'TỦ ÁO', '172800', '0.41', '2021-01-07 14:52:26', '0', null, '80000', '4', 'unpaid', '172800', '1.32', '85', '12');
INSERT INTO `orders` VALUES ('266', 'anonymousUser', '2021-01-07 15:13:10', '07/1/2021 15:13:10 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 15:13:10', '1.82', 'DH00213-21107031310', 'BÁN NÓN BẢO HIỂM', '109200', '0.76', '2021-01-07 15:13:10', '0', null, '60000', '2', 'unpaid', '109200', '1.2', '35', '4');
INSERT INTO `orders` VALUES ('267', 'anonymousUser', '2021-01-07 15:22:49', '07/1/2021 15:22:48 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 15:22:49', '2', 'DH00214-21107032248', 'HỘI NGHỊ', '60000', '2', '2021-01-07 15:22:48', '0', null, '30000', '1', 'unpaid', '60000', '1', '78', '2');
INSERT INTO `orders` VALUES ('268', 'anonymousUser', '2021-01-07 15:37:38', '07/1/2021 15:37:37 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 15:37:38', '6.93', 'DH00215-21107033737', 'CÔNG TRỌNG', '415800', '2.1', '2021-01-07 15:37:37', '0', null, '60000', '1', 'unpaid', '415800', '3.3', '48', '6');
INSERT INTO `orders` VALUES ('269', 'anonymousUser', '2021-01-07 15:37:49', '07/1/2021 15:37:48 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-07 15:37:49', '1.84', 'DH00216-21107033748', 'CÔNG TRỌNG', '110400', '0.8', '2021-01-07 15:37:48', '0', null, '60000', '1', 'unpaid', '110400', '2.3', '48', '6');
INSERT INTO `orders` VALUES ('270', 'admin', '2021-01-07 17:17:59', '07/1/2021 17:17:59 Don hang duoc tao.&#13;21-1-07 05:18:28 Thanh toan xong.&#13;', 'admin', '2021-01-07 17:18:28', '0.7', 'DH00217-21107051759', 'VINATEX', '0', '0.7', '2021-01-07 17:17:59', '42000', '2021-01-07 17:18:28', '60000', '1', 'paid', '42000', '1', '35', '4');
INSERT INTO `orders` VALUES ('271', 'anonymousUser', '2021-01-08 07:00:07', '08/1/2021 07:00:07 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 07:00:07', '1.77', 'DH00218-21108070007', 'TỦ 3 CÁNH', '123900', '0.38', '2021-01-08 07:00:07', '0', null, '70000', '3', 'unpaid', '123900', '1.55', '26', '12');
INSERT INTO `orders` VALUES ('272', 'anonymousUser', '2021-01-08 07:04:05', '08/1/2021 07:04:05 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 07:04:05', '8.88', 'DH00219-21108070405', 'TỦ 1.2M', '621600', '0.37', '2021-01-08 07:04:05', '0', null, '70000', '20', 'unpaid', '621600', '1.2', '26', '12');
INSERT INTO `orders` VALUES ('273', 'anonymousUser', '2021-01-08 07:04:30', '08/1/2021 07:04:29 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 07:04:30', '5.46', 'DH00220-21108070429', 'TỦ 1.3M', '382200', '0.42', '2021-01-08 07:04:29', '0', null, '70000', '10', 'unpaid', '382200', '1.3', '26', '12');
INSERT INTO `orders` VALUES ('274', 'anonymousUser', '2021-01-08 07:44:48', '08/1/2021 07:44:47 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '0.67', 'DH00221-21108074447', 'PHẠM CƯƠNG', '0', '0.58', '2021-01-08 07:44:48', '33500', '2021-01-08 09:44:36', '50000', '2', 'paid', '33500', '0.58', '23', '4');
INSERT INTO `orders` VALUES ('275', 'anonymousUser', '2021-01-08 07:44:58', '08/1/2021 07:44:57 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '0.42', 'DH00222-21108074457', 'PHẠM CƯƠNG', '0', '0.46', '2021-01-08 07:44:57', '21000', '2021-01-08 09:44:36', '50000', '2', 'paid', '21000', '0.46', '23', '4');
INSERT INTO `orders` VALUES ('276', 'anonymousUser', '2021-01-08 07:45:10', '08/1/2021 07:45:09 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '0.12', 'DH00223-21108074509', 'PHẠM CƯƠNG', '0', '0.41', '2021-01-08 07:45:09', '6000', '2021-01-08 09:44:36', '50000', '1', 'paid', '6000', '0.29', '23', '4');
INSERT INTO `orders` VALUES ('277', 'anonymousUser', '2021-01-08 07:46:14', '08/1/2021 07:46:13 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 07:46:14', '0.84', 'DH00224-21108074613', 'DECAL TRONG', '42000', '0.7', '2021-01-08 07:46:13', '0', null, '50000', '1', 'unpaid', '42000', '1.2', '31', '8');
INSERT INTO `orders` VALUES ('278', 'anonymousUser', '2021-01-08 07:47:19', '08/1/2021 07:47:18 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 07:47:19', '1.5', 'DH00225-21108074718', 'RỬA XE', '45000', '1', '2021-01-08 07:47:18', '0', null, '30000', '1', 'unpaid', '45000', '1.5', '48', '3');
INSERT INTO `orders` VALUES ('279', 'anonymousUser', '2021-01-08 07:47:50', '08/1/2021 07:47:49 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 07:47:50', '3.38', 'DH00226-21108074749', 'ANH NHỰT', '202800', '1.3', '2021-01-08 07:47:49', '0', null, '60000', '2', 'unpaid', '202800', '1.3', '48', '6');
INSERT INTO `orders` VALUES ('280', 'anonymousUser', '2021-01-08 08:34:59', '08/1/2021 08:34:59 Don hang duoc tao.&#13;21-1-08 11:00:14 Thanh toan xong.&#13;', 'admin', '2021-01-08 11:00:15', '1.5', 'DH00227-21108083459', 'THÔNG ĐIỆP 5K', '0', '0.5', '2021-01-08 08:34:59', '90000', '2021-01-08 11:00:15', '60000', '6', 'paid', '90000', '0.5', '35', '4');
INSERT INTO `orders` VALUES ('281', 'anonymousUser', '2021-01-08 08:46:20', '08/1/2021 08:46:20 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 08:46:20', '1.63', 'DH00228-21108084620', 'A LONG', '97800', '1.2', '2021-01-08 08:46:20', '0', null, '60000', '1', 'unpaid', '97800', '1.36', '35', '4');
INSERT INTO `orders` VALUES ('282', 'anonymousUser', '2021-01-08 09:07:35', '08/1/2021 09:07:34 Don hang duoc tao.&#13;21-1-08 08:28:02 Thanh toan xong.&#13;', 'admin', '2021-01-08 20:28:02', '0.45', 'DH00229-21108090734', 'A HÒA', '0', '0.84', '2021-01-08 09:07:34', '27000', '2021-01-08 20:28:02', '60000', '1', 'paid', '27000', '0.54', '35', '4');
INSERT INTO `orders` VALUES ('283', 'anonymousUser', '2021-01-08 09:07:50', '08/1/2021 09:07:49 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '0.45', 'DH00230-21108090749', 'CẦM TAY', '0', '0.87', '2021-01-08 09:07:49', '31500', '2021-01-08 09:44:36', '70000', '1', 'paid', '31500', '0.52', '23', '5');
INSERT INTO `orders` VALUES ('284', 'anonymousUser', '2021-01-08 09:21:03', '08/1/2021 09:21:03 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:36', '0.12', 'DH00231-21108092103', 'MAY DÉP', '0', '0.4', '2021-01-08 09:21:03', '6000', '2021-01-08 09:44:35', '50000', '1', 'paid', '6000', '0.3', '23', '4');
INSERT INTO `orders` VALUES ('285', 'anonymousUser', '2021-01-08 09:31:52', '08/1/2021 09:31:51 Don hang duoc tao.&#13;21-1-08 10:13:03 Thanh toan xong.&#13;', 'admin', '2021-01-08 10:13:03', '0.48', 'DH00232-21108093151', 'CCB TT THẠNH AN', '0', '0.8', '2021-01-08 09:31:52', '16800', '2021-01-08 10:13:03', '35000', '1', 'paid', '16800', '0.6', '35', '2');
INSERT INTO `orders` VALUES ('286', 'anonymousUser', '2021-01-08 09:36:22', '08/1/2021 09:36:21 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 09:36:22', '4', 'DH00233-21108093621', 'THÔNG ĐIỆP 5K', '140000', '2', '2021-01-08 09:36:22', '0', null, '35000', '1', 'unpaid', '140000', '2', '12', '2');
INSERT INTO `orders` VALUES ('287', 'anonymousUser', '2021-01-08 09:37:08', '08/1/2021 09:37:07 Don hang duoc tao.&#13;21-1-08 09:44:35 Thanh toan xong.&#13;', 'admin', '2021-01-08 09:44:35', '2', 'DH00234-21108093707', '2 HỘP CARD THANH AUDIO', '0', '1', '2021-01-08 09:37:07', '100000', '2021-01-08 09:44:35', '50000', '2', 'paid', '100000', '1', '23', '4');
INSERT INTO `orders` VALUES ('288', 'anonymousUser', '2021-01-08 09:50:41', '08/1/2021 09:50:41 Don hang duoc tao.&#13;21-1-08 10:12:49 Thanh toan xong.&#13;', 'admin', '2021-01-08 10:12:49', '1.92', 'DH00235-21108095041', 'A VŨ', '0', '0.8', '2021-01-08 09:50:41', '67200', '2021-01-08 10:12:49', '35000', '2', 'paid', '67200', '1.2', '35', '2');
INSERT INTO `orders` VALUES ('289', 'anonymousUser', '2021-01-08 10:01:49', '08/1/2021 10:01:48 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 10:01:49', '0.45', 'DH00236-21108100148', 'ĐIỆN TỬ KHANG', '22500', '0.89', '2021-01-08 10:01:48', '0', null, '50000', '1', 'unpaid', '22500', '0.5', '78', '4');
INSERT INTO `orders` VALUES ('290', 'anonymousUser', '2021-01-08 10:19:38', '08/1/2021 10:19:37 Don hang duoc tao.&#13;21-1-08 08:28:02 Thanh toan xong.&#13;', 'admin', '2021-01-08 20:28:02', '0.28', 'DH00237-21108101937', 'KÍNH NHỚ TỔ TIÊN', '0', '1.4', '2021-01-08 10:19:37', '9800', '2021-01-08 20:28:02', '35000', '1', 'paid', '9800', '0.2', '35', '2');
INSERT INTO `orders` VALUES ('291', 'anonymousUser', '2021-01-08 10:25:06', '08/1/2021 10:25:05 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 10:25:06', '1.18', 'DH00238-21108102505', 'TƯỜNG LAM', '70800', '1.42', '2021-01-08 10:25:05', '0', null, '60000', '1', 'unpaid', '70800', '0.83', '35', '4');
INSERT INTO `orders` VALUES ('292', 'anonymousUser', '2021-01-08 10:30:11', '08/1/2021 10:30:11 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 10:30:11', '0.91', 'DH00239-21108103011', 'A VINH', '54600', '0.84', '2021-01-08 10:30:11', '0', null, '60000', '2', 'unpaid', '54600', '0.54', '35', '4');
INSERT INTO `orders` VALUES ('293', 'anonymousUser', '2021-01-08 10:39:45', '08/1/2021 10:39:45 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 10:39:45', '0.1', 'DH00240-21108103945', 'A QUỐC', '6000', '0.48', '2021-01-08 10:39:45', '0', null, '60000', '1', 'unpaid', '6000', '0.2', '35', '4');
INSERT INTO `orders` VALUES ('294', 'anonymousUser', '2021-01-08 10:48:55', '08/1/2021 10:48:54 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 10:48:55', '13.32', 'DH00241-21108104854', 'CHÚC MỪNG NĂM MỚI', '306360', '14.8', '2021-01-08 10:48:54', '0', null, '23000', '1', 'unpaid', '306360', '0.9', '2', '2');
INSERT INTO `orders` VALUES ('295', 'anonymousUser', '2021-01-08 10:49:05', '08/1/2021 10:49:05 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 10:49:05', '9', 'DH00242-21108104905', 'CHÚC MỪNG NĂM MỚI', '207000', '10', '2021-01-08 10:49:05', '0', null, '23000', '1', 'unpaid', '207000', '0.9', '2', '2');
INSERT INTO `orders` VALUES ('296', 'anonymousUser', '2021-01-08 10:52:03', '08/1/2021 10:52:03 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 10:52:03', '2.5', 'DH00243-21108105203', '2 HỘP CARD NẤU ĂN KIM OANH', '150000', '1', '2021-01-08 10:52:03', '0', null, '60000', '1', 'unpaid', '150000', '2.5', '35', '4');
INSERT INTO `orders` VALUES ('297', 'anonymousUser', '2021-01-08 11:35:14', '08/1/2021 11:35:13 Don hang duoc tao.&#13;21-1-08 12:00:59 Thanh toan xong.&#13;', 'admin', '2021-01-08 12:01:00', '1.16', 'DH00244-21108113513', 'HOÀI THƯƠNG', '0', '0.63', '2021-01-08 11:35:13', '69600', '2021-01-08 12:01:00', '60000', '4', 'paid', '69600', '0.46', '35', '4');
INSERT INTO `orders` VALUES ('298', 'anonymousUser', '2021-01-08 11:35:22', '08/1/2021 11:35:22 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 11:35:22', '1.27', 'DH00245-21108113522', 'A LƯƠNG', '76200', '0.83', '2021-01-08 11:35:22', '0', null, '60000', '3', 'unpaid', '76200', '0.51', '35', '4');
INSERT INTO `orders` VALUES ('299', 'anonymousUser', '2021-01-08 13:06:52', '08/1/2021 13:06:51 Don hang duoc tao.&#13;', 'admin', '2021-01-08 13:51:03', '5', 'DH00246-21108010651', 'CHẢ LỤA THIÊN THANH', '300000', '1', '2021-01-07 13:06:51', '0', null, '60000', '5', 'unpaid', '300000', '1', '35', '4');
INSERT INTO `orders` VALUES ('300', 'anonymousUser', '2021-01-08 14:29:11', '08/1/2021 14:29:10 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 14:29:11', '1.92', 'DH00247-21108022910', 'BẢNG HIỆU CHẤN', '48000', '0.8', '2021-01-08 14:29:10', '0', null, '25000', '2', 'unpaid', '48000', '1.2', '1', '2');
INSERT INTO `orders` VALUES ('301', 'anonymousUser', '2021-01-08 14:31:29', '08/1/2021 14:31:29 Don hang duoc tao.&#13;', 'admin', '2021-01-08 14:35:35', '2.16', 'DH00248-21108023129', 'HƯƠNG DỪA', '140400', '0.9', '2021-01-08 14:31:29', '0', null, '65000', '2', 'unpaid', '140400', '1.2', '96', '6');
INSERT INTO `orders` VALUES ('302', 'anonymousUser', '2021-01-08 14:31:37', '08/1/2021 14:31:37 Don hang duoc tao.&#13;', 'admin', '2021-01-08 14:35:13', '0.48', 'DH00249-21108023137', 'HƯƠNG DỪA', '31200', '0.6', '2021-01-08 14:31:37', '0', null, '65000', '2', 'unpaid', '31200', '0.4', '96', '6');
INSERT INTO `orders` VALUES ('303', 'anonymousUser', '2021-01-08 14:31:47', '08/1/2021 14:31:47 Don hang duoc tao.&#13;', 'admin', '2021-01-08 14:35:00', '4.8', 'DH00250-21108023147', 'HƯƠNG DỪA', '158400', '4', '2021-01-08 14:31:47', '0', null, '33000', '2', 'unpaid', '158400', '0.6', '96', '3');
INSERT INTO `orders` VALUES ('305', 'anonymousUser', '2021-01-08 14:32:18', '08/1/2021 14:32:17 Don hang duoc tao.&#13;', 'admin', '2021-01-08 14:36:58', '16.2', 'DH00252-21108023217', 'HƯƠNG DỪA', '534600', '3', '2021-01-08 14:32:17', '0', null, '33000', '3', 'unpaid', '534600', '1.8', '96', '3');
INSERT INTO `orders` VALUES ('306', 'anonymousUser', '2021-01-08 14:43:32', '08/1/2021 14:43:32 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 14:43:32', '192', 'DH00252-21108024332', 'PANO THAY THÁNG 1', '4800000', '4', '2021-01-08 14:43:32', '0', null, '25000', '20', 'unpaid', '4800000', '2.4', '1', '2');
INSERT INTO `orders` VALUES ('307', 'anonymousUser', '2021-01-08 14:54:48', '08/1/2021 14:54:47 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 14:54:48', '3.87', 'DH00253-21108025447', 'THUẬN PHÁT', '174150', '4.3', '2021-01-08 14:54:47', '0', null, '45000', '1', 'unpaid', '174150', '0.9', '1', '4');
INSERT INTO `orders` VALUES ('308', 'anonymousUser', '2021-01-08 14:54:59', '08/1/2021 14:54:59 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 14:54:59', '2.8', 'DH00254-21108025459', 'THUẬN PHÁT', '126000', '4.3', '2021-01-08 14:54:59', '0', null, '45000', '1', 'unpaid', '126000', '0.65', '1', '4');
INSERT INTO `orders` VALUES ('309', 'anonymousUser', '2021-01-08 14:55:08', '08/1/2021 14:55:07 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 14:55:08', '2.95', 'DH00255-21108025507', 'THUẬN PHÁT', '132750', '2.5', '2021-01-08 14:55:07', '0', null, '45000', '2', 'unpaid', '132750', '0.59', '1', '4');
INSERT INTO `orders` VALUES ('310', 'anonymousUser', '2021-01-08 14:55:24', '08/1/2021 14:55:23 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 14:55:24', '1.92', 'DH00256-21108025523', 'THUẬN PHÁT', '48000', '0.8', '2021-01-08 14:55:23', '0', null, '25000', '2', 'unpaid', '48000', '1.2', '1', '2');
INSERT INTO `orders` VALUES ('311', 'anonymousUser', '2021-01-08 14:56:13', '08/1/2021 14:56:12 Don hang duoc tao.&#13;', 'admin', '2021-01-08 15:37:15', '3.44', 'DH00257-21108025612', 'THUẬN PHÁT', '68800', '4.3', '2021-01-08 14:56:12', '0', null, '20000', '1', 'unpaid', '68800', '0.8', '1', '1');
INSERT INTO `orders` VALUES ('312', 'anonymousUser', '2021-01-08 15:05:19', '08/1/2021 15:05:18 Don hang duoc tao.&#13;21-1-08 03:05:36 Thanh toan xong.&#13;', 'admin', '2021-01-08 15:05:36', '0.52', 'DH00258-21108030518', 'CHÚ MINH', '0', '1.03', '2021-01-08 15:05:18', '31200', '2021-01-08 15:05:36', '60000', '1', 'paid', '31200', '0.5', '35', '4');
INSERT INTO `orders` VALUES ('313', 'anonymousUser', '2021-01-08 15:43:20', '08/1/2021 15:43:19 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 15:43:20', '1.65', 'DH00259-21108034319', 'CHÀO MỪNG QUÝ KHÁCH', '49500', '3.3', '2021-01-08 15:43:19', '0', null, '30000', '1', 'unpaid', '49500', '0.5', '23', '2');
INSERT INTO `orders` VALUES ('314', 'anonymousUser', '2021-01-08 16:11:01', '08/1/2021 16:11:00 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 16:11:01', '3.78', 'DH00260-21108041100', 'VÉ HỘI CHỢ', '132300', '0.07', '2021-01-08 16:11:00', '0', null, '35000', '1800', 'unpaid', '132300', '0.03', '35', '1');
INSERT INTO `orders` VALUES ('315', 'anonymousUser', '2021-01-08 17:38:32', '08/1/2021 17:38:31 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 17:38:32', '2.47', 'DH00261-21108053831', 'VỰA GẠO HÙNG PHÚC', '197600', '1.45', '2021-01-08 17:38:31', '0', null, '80000', '1', 'unpaid', '197600', '1.7', '35', '6');
INSERT INTO `orders` VALUES ('316', 'anonymousUser', '2021-01-08 17:38:45', '08/1/2021 17:38:44 Don hang duoc tao.&#13;', 'anonymousUser', '2021-01-08 17:38:45', '1.57', 'DH00262-21108053844', 'VỰA GẠO HÙNG PHÚC', '125600', '1.23', '2021-01-08 17:38:45', '0', null, '80000', '1', 'unpaid', '125600', '1.28', '35', '6');

-- ----------------------------
-- Table structure for pricelist
-- ----------------------------
DROP TABLE IF EXISTS `pricelist`;
CREATE TABLE `pricelist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `customertype_id` bigint DEFAULT NULL,
  `item_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fokau4goqumb31xeko1fi4f2t` (`customertype_id`),
  KEY `FK_78tj6ecameh2rb0hu4s7ot31v` (`item_id`),
  CONSTRAINT `FK_78tj6ecameh2rb0hu4s7ot31v` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_fokau4goqumb31xeko1fi4f2t` FOREIGN KEY (`customertype_id`) REFERENCES `customertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of pricelist
-- ----------------------------
INSERT INTO `pricelist` VALUES ('1', null, null, null, null, null, '25000', '4', '2');
INSERT INTO `pricelist` VALUES ('2', null, null, null, null, null, '20000', '4', '1');
INSERT INTO `pricelist` VALUES ('3', null, null, null, null, null, '50000', '1', '18');
INSERT INTO `pricelist` VALUES ('4', null, null, null, null, null, '12000', '1', '17');
INSERT INTO `pricelist` VALUES ('5', null, null, null, null, null, '19000', '1', '16');
INSERT INTO `pricelist` VALUES ('6', null, null, null, null, null, '12000', '1', '15');
INSERT INTO `pricelist` VALUES ('7', null, null, null, null, null, '60000', '1', '14');
INSERT INTO `pricelist` VALUES ('8', null, null, null, 'admin', '2021-01-01 10:51:52', '45000', '1', '13');
INSERT INTO `pricelist` VALUES ('9', null, null, null, 'admin', '2021-01-01 10:51:38', '80000', '1', '12');
INSERT INTO `pricelist` VALUES ('10', null, null, null, null, null, '90000', '1', '11');
INSERT INTO `pricelist` VALUES ('11', null, null, null, 'admin', '2021-01-01 10:51:19', '70000', '1', '10');
INSERT INTO `pricelist` VALUES ('12', null, null, null, null, null, '70000', '1', '9');
INSERT INTO `pricelist` VALUES ('13', null, null, null, 'admin', '2021-01-01 10:51:08', '50000', '1', '8');
INSERT INTO `pricelist` VALUES ('14', null, null, null, null, null, '90000', '1', '7');
INSERT INTO `pricelist` VALUES ('15', null, null, null, 'admin', '2021-01-01 10:50:55', '70000', '1', '6');
INSERT INTO `pricelist` VALUES ('16', null, null, null, null, null, '70000', '1', '5');
INSERT INTO `pricelist` VALUES ('17', null, null, null, 'admin', '2021-01-01 10:50:18', '50000', '1', '4');
INSERT INTO `pricelist` VALUES ('18', null, null, null, 'admin', '2021-01-01 10:49:11', '27000', '1', '3');
INSERT INTO `pricelist` VALUES ('19', null, null, null, 'admin', '2021-01-01 10:49:03', '23000', '1', '2');
INSERT INTO `pricelist` VALUES ('20', null, null, null, 'admin', '2021-01-01 10:48:46', '23000', '1', '1');
INSERT INTO `pricelist` VALUES ('21', null, null, null, null, null, '30000', '4', '3');
INSERT INTO `pricelist` VALUES ('22', null, null, null, null, null, '45000', '4', '4');
INSERT INTO `pricelist` VALUES ('23', null, null, null, null, null, '70000', '4', '5');
INSERT INTO `pricelist` VALUES ('24', null, null, null, null, null, '60000', '4', '6');
INSERT INTO `pricelist` VALUES ('25', null, null, null, null, null, '90000', '4', '7');
INSERT INTO `pricelist` VALUES ('26', null, null, null, null, null, '45000', '4', '8');
INSERT INTO `pricelist` VALUES ('27', null, null, null, null, null, '70000', '4', '9');
INSERT INTO `pricelist` VALUES ('28', null, null, null, null, null, '60000', '4', '10');
INSERT INTO `pricelist` VALUES ('29', null, null, null, null, null, '90000', '4', '11');
INSERT INTO `pricelist` VALUES ('30', null, null, null, null, null, '70000', '4', '12');
INSERT INTO `pricelist` VALUES ('31', null, null, null, null, null, '45000', '4', '13');
INSERT INTO `pricelist` VALUES ('32', null, null, null, null, null, '60000', '4', '14');
INSERT INTO `pricelist` VALUES ('33', null, null, null, null, null, '12000', '4', '15');
INSERT INTO `pricelist` VALUES ('34', null, null, null, null, null, '20000', '4', '16');
INSERT INTO `pricelist` VALUES ('35', null, null, null, null, null, '12000', '4', '17');
INSERT INTO `pricelist` VALUES ('36', null, null, null, null, null, '50000', '4', '18');
INSERT INTO `pricelist` VALUES ('37', null, null, null, null, null, '23000', '3', '1');
INSERT INTO `pricelist` VALUES ('38', null, null, null, null, null, '23000', '3', '2');
INSERT INTO `pricelist` VALUES ('39', null, null, null, null, null, '30000', '3', '3');
INSERT INTO `pricelist` VALUES ('40', null, null, null, null, null, '45000', '3', '4');
INSERT INTO `pricelist` VALUES ('41', null, null, null, null, null, '70000', '3', '5');
INSERT INTO `pricelist` VALUES ('42', null, null, null, null, null, '60000', '3', '6');
INSERT INTO `pricelist` VALUES ('43', null, null, null, null, null, '80000', '3', '7');
INSERT INTO `pricelist` VALUES ('44', null, null, null, null, null, '45000', '3', '8');
INSERT INTO `pricelist` VALUES ('45', null, null, null, null, null, '70000', '3', '9');
INSERT INTO `pricelist` VALUES ('46', null, null, null, null, null, '60000', '3', '10');
INSERT INTO `pricelist` VALUES ('47', null, null, null, null, null, '80000', '3', '11');
INSERT INTO `pricelist` VALUES ('48', null, null, null, null, null, '70000', '3', '12');
INSERT INTO `pricelist` VALUES ('49', null, null, null, null, null, '45000', '3', '13');
INSERT INTO `pricelist` VALUES ('50', null, null, null, null, null, '60000', '3', '14');
INSERT INTO `pricelist` VALUES ('51', null, null, null, null, null, '12000', '3', '15');
INSERT INTO `pricelist` VALUES ('52', null, null, null, null, null, '19000', '3', '16');
INSERT INTO `pricelist` VALUES ('53', null, null, null, null, null, '12000', '3', '17');
INSERT INTO `pricelist` VALUES ('54', null, null, null, null, null, '50000', '3', '18');
INSERT INTO `pricelist` VALUES ('55', null, null, null, null, null, '20000', '3', '19');
INSERT INTO `pricelist` VALUES ('56', null, null, null, null, null, '23000', '2', '1');
INSERT INTO `pricelist` VALUES ('57', null, null, null, null, null, '23000', '2', '2');
INSERT INTO `pricelist` VALUES ('58', null, null, null, null, null, '33000', '2', '3');
INSERT INTO `pricelist` VALUES ('59', null, null, null, null, null, '45000', '2', '4');
INSERT INTO `pricelist` VALUES ('60', null, null, null, null, null, '70000', '2', '5');
INSERT INTO `pricelist` VALUES ('61', null, null, null, null, null, '65000', '2', '6');
INSERT INTO `pricelist` VALUES ('62', null, null, null, null, null, '90000', '2', '7');
INSERT INTO `pricelist` VALUES ('63', null, null, null, null, null, '45000', '2', '8');
INSERT INTO `pricelist` VALUES ('64', null, null, null, null, null, '70000', '2', '9');
INSERT INTO `pricelist` VALUES ('65', null, null, null, null, null, '65000', '2', '10');
INSERT INTO `pricelist` VALUES ('66', null, null, null, null, null, '90000', '2', '11');
INSERT INTO `pricelist` VALUES ('67', null, null, null, null, null, '80000', '2', '12');
INSERT INTO `pricelist` VALUES ('68', null, null, null, null, null, '45000', '2', '13');
INSERT INTO `pricelist` VALUES ('69', null, null, null, null, null, '65000', '2', '14');
INSERT INTO `pricelist` VALUES ('70', null, null, null, null, null, '12000', '2', '15');
INSERT INTO `pricelist` VALUES ('71', null, null, null, null, null, '20000', '2', '16');
INSERT INTO `pricelist` VALUES ('72', null, null, null, null, null, '12000', '2', '17');
INSERT INTO `pricelist` VALUES ('73', null, null, null, null, null, '50000', '2', '18');
INSERT INTO `pricelist` VALUES ('74', null, null, null, null, null, '15000', '2', '19');
INSERT INTO `pricelist` VALUES ('75', null, null, null, null, null, '27000', '5', '1');
INSERT INTO `pricelist` VALUES ('76', null, null, null, null, null, '27000', '5', '2');
INSERT INTO `pricelist` VALUES ('77', null, null, null, null, null, '37000', '5', '3');
INSERT INTO `pricelist` VALUES ('78', null, null, null, null, null, '50000', '5', '4');
INSERT INTO `pricelist` VALUES ('79', null, null, null, 'admin', '2021-01-01 00:25:18', '70000', '5', '5');
INSERT INTO `pricelist` VALUES ('80', null, null, null, null, null, '70000', '5', '6');
INSERT INTO `pricelist` VALUES ('81', null, null, null, 'admin', '2021-01-01 00:22:53', '90000', '5', '7');
INSERT INTO `pricelist` VALUES ('82', null, null, null, null, null, '50000', '5', '8');
INSERT INTO `pricelist` VALUES ('83', null, null, null, 'admin', '2021-01-01 00:24:41', '70000', '5', '9');
INSERT INTO `pricelist` VALUES ('84', null, null, null, null, null, '70000', '5', '10');
INSERT INTO `pricelist` VALUES ('85', null, null, null, 'admin', '2021-01-01 00:22:40', '90000', '5', '11');
INSERT INTO `pricelist` VALUES ('86', null, null, null, null, null, '80000', '5', '12');
INSERT INTO `pricelist` VALUES ('87', null, null, null, null, null, '50000', '5', '13');
INSERT INTO `pricelist` VALUES ('88', null, null, null, null, null, '70000', '5', '14');
INSERT INTO `pricelist` VALUES ('89', null, null, null, null, null, '15000', '5', '15');
INSERT INTO `pricelist` VALUES ('90', null, null, null, null, null, '20000', '5', '16');
INSERT INTO `pricelist` VALUES ('91', null, null, null, null, null, '12000', '5', '17');
INSERT INTO `pricelist` VALUES ('92', null, null, null, null, null, '50000', '5', '18');
INSERT INTO `pricelist` VALUES ('93', null, null, null, null, null, '20000', '5', '19');
INSERT INTO `pricelist` VALUES ('94', null, null, null, null, null, '30000', '6', '1');
INSERT INTO `pricelist` VALUES ('95', null, null, null, null, null, '30000', '6', '2');
INSERT INTO `pricelist` VALUES ('96', null, null, null, null, null, '40000', '6', '3');
INSERT INTO `pricelist` VALUES ('97', null, null, null, null, null, '50000', '6', '4');
INSERT INTO `pricelist` VALUES ('98', null, null, null, null, null, '70000', '6', '5');
INSERT INTO `pricelist` VALUES ('99', null, null, null, null, null, '70000', '6', '6');
INSERT INTO `pricelist` VALUES ('100', null, null, null, null, null, '90000', '6', '7');
INSERT INTO `pricelist` VALUES ('101', null, null, null, null, null, '50000', '6', '8');
INSERT INTO `pricelist` VALUES ('102', null, null, null, null, null, '70000', '6', '9');
INSERT INTO `pricelist` VALUES ('103', null, null, null, null, null, '70000', '6', '10');
INSERT INTO `pricelist` VALUES ('104', null, null, null, null, null, '90000', '6', '11');
INSERT INTO `pricelist` VALUES ('105', null, null, null, null, null, '80000', '6', '12');
INSERT INTO `pricelist` VALUES ('106', null, null, null, null, null, '50000', '6', '13');
INSERT INTO `pricelist` VALUES ('107', null, null, null, null, null, '70000', '6', '14');
INSERT INTO `pricelist` VALUES ('108', null, null, null, null, null, '15000', '6', '15');
INSERT INTO `pricelist` VALUES ('109', null, null, null, null, null, '20000', '6', '16');
INSERT INTO `pricelist` VALUES ('110', null, null, null, null, null, '12000', '6', '17');
INSERT INTO `pricelist` VALUES ('111', null, null, null, null, null, '60000', '6', '18');
INSERT INTO `pricelist` VALUES ('112', null, null, null, null, null, '20000', '6', '19');
INSERT INTO `pricelist` VALUES ('113', null, null, null, null, null, '35000', '7', '1');
INSERT INTO `pricelist` VALUES ('114', null, null, null, null, null, '35000', '7', '2');
INSERT INTO `pricelist` VALUES ('115', null, null, null, null, null, '45000', '7', '3');
INSERT INTO `pricelist` VALUES ('116', null, null, null, null, null, '60000', '7', '4');
INSERT INTO `pricelist` VALUES ('117', null, null, null, 'admin', '2021-01-01 00:10:00', '80000', '7', '5');
INSERT INTO `pricelist` VALUES ('118', null, null, null, null, null, '80000', '7', '6');
INSERT INTO `pricelist` VALUES ('119', null, null, null, 'admin', '2021-01-01 00:12:20', '100000', '7', '7');
INSERT INTO `pricelist` VALUES ('120', null, null, null, null, null, '60000', '7', '8');
INSERT INTO `pricelist` VALUES ('121', null, null, null, 'admin', '2021-01-01 00:13:28', '80000', '7', '9');
INSERT INTO `pricelist` VALUES ('122', null, null, null, null, null, '80000', '7', '10');
INSERT INTO `pricelist` VALUES ('123', null, null, null, 'admin', '2021-01-01 00:14:17', '100000', '7', '11');
INSERT INTO `pricelist` VALUES ('124', null, null, null, null, null, '90000', '7', '12');
INSERT INTO `pricelist` VALUES ('125', null, null, null, null, null, '60000', '7', '13');
INSERT INTO `pricelist` VALUES ('126', null, null, null, null, null, '80000', '7', '14');
INSERT INTO `pricelist` VALUES ('127', null, null, null, null, null, '17000', '7', '15');
INSERT INTO `pricelist` VALUES ('128', null, null, null, null, null, '25000', '7', '16');
INSERT INTO `pricelist` VALUES ('129', null, null, null, null, null, '15000', '7', '17');
INSERT INTO `pricelist` VALUES ('130', null, null, null, null, null, '70000', '7', '18');
INSERT INTO `pricelist` VALUES ('131', null, null, null, null, null, '25000', '7', '19');
INSERT INTO `pricelist` VALUES ('132', null, null, null, null, null, '35000', '8', '1');
INSERT INTO `pricelist` VALUES ('133', null, null, null, null, null, '40000', '8', '2');
INSERT INTO `pricelist` VALUES ('134', null, null, null, 'admin', '2021-01-01 00:15:37', '45000', '8', '3');
INSERT INTO `pricelist` VALUES ('135', null, null, null, null, null, '60000', '8', '4');
INSERT INTO `pricelist` VALUES ('136', null, null, null, null, null, '90000', '8', '5');
INSERT INTO `pricelist` VALUES ('137', null, null, null, null, null, '80000', '8', '6');
INSERT INTO `pricelist` VALUES ('138', null, null, null, null, null, '110000', '8', '7');
INSERT INTO `pricelist` VALUES ('139', null, null, null, null, null, '60000', '8', '8');
INSERT INTO `pricelist` VALUES ('140', null, null, null, null, null, '90000', '8', '9');
INSERT INTO `pricelist` VALUES ('141', null, null, null, null, null, '80000', '8', '10');
INSERT INTO `pricelist` VALUES ('142', null, null, null, null, null, '110000', '8', '11');
INSERT INTO `pricelist` VALUES ('143', null, null, null, null, null, '90000', '8', '12');
INSERT INTO `pricelist` VALUES ('144', null, null, null, null, null, '60000', '8', '13');
INSERT INTO `pricelist` VALUES ('145', null, null, null, null, null, '80000', '8', '14');
INSERT INTO `pricelist` VALUES ('146', null, null, null, null, null, '20000', '8', '15');
INSERT INTO `pricelist` VALUES ('147', null, null, null, null, null, '25000', '8', '16');
INSERT INTO `pricelist` VALUES ('148', null, null, null, null, null, '15000', '8', '17');
INSERT INTO `pricelist` VALUES ('149', null, null, null, null, null, '60000', '8', '18');
INSERT INTO `pricelist` VALUES ('150', null, null, null, null, null, '25000', '8', '19');
INSERT INTO `pricelist` VALUES ('151', null, null, null, null, null, '25000', '9', '1');
INSERT INTO `pricelist` VALUES ('152', null, null, null, null, null, '25000', '9', '2');
INSERT INTO `pricelist` VALUES ('153', null, null, null, null, null, '33000', '9', '3');
INSERT INTO `pricelist` VALUES ('154', null, null, null, null, null, '50000', '9', '4');
INSERT INTO `pricelist` VALUES ('155', null, null, null, null, null, '80000', '9', '5');
INSERT INTO `pricelist` VALUES ('156', null, null, null, null, null, '70000', '9', '6');
INSERT INTO `pricelist` VALUES ('157', null, null, null, null, null, '100000', '9', '7');
INSERT INTO `pricelist` VALUES ('158', null, null, null, null, null, '50000', '9', '8');
INSERT INTO `pricelist` VALUES ('159', null, null, null, null, null, '80000', '9', '9');
INSERT INTO `pricelist` VALUES ('160', null, null, null, null, null, '70000', '9', '10');
INSERT INTO `pricelist` VALUES ('161', null, null, null, null, null, '100000', '9', '11');
INSERT INTO `pricelist` VALUES ('162', null, null, null, null, null, '80000', '9', '12');
INSERT INTO `pricelist` VALUES ('163', null, null, null, null, null, '50000', '9', '13');
INSERT INTO `pricelist` VALUES ('164', null, null, null, null, null, '70000', '9', '14');
INSERT INTO `pricelist` VALUES ('165', null, null, null, null, null, '15000', '9', '15');
INSERT INTO `pricelist` VALUES ('166', null, null, null, null, null, '25000', '9', '16');
INSERT INTO `pricelist` VALUES ('167', null, null, null, null, null, '12000', '9', '17');
INSERT INTO `pricelist` VALUES ('168', null, null, null, null, null, '60000', '9', '18');
INSERT INTO `pricelist` VALUES ('169', null, null, null, null, null, '20000', '9', '19');
INSERT INTO `pricelist` VALUES ('170', null, null, null, null, null, '60000', '3', '20');
INSERT INTO `pricelist` VALUES ('171', null, null, null, null, null, '70000', '2', '20');
INSERT INTO `pricelist` VALUES ('172', null, null, null, null, null, '70000', '5', '20');
INSERT INTO `pricelist` VALUES ('173', null, null, null, null, null, '70000', '6', '20');
INSERT INTO `pricelist` VALUES ('174', null, null, null, null, null, '80000', '7', '20');
INSERT INTO `pricelist` VALUES ('175', null, null, null, null, null, '80000', '8', '20');
INSERT INTO `pricelist` VALUES ('176', null, null, null, null, null, '10000', '8', '21');
INSERT INTO `pricelist` VALUES ('177', null, null, null, null, null, '50000', '6', '22');
INSERT INTO `pricelist` VALUES ('178', null, null, null, 'admin', '2021-01-01 00:19:38', '100000', '6', '23');
INSERT INTO `pricelist` VALUES ('179', null, null, null, null, null, '250000', '6', '24');
INSERT INTO `pricelist` VALUES ('180', null, null, null, null, null, '35000', '3', '25');
INSERT INTO `pricelist` VALUES ('181', null, null, null, null, null, '66000', '3', '26');
INSERT INTO `pricelist` VALUES ('182', null, null, null, null, null, '80000', '7', '22');
INSERT INTO `pricelist` VALUES ('183', null, null, null, null, null, '150000', '7', '23');
INSERT INTO `pricelist` VALUES ('184', null, null, null, null, null, '250000', '7', '24');
INSERT INTO `pricelist` VALUES ('185', null, null, null, null, null, '300', '7', '28');
INSERT INTO `pricelist` VALUES ('186', null, null, null, null, null, '450', '7', '27');
INSERT INTO `pricelist` VALUES ('187', null, null, null, null, null, '90000', '10', '5');
INSERT INTO `pricelist` VALUES ('188', null, null, null, null, null, '4600000', '6', '29');
INSERT INTO `pricelist` VALUES ('189', null, null, null, null, null, '50000', '6', '30');
INSERT INTO `pricelist` VALUES ('190', null, null, null, null, null, '100000', '11', '7');
INSERT INTO `pricelist` VALUES ('191', null, null, null, null, null, '120000', '11', '31');
INSERT INTO `pricelist` VALUES ('192', null, null, null, null, null, '60000', '11', '4');
INSERT INTO `pricelist` VALUES ('193', null, null, null, null, null, '80000', '11', '6');
INSERT INTO `pricelist` VALUES ('194', null, null, null, null, null, '20000', '11', '32');
INSERT INTO `pricelist` VALUES ('195', null, null, null, null, null, '60000', '1', '20');
INSERT INTO `pricelist` VALUES ('196', null, null, null, null, null, '50000', '2', '22');
INSERT INTO `pricelist` VALUES ('197', null, null, null, null, null, '80000', '11', '20');
INSERT INTO `pricelist` VALUES ('198', null, null, null, null, null, '70000', '12', '5');
INSERT INTO `pricelist` VALUES ('199', null, null, null, null, null, '40000', '7', '33');
INSERT INTO `pricelist` VALUES ('200', null, null, null, null, null, '5000', '7', '34');
INSERT INTO `pricelist` VALUES ('201', 'admin', '2021-01-03 17:39:54', null, 'admin', '2021-01-03 17:39:54', '100000', '1', '35');

-- ----------------------------
-- Table structure for purchasematerial
-- ----------------------------
DROP TABLE IF EXISTS `purchasematerial`;
CREATE TABLE `purchasematerial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchasedate` datetime DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchasematerial
-- ----------------------------
INSERT INTO `purchasematerial` VALUES ('1', 'admin', '2021-01-05 02:16:44', 'test nhap vat tu', 'admin', '2021-01-05 02:17:04', '20210105-021622', null, '2021-01-05 02:16:22', '1247192000');
INSERT INTO `purchasematerial` VALUES ('2', 'admin', '2021-01-05 08:02:23', '', 'admin', '2021-01-06 14:00:46', '20210106-080141', null, '2021-01-06 08:01:41', '33059800');

-- ----------------------------
-- Table structure for purchasematerialdetail
-- ----------------------------
DROP TABLE IF EXISTS `purchasematerialdetail`;
CREATE TABLE `purchasematerialdetail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `area` float DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint DEFAULT NULL,
  `quantity` bigint DEFAULT NULL,
  `size` float DEFAULT NULL,
  `total` bigint DEFAULT NULL,
  `width` float DEFAULT NULL,
  `material_id` bigint DEFAULT NULL,
  `purchasematerial_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nvqw42abxlfghv2wilt1xi7a9` (`material_id`),
  KEY `FK_4dwvt1vu83ivbe1bmmdiwwer` (`purchasematerial_id`),
  CONSTRAINT `FK_4dwvt1vu83ivbe1bmmdiwwer` FOREIGN KEY (`purchasematerial_id`) REFERENCES `purchasematerial` (`id`),
  CONSTRAINT `FK_nvqw42abxlfghv2wilt1xi7a9` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchasematerialdetail
-- ----------------------------
INSERT INTO `purchasematerialdetail` VALUES ('1', 'admin', '2021-01-05 02:16:44', null, 'admin', '2021-01-05 02:16:44', '254', null, null, '100000', '4', '1.27', '25400000', '50', '2', '1');
INSERT INTO `purchasematerialdetail` VALUES ('2', 'admin', '2021-01-05 02:17:04', null, 'admin', '2021-01-05 02:17:04', '1248', null, null, '979000', '6', '2.6', '1221792000', '80', '14', '1');
INSERT INTO `purchasematerialdetail` VALUES ('3', 'admin', '2021-01-05 08:02:23', null, 'admin', '2021-01-06 13:57:27', '512', null, null, '9700', '2', '3.2', '4966400', '80', '10', '2');
INSERT INTO `purchasematerialdetail` VALUES ('4', 'admin', '2021-01-05 08:03:35', null, 'admin', '2021-01-06 13:57:32', '240', null, null, '9700', '1', '3', '2328000', '80', '12', '2');
INSERT INTO `purchasematerialdetail` VALUES ('5', 'admin', '2021-01-05 08:04:00', null, 'admin', '2021-01-06 13:57:37', '208', null, null, '9700', '1', '2.6', '2017600', '80', '14', '2');
INSERT INTO `purchasematerialdetail` VALUES ('6', 'admin', '2021-01-05 08:04:23', null, 'admin', '2021-01-06 13:57:45', '176', null, null, '9700', '1', '2.2', '1707200', '80', '16', '2');
INSERT INTO `purchasematerialdetail` VALUES ('7', 'admin', '2021-01-05 08:04:45', null, 'admin', '2021-01-06 13:58:57', '535', null, null, '17200', '10', '1.07', '9202000', '50', '25', '2');
INSERT INTO `purchasematerialdetail` VALUES ('8', 'admin', '2021-01-06 10:09:08', null, 'admin', '2021-01-06 13:59:15', '508', null, null, '17200', '8', '1.27', '8737600', '50', '8', '2');
INSERT INTO `purchasematerialdetail` VALUES ('9', 'admin', '2021-01-06 10:54:54', null, 'admin', '2021-01-06 14:00:28', '535', null, null, '8300', '10', '1.07', '4440500', '50', '6', '2');
INSERT INTO `purchasematerialdetail` VALUES ('10', 'admin', '2021-01-06 10:55:34', null, 'admin', '2021-01-06 14:00:47', '381', null, null, '8300', '6', '1.27', '3162300', '50', '4', '2');
INSERT INTO `purchasematerialdetail` VALUES ('11', 'admin', '2021-01-06 11:05:19', null, 'admin', '2021-01-06 13:59:37', '3', null, null, '413000', '3', '1', '1239000', '1', '1', '2');
INSERT INTO `purchasematerialdetail` VALUES ('12', 'admin', '2021-01-06 11:05:49', null, 'admin', '2021-01-06 13:59:45', '2', null, null, '413000', '2', '1', '826000', '1', '32', '2');
INSERT INTO `purchasematerialdetail` VALUES ('13', 'admin', '2021-01-06 11:06:04', null, 'admin', '2021-01-06 13:59:52', '2', null, null, '413000', '2', '1', '826000', '1', '20', '2');
INSERT INTO `purchasematerialdetail` VALUES ('14', 'admin', '2021-01-06 11:06:18', null, 'admin', '2021-01-06 13:59:58', '1', null, null, '413000', '1', '1', '413000', '1', '21', '2');
INSERT INTO `purchasematerialdetail` VALUES ('15', 'admin', '2021-01-06 13:58:47', null, 'admin', '2021-01-06 13:58:47', '76', null, null, '17200', '1', '1.52', '1307200', '50', '24', '2');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', null, null, null, null, null, 'ADMIN', 'Quản trị');
INSERT INTO `role` VALUES ('2', null, null, null, null, null, 'USER', 'Người dùng');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', null, null, null, null, null, '16521191@gm.uit.edu.vn', 'Cong Thoai', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', '0983583845', '1', null, 'admin');
INSERT INTO `user` VALUES ('2', null, null, null, null, null, '16521191@gm.uit.edu.vn', 'Người dùng 1', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', '0983583845', '1', null, 'user');
INSERT INTO `user` VALUES ('3', null, null, null, null, null, '16521191@gm.uit.edu.vn', 'Công Thoại', '$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG', '0983583845', '1', null, 'congthoai');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` bigint NOT NULL,
  `roleid` bigint NOT NULL,
  KEY `FK_jpkvqqgndeonhr2alguthv64e` (`roleid`),
  KEY `FK_jwv62hhuqojjk7pot7kaex3e1` (`userid`),
  CONSTRAINT `FK_jpkvqqgndeonhr2alguthv64e` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_jwv62hhuqojjk7pot7kaex3e1` FOREIGN KEY (`userid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('2', '2');
INSERT INTO `user_role` VALUES ('3', '2');
