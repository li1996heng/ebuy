/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : ebuy

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 27/03/2018 11:46:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bigtype
-- ----------------------------
DROP TABLE IF EXISTS `bigtype`;
CREATE TABLE `bigtype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bigtype
-- ----------------------------
INSERT INTO `bigtype` VALUES (1, '服饰', NULL, NULL);
INSERT INTO `bigtype` VALUES (2, '数码', NULL, NULL);
INSERT INTO `bigtype` VALUES (3, '美食', NULL, NULL);
INSERT INTO `bigtype` VALUES (4, '家电', NULL, NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 1,
  `orderNum` int(11) NULL DEFAULT NULL,
  `price` float NULL DEFAULT NULL,
  `productID` int(11) NULL DEFAULT NULL,
  `userID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_jjb3refu7oa3r1wstbuinbfmk`(`productID`) USING BTREE,
  INDEX `FK_sxcydxpwlvr1kigakmy9oubfd`(`userID`) USING BTREE,
  CONSTRAINT `FK_jjb3refu7oa3r1wstbuinbfmk` FOREIGN KEY (`productID`) REFERENCES `product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_sxcydxpwlvr1kigakmy9oubfd` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (67, '2018-03-26 04:31:18', 1, 2, 336, 25, 17);
INSERT INTO `cart` VALUES (68, '2018-03-26 04:31:36', 0, 2, 158, 10, 17);
INSERT INTO `cart` VALUES (69, '2018-03-26 04:41:28', 1, 5, 2340, 21, 17);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `nickName` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `replyContent` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `replyTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (2, '积分大返利，机不可失失不再来', '2014-01-02 00:00:00', '会员VIP', '会员特惠月开始', '2014-01-02 00:00:00');
INSERT INTO `comment` VALUES (3, '开始配货开始配货开始配货开始配货', '2014-01-03 00:00:00', '阿木木', NULL, '2014-01-01 00:00:00');
INSERT INTO `comment` VALUES (4, '小米4发布了 1999 16G 3200W像素', '2014-01-04 00:00:00', '雷军', '假的！！', '2014-01-03 00:00:00');
INSERT INTO `comment` VALUES (6, '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '22', '2014-09-13 18:11:51');
INSERT INTO `comment` VALUES (12, '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题啊', '2014-09-13 18:02:52');
INSERT INTO `comment` VALUES (13, '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题。', '2014-09-13 18:04:45');
INSERT INTO `comment` VALUES (14, '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题。', '2014-09-13 18:05:03');
INSERT INTO `comment` VALUES (17, '1234单号，有问题', '2014-08-28 00:00:00', '大熊2', '没问题。111', '2014-09-13 18:09:52');
INSERT INTO `comment` VALUES (18, '什么时候发货？', '2014-09-14 00:00:00', '小华', '块了', '2014-09-14 21:26:46');
INSERT INTO `comment` VALUES (19, '某某订单有问题', '2014-09-15 00:00:00', '外星人', 'enen ..', '2014-09-15 07:53:00');

-- ----------------------------
-- Table structure for order_tab
-- ----------------------------
DROP TABLE IF EXISTS `order_tab`;
CREATE TABLE `order_tab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 1,
  `sellerId` int(11) NULL DEFAULT NULL,
  `cartID` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_ldcmv6jidg2cn59tft8uqmtrd`(`cartID`) USING BTREE,
  CONSTRAINT `FK_ldcmv6jidg2cn59tft8uqmtrd` FOREIGN KEY (`cartID`) REFERENCES `cart` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_tab
-- ----------------------------
INSERT INTO `order_tab` VALUES (13, '2018-03-26 04:31:37', 1, 9527, 68);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `hot` int(11) NOT NULL,
  `hotTime` datetime(0) NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `price` float NOT NULL,
  `proPic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `specialPrice` float NOT NULL,
  `specialPriceTime` datetime(0) NULL DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `bigTypeId` int(11) NULL DEFAULT NULL,
  `smallTypeId` int(11) NULL DEFAULT NULL,
  `pictureUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_2vciohqujaeij91ujm5va2xs4`(`bigTypeId`) USING BTREE,
  INDEX `FK_qexns4el8esjqbdrqfys82ih8`(`smallTypeId`) USING BTREE,
  CONSTRAINT `FK_2vciohqujaeij91ujm5va2xs4` FOREIGN KEY (`bigTypeId`) REFERENCES `bigtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_qexns4el8esjqbdrqfys82ih8` FOREIGN KEY (`smallTypeId`) REFERENCES `smalltype` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 300 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (8, '乐库优2014春装新款中腰蓝色刺绣修身', 1, '2014-01-01 00:00:00', '乐库优2014春装新款中腰蓝色刺绣修身', 78, 'images/product/5.jpg', 0, '2014-01-01 00:00:00', 65, 1, 8, NULL);
INSERT INTO `product` VALUES (9, '缪佳 春装新款2014女士牛仔裤女小脚', 1, '2014-01-01 00:00:00', '缪佳 春装新款2014女士牛仔裤女小脚', 99, 'images/product/6.jpg', 0, NULL, 152, 1, 8, NULL);
INSERT INTO `product` VALUES (10, '2014春装新款 韩版修身显瘦小脚裤休', 1, '2014-01-01 00:00:00', '2014春装新款 韩版修身显瘦小脚裤休', 79, 'images/product/7.jpg', 0, NULL, 52, 1, 8, NULL);
INSERT INTO `product` VALUES (14, '名驭 牛仔裤女小脚裤韩版潮2014春装', 1, '2014-01-01 00:00:00', '名驭 牛仔裤女小脚裤韩版潮2014春装', 79, 'images/product/8.jpg', 0, NULL, 55, 1, 8, NULL);
INSERT INTO `product` VALUES (15, '皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ', 1, '2014-01-01 00:00:00', '皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ', 199, 'images/product/9.jpg', 0, NULL, 125, 1, 8, NULL);
INSERT INTO `product` VALUES (16, 'Le hondies2014男士白色牛仔裤韩版', 1, '2014-01-01 00:00:00', 'Le hondies2014男士白色牛仔裤韩版', 129, 'images/product/10.jpg', 0, NULL, 129, 1, 8, NULL);
INSERT INTO `product` VALUES (17, '夏装新品 唐狮正品男基本修身小脚牛仔', 1, '2014-01-01 00:00:00', '夏装新品 唐狮正品男基本修身小脚牛仔', 129, 'images/product/11.jpg', 0, NULL, 129, 1, 8, NULL);
INSERT INTO `product` VALUES (18, 'gxg.1978男装2014新款春装休闲修身', 1, '2014-01-01 00:00:00', 'gxg.1978男装2014新款春装休闲修身', 229, 'images/product/12.jpg', 0, NULL, 229, 1, 7, NULL);
INSERT INTO `product` VALUES (19, '罗蒙 休闲西服男士小西装外套商务正装', 1, '2013-01-01 00:00:00', '罗蒙 休闲西服男士小西装外套商务正装', 449, 'images/product/13.jpg', 0, NULL, 125, 1, 7, NULL);
INSERT INTO `product` VALUES (20, '领般【新品】男士西服套装 商务休闲修身西装 男款职业正装结婚礼服 黑色斜纹 外', 0, NULL, '领般【新品】男士西服套装 ', 318, 'images/product/14.jpg', 1, '2013-01-01 00:00:00', 318, 1, 7, NULL);
INSERT INTO `product` VALUES (21, '货到付款Mr.TA 西服 2014新款男士礼服套 经典 黑色西装 英伦商务修身西服套装 黑', 0, NULL, '货到付款Mr.TA 西服 ', 468, 'images/product/15.jpg', 1, '2014-01-02 00:00:00', 468, 1, 7, NULL);
INSERT INTO `product` VALUES (25, '【货到付款】圣贝琪　2014韩版夏装黑白经典百搭腰肩花边美观又时尚新款连衣裙 ', 0, NULL, '经典百搭腰肩花边美观又时尚新款连衣裙 ', 168, 'images/product/16.jpg', 1, '2014-01-01 00:00:00', 99, 1, 6, NULL);
INSERT INTO `product` VALUES (26, '蒲洛妃2014春季新款女装 韩版修身两件套秋款连衣裙 L189 粉色 M', 0, NULL, '蒲洛妃2014春季新款女装 ', 139, 'images/product/17.jpg', 1, '2014-01-01 00:00:00', 11, 1, 6, NULL);
INSERT INTO `product` VALUES (27, '媞沫 2014春夏品质女装新款圆领桑蚕丝连衣裙大牌真丝连衣裙（支持货到付款)', 0, NULL, '2014春夏品质女装新款圆领桑蚕丝连衣裙', 169, 'images/product/18.jpg', 1, '2014-01-01 00:00:00', 55, 1, 6, NULL);
INSERT INTO `product` VALUES (38, '佳能（Canon） EOS 600D 单反套机（EF-S 18-55mm f/3.5-5.6 IS II 镜头）', 0, NULL, '佳能（Canon） EOS 600D 单反套机', 3599, 'images/product/19.jpg', 1, '2014-01-01 00:00:00', 25, 2, 9, NULL);
INSERT INTO `product` VALUES (39, '尼康（Nikon） D3200 单反相机套机（AF-S DX 18-55mm f/3.5-5.6G VR尼克尔镜', 0, NULL, '尼康（Nikon） D3200 单反相机套机', 6099, 'images/product/20.jpg', 1, '2014-01-01 00:00:00', 45, 2, 9, NULL);
INSERT INTO `product` VALUES (40, '佳能（Canon） EOS 5D Mark III 单反机身', 0, NULL, '佳能（Canon） EOS 5D Mark III 单反机身', 22988, 'images/product/21.jpg', 1, '2014-01-01 00:00:00', 123, 2, 9, NULL);
INSERT INTO `product` VALUES (41, '尼康（Nikon） D3300 单反套机（AF-S DX 18-55mm f/3.5-5.6G VRII尼克尔镜头）', 0, NULL, '尼康（Nikon） D3300 单反套机', 6389, 'images/product/22.jpg', 1, '2014-01-01 00:00:00', 123, 2, 9, NULL);
INSERT INTO `product` VALUES (42, '佳能（Canon） EOS 1D X 单反机身', 0, NULL, '佳能（Canon） EOS 1D X 单反机身', 5699, 'images/product/23.jpg', 0, NULL, 123, 2, 9, NULL);
INSERT INTO `product` VALUES (43, '佳能（Canon） EOS 700D 单反机身', 0, NULL, '佳能（Canon） EOS 700D 单反机身', 3199, 'images/product/24.jpg', 0, NULL, 485, 2, 9, NULL);
INSERT INTO `product` VALUES (44, '佳能（Canon） 1200D 双镜头套装', 0, NULL, '佳能（Canon） 1200D 双镜头套装', 8999, 'images/product/25.jpg', 0, NULL, 875, 2, 9, NULL);
INSERT INTO `product` VALUES (45, '宾得（PENTAX） K-50/DA L 18-55mmWR 单反套机', 0, NULL, '宾得（PENTAX） K-50/DA L 18-55mmWR ', 4499, 'images/product/26.jpg', 0, NULL, 165, 2, 9, NULL);
INSERT INTO `product` VALUES (46, '佳能（Canon） EOS 6D 单反套机（EF 24-70mm f/4L IS USM 镜头）', 0, NULL, '佳能（Canon） EOS 6D 单反套机', 3199, 'images/product/27.jpg', 0, NULL, 52, 2, 9, NULL);
INSERT INTO `product` VALUES (47, '尼康（Nikon） D3100 单反套机（AF-S DX 18-55mm f/3.5-5.6G VR尼克尔镜头）', 0, NULL, '尼康（Nikon） D3100 单反套机', 5299, 'images/product/28.jpg', 0, NULL, 641, 2, 9, NULL);
INSERT INTO `product` VALUES (48, '佳能（Canon） EOS 100D 单反机身', 0, NULL, '佳能（Canon） EOS 100D 单反机身', 4280, 'images/product/29.jpg', 0, NULL, 46, 2, 9, NULL);
INSERT INTO `product` VALUES (49, '漫步者（EDIFIER） R101V 2.1声道多媒体音箱 黑色', 0, NULL, '漫步者R101V 2.1声道多媒体音箱 黑色', 119, 'images/product/30.jpg', 0, NULL, 465, 2, 29, NULL);
INSERT INTO `product` VALUES (50, '惠威（HiVi）多媒体音箱 M200MKIII 2.0声道HI-FI品质 豪华原木做工', 0, NULL, '惠威（HiVi）多媒体音箱  豪华原木做工', 1785, 'images/product/31.jpg', 0, NULL, 213, 2, 29, NULL);
INSERT INTO `product` VALUES (51, '魅动e族MD-5110音箱 音响 蓝牙音箱 蓝牙音响 无线音箱 低音炮 NFC配对 黑色', 0, NULL, '魅动e族MD-5110音箱 音响 蓝牙音箱', 149, 'images/product/32.jpg', 0, NULL, 456, 2, 29, NULL);
INSERT INTO `product` VALUES (52, '漫步者（EDIFIER） R1600TIII 性能超强大的4吋2.0音箱', 0, NULL, '漫步者R1600TIII性能超强大的4吋2.0音箱', 399, 'images/product/33.jpg', 0, NULL, 55, 2, 29, NULL);
INSERT INTO `product` VALUES (53, '哈曼卡顿harmankardon SoundSticks III 3代 水晶 音箱', 0, NULL, '哈曼卡顿 III 3代 水晶 音箱', 1098, 'images/product/34.jpg', 0, NULL, 331, 2, 29, NULL);
INSERT INTO `product` VALUES (54, '惠威（HiVi）多媒体音箱 M200MKII 2.0声道HI-FI品质', 0, NULL, '惠威（HiVi）多媒体音箱 2.0声道HI-FI品质', 1096, 'images/product/35.jpg', 0, NULL, 456, 2, 29, NULL);
INSERT INTO `product` VALUES (55, '全微（transwin） 全微T-200N 2.1有源多媒体音响 电脑音箱笔记本迷你小重低音炮', 0, NULL, '全微 全微T-200N 2.1有源多媒体音响 ', 69, 'images/product/36.jpg', 0, NULL, 12389, 2, 29, NULL);
INSERT INTO `product` VALUES (56, '漫步者（EDIFIER） R10U 2.0声道 多媒体音箱 黑色', 0, NULL, '漫步者 R10U 2.0声道 多媒体音箱 黑色', 65, 'images/product/37.jpg', 0, NULL, 789, 2, 29, NULL);
INSERT INTO `product` VALUES (57, 'dostyle SD306重低音2.1电脑音箱低音炮音响子夜黑', 0, NULL, 'dostyle SD306重低音2.1电脑音箱低音炮音响', 239, 'images/product/38.jpg', 0, NULL, 4156, 2, 29, NULL);
INSERT INTO `product` VALUES (59, '漫步者（EDIFIER） R201T12 2.1声道 多媒体音箱 黑色', 0, NULL, '漫步者 R201T12 2.1声道 多媒体音箱 黑色', 198, 'images/product/40.jpg', 0, NULL, 965, 2, 29, NULL);
INSERT INTO `product` VALUES (60, '麦博（microlab） M100(10) 多媒体有源音响 黑色', 0, NULL, '麦博 M100(10) 多媒体有源音响 黑色', 99, 'images/product/41.jpg', 0, NULL, 66, 2, 29, NULL);
INSERT INTO `product` VALUES (62, '漫步者（EDIFIER） R201T08 2.1声道 多媒体音箱 黑色', 0, NULL, '漫步者 R201T08 2.1声道 多媒体音箱 黑色', 189, 'images/product/43.jpg', 0, NULL, 998, 2, 29, NULL);
INSERT INTO `product` VALUES (63, 'JBL ONBEATVENLTWHTCN 城市节拍 音乐底座/音箱 全新闪电接口 内置蓝牙 白色', 0, NULL, 'JBL  城市节拍 音乐底座/音箱 全新闪电接口', 998, 'images/product/44.jpg', 0, NULL, 651, 2, 29, NULL);
INSERT INTO `product` VALUES (64, '飞利浦(Philips) SBM120SLV/93 便携式插卡音响 FM收音机（银色）', 0, NULL, '飞利浦 SBM120SLV/93 便携式插卡音响', 199, 'images/product/45.jpg', 0, NULL, 456, 2, 29, NULL);
INSERT INTO `product` VALUES (65, '漫步者（EDIFIER） R101T06 2.1声道 多媒体音箱 黑银', 0, NULL, '漫步者 R101T06 2.1声道 多媒体音箱 黑银', 139, 'images/product/46.jpg', 0, NULL, 12376, 2, 29, NULL);
INSERT INTO `product` VALUES (66, 'JBL PULSE–炫彩360度LED灯 NFC 便携蓝牙音箱 音乐脉动 黑色', 0, NULL, 'JBL PULSE–炫彩360度LED灯 便携蓝牙音箱', 1699, 'images/product/47.jpg', 0, NULL, 8554, 2, 29, NULL);
INSERT INTO `product` VALUES (67, '漫步者（EDIFIER）C2X 外置功放 全木质音箱 黑色', 0, NULL, '漫步者 C2X 外置功放 全木质音箱 黑色', 569, 'images/product/48.jpg', 0, NULL, 66247, 2, 29, NULL);
INSERT INTO `product` VALUES (68, '飞利浦（PHILIPS）DC295/93 iphone5/ipad4/mini/ipod 专用苹果充电底座音响 银', 0, NULL, '飞利浦 DC295 iphone5/ipad4/mini/ipod 专用', 799, 'images/product/49.jpg', 0, NULL, 6245, 2, 29, NULL);
INSERT INTO `product` VALUES (70, '苹果（Apple）iPod touch 4代 16G ME179CH/A 多媒体播放器 白色', 0, NULL, '苹果（Apple）iPod 16G 多媒体播放器 白色', 898, 'images/product/50.jpg', 0, NULL, 1154, 2, 30, NULL);
INSERT INTO `product` VALUES (71, '苹果（APPLE）MD775CH/A IPOD SHUFFLE 2GB/BLUE 蓝色', 0, NULL, '苹果（APPLE）MD775CH/A 2GB/BLUE 蓝色', 328, 'images/product/51.jpg', 0, NULL, 456, 2, 30, NULL);
INSERT INTO `product` VALUES (72, '索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色', 0, NULL, '索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色', 239, 'images/product/52.jpg', 0, NULL, 675, 2, 30, NULL);
INSERT INTO `product` VALUES (73, '苹果（APPLE）MD773CH/A IPOD SHUFFLE 2GB/ PINK粉色', 0, NULL, '苹果（APPLE）MD773CH/A IPOD 2GB/ PINK粉色', 328, 'images/product/53.jpg', 0, NULL, 12, 2, 30, NULL);
INSERT INTO `product` VALUES (74, '苹果（Apple） iPod Nano 7代 16G MD480CH/A 多媒体播放器 银白色', 0, NULL, '苹果（Apple）16G 多媒体播放器 银白色', 998, 'images/product/54.jpg', 0, NULL, 545, 2, 30, NULL);
INSERT INTO `product` VALUES (75, '苹果（APPLE）MD778CH/A IPOD SHUFFLE 2GB/SILVER 银白', 0, NULL, '苹果（APPLE）MD778CH/A   2GB/SILVER 银白', 328, 'images/product/55.jpg', 0, NULL, 85, 2, 30, NULL);
INSERT INTO `product` VALUES (76, '苹果（APPLE）MD776CH/A IPOD SHUFFLE 2GB/GREEN 绿色', 0, NULL, '苹果（APPLE）MD776CH/A2GB/GREEN 绿色', 328, 'images/product/56.jpg', 0, NULL, 65, 2, 30, NULL);
INSERT INTO `product` VALUES (77, '苹果（Apple） iPod Nano 7代 16G MD477CH/A 多媒体播放器 蓝色', 0, NULL, '苹果（Apple） Nano 7代 16G 多媒体播放器', 998, 'images/product/57.jpg', 0, NULL, 123, 2, 30, NULL);
INSERT INTO `product` VALUES (78, '飞利浦（PHILIPS） SA2SPK04SFZ/93 MP3 播放器 4G 银色', 0, NULL, '飞利浦 SA2SPK04SFZ/93 MP3 播放器 4G 银色', 279, 'images/product/58.jpg', 0, NULL, 456, 2, 30, NULL);
INSERT INTO `product` VALUES (79, '苹果（APPLE）MD777CH/A IPOD SHUFFLE 2GB/PURPLE 紫色', 0, NULL, '苹果（APPLE）MD777CH/A IPOD 2GB/PURPLE 紫色', 328, 'images/product/59.jpg', 0, NULL, 456, 2, 30, NULL);
INSERT INTO `product` VALUES (80, '索尼（ SONY）NWZ-B172F MP3 纯白', 0, NULL, '索尼（ SONY）NWZ-B172F MP3 纯白', 239, 'images/product/60.jpg', 0, NULL, 54, 2, 30, NULL);
INSERT INTO `product` VALUES (81, '苹果（Apple） iPod Nano 7代 16G MD476CH/A 多媒体播放器 黄色', 0, NULL, '苹果（Apple） iPod 16G 多媒体播放器 黄色', 998, 'images/product/61.jpg', 0, NULL, 56, 2, 30, NULL);
INSERT INTO `product` VALUES (82, '苹果（Apple） iPod Nano 7代 16G MD479CH/A 多媒体播放器 紫色', 0, NULL, '苹果（Apple） iPod 16G  多媒体播放器 紫色', 998, 'images/product/62.jpg', 0, NULL, 34, 2, 30, NULL);
INSERT INTO `product` VALUES (83, '昂达（onda） VX330 双无损音乐格式+超便携纯音乐夹子+4G MP3 黑色', 0, NULL, '昂达 VX330 双无损音乐格式+超便携纯音乐夹', 99, 'images/product/63.jpg', 0, NULL, 62, 2, 30, NULL);
INSERT INTO `product` VALUES (84, '苹果（Apple） iPod Nano 7代 16GB ME971CH/A 多媒体播放器 深空灰色', 0, NULL, '苹果（Apple）iPod 7代 16GB 多媒体播放器', 998, 'images/product/64.jpg', 0, NULL, 89, 2, 30, NULL);
INSERT INTO `product` VALUES (86, '德国 进口牛奶 欧德堡（Oldenburger）超高温处理全脂纯牛奶1L*12', 0, NULL, '德国 欧德堡 超高温处理全脂纯牛奶1L*12', 199, 'images/product/66.jpg', 0, NULL, 45, 3, 31, NULL);
INSERT INTO `product` VALUES (87, '澳大利亚 进口牛奶 德运（Devondale）全脂牛奶礼盒装 1L*6', 0, NULL, '澳大利亚  德运 全脂牛奶礼盒装 1L*6', 99, 'images/product/67.jpg', 0, NULL, 66, 3, 31, NULL);
INSERT INTO `product` VALUES (88, '德国 进口牛奶 德亚（Deyatur）全脂牛奶200ml*30盒', 0, NULL, '德国 德亚 全脂牛奶200ml*30盒', 129, 'images/product/68.jpg', 0, NULL, 199, 3, 31, NULL);
INSERT INTO `product` VALUES (89, '德国 进口牛奶 欧德堡（Oldenburger）超高温处理全脂纯牛奶200ml*20盒', 0, NULL, '德国 欧德堡超高温处理全脂纯牛奶200ml*20', 99, 'images/product/69.jpg', 0, NULL, 299, 3, 31, NULL);
INSERT INTO `product` VALUES (90, '丹麦进口 Kjeldsens 蓝罐 曲奇 礼盒 908g 盒装', 0, NULL, '丹麦进口  蓝罐 曲奇 礼盒 908g 盒装', 89, 'images/product/70.jpg', 0, NULL, 399, 3, 31, NULL);
INSERT INTO `product` VALUES (91, '丹麦进口 Kjeldsens 蓝罐 曲奇 礼盒 454g 盒装', 0, NULL, '丹麦进口  蓝罐 曲奇 礼盒 454g 盒装', 58, 'images/product/71.jpg', 0, NULL, 145, 3, 31, NULL);
INSERT INTO `product` VALUES (92, '中国 台湾 蜜兰诺 松塔 12粒装 192克（新老包装随机发送） 盒装', 0, NULL, '蜜兰诺 松塔 12粒装 192克', 17, 'images/product/72.jpg', 0, NULL, 451, 3, 31, NULL);
INSERT INTO `product` VALUES (93, '丹麦进口 Kjeldsens 蓝罐 曲奇 125g 盒装', 0, NULL, '丹麦进口 Kjeldsens 蓝罐 曲奇 125g 盒装', 10, 'images/product/73.jpg', 0, NULL, 34, 3, 31, NULL);
INSERT INTO `product` VALUES (94, '丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g', 0, NULL, '丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g', 31, 'images/product/74.jpg', 0, NULL, 415, 3, 31, NULL);
INSERT INTO `product` VALUES (95, '意大利进口FerreroRocher费列罗榛果威化巧克力96粒婚礼装1200g', 0, NULL, '意大利进口费列罗榛果威化巧克力96粒婚礼装1200g', 149, 'images/product/75.jpg', 0, NULL, 3541, 3, 31, NULL);
INSERT INTO `product` VALUES (96, '意大利进口FerreroRocher费列罗榛果威化巧克力16粒装200g', 0, NULL, '意大利进口费列罗榛果威化巧克力16粒装200g', 35, 'images/product/76.jpg', 0, NULL, 4142, 3, 31, NULL);
INSERT INTO `product` VALUES (97, '意大利进口FerreroRocher费列罗榛果威化巧克力32粒钻石装400g', 0, NULL, '意大利进口费列罗榛果威化巧克力32粒钻石400g', 77, 'images/product/77.jpg', 0, NULL, 547, 3, 31, NULL);
INSERT INTO `product` VALUES (98, '进口食品 非国内分装 费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g', 0, NULL, '费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g', 125, 'images/product/78.jpg', 0, NULL, 265, 3, 31, NULL);
INSERT INTO `product` VALUES (99, '新疆特产 一品玉和田大枣四星450g*3袋', 0, NULL, '新疆特产 一品玉和田大枣四星450g*3袋', 75, 'images/product/79.jpg', 0, NULL, 25, 3, 32, NULL);
INSERT INTO `product` VALUES (100, '新疆特产 一品玉和田大枣六星450g*3袋', 0, NULL, '新疆特产 一品玉和田大枣六星450g*3袋', 109, 'images/product/80.jpg', 0, NULL, 45, 3, 32, NULL);
INSERT INTO `product` VALUES (101, '新疆特产 和田玉枣 四星 500g*3袋', 0, NULL, '新疆特产 和田玉枣 四星 500g*3袋', 105, 'images/product/81.jpg', 0, NULL, 123, 3, 32, NULL);
INSERT INTO `product` VALUES (102, '新疆特产 味正品新疆和田大枣箱装2000g', 0, NULL, '新疆特产 味正品新疆和田大枣箱装2000g', 99, 'images/product/82.jpg', 0, NULL, 45, 3, 32, NULL);
INSERT INTO `product` VALUES (103, '稻香村京八件糕点礼盒 北京礼物1200g 北京特产', 0, NULL, '稻香村京八件糕点礼盒 北京礼物1200g 北京特产', 78, 'images/product/83.jpg', 0, NULL, 85, 3, 32, NULL);
INSERT INTO `product` VALUES (104, '北京特产御食园3号大礼包1800g', 0, NULL, '北京特产御食园3号大礼包1800g', 68, 'images/product/84.jpg', 0, NULL, 999, 3, 32, NULL);
INSERT INTO `product` VALUES (105, '北京特产御食园4号大礼包800g', 0, NULL, '北京特产御食园4号大礼包800g', 24, 'images/product/85.jpg', 0, NULL, 456, 3, 32, NULL);
INSERT INTO `product` VALUES (106, '北京特产 御食园大礼包1500g 休闲食品小吃零食', 0, NULL, '北京特产 御食园大礼包1500g 休闲食品小吃零食', 60, 'images/product/86.jpg', 0, NULL, 54, 3, 32, NULL);
INSERT INTO `product` VALUES (107, NULL, 0, NULL, '山西特产 维之王山楂凉果408g*2袋', 39, 'images/product/87.jpg', 0, NULL, 65, 3, 32, NULL);
INSERT INTO `product` VALUES (108, '冠云 中华老字号 山西特产 平遥牛肉家庭装(200gX3袋)600g', 0, NULL, '中华老字号 平遥牛肉家庭装(200gX3袋)600g', 88, 'images/product/88.jpg', 0, NULL, 65, 3, 32, NULL);
INSERT INTO `product` VALUES (109, '冠云 中华老字号 山西特产 平遥牛肉礼盒(158gX6袋)948g', 0, NULL, '中华老字号 平遥牛肉礼盒(158gX6袋)948g', 152, 'images/product/89.jpg', 0, NULL, 654, 3, 32, NULL);
INSERT INTO `product` VALUES (110, '山西特产 维之王山楂片268g*2袋', 0, NULL, '山西特产 维之王山楂片268g*2袋', 32, 'images/product/90.jpg', 0, NULL, 214, 3, 32, NULL);
INSERT INTO `product` VALUES (111, '武汉特产 周黑鸭鸭脖210g', 0, NULL, '武汉特产 周黑鸭鸭脖210g', 26, 'images/product/91.jpg', 0, NULL, 55, 3, 33, NULL);
INSERT INTO `product` VALUES (112, '中华老字号 重庆老四川金角五香牛肉干138g', 0, NULL, '中华老字号 重庆老四川金角五香牛肉干138g', 25, 'images/product/92.jpg', 0, NULL, 112, 3, 33, NULL);
INSERT INTO `product` VALUES (113, '武汉特产 周黑鸭锁骨300g', 0, NULL, '武汉特产 周黑鸭锁骨300g', 28, 'images/product/93.jpg', 0, NULL, 6211, 3, 33, NULL);
INSERT INTO `product` VALUES (114, '重庆特产 有友泡凤爪山椒味100g*5袋', 0, NULL, '重庆特产 有友泡凤爪山椒味100g*5袋', 22, 'images/product/94.jpg', 0, NULL, 445, 3, 33, NULL);
INSERT INTO `product` VALUES (115, '百草味靖江猪肉脯200g×2袋装靖江特产蜜汁精致猪肉干', 0, NULL, '百草味靖江猪肉脯200g×2袋装', 39, 'images/product/95.jpg', 0, NULL, 123, 3, 33, NULL);
INSERT INTO `product` VALUES (116, '食塘薄皮核桃1000g', 0, NULL, '食塘薄皮核桃1000g', 53, 'images/product/96.jpg', 0, NULL, 415, 3, 33, NULL);
INSERT INTO `product` VALUES (117, '三只松鼠夏威夷果265gx2包奶油味送开口器坚果炒货春季热卖AB1', 0, NULL, '夏威夷果265gx2包奶油味', 37, 'images/product/97.jpg', 0, NULL, 119, 3, 33, NULL);
INSERT INTO `product` VALUES (118, '黄飞红麻辣花生210g', 0, NULL, '黄飞红麻辣花生210g', 9, 'images/product/98.jpg', 0, NULL, 6513, 3, 33, NULL);
INSERT INTO `product` VALUES (119, '楼兰蜜语 新疆纯野生无漂白 薄皮核桃500gx2包 新包装送夹子', 0, NULL, '楼兰蜜语 新疆薄皮核桃500gx2包', 50, 'images/product/99.jpg', 0, NULL, 1341, 3, 33, NULL);
INSERT INTO `product` VALUES (120, '福建特产 友臣 金丝肉松饼208g', 0, NULL, '福建特产 友臣 金丝肉松饼208g', 10, 'images/product/100.jpg', 0, NULL, 4115, 3, 33, NULL);
INSERT INTO `product` VALUES (121, '【包邮】友臣金丝肉松饼整箱2.5kg 约70个 休闲零食品', 0, NULL, '【包邮】友臣金丝肉松饼整箱2.5kg 约70个', 67, 'images/product/101.jpg', 0, NULL, 4141, 3, 33, NULL);
INSERT INTO `product` VALUES (122, '食塘薄皮核桃1000g', 0, NULL, '食塘薄皮核桃1000g', 52, 'images/product/102.jpg', 0, NULL, 123, 3, 33, NULL);
INSERT INTO `product` VALUES (123, '越南进口利葡面包干300g*2袋（Lipo商品名称更换中随机发货）', 0, NULL, '越南进口利葡面包干300g*2袋', 26, 'images/product/103.jpg', 0, NULL, 463, 3, 33, NULL);
INSERT INTO `product` VALUES (124, '索尼（SONY） KDL-47R500A 47英寸 全高清3D LED液晶电视 黑色', 0, NULL, '索尼（SONY） KDL-47R500A 47英寸 全高清3D', 4099, 'images/product/104.jpg', 0, NULL, 78, 4, 34, NULL);
INSERT INTO `product` VALUES (125, '海尔模卡（MOOKA） U50H7 50英寸 4K极高清8核3D安卓智能电视', 0, NULL, '海尔模卡（MOOKA） U50H7 50英寸 4K极高清8核', 4099, 'images/product/105.jpg', 0, NULL, 654, 4, 34, NULL);
INSERT INTO `product` VALUES (126, '海尔模卡（MOOKA） 48A5 48英寸 窄边框安卓智能电视', 0, NULL, '海尔模卡（MOOKA）48英寸 窄边框安卓智能电视', 3999, 'images/product/106.jpg', 0, NULL, 123, 4, 34, NULL);
INSERT INTO `product` VALUES (127, 'F3301B 32英寸 窄边蓝光USB播放LED电视(黑色）', 0, NULL, 'TCL 32英寸 窄边蓝光USB播放LED电视(黑色）', 2999, 'images/product/107.jpg', 0, NULL, 456, 4, 34, NULL);
INSERT INTO `product` VALUES (128, '飞利浦（PHILIPS） 50PFL3040/T3 50英寸 全高清LED液晶电视(黑色）', 0, NULL, '飞利浦 50PFL3040/T3 50英寸 全高清LED液晶', 1298, 'images/product/108.jpg', 0, NULL, 123, 4, 34, NULL);
INSERT INTO `product` VALUES (129, '夏普（SHARP）LCD-40DS20A 40英寸日本原装面板', 0, NULL, '夏普 40英寸日本原装面板', 3699, 'images/product/109.jpg', 0, NULL, 11, 4, 34, NULL);
INSERT INTO `product` VALUES (130, '飞利浦（PHILIPS） 32PFL3045/T3 32英寸 高清LED液晶电视（黑色）', 0, NULL, '飞利浦 32PFL3045/T3 32英寸 高清LED液晶电视', 2799, 'images/product/110.jpg', 0, NULL, 61, 4, 34, NULL);
INSERT INTO `product` VALUES (131, '康佳（KONKA） LED49K70A KKTV 49英寸网络安卓智能液晶电视(黑色)', 0, NULL, '康佳 LED49K70A KKTV 49英寸网络安卓智能液晶', 2999, 'images/product/111.jpg', 0, NULL, 651, 4, 34, NULL);
INSERT INTO `product` VALUES (132, '康佳（KONKA） LED32E330C 32英寸 高清窄边LED（银色）', 0, NULL, '康佳 LED32E330C 32英寸 高清窄边LED（银色）', 1298, 'images/product/112.jpg', 0, NULL, 654, 4, 34, NULL);
INSERT INTO `product` VALUES (133, '长虹（CHANGHONG） 3D51C2280 51英寸 3D护眼电视（黑色）', 0, NULL, '长虹 3D51C2280 51英寸 3D护眼电视（黑色）', 3699, 'images/product/113.jpg', 0, NULL, 65, 4, 34, NULL);
INSERT INTO `product` VALUES (134, '乐视TV 超级电视（Letv） S50 50英寸 3D 智能LED液晶电视 黑色', 0, NULL, '乐视TV 超级电视（Letv） S50 50英寸 3D', 2799, 'images/product/114.jpg', 0, NULL, 134, 4, 34, NULL);
INSERT INTO `product` VALUES (135, '夏普（SHARP）LCD-46DS20A 46英寸日本原装面板', 0, NULL, '夏普（SHARP）LCD-46DS20A 46英寸日本原装', 1399, 'images/product/115.jpg', 0, NULL, 76, 4, 34, NULL);
INSERT INTO `product` VALUES (136, '索尼（SONY） KDL-60R520A 60英寸 全高清网络 LED液晶电视（黑色）', 0, NULL, '索尼 KDL-60R520A 60英寸 全高清网络', 2999, 'images/product/116.jpg', 0, NULL, 878, 4, 34, NULL);
INSERT INTO `product` VALUES (137, '海信（Hisense）LED50EC310JD 50英寸全网Vision 智能电视（黑色）', 0, NULL, '海信 LED50EC310JD 50英寸全网Vision ', 1298, 'images/product/117.jpg', 0, NULL, 45, 4, 34, NULL);
INSERT INTO `product` VALUES (139, 'TCL XQB50-1678NS 5公斤 全自动洗衣机（浅灰色）', 0, NULL, 'TCL XQB50-1678NS 5公斤 全自动洗衣机', 818, 'images/product/118.jpg', 0, NULL, 51, 4, 35, NULL);
INSERT INTO `product` VALUES (140, '松下(panasonic) XQB65-Q76201 6.5公斤 全自动波轮洗衣机（灰色）', 0, NULL, '松下 XQB65-Q76201 6.5公斤 全自动', 1499, 'images/product/119.jpg', 0, NULL, 456, 4, 35, NULL);
INSERT INTO `product` VALUES (141, 'LG WD-N12435D 6公斤 静音系列滚筒洗衣机（白色）', 0, NULL, 'LG WD-N12435D 6公斤 静音系列滚筒洗衣机', 2349, 'images/product/120.jpg', 0, NULL, 1327, 4, 35, NULL);
INSERT INTO `product` VALUES (142, '小天鹅（Little Swan） TB55-V1068 5.5公斤 波轮全自动洗衣机（灰色）', 0, NULL, '小天鹅（Little Swan） TB55-V1068 5.5公斤', 998, 'images/product/121.jpg', 0, NULL, 189, 4, 35, NULL);
INSERT INTO `product` VALUES (143, '海尔（Haier） XQB60-M1269 6公斤 波轮全自动洗衣机', 0, NULL, '海尔 6公斤 波轮全自动洗衣机', 1498, 'images/product/122.jpg', 0, NULL, 1626, 4, 35, NULL);
INSERT INTO `product` VALUES (144, 'LG WD-N12430D 6公斤 静音系列滚筒洗衣机（白色）', 0, NULL, 'LG WD-N12430D 6公斤 静音系列滚筒洗衣机', 1299, 'images/product/123.jpg', 0, NULL, 741, 4, 35, NULL);
INSERT INTO `product` VALUES (145, '海尔（Haier） XQG60-1000J 6公斤 1000转滚筒洗衣机（瓷白）', 0, NULL, '海尔 6公斤 1000转滚筒洗衣机（瓷白）', 2599, 'images/product/124.jpg', 0, NULL, 1134, 4, 35, NULL);
INSERT INTO `product` VALUES (146, NULL, 0, NULL, '容声 BCD-202M/TX6-GF61-C 202升 三门冰箱', 1549, 'images/product/125.jpg', 0, NULL, 85, 4, 36, NULL);
INSERT INTO `product` VALUES (147, NULL, 0, NULL, '康佳 BCD-138UTS-GY 138升 双门冰箱', 898, 'images/product/126.jpg', 0, NULL, 415, 4, 36, NULL);
INSERT INTO `product` VALUES (148, NULL, 0, NULL, '美的 BCD-185QM 185升 双门冰箱', 1699, 'images/product/127.jpg', 0, NULL, 160, 4, 36, NULL);
INSERT INTO `product` VALUES (289, '极致优雅气质/轻薄垂坠/耗料三层荷叶边大摆/蕾丝拼接封腰式显瘦设计/轻盈旋转梦幻般的清新/精品推荐！', 0, NULL, '阿卡春装新款蕾丝绣花收腰显瘦中长袖', 298, 'images/product/1.jpg', 0, NULL, 99, 1, 6, NULL);
INSERT INTO `product` VALUES (291, 'Vero Moda透视拼接修身包边圆领蕾', 0, NULL, 'Vero Moda透视拼接修身包边圆领蕾', 499, 'images/product/2.jpg', 0, NULL, 99, 1, 6, NULL);
INSERT INTO `product` VALUES (294, '爱丽缇 2014夏装新款韩版七分袖圆领', 0, NULL, '爱丽缇 2014夏装新款韩版七分袖圆领', 138, 'images/product/3.jpg', 0, NULL, 120, 1, 6, NULL);
INSERT INTO `product` VALUES (296, '太平鸟男装男士休闲格子西装/西服修身', 1, '2014-09-12 18:32:53', '太平鸟男装男士休闲格子西装/西服修身', 529, 'images/product/4.jpg', 1, '2014-09-12 18:33:10', 15, 1, 7, NULL);
INSERT INTO `product` VALUES (298, '测试', 1, '2018-03-24 16:49:43', '测试', 1, 'images/product/1bac6010587f49d68871a94dff8646501521881383249.jpg', 0, '2018-03-24 16:49:43', 1, 2, 30, NULL);
INSERT INTO `product` VALUES (299, '测设2', 1, '2018-03-24 17:02:15', '测试2', 2, 'images/product/b41786be6bfa493d8f94ef68bc8ccb0b1521882135342.jpg', 0, '2018-03-24 17:02:15', 2, 2, 29, NULL);

-- ----------------------------
-- Table structure for smalltype
-- ----------------------------
DROP TABLE IF EXISTS `smalltype`;
CREATE TABLE `smalltype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bigTypeId` int(11) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_a9rcrieyoywpcgb1luxsbir8s`(`bigTypeId`) USING BTREE,
  CONSTRAINT `FK_a9rcrieyoywpcgb1luxsbir8s` FOREIGN KEY (`bigTypeId`) REFERENCES `bigtype` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of smalltype
-- ----------------------------
INSERT INTO `smalltype` VALUES (6, '连衣裙', '1', 1, NULL);
INSERT INTO `smalltype` VALUES (7, '男士西装', NULL, 1, NULL);
INSERT INTO `smalltype` VALUES (8, '牛仔裤', NULL, 1, NULL);
INSERT INTO `smalltype` VALUES (9, '相机', NULL, 2, NULL);
INSERT INTO `smalltype` VALUES (29, '音箱', NULL, 2, NULL);
INSERT INTO `smalltype` VALUES (30, 'MP3/MP4', NULL, 2, NULL);
INSERT INTO `smalltype` VALUES (31, '进口食品', NULL, 3, NULL);
INSERT INTO `smalltype` VALUES (32, '地方特产', NULL, 3, NULL);
INSERT INTO `smalltype` VALUES (33, '休闲食品', NULL, 3, NULL);
INSERT INTO `smalltype` VALUES (34, '平板电视', NULL, 4, NULL);
INSERT INTO `smalltype` VALUES (35, '洗衣机', NULL, 4, NULL);
INSERT INTO `smalltype` VALUES (36, '冰箱', NULL, 4, NULL);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, '音乐', 'http://www.java1234.com');
INSERT INTO `tag` VALUES (2, '影视', 'http://www.baidu.com');
INSERT INTO `tag` VALUES (3, '少儿', NULL);
INSERT INTO `tag` VALUES (4, '运动鞋', NULL);
INSERT INTO `tag` VALUES (5, '美容护肤', NULL);
INSERT INTO `tag` VALUES (6, '家纺用品', NULL);
INSERT INTO `tag` VALUES (7, '婴幼奶粉', NULL);
INSERT INTO `tag` VALUES (8, '饰品', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` datetime(0) NULL DEFAULT NULL,
  `dentityCode` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isDelete` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'xx', 'xx', '2018-03-12 00:00:00', 'xx', 'xx', 'xx', NULL, 'xx', '男', 1, 1);
INSERT INTO `user` VALUES (2, 'AS', '', NULL, '', '', '', NULL, 'AS', '男', 0, 1);
INSERT INTO `user` VALUES (3, 'H', '', NULL, '', '', '', NULL, '', '男', 0, 1);
INSERT INTO `user` VALUES (4, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 0, 1);
INSERT INTO `user` VALUES (5, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 0, 1);
INSERT INTO `user` VALUES (6, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (7, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (8, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (9, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (10, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (11, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (12, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (13, '11', '1', '2018-03-05 00:00:00', '1', '1', '1', NULL, '11', '男', 1, 1);
INSERT INTO `user` VALUES (14, 'SA', 'SA', '2018-02-26 00:00:00', 'SA', 'SA', 'AS', NULL, 'SA', '男', 1, 1);
INSERT INTO `user` VALUES (15, '123', '321', '2018-03-05 00:00:00', '321', '123', '123', NULL, '123', '男', 1, 1);
INSERT INTO `user` VALUES (16, 'xxx', 'xx', '2018-02-27 00:00:00', 'xx', 'xx', 'xx', NULL, 'xxx', '男', 1, 1);
INSERT INTO `user` VALUES (17, 'liheng', '湖北省武汉市洪山区碧桂园厚溥软件学院', '2018-03-10 14:05:41', '58454136', '1456456@qq.com', '524561521', '李恒', 'liheng', '男', 1, 1);
INSERT INTO `user` VALUES (18, 'admin', '湖北省武汉市洪山区碧桂园厚溥软件学院', '2018-03-07 23:07:51', '12213', '5454564564', '45656464', 'admin', 'admin', '女', 1, 2);

SET FOREIGN_KEY_CHECKS = 1;
