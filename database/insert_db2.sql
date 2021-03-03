/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : printmanagement

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-12-30 20:52:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cost
-- ----------------------------
DROP TABLE IF EXISTS `cost`;
CREATE TABLE `cost` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `costdate` datetime DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cost
-- ----------------------------

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `customertype_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qcxvwr050d5ln74t92r3bl0n0` (`customertype_id`),
  CONSTRAINT `FK_qcxvwr050d5ln74t92r3bl0n0` FOREIGN KEY (`customertype_id`) REFERENCES `customertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `customer` VALUES ('12', null, null, null, null, null, null, 'KH200826235527', null, 'BV', null, null, '7');
INSERT INTO `customer` VALUES ('13', null, null, null, null, null, null, 'KH200826235539', null, 'CÔ TÂM PGD', null, null, '8');
INSERT INTO `customer` VALUES ('14', null, null, null, null, null, null, 'KH200826235544', null, 'CÔNG THỨC', null, null, '8');
INSERT INTO `customer` VALUES ('15', null, null, null, null, null, null, 'KH200826235559', null, 'CPA', null, null, '3');
INSERT INTO `customer` VALUES ('16', null, null, null, null, null, null, 'KH200826235601', null, 'CTY TẤN HƯNG', null, null, '3');
INSERT INTO `customer` VALUES ('17', null, null, null, null, null, null, 'KH200826235607', null, 'CTY TÂN THÀNH', null, null, '3');
INSERT INTO `customer` VALUES ('18', null, null, null, null, null, null, 'KH200826235616', null, 'CTY VĨNH KIM', null, null, '1');
INSERT INTO `customer` VALUES ('19', null, null, null, null, null, null, 'KH200826235620', null, 'CHỊ HẠNH', null, null, '6');
INSERT INTO `customer` VALUES ('20', null, null, null, null, null, null, 'KH200826235630', null, 'CHỊ TÂM', null, null, '3');
INSERT INTO `customer` VALUES ('21', null, null, null, null, null, null, 'KH200826235634', null, 'CHỊ TRINH_TT THẠNH AN', null, null, '7');
INSERT INTO `customer` VALUES ('22', null, null, null, null, null, null, 'KH200826235645', null, 'CHÚ DUYÊN', null, null, '5');
INSERT INTO `customer` VALUES ('23', null, null, null, null, null, null, 'KH200826235655', null, 'DECAL PHƯƠNG', null, null, '6');
INSERT INTO `customer` VALUES ('24', null, null, null, null, null, null, 'KH200826235658', null, 'DUY TÂN', null, null, '8');
INSERT INTO `customer` VALUES ('25', null, null, null, null, null, null, 'KH200826235707', null, 'ĐÔNG Á', null, null, '7');
INSERT INTO `customer` VALUES ('26', null, null, null, null, null, null, 'KH200826235710', null, 'ĐỨC LIÊN', null, null, '3');
INSERT INTO `customer` VALUES ('27', null, null, null, null, null, null, 'KH200826235729', null, 'ĐỨC TIẾN', null, null, '8');
INSERT INTO `customer` VALUES ('28', null, null, null, null, null, null, 'KH200826235731', null, 'HẢI HÀ', null, null, '8');
INSERT INTO `customer` VALUES ('29', null, null, null, null, null, null, 'KH200826235736', null, 'HOAN', null, null, '6');
INSERT INTO `customer` VALUES ('30', null, null, null, null, null, null, 'KH200826235738', null, 'HOÀNG ĐĂNG', null, null, '8');
INSERT INTO `customer` VALUES ('31', null, null, null, null, null, null, 'KH200826235751', null, 'HOÀNG LONG', null, null, '5');
INSERT INTO `customer` VALUES ('32', null, null, null, null, null, null, 'KH200826235754', null, 'HUYỆN ĐOÀN', null, null, '7');
INSERT INTO `customer` VALUES ('33', null, null, null, null, null, null, 'KH200826235806', null, 'HỮU NGHĨA', null, null, '8');
INSERT INTO `customer` VALUES ('34', null, null, null, null, null, null, 'KH200826235816', null, 'KIM LÂM', null, null, '8');
INSERT INTO `customer` VALUES ('35', null, null, null, null, null, null, 'KH200826235824', null, 'KHÁCH', null, null, '7');
INSERT INTO `customer` VALUES ('36', null, null, null, null, null, null, 'KH200826235836', null, 'KHÁNH THY', null, null, '6');
INSERT INTO `customer` VALUES ('37', null, null, null, null, null, null, 'KH200826235839', null, 'KHOA', null, null, '1');
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
INSERT INTO `customer` VALUES ('94', null, null, null, null, null, null, 'KH201221102849', null, 'TÍN', null, null, '1');

-- ----------------------------
-- Table structure for customertype
-- ----------------------------
DROP TABLE IF EXISTS `customertype`;
CREATE TABLE `customertype` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customertype
-- ----------------------------
INSERT INTO `customertype` VALUES ('1', null, null, null, null, null, 'dac-biet', 'Đặc biệt');
INSERT INTO `customertype` VALUES ('2', null, null, null, null, null, 'vip-23-33', 'VIP 23-33');
INSERT INTO `customertype` VALUES ('3', null, null, null, null, null, 'vip-23', 'VIP 23');
INSERT INTO `customertype` VALUES ('4', null, null, null, null, null, 'vip-20', 'VIP 20');
INSERT INTO `customertype` VALUES ('5', null, null, null, null, null, 'vip-27', 'VIP 27');
INSERT INTO `customertype` VALUES ('6', null, null, null, null, null, 'than-thiet', 'Thân thiết');
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `area` float DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debt` bigint(20) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `orderdate` datetime DEFAULT NULL,
  `paid` bigint(20) DEFAULT NULL,
  `paymentdate` datetime DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_astys1dv61mdlp0n0wx0574r2` (`customer_id`),
  KEY `FK_rg95ddumc8608v80pqy2m43h0` (`item_id`),
  CONSTRAINT `FK_astys1dv61mdlp0n0wx0574r2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  CONSTRAINT `FK_rg95ddumc8608v80pqy2m43h0` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

ALTER TABLE orders
MODIFY COLUMN description TEXT;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', 'anonymousUser', '2020-12-30 20:45:35', '30/12/2020 20:45:35 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:45:35', '0.32', 'DH000-201230084535', 'content 1', '16000', '0.2', '2020-12-30 20:45:35', '0', null, '50000', '4', 'unpaid', '16000', '0.4', '6', '4');
INSERT INTO `orders` VALUES ('2', 'anonymousUser', '2020-12-30 20:45:43', '30/12/2020 20:45:43 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:45:43', '0.16', 'DH001-201230084543', 'content 2', '8000', '0.2', '2020-12-30 20:45:43', '0', null, '50000', '2', 'unpaid', '8000', '0.4', '6', '4');
INSERT INTO `orders` VALUES ('3', 'anonymousUser', '2020-12-30 20:46:00', '30/12/2020 20:46:00 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:46:00', '0.16', 'DH002-201230084600', 'content 2', '8000', '0.2', '2020-12-29 20:46:00', '0', null, '50000', '2', 'unpaid', '8000', '0.4', '6', '4');
INSERT INTO `orders` VALUES ('4', 'anonymousUser', '2020-12-30 20:46:08', '30/12/2020 20:46:08 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:46:08', '0.24', 'DH003-201230084608', 'content 3', '12000', '0.2', '2020-12-29 20:46:08', '0', null, '50000', '3', 'unpaid', '12000', '0.4', '6', '4');
INSERT INTO `orders` VALUES ('5', 'anonymousUser', '2020-12-30 20:46:20', '30/12/2020 20:46:20 Don hang duoc tao.&#13;30/12/2020 20:49:55 Thanh toan 1 phan: 19000 vnd.&#13;30/12/2020 20:51:32 Thanh toan xong.&#13;', 'admin', '2020-12-30 20:51:32', '0.24', 'DH004-201230084620', 'content 3', '0', '0.2', '2020-12-29 20:46:20', '19200', '2020-12-29 20:51:32', '80000', '3', 'paid', '19200', '0.4', '11', '10');
INSERT INTO `orders` VALUES ('6', 'anonymousUser', '2020-12-30 20:46:28', '30/12/2020 20:46:28 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:46:28', '0.4', 'DH005-201230084628', 'content 3', '10000', '0.2', '2020-12-29 20:46:28', '0', null, '25000', '5', 'unpaid', '10000', '0.4', '11', '16');
INSERT INTO `orders` VALUES ('7', 'anonymousUser', '2020-12-30 20:47:04', '30/12/2020 20:47:04 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:47:04', '4.2', 'DH006-201230084704', 'content 5', '378000', '2', '2020-12-30 20:47:04', '0', null, '90000', '3', 'unpaid', '378000', '0.7', '7', '11');
INSERT INTO `orders` VALUES ('8', 'anonymousUser', '2020-12-30 20:47:11', '30/12/2020 20:47:11 Don hang duoc tao.&#13;30/12/2020 20:50:11 Thanh toan 1 phan: 400000 vnd.&#13;30/12/2020 20:50:17 Thanh toan xong.&#13;', 'admin', '2020-12-30 20:50:17', '7', 'DH007-201230084711', 'content 5', '0', '2', '2020-12-30 20:47:11', '630000', '2020-12-30 20:50:17', '90000', '5', 'paid', '630000', '0.7', '7', '11');
INSERT INTO `orders` VALUES ('9', 'anonymousUser', '2020-12-30 20:47:16', '30/12/2020 20:47:16 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:47:16', '9.8', 'DH008-201230084716', 'content 5', '882000', '2', '2020-12-30 20:47:16', '0', null, '90000', '7', 'unpaid', '882000', '0.7', '7', '11');
INSERT INTO `orders` VALUES ('10', 'anonymousUser', '2020-12-30 20:47:26', '30/12/2020 20:47:26 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:47:26', '9.8', 'DH009-201230084726', 'content 5', '882000', '2', '2020-12-28 20:47:26', '0', null, '90000', '7', 'unpaid', '882000', '0.7', '7', '11');
INSERT INTO `orders` VALUES ('11', 'anonymousUser', '2020-12-30 20:47:29', '30/12/2020 20:47:29 Don hang duoc tao.&#13;30/12/2020 20:49:21 Thanh toan 1 phan: 100000 vnd.&#13;30/12/2020 20:49:29 Thanh toan 1 phan: 178000 vnd.&#13;30/12/2020 20:49:38 Thanh toan xong.&#13;', 'admin', '2020-12-30 20:49:38', '4.2', 'DH0010-201230084729', 'content 5', '0', '2', '2020-12-28 20:47:29', '378000', '2020-12-28 20:49:38', '90000', '3', 'paid', '378000', '0.7', '7', '11');
INSERT INTO `orders` VALUES ('12', 'anonymousUser', '2020-12-30 20:47:33', '30/12/2020 20:47:33 Don hang duoc tao.&#13;', 'anonymousUser', '2020-12-30 20:47:33', '4.2', 'DH0011-201230084733', 'content 5', '252000', '2', '2020-12-28 20:47:33', '0', null, '60000', '3', 'unpaid', '252000', '0.7', '7', '18');
INSERT INTO `orders` VALUES ('13', 'anonymousUser', '2020-12-30 20:47:39', '30/12/2020 20:47:39 Don hang duoc tao.&#13;30/12/2020 20:49:00 Thanh toan xong.&#13;', 'admin', '2020-12-30 20:49:00', '4.2', 'DH0012-201230084739', 'content 5', '0', '2', '2020-12-28 20:47:39', '210000', '2020-12-28 20:49:00', '50000', '3', 'paid', '210000', '0.7', '7', '22');

-- ----------------------------
-- Table structure for pricelist
-- ----------------------------
DROP TABLE IF EXISTS `pricelist`;
CREATE TABLE `pricelist` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `customertype_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fokau4goqumb31xeko1fi4f2t` (`customertype_id`),
  KEY `FK_78tj6ecameh2rb0hu4s7ot31v` (`item_id`),
  CONSTRAINT `FK_78tj6ecameh2rb0hu4s7ot31v` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  CONSTRAINT `FK_fokau4goqumb31xeko1fi4f2t` FOREIGN KEY (`customertype_id`) REFERENCES `customertype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO `pricelist` VALUES ('8', null, null, null, null, null, '40000', '1', '13');
INSERT INTO `pricelist` VALUES ('9', null, null, null, null, null, '70000', '1', '12');
INSERT INTO `pricelist` VALUES ('10', null, null, null, null, null, '90000', '1', '11');
INSERT INTO `pricelist` VALUES ('11', null, null, null, null, null, '60000', '1', '10');
INSERT INTO `pricelist` VALUES ('12', null, null, null, null, null, '70000', '1', '9');
INSERT INTO `pricelist` VALUES ('13', null, null, null, null, null, '40000', '1', '8');
INSERT INTO `pricelist` VALUES ('14', null, null, null, null, null, '90000', '1', '7');
INSERT INTO `pricelist` VALUES ('15', null, null, null, null, null, '60000', '1', '6');
INSERT INTO `pricelist` VALUES ('16', null, null, null, null, null, '70000', '1', '5');
INSERT INTO `pricelist` VALUES ('17', null, null, null, null, null, '40000', '1', '4');
INSERT INTO `pricelist` VALUES ('18', null, null, null, null, null, '25000', '1', '3');
INSERT INTO `pricelist` VALUES ('19', null, null, null, null, null, '19000', '1', '2');
INSERT INTO `pricelist` VALUES ('20', null, null, null, null, null, '19000', '1', '1');
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
INSERT INTO `pricelist` VALUES ('79', null, null, null, null, null, '80000', '5', '5');
INSERT INTO `pricelist` VALUES ('80', null, null, null, null, null, '70000', '5', '6');
INSERT INTO `pricelist` VALUES ('81', null, null, null, null, null, '100000', '5', '7');
INSERT INTO `pricelist` VALUES ('82', null, null, null, null, null, '50000', '5', '8');
INSERT INTO `pricelist` VALUES ('83', null, null, null, null, null, '80000', '5', '9');
INSERT INTO `pricelist` VALUES ('84', null, null, null, null, null, '70000', '5', '10');
INSERT INTO `pricelist` VALUES ('85', null, null, null, null, null, '100000', '5', '11');
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
INSERT INTO `pricelist` VALUES ('117', null, null, null, null, null, '90000', '7', '5');
INSERT INTO `pricelist` VALUES ('118', null, null, null, null, null, '80000', '7', '6');
INSERT INTO `pricelist` VALUES ('119', null, null, null, null, null, '110000', '7', '7');
INSERT INTO `pricelist` VALUES ('120', null, null, null, null, null, '60000', '7', '8');
INSERT INTO `pricelist` VALUES ('121', null, null, null, null, null, '90000', '7', '9');
INSERT INTO `pricelist` VALUES ('122', null, null, null, null, null, '80000', '7', '10');
INSERT INTO `pricelist` VALUES ('123', null, null, null, null, null, '110000', '7', '11');
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
INSERT INTO `pricelist` VALUES ('134', null, null, null, null, null, '50000', '8', '3');
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
INSERT INTO `pricelist` VALUES ('178', null, null, null, null, null, '150000', '6', '23');
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

-- ----------------------------
-- Table structure for purchasematerial
-- ----------------------------
DROP TABLE IF EXISTS `purchasematerial`;
CREATE TABLE `purchasematerial` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `purchasedate` datetime DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchasematerial
-- ----------------------------

-- ----------------------------
-- Table structure for purchasematerialdetail
-- ----------------------------
DROP TABLE IF EXISTS `purchasematerialdetail`;
CREATE TABLE `purchasematerialdetail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `area` float DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `quantity` bigint(20) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `purchasematerial_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nvqw42abxlfghv2wilt1xi7a9` (`material_id`),
  KEY `FK_4dwvt1vu83ivbe1bmmdiwwer` (`purchasematerial_id`),
  CONSTRAINT `FK_4dwvt1vu83ivbe1bmmdiwwer` FOREIGN KEY (`purchasematerial_id`) REFERENCES `purchasematerial` (`id`),
  CONSTRAINT `FK_nvqw42abxlfghv2wilt1xi7a9` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of purchasematerialdetail
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createddate` datetime DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifiedby` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `modifieddate` datetime DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
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
  `userid` bigint(20) NOT NULL,
  `roleid` bigint(20) NOT NULL,
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
