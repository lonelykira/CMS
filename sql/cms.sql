/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2014-12-13 00:21:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminId` bigint(10) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `email` varchar(45) DEFAULT NULL COMMENT '邮件地址',
  `name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `password` varchar(32) DEFAULT NULL COMMENT 'MD5(密码+email) ',
  `status` varchar(20) DEFAULT NULL COMMENT '状态:init(初始化), normal(正常),freeze(冻结)',
  `roleId` varchar(12) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `createUser` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateUser` varchar(100) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`adminId`),
  UNIQUE KEY `idx_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'cmstest@shishuo.com', 'cmstest111', '4a3981e0b096eb5a273f07f2b82b7eab', 'init', null, null, null, '2014-02-17 10:59:07', null, null);
INSERT INTO `admin` VALUES ('5', 'admin@qq.com', 'admin', 'b9d11b3be25f5a1a7dc8ca04cd310b28', 'init', null, null, null, '2014-11-21 10:10:48', null, null);
INSERT INTO `admin` VALUES ('6', 'admin', 'xxx', 'eac4108912af90ae96e858190f4d8af7', 'init', null, null, null, '2014-11-21 10:42:37', null, null);
INSERT INTO `admin` VALUES ('7', 'molingcool@163.com', 'kid', '11b7837e163b06d1f97fa71e0759d90a', 'init', null, null, null, '2014-11-21 10:43:53', null, null);
INSERT INTO `admin` VALUES ('15', '7567', '56756', '4c3a88e53b3c46e84157af6b2421cab7', 'init', null, null, null, '2014-11-21 11:58:16', null, null);

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `articleId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文件ID',
  `firstFolderId` bigint(20) NOT NULL DEFAULT '1' COMMENT '一级目录Id',
  `secondFolderId` bigint(20) NOT NULL DEFAULT '0' COMMENT '二级目录Id',
  `thirdFolderId` bigint(20) NOT NULL DEFAULT '0' COMMENT '三级目录Id',
  `fourthFolderId` bigint(20) NOT NULL DEFAULT '0' COMMENT '四级目录Id',
  `adminId` bigint(20) DEFAULT '0' COMMENT '管理员ID',
  `name` varchar(200) DEFAULT '' COMMENT '文件名称',
  `title` varchar(200) DEFAULT '' COMMENT '标题',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '价格，报价',
  `realPrice` decimal(10,2) DEFAULT '0.00' COMMENT '实际价格',
  `copyCount` int(11) DEFAULT '0' COMMENT '文件被copy的次数，相当于是商品的库存',
  `content` text COMMENT '文件内容',
  `description` text COMMENT '文件的描述',
  `viewCount` int(11) DEFAULT '0' COMMENT '浏览数',
  `commentCount` int(11) DEFAULT '0' COMMENT '评论数',
  `owner` varchar(20) DEFAULT 'app' COMMENT ' 创建方式  （system）系统创建 ，（app）应用创建\n		\n',
  `type` varchar(20) DEFAULT 'article' COMMENT '文件类型：0 文章 1 照片 2 下载 3 商品',
  `status` varchar(20) DEFAULT 'init' COMMENT '状态：0 隐藏 1 显示',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  `expireTime` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`articleId`,`thirdFolderId`,`fourthFolderId`,`secondFolderId`),
  KEY `idx_folder` (`status`,`firstFolderId`,`secondFolderId`,`thirdFolderId`,`fourthFolderId`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='文件';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '3', '5', '0', '0', '0', '美丽', '', '0.00', '0.00', '0', '<p>美丽<br/></p>', '', '0', '0', 'app', 'article', 'display', '2014-02-28 11:28:27', '2014-11-21 14:42:18', '2014-02-28 11:28:27');
INSERT INTO `article` VALUES ('2', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-02-28 13:30:03', '2014-02-28 13:30:03', '2014-02-28 13:30:03');
INSERT INTO `article` VALUES ('3', '3', '7', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-02-28 13:42:17', '2014-02-28 13:42:17', '2014-02-28 13:42:17');
INSERT INTO `article` VALUES ('4', '3', '7', '0', '0', '0', 'Java', '', '0.00', '0.00', '0', 'Java 是一门很容易学的计算机语言。<br/><p><br/></p>', '', '0', '0', 'app', 'article', 'trash', '2014-02-28 13:57:04', '2014-02-28 13:57:21', '2014-02-28 13:57:04');
INSERT INTO `article` VALUES ('5', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-02-28 14:17:37', '2014-02-28 14:17:37', '2014-02-28 14:17:37');
INSERT INTO `article` VALUES ('6', '12', '13', '0', '0', '0', '这是一篇新闻', '', '0.00', '0.00', '0', '<p>这是一篇新闻<br/></p>', '', '0', '0', 'app', 'article', 'display', '2014-02-28 17:03:15', '2014-02-28 17:03:30', '2014-02-28 17:03:15');
INSERT INTO `article` VALUES ('7', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-21 14:36:48', '2014-11-21 14:36:48', '2014-11-21 14:36:48');
INSERT INTO `article` VALUES ('8', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-21 14:40:35', '2014-11-21 14:40:35', '2014-11-21 14:40:35');
INSERT INTO `article` VALUES ('9', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-21 14:41:57', '2014-11-21 14:41:57', '2014-11-21 14:41:57');
INSERT INTO `article` VALUES ('10', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-21 14:42:24', '2014-11-21 14:42:24', '2014-11-21 14:42:24');
INSERT INTO `article` VALUES ('11', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-21 14:43:17', '2014-11-21 14:43:17', '2014-11-21 14:43:17');
INSERT INTO `article` VALUES ('12', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-21 14:48:07', '2014-11-21 14:48:07', '2014-11-21 14:48:07');
INSERT INTO `article` VALUES ('13', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-21 14:48:57', '2014-11-21 14:48:57', '2014-11-21 14:48:57');
INSERT INTO `article` VALUES ('14', '3', '6', '0', '0', '0', '领跑者从来不惧', '领跑者', '0.00', '0.00', '0', '<p><img src=\"/cms/upload/2014/11/21/1416553800106.jpg\" title=\"??\"/>白色</p>', '<p>白色的雪花<br/></p>', '0', '0', 'app', 'article', 'display', '2014-11-21 14:49:42', '2014-11-21 15:14:07', '2014-11-21 14:49:42');
INSERT INTO `article` VALUES ('15', '2', '0', '0', '0', '0', '1', '', '0.00', '0.00', '0', '<p>2<br/></p>', '', '0', '0', 'app', 'article', 'trash', '2014-11-21 16:07:11', '2014-11-21 16:07:52', '2014-11-21 16:07:11');
INSERT INTO `article` VALUES ('16', '3', '0', '0', '0', '0', '4', '', '0.00', '0.00', '0', '<p>44<br/></p>', '', '0', '0', 'app', 'article', 'trash', '2014-11-21 16:07:56', '2014-11-21 16:08:12', '2014-11-21 16:07:56');
INSERT INTO `article` VALUES ('17', '3', '5', '0', '0', '0', '21312', '', '0.00', '0.00', '0', '<p>3213213213<br/></p>', '<p>546<br/></p>', '0', '0', 'app', 'article', 'trash', '2014-11-24 09:47:08', '2014-11-24 09:47:38', '2014-11-24 09:47:08');
INSERT INTO `article` VALUES ('18', '3', '0', '0', '0', '0', '植树', '', '0.00', '0.00', '0', '<p>植树<br/></p>', '', '0', '0', 'app', 'article', 'display', '2014-11-24 11:49:36', '2014-11-24 11:50:25', '2014-11-24 11:49:36');
INSERT INTO `article` VALUES ('19', '3', '0', '0', '0', '0', '捐助希望小学', '', '0.00', '0.00', '0', '<p>捐助希望小学<br/></p>', '<p>捐助希望小学<br/></p>', '0', '0', 'app', 'article', 'display', '2014-11-24 11:50:30', '2014-11-24 11:53:14', '2014-11-24 11:50:30');
INSERT INTO `article` VALUES ('20', '3', '0', '0', '0', '0', '看望留守老人', '看望留守老人', '0.00', '0.00', '0', '<p>看望留守老人<br/></p>', '<p>看望留守老人<br/></p>', '0', '0', 'app', 'article', 'display', '2014-11-24 11:53:27', '2014-11-24 11:54:09', '2014-11-24 11:53:27');
INSERT INTO `article` VALUES ('21', '3', '0', '0', '0', '0', '日行一善', '日行一善', '0.00', '0.00', '0', '<p>日行一善<br/></p>', '<p>日行一善<br/></p>', '0', '0', 'app', 'article', 'display', '2014-11-24 11:54:25', '2014-11-24 11:55:14', '2014-11-24 11:54:25');
INSERT INTO `article` VALUES ('22', '3', '0', '0', '0', '0', '捐助希望小学', '', '0.00', '0.00', '0', '<p>&nbsp;&nbsp;&nbsp;&nbsp;是日，天朗气清，微风徐徐，结三五友人探望xx小学，并给予关怀物品。</p><p style=\"text-align: center;\"><img src=\"/cms/upload/picture/20141124/1416814844263.jpg\" title=\"mhrm-cpmh-30084.jpg\"/></p>', '<p>&nbsp;&nbsp;&nbsp;&nbsp;众人笑容满面。<br/></p>', '0', '0', 'app', 'article', 'display', '2014-11-24 15:36:20', '2014-11-24 15:42:06', '2014-11-24 15:36:20');
INSERT INTO `article` VALUES ('23', '3', '0', '0', '0', '0', '213', '', '0.00', '0.00', '0', '<p>213123<br/></p>', '', '0', '0', 'app', 'article', 'display', '2014-11-24 15:42:44', '2014-11-24 15:43:02', '2014-11-24 15:42:44');
INSERT INTO `article` VALUES ('24', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-26 17:33:51', '2014-11-26 17:33:51', '2014-11-26 17:33:51');
INSERT INTO `article` VALUES ('25', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-26 19:54:57', '2014-11-26 19:54:57', '2014-11-26 19:54:57');
INSERT INTO `article` VALUES ('26', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-26 20:33:50', '2014-11-26 20:33:50', '2014-11-26 20:33:50');
INSERT INTO `article` VALUES ('27', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-28 17:57:09', '2014-11-28 17:57:09', '2014-11-28 17:57:09');
INSERT INTO `article` VALUES ('28', '1', '0', '0', '0', '0', '', '', '0.00', '0.00', '0', '', '', '0', '0', 'app', 'article', 'init', '2014-11-29 00:11:23', '2014-11-29 00:11:23', '2014-11-29 00:11:23');

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `attachmentId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '附件Id',
  `kindId` bigint(20) DEFAULT '0' COMMENT '种类Id',
  `name` varchar(200) DEFAULT NULL COMMENT '名字',
  `path` varchar(200) DEFAULT NULL COMMENT '附件路径',
  `description` varchar(500) DEFAULT NULL COMMENT '附件描述',
  `size` int(11) DEFAULT NULL COMMENT '附件大小',
  `type` varchar(45) DEFAULT NULL COMMENT '附件类型   相册（photo）  文件（ file）',
  `link` varchar(500) DEFAULT NULL COMMENT '链接',
  `kind` varchar(20) DEFAULT NULL COMMENT '种类 （folder）目录, （article）文章',
  `status` varchar(45) DEFAULT NULL COMMENT '状态  隐藏是嵌入文章的（hidden）,没有嵌入文章的（display）',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`attachmentId`),
  KEY `idx_kind` (`kind`,`kindId`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=ucs2;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('4', '2', 'QQ图片20140213105017.jpg', '/upload/2014/02/13/1392260770067.jpg', '', '61295', 'picture', 'javascript:void(0);', 'article', 'display', '2014-02-13 11:06:10');
INSERT INTO `attachment` VALUES ('5', '2', 'QQ图片20140213110522.jpg', '/upload/2014/02/13/1392260781991.jpg', '', '46566', 'picture', 'javascript:void(0);', 'article', 'display', '2014-02-13 11:06:22');
INSERT INTO `attachment` VALUES ('6', '2', 'QQ图片20140213104934.jpg', '/upload/2014/02/13/1392260792329.jpg', '', '66696', 'picture', 'javascript:void(0);', 'article', 'display', '2014-02-13 11:06:32');
INSERT INTO `attachment` VALUES ('7', '1', '145548_94d8.jpg', 'upload/2014/02/28/1393559430495.jpg', '', '13647', 'picture', 'javascript:void(0);', 'article', 'display', '2014-02-28 11:50:30');
INSERT INTO `attachment` VALUES ('8', '9', '2014_02_13_44b6a313275f4e08b52d9fcb9db531de.jpg', 'upload/2014/02/28/1393568904989.jpg', '', '4565', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:28:25');
INSERT INTO `attachment` VALUES ('10', '9', '杨海波 - 师说.png', 'upload/2014/02/28/1393568983646.png', '', '196227', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:29:44');
INSERT INTO `attachment` VALUES ('11', '9', '2014_02_13_44b6a313275f4e08b52d9fcb9db531de.jpg', 'upload/2014/02/28/1393569295965.jpg', '', '4565', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:34:56');
INSERT INTO `attachment` VALUES ('12', '9', 'course.jpg', 'upload/2014/02/28/1393569296024.jpg', '', '54449', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:34:56');
INSERT INTO `attachment` VALUES ('13', '9', '2014_02_13_44b6a313275f4e08b52d9fcb9db531de.jpg', 'upload/2014/02/28/1393569688470.jpg', '', '4565', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:41:28');
INSERT INTO `attachment` VALUES ('14', '9', 'course.jpg', 'upload/2014/02/28/1393569688509.jpg', '', '54449', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:41:29');
INSERT INTO `attachment` VALUES ('15', '9', '145548_94d8.jpg', 'upload/2014/02/28/1393569688586.jpg', '', '13647', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:41:29');
INSERT INTO `attachment` VALUES ('16', '9', '杨海波 - 师说.png', 'upload/2014/02/28/1393569688617.png', '', '196227', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:41:29');
INSERT INTO `attachment` VALUES ('17', '9', '1111-1.png', 'upload/2014/02/28/1393569688700.png', '', '423433', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:41:29');
INSERT INTO `attachment` VALUES ('18', '9', 'swdjz1.jpg', 'upload/2014/02/28/1393569688737.jpg', '', '947707', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-02-28 14:41:29');
INSERT INTO `attachment` VALUES ('22', '7', '599750_1286086064SSce.jpg', '/upload/2014/11/21/1416551849754.jpg', '', '47392', 'picture', 'javascript:void(0);', 'article', 'hidden', '2014-11-21 14:37:29');
INSERT INTO `attachment` VALUES ('23', '14', '599750_1286086064SSce.jpg', '/upload/2014/11/21/1416553554428.jpg', '', '266971', 'picture', 'www.baidu.com', 'article', 'display', '2014-11-21 15:05:54');
INSERT INTO `attachment` VALUES ('24', '14', 'Redocn_2012112914051307(2).jpg', '/upload/2014/11/21/1416553800106.jpg', '', '150150', 'picture', 'javascript:void(0);', 'article', 'hidden', '2014-11-21 15:10:00');
INSERT INTO `attachment` VALUES ('38', '22', 'mhrm-cpmh-30084.jpg', '/upload/picture/20141124/1416814844263.jpg', '', '134710', 'picture', 'javascript:void(0);', 'article', 'hidden', '2014-11-24 15:40:44');
INSERT INTO `attachment` VALUES ('39', '11', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416876398194.jpg', '', '76427', 'picture', 'javascript:void(0);', 'folder', 'hidden', '2014-11-25 08:46:38');
INSERT INTO `attachment` VALUES ('50', '0', 'mhrm-cpmh-30084.jpg', '/upload/picture/20141125/1416877510174.jpg', null, '134708', 'picture', 'javascript:void(0);', null, null, '2014-11-25 09:05:10');
INSERT INTO `attachment` VALUES ('51', '0', '11709119_0.jpg', '/upload/picture/20141125/1416877520055.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 09:05:20');
INSERT INTO `attachment` VALUES ('59', '0', 'mhrm-cpmh-30084.jpg', '/upload/picture/20141125/1416879451199.jpg', null, '134708', 'picture', 'javascript:void(0);', null, null, '2014-11-25 09:37:31');
INSERT INTO `attachment` VALUES ('62', '11', 'mhrm-cpmh-30084.jpg', '/upload/picture/20141125/1416882983429.jpg', '', '134708', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-11-25 10:36:23');
INSERT INTO `attachment` VALUES ('63', '11', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416884469092.jpg', '', '254148', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-11-25 11:01:09');
INSERT INTO `attachment` VALUES ('64', '11', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416897303013.jpg', '', '254148', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-11-25 14:35:03');
INSERT INTO `attachment` VALUES ('65', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416897609136.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 14:40:09');
INSERT INTO `attachment` VALUES ('66', '0', '20130320161819773273.jpg', '/upload/picture/20141125/1416897686878.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-25 14:41:26');
INSERT INTO `attachment` VALUES ('67', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416898706843.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 14:58:26');
INSERT INTO `attachment` VALUES ('68', '11', '20130320161819773273.jpg', '/upload/picture/20141125/1416899493276.jpg', '', '103353', 'picture', 'javascript:void(0);', 'folder', 'display', '2014-11-25 15:11:33');
INSERT INTO `attachment` VALUES ('69', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416900389383.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:26:29');
INSERT INTO `attachment` VALUES ('70', '0', 'mhrm-cpmh-30084.jpg', '/upload/picture/20141125/1416900410257.jpg', null, '134708', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:26:50');
INSERT INTO `attachment` VALUES ('71', '0', '20130320161819773273.jpg', '/upload/picture/20141125/1416900572775.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:29:32');
INSERT INTO `attachment` VALUES ('72', '0', '11709119_0.jpg', '/upload/picture/20141125/1416900608169.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:30:08');
INSERT INTO `attachment` VALUES ('73', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416900743231.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:32:23');
INSERT INTO `attachment` VALUES ('74', '0', '11709119_0.jpg', '/upload/picture/20141125/1416900766893.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:32:46');
INSERT INTO `attachment` VALUES ('75', '0', '11709119_0.jpg', '/upload/picture/20141125/1416900804590.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:33:24');
INSERT INTO `attachment` VALUES ('76', '0', '11709119_0.jpg', '/upload/picture/20141125/1416900851859.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:34:11');
INSERT INTO `attachment` VALUES ('77', '0', '11709119_0.jpg', '/upload/picture/20141125/1416900959974.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:35:59');
INSERT INTO `attachment` VALUES ('78', '0', '11709119_0.jpg', '/upload/picture/20141125/1416901012800.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:36:52');
INSERT INTO `attachment` VALUES ('79', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416901066311.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:37:46');
INSERT INTO `attachment` VALUES ('80', '0', 'mhrm-cpmh-30084.jpg', '/upload/picture/20141125/1416901097049.jpg', null, '134708', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:38:17');
INSERT INTO `attachment` VALUES ('81', '0', 'mhrm-cpmh-30084.jpg', '/upload/picture/20141125/1416901157987.jpg', null, '134708', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:39:17');
INSERT INTO `attachment` VALUES ('82', '0', '11709119_0.jpg', '/upload/picture/20141125/1416901192185.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:39:52');
INSERT INTO `attachment` VALUES ('83', '0', '11709119_0.jpg', '/upload/picture/20141125/1416901340071.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:42:20');
INSERT INTO `attachment` VALUES ('84', '0', '20130320161819773273.jpg', '/upload/picture/20141125/1416901347585.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-25 15:42:27');
INSERT INTO `attachment` VALUES ('85', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416903615351.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 16:20:15');
INSERT INTO `attachment` VALUES ('86', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416903869859.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 16:24:29');
INSERT INTO `attachment` VALUES ('87', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416903913609.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 16:25:13');
INSERT INTO `attachment` VALUES ('88', '0', '11709119_0.jpg', '/upload/picture/20141125/1416903942740.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 16:25:42');
INSERT INTO `attachment` VALUES ('89', '0', '11709119_0.jpg', '/upload/picture/20141125/1416903995810.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-25 16:26:35');
INSERT INTO `attachment` VALUES ('90', '0', 'kkxa.swf', '/upload/video/20141125/1416905938474.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-25 16:58:58');
INSERT INTO `attachment` VALUES ('91', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141125/1416905996414.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-25 16:59:56');
INSERT INTO `attachment` VALUES ('92', '0', 'kkxa.mp4', '/upload/video/20141125/1416906242079.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-25 17:04:02');
INSERT INTO `attachment` VALUES ('93', '0', 'kkxa.swf', '/upload/video/20141125/1416906256898.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-25 17:04:16');
INSERT INTO `attachment` VALUES ('94', '0', 'kkxa.swf', '/upload/video/20141125/1416906291921.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-25 17:04:51');
INSERT INTO `attachment` VALUES ('95', '0', 'kkxa.swf', '/upload/video/20141125/1416906313060.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-25 17:05:13');
INSERT INTO `attachment` VALUES ('96', '0', 'kkxa.swf', '/upload/video/20141125/1416906328861.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-25 17:05:28');
INSERT INTO `attachment` VALUES ('97', '0', 'kkxa.swf', '/upload/video/20141125/1416906498365.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-25 17:08:18');
INSERT INTO `attachment` VALUES ('98', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416962776091.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 08:46:16');
INSERT INTO `attachment` VALUES ('99', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416964364481.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 09:12:44');
INSERT INTO `attachment` VALUES ('100', '0', '11709119_0.jpg', '/upload/picture/20141126/1416964399164.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-26 09:13:19');
INSERT INTO `attachment` VALUES ('101', '0', 'kkxa.mp4', '/upload/video/20141126/1416964414326.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 09:13:34');
INSERT INTO `attachment` VALUES ('102', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416964467389.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 09:14:27');
INSERT INTO `attachment` VALUES ('103', '0', 'kkxa.mp4', '/upload/video/20141126/1416964475052.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 09:14:35');
INSERT INTO `attachment` VALUES ('104', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416964706078.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 09:18:26');
INSERT INTO `attachment` VALUES ('105', '0', 'kkxa.mp4', '/upload/video/20141126/1416964719932.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 09:18:39');
INSERT INTO `attachment` VALUES ('106', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416984321546.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 14:45:21');
INSERT INTO `attachment` VALUES ('107', '0', 'kkxa.swf', '/upload/video/20141126/1416984358330.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-26 14:45:58');
INSERT INTO `attachment` VALUES ('108', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416984579438.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 14:49:39');
INSERT INTO `attachment` VALUES ('109', '0', 'kkxa.swf', '/upload/video/20141126/1416984584853.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-26 14:49:44');
INSERT INTO `attachment` VALUES ('110', '0', '11709119_0.jpg', '/upload/picture/20141126/1416984792083.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-26 14:53:12');
INSERT INTO `attachment` VALUES ('111', '0', 'kkxa.mp4', '/upload/video/20141126/1416984803960.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 14:53:23');
INSERT INTO `attachment` VALUES ('112', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416985185580.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 14:59:45');
INSERT INTO `attachment` VALUES ('113', '0', 'kkxa.mp4', '/upload/video/20141126/1416985191689.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 14:59:51');
INSERT INTO `attachment` VALUES ('114', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416985237482.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:00:37');
INSERT INTO `attachment` VALUES ('115', '0', 'kkxa.mp4', '/upload/video/20141126/1416985242359.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:00:42');
INSERT INTO `attachment` VALUES ('116', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416985271712.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:01:11');
INSERT INTO `attachment` VALUES ('117', '0', 'kkxa.mp4', '/upload/video/20141126/1416985278015.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:01:18');
INSERT INTO `attachment` VALUES ('118', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416985319757.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:01:59');
INSERT INTO `attachment` VALUES ('119', '0', 'kkxa.swf', '/upload/video/20141126/1416985326495.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:02:06');
INSERT INTO `attachment` VALUES ('120', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416985358720.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:02:38');
INSERT INTO `attachment` VALUES ('121', '0', 'kkxa.mp4', '/upload/video/20141126/1416985366142.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:02:46');
INSERT INTO `attachment` VALUES ('122', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416985520190.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:05:20');
INSERT INTO `attachment` VALUES ('123', '0', 'kkxa.mp4', '/upload/video/20141126/1416985540251.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:05:40');
INSERT INTO `attachment` VALUES ('124', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416988058430.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:47:38');
INSERT INTO `attachment` VALUES ('125', '0', 'kkxa.swf', '/upload/video/20141126/1416988067485.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:47:47');
INSERT INTO `attachment` VALUES ('126', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416988179714.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:49:39');
INSERT INTO `attachment` VALUES ('127', '0', 'kkxa.mp4', '/upload/video/20141126/1416988185907.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:49:45');
INSERT INTO `attachment` VALUES ('128', '0', 'a6zdxb15004238550897.jpg', '/upload/picture/20141126/1416988201787.jpg', null, '254148', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:50:01');
INSERT INTO `attachment` VALUES ('129', '0', 'kkxa.swf', '/upload/video/20141126/1416988207102.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:50:07');
INSERT INTO `attachment` VALUES ('130', '0', '20130320161819773273.jpg', '/upload/picture/20141126/1416988376911.jpg', null, '103353', 'picture', 'javascript:void(0);', null, null, '2014-11-26 15:52:56');
INSERT INTO `attachment` VALUES ('131', '0', 'kkxa.swf', '/upload/video/20141126/1416988382428.swf', '', '1795331', 'video', 'javascript:void(0);', null, null, '2014-11-26 15:53:02');
INSERT INTO `attachment` VALUES ('132', '0', '11709119_0.jpg', '/upload/picture/20141126/1416991663100.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-26 16:47:43');
INSERT INTO `attachment` VALUES ('133', '0', 'kkxa.mp4', '/upload/video/20141126/1416991704548.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 16:48:24');
INSERT INTO `attachment` VALUES ('134', '0', '11709119_0.jpg', '/upload/picture/20141126/1416991775677.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-26 16:49:35');
INSERT INTO `attachment` VALUES ('135', '0', '11709119_0.jpg', '/upload/picture/20141126/1417003169997.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-26 19:59:29');
INSERT INTO `attachment` VALUES ('136', '0', 'kkxa.mp4', '/upload/video/20141126/1417003190622.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 19:59:50');
INSERT INTO `attachment` VALUES ('137', '0', '11709119_0.jpg', '/upload/picture/20141126/1417003304759.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-26 20:01:44');
INSERT INTO `attachment` VALUES ('138', '0', 'kkxa.mp4', '/upload/video/20141126/1417003311444.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 20:01:51');
INSERT INTO `attachment` VALUES ('139', '0', '11709119_0.jpg', '/upload/picture/20141126/1417004734432.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-11-26 20:25:34');
INSERT INTO `attachment` VALUES ('140', '0', 'kkxa.mp4', '/upload/video/20141126/1417004742038.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 20:25:42');
INSERT INTO `attachment` VALUES ('141', '0', 's_jpg_b641d9fagw1e62falqd31j21hc0u0wjf.jpg', '/upload/picture/20141126/1417004768648.jpg', null, '204060', 'picture', 'javascript:void(0);', null, null, '2014-11-26 20:26:08');
INSERT INTO `attachment` VALUES ('142', '0', 'kkxa2.flv', '/upload/video/20141126/1417004779814.flv', '', '6941084', 'video', 'javascript:void(0);', null, null, '2014-11-26 20:26:19');
INSERT INTO `attachment` VALUES ('143', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141126/1417004963540.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-11-26 20:29:23');
INSERT INTO `attachment` VALUES ('144', '0', 'kkxa.mp4', '/upload/video/20141126/1417004971013.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-11-26 20:29:31');
INSERT INTO `attachment` VALUES ('145', '0', '11709119_0.jpg', '/upload/picture/20141209/1418131940383.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-09 21:32:20');
INSERT INTO `attachment` VALUES ('146', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141209/1418131940967.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-12-09 21:32:20');
INSERT INTO `attachment` VALUES ('147', '0', 's_jpg_b641d9fagw1e62falqd31j21hc0u0wjf.jpg', '/upload/picture/20141209/1418131941134.jpg', null, '204060', 'picture', 'javascript:void(0);', null, null, '2014-12-09 21:32:21');
INSERT INTO `attachment` VALUES ('148', '0', '网站模板2.jpg', '/upload/picture/20141209/1418131941322.jpg', null, '858895', 'picture', 'javascript:void(0);', null, null, '2014-12-09 21:32:21');
INSERT INTO `attachment` VALUES ('149', '0', '11709119_0.jpg', '/upload/picture/20141210/1418226644092.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-10 23:50:44');
INSERT INTO `attachment` VALUES ('150', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141210/1418226843982.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-12-10 23:54:03');
INSERT INTO `attachment` VALUES ('151', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141210/1418226882999.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-12-10 23:54:42');
INSERT INTO `attachment` VALUES ('152', '0', '11709119_0.jpg', '/upload/picture/20141210/1418226896106.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-10 23:54:56');
INSERT INTO `attachment` VALUES ('153', '0', 's_jpg_b641d9fagw1e62falqd31j21hc0u0wjf.jpg', '/upload/picture/20141210/1418226985113.jpg', null, '204060', 'picture', 'javascript:void(0);', null, null, '2014-12-10 23:56:25');
INSERT INTO `attachment` VALUES ('154', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141210/1418227177795.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-12-10 23:59:37');
INSERT INTO `attachment` VALUES ('155', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141211/1418227287197.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-12-11 00:01:27');
INSERT INTO `attachment` VALUES ('156', '0', '11709119_0.jpg', '/upload/picture/20141211/1418227354415.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-11 00:02:34');
INSERT INTO `attachment` VALUES ('157', '0', '11709119_0.jpg', '/upload/picture/20141211/1418227405872.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-11 00:03:25');
INSERT INTO `attachment` VALUES ('158', '0', 's_jpg_b641d9fagw1e62falqd31j21hc0u0wjf.jpg', '/upload/picture/20141211/1418302899007.jpg', null, '204060', 'picture', 'javascript:void(0);', null, null, '2014-12-11 21:01:39');
INSERT INTO `attachment` VALUES ('159', '0', 's_jpg_b641d9fagw1e62falqd31j21hc0u0wjf.jpg', '/upload/picture/20141211/1418303275561.jpg', null, '204060', 'picture', 'javascript:void(0);', null, null, '2014-12-11 21:07:55');
INSERT INTO `attachment` VALUES ('160', '0', '11709119_0.jpg', '/upload/picture/20141211/1418304692179.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-11 21:31:32');
INSERT INTO `attachment` VALUES ('161', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141211/1418307810295.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-12-11 22:23:30');
INSERT INTO `attachment` VALUES ('162', '0', 's_jpg_b641d9fagw1e62falqd31j21hc0u0wjf.jpg', '/upload/picture/20141211/1418307946006.jpg', null, '204060', 'picture', 'javascript:void(0);', null, null, '2014-12-11 22:25:46');
INSERT INTO `attachment` VALUES ('163', '0', '11709119_0.jpg', '/upload/picture/20141211/1418308473462.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-11 22:34:33');
INSERT INTO `attachment` VALUES ('164', '0', 'kkxa.mp4', '/upload/video/20141211/1418308496346.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:34:56');
INSERT INTO `attachment` VALUES ('165', '0', 'kkxa.mp4', '/upload/video/20141211/1418309049137.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:44:09');
INSERT INTO `attachment` VALUES ('166', '0', 'kkxa.mp4', '/upload/video/20141211/1418309114883.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:45:14');
INSERT INTO `attachment` VALUES ('167', '0', 'kkxa2.flv', '/upload/video/20141211/1418309165785.flv', '', '6941084', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:46:05');
INSERT INTO `attachment` VALUES ('168', '0', 'kkxa.mp4', '/upload/video/20141211/1418309172667.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:46:12');
INSERT INTO `attachment` VALUES ('169', '0', 'kkxa.mp4', '/upload/video/20141211/1418309223510.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:47:03');
INSERT INTO `attachment` VALUES ('170', '0', 's_jpg_b641d9fagw1e62falqd31j21hc0u0wjf.jpg', '/upload/picture/20141211/1418309314505.jpg', null, '204060', 'picture', 'javascript:void(0);', null, null, '2014-12-11 22:48:34');
INSERT INTO `attachment` VALUES ('171', '0', 'kkxa.mp4', '/upload/video/20141211/1418309334464.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:48:54');
INSERT INTO `attachment` VALUES ('172', '0', 'kkxa.mp4', '/upload/video/20141211/1418309404183.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:50:04');
INSERT INTO `attachment` VALUES ('173', '0', '可可小爱第六季 第3集.pfv_2014111920756.flv', '/upload/video/20141211/1418309404360.flv', '', '5894139', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:50:04');
INSERT INTO `attachment` VALUES ('174', '0', 'kkxa.mp4', '/upload/video/20141211/1418309475317.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:51:15');
INSERT INTO `attachment` VALUES ('175', '0', 'kkxa.mp4', '/upload/video/20141211/1418309481727.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-11 22:51:21');
INSERT INTO `attachment` VALUES ('176', '0', 'b641d9fagw1e4uj12iv3rj21kw11v19a.jpg', '/upload/picture/20141212/1418387736511.jpg', null, '637574', 'picture', 'javascript:void(0);', null, null, '2014-12-12 20:35:36');
INSERT INTO `attachment` VALUES ('177', '0', 'kkxa.mp4', '/upload/video/20141212/1418390415197.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:20:15');
INSERT INTO `attachment` VALUES ('178', '0', 'kkxa.mp4', '/upload/video/20141212/1418390462656.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:21:02');
INSERT INTO `attachment` VALUES ('179', '0', 'kkxa.mp4', '/upload/video/20141212/1418390596580.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:23:16');
INSERT INTO `attachment` VALUES ('180', '0', 'kkxa.mp4', '/upload/video/20141212/1418390633800.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:23:53');
INSERT INTO `attachment` VALUES ('181', '0', 'kkxa2.flv', '/upload/video/20141212/1418390654432.flv', '', '6941084', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:24:14');
INSERT INTO `attachment` VALUES ('182', '0', 'kkxa.mp4', '/upload/video/20141212/1418390757755.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:25:57');
INSERT INTO `attachment` VALUES ('183', '0', 'kkxa.mp4', '/upload/video/20141212/1418391190553.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:33:10');
INSERT INTO `attachment` VALUES ('184', '0', 'kkxa.mp4', '/upload/video/20141212/1418391194701.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:33:14');
INSERT INTO `attachment` VALUES ('185', '0', '可可小爱第六季 第3集.pfv_2014111920756.flv', '/upload/video/20141212/1418391198886.flv', '', '5894139', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:33:18');
INSERT INTO `attachment` VALUES ('186', '0', 'kkxa.mp4', '/upload/video/20141212/1418391253658.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:34:13');
INSERT INTO `attachment` VALUES ('187', '0', 'kkxa.mp4', '/upload/video/20141212/1418391294817.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:34:54');
INSERT INTO `attachment` VALUES ('188', '0', 'kkxa.mp4', '/upload/video/20141212/1418391976140.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:46:16');
INSERT INTO `attachment` VALUES ('189', '0', 'kkxa.mp4', '/upload/video/20141212/1418392440017.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:54:00');
INSERT INTO `attachment` VALUES ('190', '0', 'kkxa.mp4', '/upload/video/20141212/1418392459109.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:54:19');
INSERT INTO `attachment` VALUES ('191', '0', 'kkxa.mp4', '/upload/video/20141212/1418392578238.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:56:18');
INSERT INTO `attachment` VALUES ('192', '0', 'kkxa.mp4', '/upload/video/20141212/1418392693817.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 21:58:13');
INSERT INTO `attachment` VALUES ('193', '0', 'kkxa.mp4', '/upload/video/20141212/1418392910255.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:01:50');
INSERT INTO `attachment` VALUES ('194', '0', 'kkxa.mp4', '/upload/video/20141212/1418392977872.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:02:57');
INSERT INTO `attachment` VALUES ('195', '0', 'kkxa.mp4', '/upload/video/20141212/1418393025103.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:03:45');
INSERT INTO `attachment` VALUES ('196', '0', 'kkxa.mp4', '/upload/video/20141212/1418393093129.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:04:53');
INSERT INTO `attachment` VALUES ('197', '0', 'kkxa.mp4', '/upload/video/20141212/1418395680927.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:48:00');
INSERT INTO `attachment` VALUES ('198', '0', 'kkxa.mp4', '/upload/video/20141212/1418395727916.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:48:47');
INSERT INTO `attachment` VALUES ('199', '0', 'kkxa.mp4', '/upload/video/20141212/1418395812261.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:50:12');
INSERT INTO `attachment` VALUES ('200', '0', 'kkxa.mp4', '/upload/video/20141212/1418396063009.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:54:23');
INSERT INTO `attachment` VALUES ('201', '0', 'kkxa.mp4', '/upload/video/20141212/1418396184930.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:56:24');
INSERT INTO `attachment` VALUES ('202', '0', 'kkxa.mp4', '/upload/video/20141212/1418396264860.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:57:44');
INSERT INTO `attachment` VALUES ('203', '0', 'kkxa.mp4', '/upload/video/20141212/1418396298443.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 22:58:18');
INSERT INTO `attachment` VALUES ('204', '0', '11709119_0.jpg', '/upload/picture/20141212/1418398830040.jpg', null, '70750', 'picture', 'javascript:void(0);', null, null, '2014-12-12 23:40:30');
INSERT INTO `attachment` VALUES ('205', '0', 'kkxa.mp4', '/upload/video/20141212/1418398910303.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:41:50');
INSERT INTO `attachment` VALUES ('206', '0', 'kkxa.mp4', '/upload/video/20141212/1418398918699.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:41:58');
INSERT INTO `attachment` VALUES ('207', '0', 'kkxa.mp4', '/upload/video/20141212/1418399106658.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:45:06');
INSERT INTO `attachment` VALUES ('208', '0', 'kkxa.mp4', '/upload/video/20141212/1418399130850.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:45:30');
INSERT INTO `attachment` VALUES ('209', '0', 'kkxa.mp4', '/upload/video/20141212/1418399210195.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:46:50');
INSERT INTO `attachment` VALUES ('210', '0', 'kkxa.mp4', '/upload/video/20141212/1418399266452.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:47:46');
INSERT INTO `attachment` VALUES ('211', '0', 'kkxa.mp4', '/upload/video/20141212/1418399323719.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:48:43');
INSERT INTO `attachment` VALUES ('212', '0', 'kkxa.mp4', '/upload/video/20141212/1418399331089.mp4', '', '6112547', 'video', 'javascript:void(0);', null, null, '2014-12-12 23:48:51');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `commentId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `userId` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `fatherId` bigint(20) DEFAULT NULL COMMENT '父评论ID',
  `kindId` bigint(20) DEFAULT NULL COMMENT '种类Id',
  `kind` varchar(45) DEFAULT NULL COMMENT '评论类型   隐藏 （article） 显示（folder）\n		',
  `name` varchar(45) DEFAULT NULL COMMENT '评论者',
  `email` varchar(45) DEFAULT NULL COMMENT '评论者邮件地址',
  `url` varchar(200) DEFAULT NULL COMMENT '评论者网址',
  `phone` varchar(45) DEFAULT NULL COMMENT '评论者电话',
  `content` text COMMENT '内容',
  `ip` varchar(45) DEFAULT NULL COMMENT 'Ip',
  `status` varchar(20) DEFAULT NULL COMMENT '状态       隐藏 hidden 显示 display 垃圾trash',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`commentId`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '0', '0', '11', 'folder', 'sdv', 'sdfv', null, '', 'dfbtgebergvergfv', 'localhost:8080', 'trash', '2014-02-21 14:26:31');
INSERT INTO `comment` VALUES ('2', '0', '0', '11', 'folder', 'efsfds', 'dfegregregr@qq.com', null, '', 'fovnonoenvolwlkcfnweoifbow', 'localhost:8080', 'hidden', '2014-02-21 14:27:43');
INSERT INTO `comment` VALUES ('3', '0', '0', '11', 'folder', 'sdfwe', 'ewfdsf', null, '', 'sdfvgfrbvc', 'localhost:8080', 'hidden', '2014-02-21 15:01:15');
INSERT INTO `comment` VALUES ('4', '0', '0', '11', 'folder', 'sdfsw', 'sdfwef', null, '', 'fdsbedfbr', 'localhost:8080', 'hidden', '2014-02-21 15:02:06');
INSERT INTO `comment` VALUES ('5', '0', '0', '11', 'folder', 'sdv', 'asf', null, '', 'fdgbergbvervger', 'localhost:8080', 'hidden', '2014-02-21 15:11:58');
INSERT INTO `comment` VALUES ('6', '0', '0', '11', 'folder', 'wegrg', 'dsvfdeve@s.com', null, '', 'sdvfr', 'localhost:8080', 'hidden', '2014-02-21 15:13:09');
INSERT INTO `comment` VALUES ('7', '0', '0', '4', 'folder', '杨海波', 'cms@shishuo.com', '', '', '哇哈哈哈哈', '127.0.0.1:8080', 'hidden', '2014-03-01 20:46:17');
INSERT INTO `comment` VALUES ('8', '0', '0', '4', 'folder', '啊哈哈', 'shishuo.com@mail.clm', '', '', 'ddasdfasdfadf', '127.0.0.1:8080', 'display', '2014-03-01 20:47:01');

-- ----------------------------
-- Table structure for `config`
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `key` varchar(45) NOT NULL COMMENT 'Key',
  `value` varchar(45) DEFAULT NULL COMMENT '值',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站配置';

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('sys_sitedesc', '国内儿童教育领跑者之一', '网站描述', '2012-08-08 00:00:00');
INSERT INTO `config` VALUES ('sys_sitename', '可可小爱', '网站名称', '2012-08-08 00:00:00');
INSERT INTO `config` VALUES ('sys_theme', 'cms', '网站模板名称', '2012-08-08 00:00:00');

-- ----------------------------
-- Table structure for `folder`
-- ----------------------------
DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder` (
  `folderId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '目录ID',
  `fatherId` bigint(20) NOT NULL DEFAULT '0' COMMENT '父亲Id，用于构建目录树',
  `ename` varchar(45) NOT NULL COMMENT '英文名',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '中文名',
  `path` varchar(200) NOT NULL DEFAULT '' COMMENT '路径',
  `content` text COMMENT '内容',
  `level` tinyint(4) DEFAULT '1' COMMENT '层级',
  `sort` tinyint(4) DEFAULT '0' COMMENT '排序',
  `count` int(11) DEFAULT '0' COMMENT '文件数',
  `rank` varchar(20) DEFAULT 'everyone' COMMENT '等级  任何人 everyone 登录用户 login,vip用户 vip 管理员admin',
  `type` varchar(45) DEFAULT 'folder' COMMENT '种类  页面page  列表list  目录folder  所有all',
  `status` varchar(20) DEFAULT 'hidden' COMMENT '状态：0 隐藏 1 现实',
  `owner` varchar(45) DEFAULT 'app' COMMENT '创建方式   系统创建  system ,  应用创建 app',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`folderId`),
  UNIQUE KEY `idx_ename` (`ename`),
  KEY `idx_status` (`fatherId`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='目录';

-- ----------------------------
-- Records of folder
-- ----------------------------
INSERT INTO `folder` VALUES ('1', '0', 'default', '默认', '1', '', '1', '0', '0', 'everyone', 'folder', 'hidden', 'app', '2014-02-28 15:33:53', null);
INSERT INTO `folder` VALUES ('2', '0', 'service', '服务', '2', '', '1', '1', '0', 'everyone', 'folder', 'display', 'app', '2014-02-12 14:42:17', null);
INSERT INTO `folder` VALUES ('3', '0', 'blog', '博客', '3', '', '1', '2', '0', 'everyone', 'folder', 'display', 'app', '2014-02-12 14:43:52', null);
INSERT INTO `folder` VALUES ('4', '0', 'contact', '联系我们', '3', '', '1', '4', '0', 'everyone', 'folder', 'display', 'app', '2014-02-27 17:34:33', null);
INSERT INTO `folder` VALUES ('5', '3', 'life', '生活', '3#5', '', '2', '1', '0', 'everyone', 'article', 'display', 'app', '2014-02-28 11:21:16', null);
INSERT INTO `folder` VALUES ('6', '3', 'work', '工作', '3#6', '', '2', '1', '0', 'everyone', 'article', 'display', 'app', '2014-02-28 11:21:31', null);
INSERT INTO `folder` VALUES ('7', '3', 'java', 'Java', '3#7', '', '2', '1', '0', 'everyone', 'article', 'display', 'app', '2014-02-28 11:21:58', null);
INSERT INTO `folder` VALUES ('8', '3', 'movie', '电影', '3#8', '', '2', '1', '0', 'everyone', 'article', 'display', 'app', '2014-02-28 11:22:29', null);
INSERT INTO `folder` VALUES ('9', '3', 'photo', '相册', '3#9', '', '2', '1', '0', 'everyone', 'picture', 'display', 'app', '2014-02-28 13:56:45', null);
INSERT INTO `folder` VALUES ('11', '1', 'top', '首页头图', '1#11', '<p><img src=\"/cms/upload/picture/20141125/1416876398194.jpg\" title=\"a6zdxb15004238550897.jpg\"/></p>', '2', '1', '0', 'everyone', 'picture', 'hidden', 'app', '2014-02-28 15:38:03', null);
INSERT INTO `folder` VALUES ('12', '0', 'news', '新闻', '12', '', '1', '3', '0', 'everyone', 'folder', 'display', 'app', '2014-02-28 15:56:06', null);
INSERT INTO `folder` VALUES ('13', '12', 'corp', '公司新闻', '12#13', '', '2', '1', '0', 'everyone', 'article', 'display', 'app', '2014-02-28 15:57:45', null);
INSERT INTO `folder` VALUES ('14', '12', 'industry', '行业新闻', '12#14', '', '2', '1', '0', 'everyone', 'article', 'display', 'app', '2014-02-28 15:58:12', null);

-- ----------------------------
-- Table structure for `kkxa_article`
-- ----------------------------
DROP TABLE IF EXISTS `kkxa_article`;
CREATE TABLE `kkxa_article` (
  `articleid` int(11) NOT NULL,
  `columnid` char(10) DEFAULT NULL,
  `columnname` char(10) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `content` text,
  `description` varchar(300) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kkxa_article
-- ----------------------------

-- ----------------------------
-- Table structure for `kkxa_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `kkxa_attachment`;
CREATE TABLE `kkxa_attachment` (
  `attachmentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `columnid` int(11) DEFAULT NULL COMMENT '分类id',
  `columnname` varchar(100) DEFAULT NULL COMMENT '分类名称',
  `name` varchar(200) DEFAULT NULL COMMENT '文件名称',
  `path` varchar(200) DEFAULT NULL COMMENT '存放路径',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `size` int(11) DEFAULT NULL COMMENT '文件大小',
  `type` varchar(50) DEFAULT NULL COMMENT '类型（视频、图片）',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`attachmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kkxa_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `kkxa_column`
-- ----------------------------
DROP TABLE IF EXISTS `kkxa_column`;
CREATE TABLE `kkxa_column` (
  `columnid` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目主键',
  `pcolumnid` int(12) DEFAULT NULL COMMENT '父id',
  `name` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `ename` varchar(100) DEFAULT NULL COMMENT '栏目名称（英文）',
  `sort` int(4) DEFAULT NULL COMMENT '排序',
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `status` varchar(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`columnid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kkxa_column
-- ----------------------------

-- ----------------------------
-- Table structure for `kkxa_comment`
-- ----------------------------
DROP TABLE IF EXISTS `kkxa_comment`;
CREATE TABLE `kkxa_comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pcommentid` int(12) DEFAULT NULL COMMENT '评论父id',
  `accountid` int(12) DEFAULT NULL COMMENT '评论者id',
  `relationid` int(12) DEFAULT NULL COMMENT '关联id',
  `columnid` int(12) DEFAULT NULL COMMENT '栏目id',
  `columnname` varchar(100) DEFAULT NULL COMMENT '栏目名称',
  `comment` varchar(300) DEFAULT NULL COMMENT '评论',
  `source` varchar(20) DEFAULT NULL COMMENT '来源（手机、网站）',
  `ip` varchar(15) DEFAULT NULL COMMENT 'ip',
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `createuser` varchar(200) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updateuser` varchar(200) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`commentid`),
  KEY `fk_vid` (`relationid`),
  CONSTRAINT `fk_vid` FOREIGN KEY (`relationid`) REFERENCES `videodetail` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论';

-- ----------------------------
-- Records of kkxa_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `mainvideo`
-- ----------------------------
DROP TABLE IF EXISTS `mainvideo`;
CREATE TABLE `mainvideo` (
  `mid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `type` varchar(50) NOT NULL COMMENT '类型(电影、连续剧)',
  `imageurl` varchar(300) NOT NULL COMMENT '封面图片',
  `introduction` varchar(500) NOT NULL COMMENT '简介',
  `year` varchar(4) NOT NULL COMMENT '年份',
  `language` varchar(50) DEFAULT NULL COMMENT '语言',
  `status` varchar(20) DEFAULT NULL COMMENT '状态',
  `createuser` varchar(100) DEFAULT NULL COMMENT '创建者',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(100) DEFAULT NULL COMMENT '更新者',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainvideo
-- ----------------------------
INSERT INTO `mainvideo` VALUES ('1', '1', '2', '/upload/picture/20141211/1418227287197.jpg', '5', '3', '4', null, 'kid', '2014-12-11 00:01:33', '', null);
INSERT INTO `mainvideo` VALUES ('2', '1', '2', '/upload/picture/20141211/1418227354415.jpg', '5', '3', '4', null, 'kid', '2014-12-11 00:02:44', '', null);
INSERT INTO `mainvideo` VALUES ('3', '1', '2', '/upload/picture/20141211/1418227405872.jpg', '5', '3', '4', null, 'kid', '2014-12-11 00:03:28', '', null);
INSERT INTO `mainvideo` VALUES ('4', '213123', '213', '/upload/picture/20141211/1418302899007.jpg', '231', '123', '22', null, 'kid', '2014-12-11 21:01:57', '', null);
INSERT INTO `mainvideo` VALUES ('5', '2', '3', '/upload/picture/20141211/1418304692179.jpg', '66', '4', '5', null, 'kid', '2014-12-11 21:31:52', '', null);
INSERT INTO `mainvideo` VALUES ('6', '123', '213', '/upload/picture/20141211/1418307810295.jpg', '21323', '123', '123', null, 'kid', '2014-12-11 22:24:49', '', null);
INSERT INTO `mainvideo` VALUES ('7', '32423', '324', '/upload/picture/20141211/1418307946006.jpg', '23423423', '2014', '324', null, 'kid', '2014-12-11 22:26:51', '', null);
INSERT INTO `mainvideo` VALUES ('8', '32423', '324', '/upload/picture/20141211/1418307946006.jpg', '23423423', '2014', '324', null, 'kid', '2014-12-11 22:28:15', '', null);
INSERT INTO `mainvideo` VALUES ('9', '123123', '2312', '/upload/picture/20141211/1418308473462.jpg', '33', '2014', '33', null, 'kid', '2014-12-11 22:34:44', '', null);
INSERT INTO `mainvideo` VALUES ('10', '213', '123', '/upload/picture/20141211/1418309314505.jpg', '231', '2132', '323', null, 'kid', '2014-12-11 22:48:42', '', null);
INSERT INTO `mainvideo` VALUES ('11', '可可小爱第一季', '益智 早教', '/upload/picture/20141212/1418387736511.jpg', '适合儿童教育，启蒙教育。', '2014', '国语', null, 'kid', '2014-12-12 20:35:43', '', null);
INSERT INTO `mainvideo` VALUES ('12', '可可小爱第二季', '益智 儿童 学习 道德', '/upload/picture/20141212/1418398830040.jpg', '可可小爱是一部引导儿童讲道德', '2014', '国语', null, 'kid', '2014-12-12 23:41:33', 'kid', '2014-12-13 00:06:51');

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `menuId` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一',
  `parentId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '父节点',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `bindmenu` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isMenu` int(1) DEFAULT '0' COMMENT '菜单类型',
  `type` int(1) DEFAULT '0' COMMENT '加载方式',
  `sortNumber` int(9) DEFAULT '0' COMMENT '排序',
  `url` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `icon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '按钮',
  `status` int(9) DEFAULT '0' COMMENT '状态',
  `createUser` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL COMMENT '时间',
  `updateUser` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='菜单导航';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '', '首页', 'default', null, null, '0', '/admin/index.htm', 'icon-home', '1', 'kid', '2014-11-27 00:05:38', '', null);
INSERT INTO `menu` VALUES ('2', '', '目录', 'folder', null, null, '1', '/admin/folder/page.htm', 'icon-folder-open', '1', 'kid', '2014-11-27 00:07:50', '', null);
INSERT INTO `menu` VALUES ('3', '', '文章', 'article', null, null, '2', 'javascript:void(0);', 'icon-book', '1', 'kid', '2014-11-27 00:10:03', '', null);
INSERT INTO `menu` VALUES ('4', '3', '添加文章', 'add_article', null, null, '0', '/admin/article/add.htm', '', null, 'kid', '2014-11-27 00:29:50', 'kid', '2014-12-09 20:39:21');
INSERT INTO `menu` VALUES ('5', '3', '文章列表', 'article_list', null, null, '1', '/admin/article/page.htm', '', '1', 'kid', '2014-11-27 00:30:43', '', null);
INSERT INTO `menu` VALUES ('6', '', '评论', 'comment', null, null, '3', '/admin/comment/page.htm', 'icon-comments', '1', 'kid', '2014-11-27 22:35:40', '', null);
INSERT INTO `menu` VALUES ('7', '', '视频', 'video', null, null, '4', 'javascript:void(0);', 'icon-facetime-video', '1', 'kid', '2014-11-27 22:36:42', '', null);
INSERT INTO `menu` VALUES ('8', '7', '添加视频', 'add_video', null, null, '1', '/admin/video/add-video.htm', '', null, 'kid', '2014-11-27 22:38:54', 'kid', '2014-12-09 20:34:05');
INSERT INTO `menu` VALUES ('9', '7', '视频列表', 'video_list', null, null, '2', '/admin/video/video-list.htm', '', null, 'kid', '2014-11-27 22:39:36', 'kid', '2014-12-09 20:39:11');
INSERT INTO `menu` VALUES ('10', '', '设置', 'system', null, null, '7', 'javascript:void(0);', 'icon-cogs', '1', 'kid', '2014-11-27 22:46:11', '', null);
INSERT INTO `menu` VALUES ('11', '10', '基本设置', 'system_basic', null, null, '0', '/admin/config/basic.htm', '', '1', 'kid', '2014-11-27 22:46:40', '', null);
INSERT INTO `menu` VALUES ('12', '10', '管理员管理', 'system_adminManage', null, null, '1', '/admin/admin/manage.htm', '', '1', 'kid', '2014-11-27 22:50:18', '', null);
INSERT INTO `menu` VALUES ('13', '10', '修改个人信息', 'update_admin', null, null, '2', '/admin/admin/update.htm', '', '1', 'kid', '2014-11-27 22:51:38', '', null);
INSERT INTO `menu` VALUES ('14', '', '菜单', 'menu', null, null, '5', 'javascript:void(0);', 'icon-tags', '1', 'kid', '2014-11-29 11:09:55', '', null);
INSERT INTO `menu` VALUES ('15', '14', '添加菜单', 'add_menu', null, null, '0', '/admin/menu/add-menu.htm', '', '1', 'kid', '2014-11-29 11:10:46', '', null);
INSERT INTO `menu` VALUES ('16', '14', '菜单列表', 'menu_list', null, null, '1', '/admin/menu/menu-list.htm', '', '1', 'kid', '2014-11-29 11:11:26', '', null);
INSERT INTO `menu` VALUES ('17', '', '角色', 'role', null, null, '6', 'javascript:void(0);', 'icon-user', '1', 'kid', '2014-11-29 11:15:20', '', null);
INSERT INTO `menu` VALUES ('18', '17', '添加角色', 'add_role', null, null, '0', '/admin/role/add-role.htm', '', '1', 'kid', '2014-11-29 11:16:28', '', null);
INSERT INTO `menu` VALUES ('19', '17', '角色列表', 'role_list', null, null, '1', '/admin/role/role-list.htm', '', '1', 'kid', '2014-11-29 11:17:11', '', null);
INSERT INTO `menu` VALUES ('21', '7', '视频简介', 'video_info', null, null, '0', '/admin/mainvideo/add-mainvideo.htm', '', '1', 'kid', '2014-12-09 20:32:56', '', null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色',
  `permission` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所有权限',
  `createUser` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateUser` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限角色';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('5', '管理员', '1,2,3,4,5,6,7,8,9,14,15,16,17,18,19,10,11,12,13', 'kid', '2014-11-29 21:16:41', 'kid', '2014-11-29 21:31:11');
INSERT INTO `role` VALUES ('6', '普通管理员', '1,2,3,4,5,6,7,8,9', 'kid', '2014-11-29 21:17:52', '', null);

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `gender` varchar(4) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `qq` varchar(12) DEFAULT NULL,
  `statu` varchar(1) DEFAULT NULL,
  `roleId` varchar(20) DEFAULT NULL,
  `lastLogin` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('5', 'admin', 'admin', 'mxx', '1', '18577870730', 'xxx1', 'xxxx1', '21312', null, '5', null);

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `openId` bigint(20) DEFAULT NULL COMMENT '公共用户ID，只有是师说，QQ，微博等其它网站登录时才有。',
  `type` varchar(20) DEFAULT NULL COMMENT '帐号类型：0 本站 1 师说 2 QQ 3 微博',
  `name` varchar(45) DEFAULT NULL COMMENT '用户名',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for `videodetail`
-- ----------------------------
DROP TABLE IF EXISTS `videodetail`;
CREATE TABLE `videodetail` (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mid` int(11) NOT NULL COMMENT '视频主表id',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `imageurl` varchar(300) NOT NULL COMMENT '封面图片',
  `videourl` varchar(300) NOT NULL COMMENT '视频地址',
  `tag` varchar(20) DEFAULT NULL COMMENT '标签',
  `up` int(11) DEFAULT NULL COMMENT '顶次数',
  `down` int(11) DEFAULT NULL COMMENT '踩次数',
  `record` int(11) DEFAULT NULL COMMENT '播放次数',
  `introduction` varchar(300) DEFAULT NULL COMMENT '简介（点评）',
  `status` varchar(20) DEFAULT NULL,
  `createuser` varchar(100) DEFAULT NULL COMMENT '创建者',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateuser` varchar(100) DEFAULT NULL COMMENT '更新者',
  `updatetime` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`vid`),
  KEY `fk_mid` (`mid`),
  CONSTRAINT `fk_mid` FOREIGN KEY (`mid`) REFERENCES `mainvideo` (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videodetail
-- ----------------------------
INSERT INTO `videodetail` VALUES ('1', '12', '啊', '/upload/picture/20141212/1418387736511.jpg', '/upload/video/20141212/1418399266452.mp4', null, null, null, null, '啊', '1', 'kid', '2014-12-12 23:48:04', null, null);
INSERT INTO `videodetail` VALUES ('2', '12', '学习型', '/upload/picture/20141212/1418387736511.jpg', '/upload/video/20141212/1418399323719.mp4', null, null, null, null, '213', '1', 'kid', '2014-12-12 23:49:07', null, null);
INSERT INTO `videodetail` VALUES ('3', '12', '12312', '/upload/picture/20141212/1418387736511.jpg', '/upload/video/20141212/1418399331089.mp4', null, null, null, null, '123123', '1', 'kid', '2014-12-12 23:49:07', null, null);

-- ----------------------------
-- Table structure for `videofactory`
-- ----------------------------
DROP TABLE IF EXISTS `videofactory`;
CREATE TABLE `videofactory` (
  `videoFactoryId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `videoUrl` varchar(255) DEFAULT NULL,
  `videoTitle` varchar(255) DEFAULT NULL,
  `tag` varchar(100) DEFAULT NULL,
  `frontCoverUrl` varchar(255) DEFAULT NULL,
  `introduction` varchar(1000) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `createUser` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateUser` varchar(100) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`videoFactoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videofactory
-- ----------------------------
