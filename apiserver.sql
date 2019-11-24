/*
 Navicat Premium Data Transfer

 Source Server         : 106.54.212.105
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 106.54.212.105:3306
 Source Schema         : apiserver

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 21/11/2019 09:37:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bbc_document
-- ----------------------------
DROP TABLE IF EXISTS `bbc_document`;
CREATE TABLE `bbc_document`  (
  `doc_id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `doc_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用标识码',
  `doc_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `doc_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `doc_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间/修改时间',
  PRIMARY KEY (`doc_id`) USING BTREE,
  UNIQUE INDEX `doc_code`(`doc_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_document
-- ----------------------------
INSERT INTO `bbc_document` VALUES (1, 'agreement', '用户服务协议', '测试用户服务协议 />', 1499762940);
INSERT INTO `bbc_document` VALUES (4, 'open_store', '开店协议', '<p>使222用本公司服务所须遵守的条款和条件。</p><p> </p><p> 1.用户资格</p><p> 本公司的服务仅向适用法律下能够签订具有法律约束力的合同的个人提供并仅由其使用。在不限制前述规定的前提下，本公司的服务不向18周岁以下或被临时或无限期中止的用户提供。如您不合资格，请勿使用本公司的服务。此外，您的账户（包括信用评价）和用户名不得向其他方转让或出售。另外，本公司保留根据其意愿中止或终止您的账户的权利。</p><p> </p><p> 2.您的资料（包括但不限于所添加的任何商品）不得：</p><p> *具有欺诈性、虚假、不准确或具误导性；</p><p> *侵犯任何第三方著作权、专利权、商标权、商业秘密或其他专有权利或发表权或隐私权；</p><p> *违反任何适用的法律或法规（包括但不限于有关出口管制、消费者保护、不正当竞争、刑法、反歧视或贸易惯例/公平贸易法律的法律或法规）；</p><p> *有侮辱或者诽谤他人，侵害他人合法权益的内容；</p><p> *有淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的内容；</p><p> *包含可能破坏、改变、删除、不利影响、秘密截取、未经授权而接触或征用任何系统、数据或个人资料的任何病毒、特洛依木马、蠕虫、定时炸弹、删除蝇、复活节彩蛋、间谍软件或其他电脑程序；</p><p> </p><p> 3.违约</p><p> 如发生以下情形，本公司可能限制您的活动、立即删除您的商品、向本公司社区发出有关您的行为的警告、发出警告通知、暂时中止、无限期地中止或终止您的用户资格及拒绝向您提供服务：</p><p> (a)您违反本协议或纳入本协议的文件；</p><p> (b)本公司无法核证或验证您向本公司提供的任何资料；</p><p> (c)本公司相信您的行为可能对您、本公司用户或本公司造成损失或法律责任。</p><p> </p><p> 4.责任限制</p><p> 本公司、本公司的关联公司和相关实体或本公司的供应商在任何情况下均不就因本公司的网站、本公司的服务或本协议而产生或与之有关的利润损失或任何特别、间接或后果性的损害（无论以何种方式产生，包括疏忽）承担任何责任。您同意您就您自身行为之合法性单独承担责任。您同意，本公司和本公司的所有关联公司和相关实体对本公司用户的行为的合法性及产生的任何结果不承担责任。</p><p> </p><p> 5.无代理关系</p><p> 用户和本公司是独立的合同方，本协议无意建立也没有创立任何代理、合伙、合营、雇员与雇主或特许经营关系。本公司也不对任何用户及其网上交易行为做出明示或默许的推荐、承诺或担保。</p><p> </p><p> 6.一般规定</p><p> 本协议在所有方面均受中华人民共和国法律管辖。本协议的规定是可分割的，如本协议任何规定被裁定为无效或不可执行，该规定可被删除而其余条款应予以执行。</p>', 1560502054);
INSERT INTO `bbc_document` VALUES (5, 'groupbuy', '团购活动协议', '<p>\r\n	<br />\r\n</p>', 1449841023);

-- ----------------------------
-- Table structure for bbc_invoice
-- ----------------------------
DROP TABLE IF EXISTS `bbc_invoice`;
CREATE TABLE `bbc_invoice`  (
  `inv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `inv_state` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1普通发票2增值税发票',
  `inv_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发票抬头[普通发票]',
  `inv_content` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '发票内容[普通发票]',
  `inv_company` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位名称',
  `inv_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '纳税人识别号',
  `inv_reg_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册地址',
  `inv_reg_phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '注册电话',
  `inv_reg_bname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户银行',
  `inv_reg_baccount` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '银行帐户',
  `inv_rec_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收票人姓名',
  `inv_rec_mobphone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收票人手机号',
  `inv_rec_province` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '收票人省份',
  `inv_goto_addr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '送票地址',
  `process` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步状态 1正在同步,2同步完成,3其他',
  PRIMARY KEY (`inv_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '买家发票信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_invoice
-- ----------------------------
INSERT INTO `bbc_invoice` VALUES (1, 17, '1', '个人', '明细', '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `bbc_invoice` VALUES (2, 17, '1', '213', '明细', '', '232', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `bbc_invoice` VALUES (3, 9, '1', '阿斯达四大有限公司', '玩具', '', '54646512365464645', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `bbc_invoice` VALUES (12, 10, '1', 'person', 'clothing', '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `bbc_invoice` VALUES (13, 10, '1', 'sdfgsdfgf', 'wine', '', '343432423', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `bbc_invoice` VALUES (16, 127, '1', '个人', '箱包', '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `bbc_invoice` VALUES (17, 116, '2', '', '', 'D', 'D', 'D', 'D', 'D', 'D', 'D', '84615487945', '中国	北京	北京	东城', 'DDDD', NULL);

-- ----------------------------
-- Table structure for bbc_order
-- ----------------------------
DROP TABLE IF EXISTS `bbc_order`;
CREATE TABLE `bbc_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单索引id',
  `order_sn` bigint(20) UNSIGNED NOT NULL COMMENT '订单编号',
  `pay_sn` bigint(20) UNSIGNED NOT NULL COMMENT '支付单号',
  `vid` int(11) UNSIGNED NOT NULL COMMENT '卖家店铺id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卖家店铺名称',
  `buyer_id` int(11) UNSIGNED NOT NULL COMMENT '买家id',
  `buyer_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '买家姓名',
  `buyer_email` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '买家电子邮箱',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单生成时间',
  `payment_code` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付方式名称代码',
  `payment_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '支付(付款)时间',
  `finnshed_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '订单完成时间',
  `goods_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品总价格',
  `order_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '订单总价格',
  `pd_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '预存款支付金额',
  `shipping_fee` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '运费',
  `evaluation_state` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '评价状态 0未评价，1已评价',
  `order_state` enum('0','10','20','30','40') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10' COMMENT '订单状态：0(已取消)10(默认):未付款;20:已付款;30:已发货;40:已收货;',
  `refund_state` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '退款状态:0是无退款,1是部分退款,2是全部退款',
  `lock_state` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '锁定状态:0是正常,大于0是锁定,默认是0',
  `delete_state` tinyint(4) NOT NULL DEFAULT 0 COMMENT '删除状态0未删除1放入回收站2彻底删除',
  `refund_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退款金额',
  `delay_time` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '延迟时间,默认为0',
  `order_from` enum('1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '1WEB2mobile',
  `chain_code` mediumint(6) UNSIGNED NOT NULL DEFAULT 0 COMMENT '门店提货码',
  `chain_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '自提门店ID',
  `shipping_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '物流单号',
  `dian_id` int(10) NULL DEFAULT 0 COMMENT '0不是自提 直接存自提id',
  `to_dian` int(10) NULL DEFAULT 0 COMMENT '门店发货 门店id',
  `pin_id` int(10) NULL DEFAULT 0 COMMENT '拼团id',
  `ziti` tinyint(1) NULL DEFAULT 1 COMMENT '是否是自提 默认1 是自提',
  `pd_points` int(10) NULL DEFAULT 0 COMMENT '使用多少积分参与抵现',
  `red_id` int(11) NULL DEFAULT NULL COMMENT '优惠券id',
  `red_money` decimal(10, 2) NULL DEFAULT NULL COMMENT '平台优惠卷金额,结算时用得到',
  `vred_id` int(11) NULL DEFAULT NULL COMMENT '店铺优惠券id',
  `is_check` bigint(1) NULL DEFAULT NULL COMMENT '1已核对',
  `service_id` int(11) NULL DEFAULT NULL COMMENT '客服id',
  `service_time` int(11) NULL DEFAULT NULL COMMENT '跟客服接入的时间',
  `points_ratio` tinyint(3) NULL DEFAULT NULL COMMENT '积分当时比率',
  `pin_order_id` int(10) NULL DEFAULT 0 COMMENT '阶梯团购订单表id',
  `pre_order_id` int(10) NULL DEFAULT 0 COMMENT '预售订单表id',
  `order_course_type` tinyint(1) NULL DEFAULT NULL COMMENT '特殊类型 1 公开课（只有公开课需要确认收货） 2 在线课 3 教材',
  `course_zhengshu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程证书',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 434 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_order
-- ----------------------------
INSERT INTO `bbc_order` VALUES (17, 2000000000001701, 280604493366609009, 1, '测试店铺', 9, '222222', '1182557168@qq.com', 1551149366, 'online', 0, 0, 200.00, 200.00, 0.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (38, 2000000000003801, 950604593231661016, 1, '测试店铺', 16, 'wq2', NULL, 1551249231, 'predeposit', 1551249231, 1551250003, 180.00, 180.00, 180.00, 0.00, '1', '40', 0, 0, 0, 0.00, 1551249989, '1', 0, 0, '12312312', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (63, 2000000000006301, 800605733974837009, 1, '测试店铺', 9, '222222', '1182557168@qq.com', 1552389974, 'online', 0, 0, 180.00, 180.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (64, 2000000000006401, 300605734043438009, 1, '测试店铺', 9, '222222', '1182557168@qq.com', 1552390043, 'online', 0, 0, 2000.00, 2000.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (65, 2000000000006501, 820605734294578009, 1, '测试店铺', 9, '222222', '1182557168@qq.com', 1552390294, 'online', 0, 0, 2000.00, 2000.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (66, 2000000000006601, 910605734337714009, 1, '测试店铺', 9, '222222', '1182557168@qq.com', 1552390337, 'online', 0, 0, 2000.00, 2000.00, 0.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (67, 2000000000006701, 510605734444687009, 1, '测试店铺', 9, '222222', '1182557168@qq.com', 1552390444, 'predeposit', 1552390444, 1552390444, 2000.00, 2000.00, 2000.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (68, 2000000000006801, 450605787987326010, 1, '测试店铺', 10, 'wq1', '2343333182231@qq.com', 1552443987, 'predeposit', 1552443987, 1552443987, 20.00, 20.00, 20.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (73, 2000000000007301, 710605791345587010, 1, '测试店铺', 10, 'wq1', '2343333182231@qq.com', 1552447345, 'predeposit', 1552447345, 1552447345, 50.00, 50.00, 50.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (75, 2000000000007501, 160606223293744002, 1, '测试店铺', 2, 'zzz', '', 1552879293, 'predeposit', 1552879293, 1552879293, 2000.00, 2000.00, 2000.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (76, 2000000000007601, 640606224069049002, 1, '测试店铺', 2, 'zzz', '', 1552880068, 'predeposit', 1552880068, 1552880068, 500.00, 500.00, 500.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (77, 2000000000007701, 700606224727173002, 1, '测试店铺', 2, 'zzz', '', 1552880727, 'predeposit', 1552880727, 1552880727, 20.00, 20.00, 20.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (78, 2000000000007801, 400606243743429017, 1, '测试店铺', 17, 'yao', '', 1552899743, 'predeposit', 1552899743, 1552899743, 480.00, 480.00, 480.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (79, 2000000000007901, 200606303051341017, 1, '测试店铺', 17, 'yao', '', 1552959051, 'predeposit', 1552959051, 1552959051, 2000.00, 2000.00, 2000.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (80, 2000000000008001, 230606331329874010, 1, '测试店铺', 10, 'wq1', '2343333182231@qq.com', 1552987329, 'predeposit', 1552987329, 1552987329, 1.00, 1.00, 1.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (81, 2000000000008101, 630606497775381010, 1, '测试店铺', 10, 'wq1', '2343333182231@qq.com', 1553153775, 'predeposit', 1553153775, 1553153775, 30.00, 30.00, 30.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (82, 2000000000008201, 820606910625586010, 1, '测试店铺', 10, 'wq1', '2343333182231@qq.com', 1553566625, 'predeposit', 1553566625, 1553566625, 60.00, 60.00, 60.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (84, 2000000000008401, 290607030307622002, 1, '测试店铺', 2, 'zzz', '', 1553686307, 'predeposit', 1553686307, 1553686307, 998.00, 998.00, 998.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (85, 2000000000008501, 570607171888570020, 1, '测试店铺', 20, 'xxx', NULL, 1553827888, 'predeposit', 1553827888, 1553827888, 888.00, 888.00, 888.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (86, 2000000000008601, 630607175278065020, 1, '测试店铺', 20, 'xxx', NULL, 1553831277, 'predeposit', 1553831277, 1553831277, 600.00, 600.00, 600.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (87, 2000000000008701, 710607175899354020, 1, '测试店铺', 20, 'xxx', NULL, 1553831899, 'predeposit', 1553831899, 1553831899, 1000.00, 1000.00, 1000.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (88, 2000000000008801, 810607427907665002, 1, '北京寰宇科技有限公司', 2, 'zzz', '', 1554083907, 'predeposit', 1554083907, 1554083907, 110.00, 110.00, 110.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (89, 2000000000008901, 530607430288466002, 1, '测试店铺', 2, 'zzz', '', 1554086288, 'predeposit', 1554086288, 1554086288, 200.00, 200.00, 200.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (90, 2000000000009001, 230607513318055020, 1, '测试店铺', 20, 'xxx', '', 1554169317, 'predeposit', 1554169317, 1554169317, 222.00, 222.00, 222.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (91, 2000000000009101, 740607514954874020, 1, '测试店铺', 20, 'xxx', '', 1554170954, 'predeposit', 1554170954, 1554170954, 3480.00, 3480.00, 3480.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (92, 2000000000009201, 210607517594463020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1554173594, 'predeposit', 1554173594, 1554173594, 555.00, 555.00, 555.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (93, 2000000000009301, 520607522393215013, 1, '测试店铺', 13, 'duanyu', '', 1554178393, 'predeposit', 1554178393, 1554178393, 99.00, 99.00, 99.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (94, 2000000000009401, 640607522423550012, 1, '测试店铺', 12, 'qiaofeng', '', 1554178423, 'predeposit', 1554178423, 1554178423, 299.00, 299.00, 299.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (95, 2000000000009501, 360607522481549010, 1, '测试店铺', 10, 'wq1', '2343333182231@qq.com', 1554178481, 'predeposit', 1554178481, 1554178481, 998.00, 998.00, 998.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (96, 2000000000009601, 250607529378552020, 1, '测试店铺', 20, 'xxx', '', 1554185378, 'predeposit', 1554185378, 1554185378, 60.00, 60.00, 60.00, 0.00, '0', '40', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (97, 2000000000009701, 810607530758117020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1554186758, 'online', 0, 0, 50.00, 50.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (98, 2000000000009801, 930607542049266009, 1, '北京寰宇科技有限公司', 9, '222222', '1182557168@qq.com', 1554198049, 'predeposit', 1554198049, 1554198049, 222.00, 222.00, 222.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (99, 2000000000009901, 390607542294693013, 1, '北京寰宇科技有限公司', 13, 'duanyu', '', 1554198294, 'predeposit', 1554198294, 1554198294, 222.00, 222.00, 222.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (101, 2000000000010101, 280608035886881020, 1, '测试店铺', 20, 'xxx', '', 1554691886, 'predeposit', 1554691886, 1554691886, 30.00, 30.00, 30.00, 0.00, '0', '40', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (102, 2000000000010201, 440608036663170020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1554692663, 'predeposit', 1554692663, 1554692663, 300.00, 300.00, 300.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (103, 2000000000010301, 480608055778389020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1554711778, 'predeposit', 1554711778, 1554711778, 321.00, 321.00, 321.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (106, 2000000000010601, 260608143877504020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1554799877, 'predeposit', 1554799877, 1554799877, 567.00, 567.00, 567.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (107, 2000000000010701, 530608224685567020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1554880685, 'predeposit', 1554880685, 1554880685, 0.01, 0.01, 0.01, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (111, 2000000000011101, 380608292034319032, 1, '测试店铺', 32, 'testvendor', '', 1554948034, 'online', 0, 0, 998.00, 998.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (112, 2000000000011201, 590608292093732020, 1, '测试店铺', 20, 'xxx', '', 1554948093, 'predeposit', 1554948093, 1554948093, 998.00, 998.00, 998.00, 0.00, '1', '40', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (117, 2000000000011701, 120608664722492020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1555320722, 'predeposit', 1555320722, 1555320722, 576.00, 576.00, 576.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, 3, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (118, 2000000000011801, 780608664872470020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1555320872, 'predeposit', 1555320872, 1555320872, 66.00, 66.00, 66.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (119, 2000000000011901, 310608895611849002, 1, '北京寰宇科技有限公司', 2, 'zzz', '', 1555551611, 'predeposit', 1555551611, 1555551611, 222.00, 222.00, 222.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (120, 2000000000012001, 680608895886394020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1555551886, 'predeposit', 1555551886, 1555551886, 222.00, 222.00, 222.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (121, 2000000000012101, 480609875305448020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1556531305, 'predeposit', 1556531305, 1556531305, 666.00, 666.00, 666.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (123, 2000000000012301, 290609877144345020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1556533144, 'predeposit', 1556533144, 1556533144, 333.00, 333.00, 333.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (124, 2000000000012401, 360610372098312002, 1, '北京寰宇科技有限公司', 2, 'zzz', '', 1557028098, 'predeposit', 1557028098, 1557028098, 10086.00, 10086.00, 10086.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (132, 2000000000013201, 320610648721540020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1557304721, 'predeposit', 1557304721, 1557304721, 2099.00, 2099.00, 2099.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (140, 2000000000014301, 690610800185682020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1557456185, 'predeposit', 1557456185, 1557456185, 888.00, 888.00, 888.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (141, 2000000000014401, 390610801448440020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1557457448, 'predeposit', 1557457448, 1557457448, 288.00, 288.00, 288.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (142, 2000000000014501, 890610804346123020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1557460345, 'predeposit', 1557460345, 1557460345, 656.00, 656.00, 656.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (143, 2000000000014601, 450611058285693041, 1, '北京寰宇科技有限公司', 41, 'pwd', NULL, 1557714285, 'alipay', 1557849600, 1559183590, 1000.00, 1000.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 1558318091, '1', 0, 0, 'dfdfd', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (144, 2000000000014701, 300611058360973041, 1, '北京寰宇科技有限公司', 41, 'pwd', NULL, 1557714360, 'wxpay', 1557676800, 1558659730, 1000.00, 1000.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 1557726056, '1', 0, 0, '123131', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (145, 2000000000014801, 540611078626817041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1557734626, 'online', 0, 0, 994.00, 994.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, 12, 6.00, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (146, 2000000000014901, 650611079159332041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1557734848, 'alipay', 1557735235, 1558659730, 994.00, 994.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 1557735342, '1', 0, 0, '8754122222222', 0, 0, 0, 0, 0, 13, 6.00, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (147, 2000000000015001, 760611078866677041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1557734866, 'online', 0, 0, 999.00, 999.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, 14, 1.00, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (148, 2000000000015101, 130611078883695041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1557734883, 'online', 0, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (149, 2000000000015301, 270611160154472041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1557816154, 'alipay', 1557810367, 1558920607, 333.00, 333.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 1557904933, '1', 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (150, 2000000000015401, 150611160537082041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1557816536, 'online', 0, 0, 3211.00, 3211.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (154, 2000000000015801, 850611413231023041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558069230, 'alipay', 1558022400, 1559183590, 1000.00, 1000.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 1558318085, '1', 0, 0, 'dfdfd', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (155, 2000000000015901, 570611415400813041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558071400, 'online', 0, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (156, 2000000000016001, 230611415698227041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558071524, 'online', 0, 0, 0.00, 0.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (157, 2000000000016101, 200611415664134041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558071664, 'alipay', 1558022400, 0, 288.00, 288.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 1558072196, '1', 0, 0, NULL, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (158, 2000000000016301, 580611421167909010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1558077167, 'predeposit', 1558077167, 1558077167, 1000.00, 1000.00, 1000.00, 0.00, '0', '40', 0, 0, 2, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (162, 2000000000016701, 240611424371969010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1558080371, 'online', 0, 0, 999.00, 999.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, 16, 1.00, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (163, 2000000000016801, 820611424392206010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1558080392, 'online', 0, 0, 994.00, 994.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, 17, 6.00, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (164, 2000000000016901, 800611674017195041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558330017, 'predeposit', 1558330076, 0, 0.01, 0.01, 0.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (165, 2000000000017001, 510611751801197020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1558407801, 'predeposit', 1558407801, 1558407801, 12.00, 12.00, 12.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (166, 2000000000017101, 530611751907385020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1558407907, 'predeposit', 1558407907, 1558407907, 123.00, 123.00, 123.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (167, 2000000000017201, 170611752291911020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1558408291, 'online', 0, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (168, 2000000000017301, 470611752982495020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1558408982, 'alipay', 1558409011, 0, 0.01, 0.01, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (169, 2000000000017401, 800611753074864020, 1, '北京寰宇科技有限公司', 20, 'xxx', '', 1558409074, 'wxpay', 1558368000, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (170, 2000000000017501, 590611753892446041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558409892, 'alipay', 1558409922, 0, 0.01, 0.01, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (171, 2000000000017601, 220611754767535041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558410767, 'wxpay', 1558281600, 0, 33.00, 33.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (172, 2000000000017701, 320611754776513041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558410776, 'wxpay', 1558281600, 0, 888.00, 888.00, 0.00, 0.00, '0', '20', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (173, 2000000000017801, 490611764516887041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558420516, 'predeposit', 1558420516, 1558420516, 0.01, 0.01, 0.01, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (174, 2000000000017901, 700611767742872041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558423742, 'online', 0, 0, 0.01, 0.01, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (175, 2000000000018001, 670612284160083041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558940159, 'predeposit', 1558940159, 1558940159, 0.01, 0.01, 0.01, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (176, 2000000000018101, 300612284469410041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558940469, 'predeposit', 1558940469, 1558940469, 12.00, 12.00, 12.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (177, 2000000000018201, 450612284729698041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1558940729, 'predeposit', 1558940729, 1558940729, 111.00, 111.00, 111.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (178, 2000000000018301, 300612369216158041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1559025216, 'online', 0, 0, 888.00, 888.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (179, 2000000000018401, 140612438410407041, 7, 'Angel小店', 41, 'pwd', '', 1559094410, 'predeposit', 1559094410, 1559094410, 0.01, 0.01, 0.01, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (180, 2000000000018501, 450612524122208041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1559180122, 'predeposit', 1559180122, 1559180122, 1111.00, 1111.00, 1111.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (181, 2000000000018601, 570612524326731041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1559180326, 'predeposit', 1559180326, 1559180326, 1111.00, 1099.90, 1099.90, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 111, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (215, 2000000000022601, 340612638911744010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1559294911, 'predeposit', 1559294911, 1559294911, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (216, 2000000000022701, 480612639249471010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1559295248, 'predeposit', 1559295248, 1559295248, 0.00, 0.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (217, 2000000000022801, 380612876928599010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1559532928, 'online', 0, 0, 120.00, 120.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (236, 2000000000024701, 140613066653761041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1559722653, 'predeposit', 1559722653, 1559722653, 0.00, 0.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (237, 2000000000024801, 100613066732961041, 1, '测试店铺', 41, 'pwd', '', 1559722732, 'predeposit', 1559722732, 1559722732, 3499.00, 3464.00, 3464.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 350, 14, 1.00, NULL, NULL, NULL, NULL, 10, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (238, 2000000000024901, 730613066785133041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1559722785, 'predeposit', 1559722785, 1559722785, 888.00, 879.20, 879.20, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 88, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (239, 2000000000025001, 710613066798373041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1559722798, 'predeposit', 1559722798, 1559722798, 888.00, 888.00, 888.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (241, 2000000000025201, 230613068554031010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1559724553, 'predeposit', 1559724553, 1559724553, 333.00, 333.00, 333.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (242, 2000000000025301, 460613071338275010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1559727338, 'predeposit', 1559727338, 1559727338, 32.00, 32.00, 32.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (243, 2000000000025401, 200613158730086041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1559814729, 'predeposit', 1559814729, 1559814729, 1000.00, 1000.00, 1000.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (244, 2000000000025501, 500613497612407090, 1, '北京寰宇科技有限公司', 90, '必修一', '', 1560153612, 'online', 0, 0, 2111.00, 2111.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (250, 2000000000026101, 820613591062035088, 1, '北京寰宇科技有限公司', 88, 'UCG', '', 1560247061, 'online', 0, 0, 100.00, 100.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (251, 2000000000026201, 530613591660728088, 1, '北京寰宇科技有限公司', 88, 'UCG', '', 1560247660, 'online', 0, 0, 100.00, 100.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (253, 2000000000026401, 630613668708669041, 11, 'UCG企管', 41, 'pwd', '', 1560324708, 'predeposit', 1560324708, 1560324708, 200.00, 200.00, 200.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (254, 2000000000026501, 670613737949780041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560393949, 'predeposit', 1560393949, 1560393949, 0.00, 0.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (255, 2000000000026601, 720613738252178041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560394252, 'predeposit', 1560394252, 1560394252, 200.00, 200.00, 200.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (256, 2000000000026701, 310613740857204041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560396857, 'predeposit', 1560396857, 1560396857, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (257, 2000000000026801, 250613742638807041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560398638, 'predeposit', 1560398638, 1560398638, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (258, 2000000000026901, 140613744277263096, 1, '北京寰宇科技有限公司', 96, 'test5', '', 1560400277, 'online', 0, 0, 100.00, 100.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (259, 2000000000027001, 180613750426578010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1560406426, 'predeposit', 1560406426, 1560406426, 300.00, 300.00, 300.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (260, 2000000000027101, 530613753955612096, 1, '北京寰宇科技有限公司', 96, 'test5', '', 1560409955, 'predeposit', 1560409955, 1560409955, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (261, 2000000000027201, 710613754033341096, 1, '北京寰宇科技有限公司', 96, 'test5', '', 1560410033, 'predeposit', 1560410033, 1560410033, 433.00, 433.00, 433.00, 0.00, '1', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (263, 2000000000027401, 990613763968208097, 1, '北京寰宇科技有限公司', 97, 'test6', NULL, 1560419968, 'online', 0, 0, 115.00, 115.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (264, 2000000000027501, 930613784153063098, 1, '北京寰宇科技有限公司', 98, 'yuwen', NULL, 1560440152, 'online', 0, 0, 110.00, 110.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (265, 2000000000027601, 100613784193494098, 1, '北京寰宇科技有限公司', 98, 'yuwen', NULL, 1560440193, 'online', 0, 0, 5.00, 5.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (266, 2000000000027701, 840613824210044099, 1, '北京寰宇科技有限公司', 99, '0614test', NULL, 1560480209, 'online', 0, 0, 110.00, 110.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (267, 2000000000027801, 260613824418250096, 1, '北京寰宇科技有限公司', 96, 'test5', '', 1560480418, 'predeposit', 1560480418, 1560480418, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (268, 2000000000027901, 870613838760516096, 11, 'UCG企管', 96, 'test5', '', 1560494760, 'predeposit', 1560494760, 1560494760, 200.00, 200.00, 200.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '06183370406178356_small.png');
INSERT INTO `bbc_order` VALUES (271, 2000000000028201, 300613914451598010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1560570451, 'predeposit', 1560570451, 1560570451, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (273, 2000000000028401, 260614084639134001, 11, 'UCG企管', 1, 'vendor', '', 1560740638, 'online', 0, 0, 200.00, 200.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (275, 2000000000028601, 390614256937795041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560912937, 'predeposit', 1560912937, 1560912937, 123.00, 123.00, 123.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (276, 2000000000028701, 550614256981858041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560912981, 'predeposit', 1560912981, 1560912981, 500.00, 500.00, 500.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (277, 2000000000028801, 630614257778187041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560913778, 'predeposit', 1560913778, 1560913778, 1567.00, 1567.00, 1567.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (278, 2000000000028901, 690614266630059041, 7, 'Angel小店', 41, 'pwd', '', 1560922629, 'predeposit', 1560922629, 1560922629, 200.00, 200.00, 200.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (279, 2000000000028902, 690614266630059041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560922629, 'predeposit', 1560922629, 1560922629, 1100.00, 1100.00, 1100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (280, 2000000000029001, 360614266847599041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560922847, 'predeposit', 1560922847, 1560922847, 200.00, 200.00, 200.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (281, 2000000000029101, 490614270699890010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1560926699, 'predeposit', 1560926699, 1560926699, 789.00, 789.00, 789.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (282, 2000000000029201, 620614270951477010, 1, '北京寰宇科技有限公司', 10, 'wq1', '2343333182231@qq.com', 1560926951, 'predeposit', 1560926951, 1560926951, 500.00, 500.00, 500.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (283, 2000000000029301, 390614273961205041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560929961, 'predeposit', 1560929961, 1560929961, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (284, 2000000000029401, 920614284140052041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560940139, 'predeposit', 1560940139, 1560940139, 1234.00, 1234.00, 1234.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (285, 2000000000029501, 590614284221235041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1560940221, 'predeposit', 1560940221, 1560940221, 123.00, 123.00, 123.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (295, 2000000000030501, 110615312556097041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1561968555, 'predeposit', 1561968555, 1561968555, 1000.00, 990.00, 990.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 100, NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (296, 2000000000030601, 450615463280194041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1562119280, 'predeposit', 1562119280, 1562119280, 188.00, 188.00, 188.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (297, 2000000000030701, 100615464430143109, 1, '北京寰宇科技有限公司', 109, 'test1', '12141515@qq.com', 1562120429, 'predeposit', 1562120429, 1562136128, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (298, 2000000000030801, 980615466300195109, 1, '北京寰宇科技有限公司', 109, 'test1', '12141515@qq.com', 1562122300, 'predeposit', 1562122300, 1562122300, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (300, 2000000000031001, 600615467348516109, 1, '北京寰宇科技有限公司', 109, 'test1', '12141515@qq.com', 1562123348, 'predeposit', 1562123348, 1562136128, 100.00, 100.00, 100.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, '06155083481230992_small.jpg');
INSERT INTO `bbc_order` VALUES (303, 2000000000031301, 510615470493026109, 1, '北京寰宇科技有限公司', 109, 'test1', '12141515@qq.com', 1562126492, 'predeposit', 1562126492, 1562136128, 32.00, 32.00, 32.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (305, 2000000000031501, 180615488480218109, 1, '北京寰宇科技有限公司', 109, 'test1', '12141515@qq.com', 1562144480, 'predeposit', 1562144480, 1562202314, 188.00, 188.00, 188.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `bbc_order` VALUES (306, 2000000000031601, 520615488535284109, 1, '北京寰宇科技有限公司', 109, 'test1', '12141515@qq.com', 1562144535, 'predeposit', 1562144535, 1562144535, 5.00, 5.00, 5.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (307, 2000000000031701, 420615488801075041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1562144800, 'predeposit', 1562144800, 1562144800, 200.00, 200.00, 200.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (308, 2000000000031801, 950616593679696104, 1, '北京寰宇科技有限公司', 104, 'john', '', 1563249679, 'predeposit', 1563249679, 1563249679, 1000.00, 1000.00, 1000.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (310, 2000000000032001, 590617206920912001, 11, 'UCG企管', 1, 'vendor', '', 1563862920, 'online', 0, 0, 200.00, 200.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `bbc_order` VALUES (311, 2000000000032101, 750617376323465041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1564032322, 'online', 0, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (312, 2000000000032201, 410617727032013116, 1, '北京寰宇科技有限公司', 116, 'd5368190', '', 1564383031, 'online', 0, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (313, 2000000000032301, 270617795749641119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564451749, 'online', 0, 0, 0.00, 0.00, 0.00, 0.00, '1', '40', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `bbc_order` VALUES (314, 2000000000032401, 550617795809117119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564451808, 'online', 0, 0, 666.00, 666.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (315, 2000000000032501, 510617795826655119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564451826, 'online', 0, 0, 666.00, 666.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `bbc_order` VALUES (316, 2000000000032601, 540617797185934119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564453185, 'online', 0, 0, 6656.00, 6656.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `bbc_order` VALUES (317, 2000000000032701, 400617797490795119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564453490, 'online', 0, 0, 10086.00, 10086.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL);
INSERT INTO `bbc_order` VALUES (318, 2000000000032801, 160617797850210119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564453849, 'online', 0, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (319, 2000000000032901, 750617812736271041, 1, '北京寰宇科技有限公司', 41, 'pwd', '', 1564468735, 'predeposit', 1564468735, 1564468735, 1000.00, 1000.00, 1000.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (320, 2000000000033001, 710617813005387119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564469005, 'online', 0, 0, 0.00, 0.00, 0.00, 0.00, '0', '40', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (321, 2000000000033101, 150617813023097119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564469022, 'online', 0, 0, 1000.00, 1000.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (322, 2000000000033201, 950617814031023116, 1, '北京寰宇科技有限公司', 116, 'd5368190', '', 1564470030, 'online', 0, 0, 0.00, 0.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `bbc_order` VALUES (323, 2000000000033301, 550617815655783119, 1, '北京寰宇科技有限公司', 119, 'taylor', '', 1564471655, 'predeposit', 1564471655, 1564471655, 60.00, 60.00, 60.00, 0.00, '0', '40', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (324, 2000000000033401, 930617815736786120, 1, '北京寰宇科技有限公司', 120, 'u0518', 'bland0518@gmail.com', 1564471736, 'predeposit', 1564471736, 1564471736, 110.00, 110.00, 110.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (325, 2000000000033501, 220618400893780127, 15, '222222', 127, 'a610846186', '', 1565056893, 'online', 0, 0, 0.00, 0.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `bbc_order` VALUES (326, 2000000000033601, 290618401503735126, 16, '梁雨', 126, 'dylan', '', 1565056964, 'online', 0, 0, 0.00, 0.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL);
INSERT INTO `bbc_order` VALUES (327, 2000000000033801, 400618401715650126, 16, '梁雨', 126, 'dylan', '', 1565057626, 'online', 0, 0, 0.00, 0.00, 0.00, 0.00, '0', '0', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (414, 2000000000000101, 660620326672407123, 11, 'UCG企管', 123, 'jack', '932563595@qq.com', 1566982671, 'online', 0, 0, 666.00, 666.00, 0.00, 0.00, '0', '10', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (415, 2000000000000102, 660620326672407123, 1, '北京寰宇科技有限公司', 123, 'jack', '932563595@qq.com', 1566982671, 'online', 0, 0, 72.00, 72.00, 0.00, 0.00, '0', '10', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (416, 2000000000000101, 740620326679851123, 11, 'UCG企管', 123, 'jack', '932563595@qq.com', 1566982679, 'online', 0, 0, 666.00, 666.00, 0.00, 0.00, '0', '10', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (417, 2000000000000102, 740620326679851123, 1, '北京寰宇科技有限公司', 123, 'jack', '932563595@qq.com', 1566982679, 'online', 0, 0, 42.00, 42.00, 0.00, 0.00, '0', '20', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, 24, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (418, 2000000000044901, 710620326719975123, 11, 'UCG企管', 123, 'lybjx', '', 1566982717, 'online', 0, 0, 666.00, 666.00, 0.00, 0.00, '0', '20', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (419, 2000000000044902, 710620326719975123, 1, '北京寰宇科技有限公司', 123, 'lybjx', '', 1566982717, 'online', 0, 1572510180, 72.00, 72.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `bbc_order` VALUES (431, 2000000000046201, 650620760622721123, 1, '北京寰宇科技有限公司', 123, 'lybjx', '', 1567416621, 'online', 0, 1572510180, 299.00, 299.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 2, NULL);
INSERT INTO `bbc_order` VALUES (432, 2000000000046301, 670620846761219123, 1, '北京寰宇科技有限公司', 123, 'lybjx', '', 1567502759, 'online', 0, 0, 69.00, 69.00, 0.00, 0.00, '0', '40', 0, 0, 0, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, 25, NULL, NULL, NULL, NULL, 0, 0, 3, NULL);
INSERT INTO `bbc_order` VALUES (433, 2000000000046401, 650620920758559123, 11, 'UCG企管', 123, 'lybjx', '', 1567576758, 'online', 0, 0, 666.00, 666.00, 0.00, 0.00, '0', '0', 0, 0, 1, 0.00, 0, '1', 0, 0, '', 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for bbc_ssys_goods
-- ----------------------------
DROP TABLE IF EXISTS `bbc_ssys_goods`;
CREATE TABLE `bbc_ssys_goods`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL COMMENT '商城系统gid',
  `goods_commonid` int(11) NOT NULL COMMENT '商城系统goods_commonid',
  `cate_id` int(11) NULL DEFAULT 0 COMMENT '商城系统商品分类ID',
  `from_flag` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商城系统来源标示',
  `yj_amount` float(10, 2) NOT NULL DEFAULT 0.00 COMMENT '设置的奖励金额',
  `share_link` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '商城系统用于分享的url',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `is_buy_condition` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是成为推手的购买条件商品 1是 0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推手系统 商品信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bbc_ssys_member
-- ----------------------------
DROP TABLE IF EXISTS `bbc_ssys_member`;
CREATE TABLE `bbc_ssys_member`  (
  `member_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `member_truename` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `member_avatar` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '会员头像',
  `member_sex` tinyint(1) NULL DEFAULT NULL COMMENT '会员性别',
  `member_birthday` date NULL DEFAULT NULL COMMENT '生日',
  `member_passwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员密码',
  `member_paypwd` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `member_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员邮箱',
  `member_email_bind` tinyint(4) NULL DEFAULT 0 COMMENT '0未绑定1已绑定',
  `member_mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号',
  `member_mobile_bind` tinyint(4) NULL DEFAULT 0 COMMENT '0未绑定1已绑定',
  `member_qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `member_ww` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里旺旺',
  `member_login_num` int(11) NOT NULL DEFAULT 1 COMMENT '登录次数',
  `member_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员注册时间',
  `member_login_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当前登录时间',
  `member_old_login_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上次登录时间',
  `member_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '当前登录ip',
  `member_old_login_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上次登录ip',
  `member_qqopenid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq互联id',
  `member_qqinfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'qq账号相关信息',
  `member_sinaopenid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新浪微博登录id',
  `member_sinainfo` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '新浪账号相关信息序列化值',
  `weixin_unionid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户统一标识',
  `weixin_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信用户相关信息',
  `member_points` int(11) NOT NULL DEFAULT 0 COMMENT '会员积分',
  `available_yongjin` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '可用佣金',
  `freeze_yongjin` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '未结算佣金',
  `disable_yongjin` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '失效佣金',
  `is_buy` tinyint(1) NOT NULL DEFAULT 1 COMMENT '会员是否有购买权限 1为开启 0为关闭',
  `is_allowtalk` tinyint(1) NOT NULL DEFAULT 1 COMMENT '会员是否有咨询和发送站内信的权限 1为开启 0为关闭',
  `member_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '会员的开启状态 1为开启 0为关闭',
  `member_areaid` int(11) NULL DEFAULT NULL COMMENT '地区ID',
  `member_cityid` int(11) NULL DEFAULT NULL COMMENT '城市ID',
  `member_provinceid` int(11) NULL DEFAULT NULL COMMENT '省份ID',
  `member_areainfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区内容',
  `member_privacy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '隐私设定',
  `member_growthvalue` int(11) NOT NULL DEFAULT 0 COMMENT '会员经验值',
  `parent3_id` int(11) NULL DEFAULT NULL COMMENT '三级上线ID',
  `parent2_id` int(11) NULL DEFAULT NULL COMMENT '二级上线ID',
  `parent_id` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '邀请人ID',
  `wx_openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信openid（现在用于小程序）',
  `wx_nickname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信昵称',
  `wx_area` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信的地区 省+空格+市',
  `shop_member_id` int(11) NULL DEFAULT NULL COMMENT '关联的商城用户ID',
  `ts_member_state` tinyint(2) UNSIGNED NULL DEFAULT 0 COMMENT '推手的状态: 0:不是推手(新用户) 1:还未成为推手(具备推手的条件,但还未达成) 2真正的推手',
  PRIMARY KEY (`member_id`) USING BTREE,
  INDEX `member_name`(`member_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_ssys_member
-- ----------------------------
INSERT INTO `bbc_ssys_member` VALUES (1, 'd538', '', '', 0, NULL, '96e79218965eb72c92a549dd5a330112', NULL, '', 0, '', 0, '', NULL, 1, '1573274914', '', '', NULL, NULL, '', '', '', '', '', NULL, 0, 0.00, 0.00, 0.00, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '', '', '', 146, 2);

-- ----------------------------
-- Table structure for bbc_ssys_setting
-- ----------------------------
DROP TABLE IF EXISTS `bbc_ssys_setting`;
CREATE TABLE `bbc_ssys_setting`  (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推手系统设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_ssys_setting
-- ----------------------------
INSERT INTO `bbc_ssys_setting` VALUES ('spreader_isuse', '1');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_allow_self_get_yj', '1');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_become_ts_open', '1');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_freeze_to_av_days', '55');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_gzh_appid', 'wxd4e85b4526eaac01');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_gzh_secret', '88b13be8cf2f2f2b43b0b665036449a2');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_min_cash_amount_once', '1');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_mobile_memo', '【商联达电商】欢迎使用#app#，您的手机验证码是#code#。我们的专业顾问会第一时间和您联系，本条信息无需回复');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_mobile_signature', '推手');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_mobile_tplid', '1946746');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_rulepage_set', '2323');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_share_valid_time', '55');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_site_name', '推手1号');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_site_phone', '111111');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_sms_login', '1');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_sms_password', '1');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_sms_register', '1');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_ts_condition1_money', '1000');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_ts_condition2_goodsmoney', '500');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_yj_percent', 'a:4:{s:1:\"a\";i:3;s:1:\"b\";i:10;s:1:\"c\";i:80;s:1:\"d\";i:20;}');
INSERT INTO `bbc_ssys_setting` VALUES ('ssys_yj_type', '1');

-- ----------------------------
-- Table structure for bbc_ssys_yj_log
-- ----------------------------
DROP TABLE IF EXISTS `bbc_ssys_yj_log`;
CREATE TABLE `bbc_ssys_yj_log`  (
  `lg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增编号',
  `lg_member_id` int(11) NOT NULL COMMENT '会员编号',
  `lg_member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `lg_admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员名称',
  `lg_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'order_pay获得冻结金额,order_cancel取消订单扣除冻结金额增加失效,refund退款退货扣除冻结金额增加失效金额,order_over订单完结冻结金额转为可用金额,cash_apply提现申请可用转冻结,cash_over申请提现通过扣除可用,cash_refuse申请提现拒绝回退可用,cash_del取消申请提现回退可用',
  `lg_av_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '可用金额变更0表示未变更',
  `lg_freeze_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结金额变更0表示未变更',
  `lg_disable_amount` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '失效金额变更0表示未变更',
  `lg_add_time` int(11) NOT NULL COMMENT '添加时间',
  `lg_desc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `process` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '同步1正在同步,2同步完成,3同步失败,其他状态',
  PRIMARY KEY (`lg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '佣金变更日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bbc_store_grade
-- ----------------------------
DROP TABLE IF EXISTS `bbc_store_grade`;
CREATE TABLE `bbc_store_grade`  (
  `sg_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `sg_name` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `sg_goods_limit` mediumint(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '允许发布的商品数量',
  `sg_album_limit` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '允许上传图片数量',
  `sg_space_limit` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上传空间大小，单位MB',
  `sg_template_number` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '选择店铺模板套数',
  `sg_template` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板内容',
  `sg_price` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '费用',
  `sg_confirm` tinyint(1) NOT NULL DEFAULT 1 COMMENT '审核，0为否，1为是，默认为1',
  `sg_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请说明',
  `sg_function` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附加功能',
  `sg_sort` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '级别，数目越大级别越高',
  `sld_is_supplier` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为供货商',
  PRIMARY KEY (`sg_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_store_grade
-- ----------------------------
INSERT INTO `bbc_store_grade` VALUES (1, '系统默认', 100, 500, 100, 1, 'default', '100元/年', 0, '用户选择“默认等级”，可以立即开通。', '', 0, 0);
INSERT INTO `bbc_store_grade` VALUES (2, '白金店铺', 200, 1000, 100, 1, 'default', '200元/年', 0, '享受更多特权', 'editor_multimedia', 2, 0);
INSERT INTO `bbc_store_grade` VALUES (3, '钻石店铺', 0, 1000, 100, 6, 'default|style1|style2|style3|style4|style5', '2000元/年', 0, '', 'editor_multimedia', 100, 0);
INSERT INTO `bbc_store_grade` VALUES (4, '贵宾', 3000, 100000, 100, 1, 'default', '1000元/年', 0, '线下连锁机构，店铺实力强', '', 10, 0);
INSERT INTO `bbc_store_grade` VALUES (6, '系统默认', 100, 500, 100, 1, 'default', '100元/年', 0, '用户选择“默认等级”，可以立即开通。', '', 0, 1);
INSERT INTO `bbc_store_grade` VALUES (7, '白金店铺', 200, 1000, 100, 1, 'default', '200元/年', 0, '享受更多特权', 'editor_multimedia', 2, 1);
INSERT INTO `bbc_store_grade` VALUES (8, '钻石店铺', 0, 1000, 100, 6, 'default|style1|style2|style3|style4|style5', '2000元/年', 0, '', 'editor_multimedia', 100, 1);
INSERT INTO `bbc_store_grade` VALUES (9, '贵宾', 3000, 100000, 100, 1, 'default', '1000元/年', 0, '线下连锁机构，店铺实力强', '', 10, 1);
INSERT INTO `bbc_store_grade` VALUES (10, '尊贵专享', 0, 100002, 100, 0, 'default', '1005', 0, '', 'editor_multimedia', 3, 1);

-- ----------------------------
-- Table structure for bbc_vendor
-- ----------------------------
DROP TABLE IF EXISTS `bbc_vendor`;
CREATE TABLE `bbc_vendor`  (
  `vid` int(11) NOT NULL AUTO_INCREMENT COMMENT '店铺索引id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺名称',
  `store_auth` tinyint(1) NULL DEFAULT 0 COMMENT '店铺认证',
  `name_auth` tinyint(1) NULL DEFAULT 0 COMMENT '店主认证',
  `grade_id` int(11) NOT NULL COMMENT '店铺等级',
  `member_id` int(11) NOT NULL COMMENT '会员id',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会员名称',
  `seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店主卖家用户名',
  `store_owner_card` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `sc_id` int(11) NOT NULL COMMENT '店铺分类',
  `store_company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) NULL DEFAULT 0 COMMENT '所在城市id',
  `area_id` int(11) NOT NULL DEFAULT 0 COMMENT '地区id',
  `area_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地区内容，冗余数据',
  `store_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地区',
  `store_longitude` float NULL DEFAULT 0 COMMENT '店铺经度',
  `store_latitude` float NULL DEFAULT 0 COMMENT '店铺纬度',
  `store_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找门店店铺分类',
  `sotre_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '找门店店铺地址',
  `store_zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮政编码',
  `store_tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话号码',
  `store_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '证件上传',
  `store_image1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执照上传',
  `store_state` tinyint(1) NOT NULL DEFAULT 2 COMMENT '店铺状态，0关闭，1开启，2审核中',
  `store_close_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺关闭原因',
  `store_sort` int(11) NOT NULL DEFAULT 0 COMMENT '店铺排序',
  `store_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店铺时间',
  `store_end_time` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺关闭时间',
  `store_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺logo',
  `store_banner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺横幅',
  `store_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺头像',
  `store_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `store_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `store_qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `store_ww` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里旺旺',
  `store_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家电话',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺简介',
  `store_zy` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '主营商品',
  `store_domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺二级域名',
  `store_domain_times` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '二级域名修改次数',
  `store_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐，0为否，1为是，默认为0',
  `store_theme` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default' COMMENT '店铺当前主题',
  `store_credit` int(10) NOT NULL DEFAULT 0 COMMENT '店铺信用',
  `praise_rate` float NOT NULL DEFAULT 0 COMMENT '店铺好评率',
  `store_desccredit` float NOT NULL DEFAULT 0 COMMENT '描述相符度分数',
  `store_servicecredit` float NOT NULL DEFAULT 0 COMMENT '服务态度分数',
  `store_deliverycredit` float NOT NULL DEFAULT 0 COMMENT '发货速度分数',
  `store_collect` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺收藏数量',
  `store_slide` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺幻灯片',
  `store_slide_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '店铺幻灯片链接',
  `store_stamp` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺印章',
  `store_printdesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `store_sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺销量',
  `store_presales` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '售前客服',
  `store_aftersales` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '售后客服',
  `store_workingtime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作时间',
  `store_free_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '超出该金额免运费，大于0才表示该值有效',
  `store_decoration_switch` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺装修开关(0-关闭 装修编号-开启)',
  `store_decoration_only` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '开启店铺装修时，仅显示店铺装修(1-是 0-否',
  `store_decoration_image_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺装修相册图片数量',
  `live_store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商铺名称',
  `live_store_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家地址',
  `live_store_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商铺电话',
  `live_store_bus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公交线路',
  `is_own_shop` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否自营店铺 1是 0否',
  `bind_all_gc` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '自营店是否绑定全部分类 0否1是',
  `store_vrcode_prefix` char(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商家兑换码前缀',
  `store_baozh` tinyint(1) NULL DEFAULT 0 COMMENT '保证服务开关',
  `store_baozhopen` tinyint(1) NULL DEFAULT 0 COMMENT '保证金显示开关',
  `store_baozhrmb` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '零' COMMENT '保证金金额',
  `store_qtian` tinyint(1) NULL DEFAULT 0 COMMENT '7天退换',
  `store_zhping` tinyint(1) NULL DEFAULT 0 COMMENT '正品保障',
  `store_erxiaoshi` tinyint(1) NULL DEFAULT 0 COMMENT '两小时发货',
  `store_tuihuo` tinyint(1) NULL DEFAULT 0 COMMENT '退货承诺',
  `store_shiyong` tinyint(1) NULL DEFAULT 0 COMMENT '试用中心',
  `store_shiti` tinyint(1) NULL DEFAULT 0 COMMENT '实体验证',
  `store_xiaoxie` tinyint(1) NULL DEFAULT 0 COMMENT '消协保证',
  `store_huodaofk` tinyint(1) NULL DEFAULT 0 COMMENT '货到付款',
  `is_display_shop` tinyint(1) NULL DEFAULT 0 COMMENT '是否在找门店中显示，0不显示，1显示',
  `store_offline_label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '线下找门店店铺logo（app端使用）',
  `sld_is_supplier` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为供货商',
  `cash_on_delivery` tinyint(1) NULL DEFAULT 0 COMMENT '是否支持货到付款',
  `grade_on_price` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否支持会员等级折扣',
  `label_id` int(10) NULL DEFAULT NULL COMMENT '店铺标签id',
  `sett_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'cn' COMMENT '结算 货币',
  `store_type` int(9) NOT NULL DEFAULT 1 COMMENT '默认为1 个人 2为企业',
  PRIMARY KEY (`vid`) USING BTREE,
  INDEX `store_name`(`store_name`) USING BTREE,
  INDEX `sc_id`(`sc_id`) USING BTREE,
  INDEX `area_id`(`area_id`) USING BTREE,
  INDEX `store_state`(`store_state`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_vendor
-- ----------------------------
INSERT INTO `bbc_vendor` VALUES (1, '北京寰宇科技有限公司', 0, 0, 0, 1, 'vendor', 'vendor', '', 0, NULL, 0, 0, 0, '', '', 0, 0, '', NULL, '', '', NULL, NULL, 1, '', 0, '1550557299', NULL, '06072806925048294.jpg', 'undefined', NULL, '的', '', '', NULL, '', NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 8, NULL, NULL, '06201338473018092.png', '123', 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 2, 'usd', 2);
INSERT INTO `bbc_vendor` VALUES (2, 'yao', 0, 0, 1, 2, 'zzz', 'yao', '', 1, '我欠额为企鹅我', 1, 36, 37, '北京 北京市 东城区', '阿萨德sad', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, '', 0, '1553501460', '1616774399', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 2, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (3, '测试', 0, 0, 0, 32, 'testvendor', 'testvendor', '', 0, NULL, 0, 0, 0, '', '', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1554877287', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (4, '安琪小店', 0, 0, 2, 41, 'pwd', 'anqi', '', 1, '于安琪', 9, 39, 146, '上海 上海市 长宁区', '金钟路968号', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, '', 0, '1558426325', '1621699199', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (5, '地方', 0, 0, 1, 46, '安琪', '地方', '', 1, '1', 2, 40, 55, '天津 天津市 和平区', '1111', 0, 0, NULL, NULL, '', '', NULL, NULL, 0, '', 0, '1558493816', '1621785599', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (6, '说的', 0, 0, 1, 47, 'mmm', '说的', '', 1, '春风吹', 2, 40, 56, '天津 天津市 河东区', '大幅度', 0, 0, NULL, NULL, '', '', NULL, NULL, 0, '', 0, '1558503430', '1590249599', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (7, 'Angel小店', 0, 0, 3, 51, 'Angel', 'Angel', '', 2, 'Angel', 9, 39, 146, '上海 上海市 长宁区', '968号', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1558938583', '1622217599', '06122826353160981.jpg', '06122826353155513.jpg', NULL, '', '', '', NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, '06185878345846689.png,,,,', 'http://,http://,http://,http://,http://', NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cny', 1);
INSERT INTO `bbc_vendor` VALUES (9, '小店', 0, 0, 1, 85, 'asss', 'asdfg', '', 2, 'qwewe', 3, 75, 1165, '河北省 秦皇岛市 山海关区', '金钟路123号', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1559284971', '1622563199', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (10, '阿萨德', 0, 0, 1, 87, '于宁', '小店', '', 1, '小店', 9, 39, 146, '上海 上海市 长宁区', '金钟路', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1559547548', '1591286399', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (11, 'UCG企管', 0, 0, 0, 95, '尤西际', '尤西际', '', 0, NULL, 0, 0, 0, '', '', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1560320884', NULL, '06186737722383200.png', '06186746149931337.png', NULL, 'UCG,尤西际,培训,ISO9001,内审员培训', '', '857293078', NULL, NULL, NULL, '培训，咨询，ISO9001，内审员培训', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 3, '06185879355757417.jpg,06185879437328235.jpg,06185879242204035.jpg,06185882720716326.jpg,06185882951898354.jpg', 'http://,http://,http://,http://,http://', NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cny', 1);
INSERT INTO `bbc_vendor` VALUES (12, 'xxxx', 0, 0, 1, 39, 'xxxx', 'xxxx', '', 5, '我我我IEuur', 1, 36, 37, '北京 北京市 东城区', '新洋路湘桥区政府三楼', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, '', 0, '1560392300', '1592150399', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (13, '华晨公司', 0, 0, 3, 116, 'd5368190', 'd5368190', '', 5, '华晨公司', 1, 2, 4, '中国 北京 北京 西城', '华晨公司', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1564385518', '1627660799', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (14, 'daixianhua', 0, 0, 4, 118, 'd536819', 'testdaixianhua', '', 3, 'ddd', 0, 0, 0, '中国', '第三個電話', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, '', 0, '1564448783', '1627747199', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (15, '222222', 0, 0, 3, 126, 'dylan', '222222', '', 4, 'ceshi1', 801, 802, 805, '中国 上海 上海 长宁', 'adfadsfa', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1564722955', '1596470399', '06183978804059164.jpg', '06183978804059799.jpg', NULL, '服务;教育', '啊啊啊啊啊啊啊啊', '32453643463', NULL, NULL, NULL, '教育服务', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cny', 1);
INSERT INTO `bbc_vendor` VALUES (16, '梁雨', 0, 0, 3, 127, 'a610846186', '梁雨测试', '', 3, '梁雨测试', 801, 802, 806, '中国 上海 上海 静安', '中原路', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1565055566', '1628351999', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (17, 'XINHAO', 0, 0, 1, 129, 'haohao', 'haohao', '', 3, '信息', 585, 597, 0, '中国 吉林 吉林', '急急急', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1565055583', '1596815999', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (18, '测试233', 0, 0, 1, 133, '测试用户100', '测试用户100', '', 3, '测试店铺233', 801, 802, 805, '中国 上海 上海 长宁', '凄凄切切群群', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1565164849', '1596902399', NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, '', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);
INSERT INTO `bbc_vendor` VALUES (19, '洪兴培训123123', 0, 0, 1, 139, 'qq3655', '洪兴培训123123', '', 3, '洪兴培训231123', 0, 0, 0, '中国', '上海长宁区', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1565577469', '1597334399', NULL, NULL, NULL, '', '', '', NULL, NULL, NULL, 'JAVA,WEB', NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cny', 1);
INSERT INTO `bbc_vendor` VALUES (20, '测试店铺111', 0, 0, 0, 143, 'test1111', 'test1111', '', 0, NULL, 0, 0, 0, '', '', 0, 0, NULL, NULL, '', '', NULL, NULL, 1, NULL, 0, '1566636045', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'default', 0, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, 0, 0, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 0, '零', 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, 0, 0, NULL, 'cn', 1);

-- ----------------------------
-- Table structure for bbc_vendor_joinin
-- ----------------------------
DROP TABLE IF EXISTS `bbc_vendor_joinin`;
CREATE TABLE `bbc_vendor_joinin`  (
  `member_id` int(10) UNSIGNED NOT NULL COMMENT '用户编号',
  `member_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店主用户名',
  `company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司名称',
  `company_country_id` int(11) NULL DEFAULT NULL COMMENT '所在国家id',
  `company_province_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所在地省ID',
  `company_city_id` int(11) NULL DEFAULT 0 COMMENT '所在城市id',
  `company_area_id` int(11) NULL DEFAULT 0 COMMENT '所在地区id',
  `company_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `company_address_detail` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司详细地址',
  `company_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司电话',
  `company_employee_count` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '员工总数',
  `company_registered_capital` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '注册资金',
  `contacts_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人姓名',
  `contacts_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人电话',
  `contacts_email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人邮箱',
  `business_licence_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照号',
  `business_licence_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执所在地',
  `business_licence_start` date NULL DEFAULT NULL COMMENT '营业执照有效期开始',
  `business_licence_end` date NULL DEFAULT NULL COMMENT '营业执照有效期结束',
  `business_sphere` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法定经营范围',
  `business_licence_number_electronic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照电子版',
  `organization_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码',
  `organization_code_electronic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织机构代码电子版',
  `general_taxpayer` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '一般纳税人证明',
  `bank_account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行开户名',
  `bank_account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司银行账号',
  `bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行支行名称',
  `bank_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支行联行号',
  `bank_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行所在地',
  `bank_licence_electronic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行许可证电子版',
  `is_settlement_account` tinyint(1) NULL DEFAULT NULL COMMENT '开户行账号是否为结算账号 1-开户行就是结算账号 2-独立的计算账号',
  `settlement_bank_account_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算银行开户名',
  `settlement_bank_account_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算公司银行账号',
  `settlement_bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算开户银行支行名称',
  `settlement_bank_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算支行联行号',
  `settlement_bank_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '结算开户银行所在地',
  `tax_registration_certificate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证号',
  `taxpayer_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '纳税人识别号',
  `tax_registration_certificate_electronic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '税务登记证号电子版',
  `seller_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖家帐号',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `store_class_ids` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺分类编号集合',
  `store_class_names` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺分类名称集合',
  `joinin_state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请状态 10-已提交申请 11-缴费完成  20-审核成功 30-审核失败 31-缴费审核失败 40-审核通过开店',
  `joinin_message` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员审核信息',
  `joinin_year` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '开店时长(年)',
  `sg_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺等级名称',
  `sg_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺等级编号',
  `sg_info` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺等级下的收费等信息',
  `sc_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺分类名称',
  `sc_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店铺分类编号',
  `sc_bail` mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT '店铺分类保证金',
  `store_class_commis_rates` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类佣金比例',
  `paying_money_certificate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证',
  `paying_money_certificate_explain` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款凭证说明',
  `paying_amount` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '付款金额',
  `sld_is_supplier` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为供货商',
  `legal_licence_start` date NULL DEFAULT NULL COMMENT '法人证件有效期开始',
  `legal_licence_end` date NULL DEFAULT NULL COMMENT '法人证件有效期结束',
  `legal_licence_zheng_electronic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人证件正面电子版',
  `legal_licence_fan_electronic` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人证件反面电子版',
  `legal_person_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人姓名',
  `legal_licence_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '法人身份证号',
  `vendor_add_img1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补充认证图片1',
  `vendor_add_img2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补充认证图片2',
  `vendor_add_img3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '补充认证图片3',
  `joinin_step` int(1) NOT NULL DEFAULT 1 COMMENT '申请进度',
  PRIMARY KEY (`member_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '店铺入住表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbc_vendor_joinin
-- ----------------------------
INSERT INTO `bbc_vendor_joinin` VALUES (2, 'zzz', '我欠额为企鹅我', NULL, 1, 36, 37, '北京 北京市 东城区', '阿萨德sad', '13212312312', 222, 33333, '张xx', '额', '123123@qq.com', '232323199508083211', '天津 天津市 河东区', '2019-03-07', '2019-03-04', '撒旦撒旦撒旦的', '06059118216553040.jpg', NULL, NULL, NULL, 'eeee', 's', 's', 's', '北京 北京市 西城区', '06059123611938986.jpg', 1, 'eeee', 's', 's', 's', '北京 北京市 西城区', NULL, NULL, NULL, 'yao', 'yao', 'a:1:{i:0;s:4:\"1,8,\";}', 'a:1:{i:0;s:17:\"公开课,管理,\";}', '40', 'sdfasd', 2, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  店铺分类1', '1', 0, '10', '06068454255060649.jpg', '1111', 200.00, 0, '2019-03-07', '2019-03-25', '06059118216557236.jpg', '06059118216559672.jpg', '额', '额', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (9, '222222', '店铺名称', NULL, 1, 36, 37, '北京 北京市 东城区', '123', NULL, NULL, NULL, 'yao', '13212312312', '123123@qq.com', '232323199508083211', NULL, NULL, NULL, 'yao', '06059000016296872.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'yao', '13212312312', NULL, NULL, NULL, NULL, NULL, NULL, 'yao', 'yao', 'a:1:{i:0;s:4:\"1,7,\";}', 'a:1:{i:0;s:17:\"公开课,创业,\";}', '20', 'sdfasdfa', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  店铺分类1', '1', 0, '10', NULL, NULL, 100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (10, 'wq1', '北京商联达科技', NULL, 16777215, 220, 250, '中国 山西 长治 长治', '哒哒哒哒哒哒多多多多多阿萨德', NULL, NULL, NULL, '额', '5461228', '2233@qq.com', '北京商联达科技', NULL, NULL, NULL, '北京商联达科技', '06139212849835952.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '大撒旦', 'k5kkk56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO `bbc_vendor_joinin` VALUES (17, 'yao', 'ceshidian', NULL, 1, 36, 37, '北京 北京市 东城区', 'dasdsadd', NULL, NULL, NULL, 'ewqewqe', '13212312312', '12345123@qq.com', '230123199909094037', NULL, NULL, NULL, '吴某', '06072599257221773.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '吴某', '13212312312', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (20, 'xxx', '测试店铺', NULL, 18, 288, 3028, '湖南省 湘西土家族苗族自治州 保靖县', '西小口', NULL, NULL, NULL, '嗯嗯', '13199990000', '213131@qq.com', '211111199909090909', NULL, NULL, NULL, '66', '06134970524084102.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rew', '123333333', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (39, 'xxxx', '我我我IEuur', NULL, 1, 36, 37, '北京 北京市 东城区', '新洋路湘桥区政府三楼', '15151515151', 1231, 141, '1233', '14141414141', '123131@qq.com', '2132131321312312321', '湖北省 天门市 天门市', '2019-05-30', '2019-05-30', '3211111111', '06137360797537485.jpg', NULL, NULL, NULL, '12312312', '21333', '213', '31231231', '湖南省 娄底市 冷水江市', '06137361104766584.jpg', 1, '12312312', '21333', '213', '31231231', '湖南省 娄底市 冷水江市', NULL, NULL, NULL, 'xxxx', 'xxxx', 'a:3:{i:0;s:6:\"1,156,\";i:1;s:8:\"2,6,151,\";i:2;s:8:\"167,169,\";}', 'a:3:{i:0;s:39:\"企业战略/人力资源,企业文化,\";i:1;s:49:\"项目管理/营销管理,开发培训,web培训,\";i:2;s:42:\"财务管理/体系化管理,审计管理,\";}', '40', '312', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '    线下培训', '5', 0, '1,1,1', '06137362807758122.jpg', '21', 100.00, 0, '2019-06-26', '2019-06-30', '06137360797537595.jpg', '06137360797535755.jpg', '1241', '211111199909090909', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (41, 'pwd', '于安琪', NULL, 9, 39, 146, '上海 上海市 长宁区', '金钟路968号', NULL, NULL, NULL, '于', '18702192719', '18702192719@163.com', '5456112498545645645', NULL, NULL, NULL, '于', '06117697718186844.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '于', '18702192719', NULL, NULL, NULL, NULL, NULL, NULL, 'anqi', '安琪小店', 'a:6:{i:0;s:7:\"2,6,10,\";i:1;s:6:\"1,7,9,\";i:2;s:4:\"1,8,\";i:3;s:4:\"3,5,\";i:4;s:4:\"3,4,\";i:5;s:3:\"11,\";}', 'a:6:{i:0;s:22:\"在线课,营销,3级,\";i:1;s:36:\"公开课VIp,创业,创业子分类,\";i:2;s:20:\"公开课VIp,管理,\";i:3;s:11:\"教材,MBA,\";i:4;s:17:\"教材,互联网,\";i:5;s:5:\"test,\";}', '40', '通过', 2, '白金店铺', '2', 'a:1:{s:8:\"sg_price\";s:10:\"200元/年\";}', '  店铺分类1', '1', 0, '2,2,1,2,3,3', '06117702339486616.png', '', 400.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (46, '安琪', '1', NULL, 2, 40, 55, '天津 天津市 和平区', '1111', NULL, NULL, NULL, '111', '111', '111@163.com', '1111', NULL, NULL, NULL, '111', '06118372071174329.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4555555555', '87144', NULL, NULL, NULL, NULL, NULL, NULL, '地方', '地方', 'a:1:{i:0;s:6:\"1,7,9,\";}', 'a:1:{i:0;s:36:\"公开课VIp,创业,创业子分类,\";}', '40', '45', 2, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  店铺分类1', '1', 0, '12', '06118375193817015.png', '是打算', 200.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (47, 'mmm', '春风吹', NULL, 2, 40, 56, '天津 天津市 河东区', '大幅度', NULL, NULL, NULL, '大幅度', '的', '123@163.com', '是', NULL, NULL, NULL, '说的', '06118470621023116.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '呀', '呀', NULL, NULL, NULL, NULL, NULL, NULL, '说的', '说的', 'a:1:{i:0;s:7:\"2,6,10,\";}', 'a:1:{i:0;s:22:\"在线课,营销,3级,\";}', '40', 'd', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  店铺分类1', '1', 0, '1', '06118474140309324.png', '说的', 100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (48, '123', '的', NULL, 1, 36, 0, '北京 北京市', '地方', '地方', 1, 10, '地方', '发', '13@163.com', '的', '江西省 萍乡市 湘东区', '2019-05-01', '2027-06-26', '说的', '06118527899938440.png', NULL, NULL, '', '是', '是', '是', '是', '河南省 开封市 尉氏县', '06118528572356843.png', 1, '是', '是', '是', '是', '河南省 开封市 尉氏县', NULL, NULL, NULL, '说的发', '是', 'a:1:{i:0;s:6:\"1,7,9,\";}', 'a:1:{i:0;s:36:\"公开课VIp,创业,创业子分类,\";}', '30', '1', 2, '白金店铺', '2', 'a:1:{s:8:\"sg_price\";s:10:\"200元/年\";}', '  店铺分类1', '1', 0, '', NULL, NULL, 400.00, 0, '2019-05-03', '2019-05-26', '06118527899934612.png', '06118527899938578.png', '阿萨德', '123', '06118527899935444.png', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (49, '111', 'f', NULL, 2, 40, 56, '天津 天津市 河东区', '发', 'a', 1, 1, '额', '1', '123@163.com', '1', '内蒙古 通辽市 扎鲁特旗', '2019-05-02', '2019-06-02', '元', '06118558056533734.png', NULL, NULL, '', 'a', 'a', 'a', 'a', '浙江省 温州市 文成县', '06118552674746401.png', 1, '1', '1', 'a', 'a', '浙江省 温州市 文成县', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, '2019-05-10', '2019-06-01', '06118546368071623.png', '06118546368082004.png', 'a', 'a', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (51, 'Angel', 'Angel', NULL, 9, 39, 146, '上海 上海市 长宁区', '968号', NULL, NULL, NULL, '于宁', '18702192719', '18702192719@163.com', '410926199510270422', NULL, NULL, NULL, '于宁', '06122823098543264.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Angel', '18702192719', NULL, NULL, NULL, NULL, NULL, NULL, 'Angel', 'Angel小店', 'a:3:{i:0;s:4:\"1,8,\";i:1;s:7:\"2,6,10,\";i:2;s:4:\"3,4,\";}', 'a:3:{i:0;s:20:\"公开课VIp,管理,\";i:1;s:22:\"在线课,营销,3级,\";i:2;s:17:\"教材,互联网,\";}', '40', '嗯', 2, '钻石店铺', '3', 'a:1:{s:8:\"sg_price\";s:11:\"2000元/年\";}', '    行业分类', '2', 0, '1,1,1', '06122825681939296.jpg', '123', 4000.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (85, 'asss', 'qwewe', NULL, 3, 75, 1165, '河北省 秦皇岛市 山海关区', '金钟路123号', NULL, NULL, NULL, '于', '12345678901', '123@163.com', '123121111111111111', NULL, NULL, NULL, '于', '06126285792164153.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '请问', '12312', NULL, NULL, NULL, NULL, NULL, NULL, 'asdfg', '小店', 'a:1:{i:0;s:2:\"1,\";}', 'a:1:{i:0;s:13:\"公开课VIp,\";}', '40', '通过', 2, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '    行业分类', '2', 0, '12', '06126289519759176.png', '请问', 200.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (87, '于宁', '小店', NULL, 9, 39, 146, '上海 上海市 长宁区', '金钟路', NULL, NULL, NULL, '于宁', '18702192719', '18702192719@163.com', '410926199510270422', NULL, NULL, NULL, '于宁', '06128907633280794.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '18702192719', '18702192719', NULL, NULL, NULL, NULL, NULL, NULL, '小店', '阿萨德', 'a:3:{i:0;s:2:\"1,\";i:1;s:2:\"2,\";i:2;s:2:\"3,\";}', 'a:3:{i:0;s:13:\"公开课VIp,\";i:1;s:10:\"在线课,\";i:2;s:7:\"教材,\";}', '40', '通过', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  店铺分类1', '1', 0, '1,1,1', '06128914418444246.png', '去', 100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (88, 'UCG', 'a', 99999999, 10002, 10004, 100021, 'Aland lslands', 'a', 'a', 1, 1, 'a', 'a', '123@163.com', 'a', 'Algeria Annaba', '2019-06-07', '2019-06-07', 'a', '06139317889779006.png', NULL, NULL, '', 'a', 'a', 'aa', 'a', 'Australia Northern Territory Palmerston', '06139319315103677.png', 1, 'a', 'a', 'aa', 'a', 'Australia Northern Territory Palmerston', NULL, NULL, NULL, 'a', 'a', 'a:1:{i:0;s:6:\"1,156,\";}', 'a:1:{i:0;s:39:\"企业战略/人力资源,企业文化,\";}', '30', '请问', 1, '钻石店铺', '3', 'a:1:{s:8:\"sg_price\";s:11:\"2000元/年\";}', '    课程', '4', 0, '', NULL, NULL, 2000.00, 0, '2019-05-29', '2019-06-30', '06139317889765288.png', '06139317889767488.png', 'a', 'a', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (89, '1234', 'a', 10001, 10002, 10002, 0, 'Aland lslands', 'a', 'a', 1, 1, '宁 于', '18702192719', 'mary@ucg-global.org', '尤西际企业管理咨询(上海)有限责任公司', 'Aland lslands', '2019-06-03', '2019-06-15', 'd', '06143389844820466.png', NULL, NULL, '', 'a', 'a', 'a', 'a', 'American Samoa Faasaleleaga', '06143390100327352.png', 1, 'a', 'a', 'a', 'a', 'American Samoa Faasaleleaga', NULL, NULL, NULL, '啊', '啊', 'a:1:{i:0;s:6:\"1,156,\";}', 'a:1:{i:0;s:39:\"企业战略/人力资源,企业文化,\";}', '30', '亲爱', 2, '白金店铺', '2', 'a:1:{s:8:\"sg_price\";s:10:\"200元/年\";}', '    线下培训', '5', 0, '', NULL, NULL, 400.00, 0, '2019-05-29', '2019-06-22', '06143389844818749.png', '06143389844827558.png', 'a', 'a', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (91, 'asd', '上海诺距离', NULL, 4, 86, 1321, '山西省 阳泉市 盂县', '金中立', '12456', 20, 1000, '余', '1234568778444', '1231231235445@163.com', '123121hy', '天津 天津市 河西区', '2019-05-28', '2027-07-03', '不能举报', '06131297989164234.png', NULL, NULL, NULL, '2145644', '545451', '465451', '45641', '上海 上海市 卢湾区', '06131298327361002.png', 1, '2145644', '545451', '465451', '45641', '上海 上海市 卢湾区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, '2019-05-29', '2029-06-30', '06131297989159581.png', '06131297989163298.png', '按时', '123454444444444444', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (93, '测试111', '测试', NULL, 2, 40, 55, '天津 天津市 和平区', '12121', '3283727271', 23, 123, '陈彦斌', '12833773373', '2773172@slodon.com', '12333223232', '北京 北京市 东城区', '2019-05-27', '2019-06-30', '2132131', '06131344215276803.jpg', NULL, NULL, NULL, '123', '123', '123', '123', '山东省 聊城市 东昌府区', '06131344444932155.jpg', 2, '12333', '2312412412451', '234123', '123123', '山东省 滨州市 博兴县', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, '2019-05-29', '2019-06-27', '06131344215264547.jpg', '06131344215263993.jpg', '付回', '383727372837283733', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (94, 'chenz', '23123123', NULL, 15, 237, 2629, '山东省 聊城市 东昌府区', '12312312', '12312312', 3123123, 12123112, '123123', '12312312312', '2773172@slodon.com', '123123123', '北京', '2019-05-28', '2019-06-23', '123123', '06136679359070086.jpg', NULL, NULL, '', '123123', '123123', '123123', '12312123', '湖北省 天门市 天门市', '06136679784028434.jpg', 2, '123123', '123123', '234123', '123123', '湖北省 神农架林区 神农架林区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, '2019-06-11', '2019-05-29', '06136679359064319.jpg', '06136679359072915.jpg', '付回', '1243123543245234234', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (96, 'test5', '北京商联达科技', NULL, 3, 76, 1172, '河北省 邯郸市 复兴区', '哒哒哒哒哒哒多多多多多阿萨德', '5461228', 33, 2, '额', '5461228', '2233@qq.com', '北京商联达科技', '吉林省 白山市 江源区', '2019-05-27', '2019-05-27', 'asdadsas', '06136852298381095.jpg', NULL, NULL, '', 'Qiang Wang', '北京商联达科技', 'sadasd', '2107111990000000', '吉林省 通化市 辉南县', '06136852740391314.jpg', 1, 'Qiang Wang', '北京商联达科技', 'sadasd', '2107111990000000', '吉林省 通化市 辉南县', NULL, NULL, NULL, 'test5', '系统测试商铺', 'a:1:{i:0;s:4:\"2,6,\";}', 'a:1:{i:0;s:19:\"zaixianke,yingxiao,\";}', '20', '通过', 1, '白金店铺', '2', 'a:1:{s:8:\"sg_price\";s:10:\"200元/年\";}', '    课程', '4', 0, '2', NULL, NULL, 200.00, 0, '2019-05-27', '2019-06-30', '06136852298385422.gif', '06136852298388297.jpg', 'Qiang Wang', '22', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (101, '0614test1', 'ceshidianpu', NULL, 1, 36, 38, '北京 北京市 西城区', '123123', NULL, NULL, NULL, 'chen', '18221391191', '877@sldon.com', '889838483811223833', NULL, NULL, NULL, '陈超', '06138424859768201.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '陈超', '384838282818', NULL, NULL, NULL, NULL, NULL, NULL, 'vendor0614', '新开店001', 'a:1:{i:0;s:8:\"2,6,151,\";}', 'a:1:{i:0;s:49:\"项目管理/营销管理,开发培训,web培训,\";}', '20', '通过', 1, '白金店铺', '2', 'a:1:{s:8:\"sg_price\";s:10:\"200元/年\";}', '  服务', '3', 0, '1', NULL, NULL, 200.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (102, 'test9999', '海云舟', NULL, 9, 39, 152, '上海 上海市 闵行区', '新海路', '021-2220393', 1222, 122, 'CHENHR', '18221391191', '293884@SLODON.com', 'HAYYR2984892838', '福建省 南平市 邵武市', '2019-06-18', '2019-06-18', '7t7t7t77t7t', '06138460275836546.jpg', NULL, NULL, NULL, '工商银行', '28383882828388', '闵行支行', '28384848888', '山东省 聊城市 阳谷县', '06138463109341603.jpg', 1, '工商银行', '28383882828388', '闵行支行', '28384848888', '山东省 聊城市 阳谷县', NULL, NULL, NULL, 'test9999', '海云周', 'a:1:{i:0;s:8:\"2,6,151,\";}', 'a:1:{i:0;s:49:\"项目管理/营销管理,开发培训,web培训,\";}', '20', '1', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  服务', '3', 0, '1', NULL, NULL, 100.00, 0, '2019-06-07', '2039-06-16', '06138460275829496.jpg', '06138460275839192.jpg', 'chenHR', '83728392999192222', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (104, 'john', '啊', 10002, 0, 0, 0, 'Aland lslands', 'a', NULL, NULL, NULL, '宁 于', '18702192719', 'mary@ucg-global.org', '啊', NULL, NULL, NULL, '啊', '06146993763409994.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '啊', '啊', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (105, 'aab', 'dgdfsfdb', NULL, 10015, 100150, 10000005, 'Australia Northern Territory Darwin', 'dfgsdf', 'sfdgsdg', 3242, 2324, 'fgdsg', '12341312413', '3423432543@dssf.com', '42563465642564564256', 'Azerbaijan Lankaran', '2019-06-05', '2019-06-05', 'gdthstf', '06150547994930295.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, '2019-06-13', '2019-06-19', '06150547994917454.png', '06150547994927946.png', 'sdfsd', 'xvzzdf', '06150547994938945.png', '06150547994944383.png', '06150547994950143.png', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (111, 'ttt', '123123', NULL, 10015, 100149, 10000003, 'Australia New South Wales Sydney', '123123', '123123', 12312, 1231, '123123', '12312312312', '123@slodon.com', '123123AQQED123123123', '中国 北京 北京 西城', '2019-07-02', '2019-07-03', '123', '06156437099431730.jpg', NULL, NULL, NULL, '123123', '123123', '123123', '123123', 'Bahamas', '06156438696571602.jpg', 1, '123123', '123123', '123123', '123123', 'Bahamas', NULL, NULL, NULL, '123', '123', 'a:1:{i:0;s:6:\"1,156,\";}', 'a:1:{i:0;s:39:\"企业战略/人力资源,企业文化,\";}', '10', NULL, 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  服务', '3', 0, '', NULL, NULL, 100.00, 0, '2019-07-10', '2019-07-22', '06156437099428025.jpg', '06156437099420841.jpg', '123', '1243123543245234234', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (112, 'test111', '123123', NULL, 99999999, 1, 2, '中国 北京 北京 东城', '123123', '13123', 123123, 12, '1231', '12312312312', '123@slodon.com', '123123AQQED123123123', '中国 天津 天津 和平', '2019-07-17', '2019-07-17', '123123', '06156394175609360.jpg', NULL, NULL, NULL, '工商银行', '13123', '123123', '123123', 'Afghanistan Herat', '06156404739931106.jpg', 1, '工商银行', '13123', '123123', '123123', 'Afghanistan Herat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, '2019-07-03', '2019-07-10', '06156394175596816.jpg', '06156394175600907.jpg', '1231', '123123', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (113, 'test777', 'test777', NULL, 10002, 10016, 100157, 'Aland lslands', 'dfgdfgdf', '15263634141', 0, 0, 'gdfg', '15236365252', '12141515@qq.com', '1111111111111111', 'Austria Carinthia', '2019-06-30', '2019-06-30', 'saffasfadafsdfsfdsffsfasasaasfafaf', '06160048985049746.jpg', NULL, NULL, NULL, '吴镇宇', '543534534543555', '中国建设银行', '5434535354354535', 'Algeria Ain Defla', '06160228807349307.jpg', 1, '吴镇宇', '543534534543555', '中国建设银行', '5434535354354535', 'Algeria Ain Defla', NULL, NULL, NULL, 'test777', 'test777', 'a:1:{i:0;s:10:\"2,148,153,\";}', 'a:1:{i:0;s:48:\"营销管理/生产管理,设计培训,UI设计,\";}', '10', NULL, 1, '贵宾', '4', 'a:1:{s:8:\"sg_price\";s:11:\"1000元/年\";}', '服务,课程,线下培训', '3,4,5', 0, '', NULL, NULL, 1000.00, 0, '1980-07-29', '2073-07-09', '06160048984811591.jpg', '06160048985031887.jpg', '测试的', '11111111111111111111', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (114, 'test778', 'test2', NULL, 99999999, 1, 2, '中国 北京 北京 西城', '11111', '15236365252', 0, 0, '吴镇宇', '15200000000', '12141515@qq.com', '1111111111111111', 'Albania Diber', '2019-02-25', '2063-07-17', 'fghfhfhgdfhdfhfdhfhfdhfdhfdhfdhdfghfhfhddghfhdh', '06166946188349227.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'test778', 'test778', 'a:1:{i:0;s:8:\"2,6,151,\";}', 'a:1:{i:0;s:49:\"营销管理/生产管理,开发培训,web培训,\";}', '10', NULL, 2, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '服务,课程,线下培训', '3,4,5', 0, '', NULL, NULL, 200.00, 0, '2019-02-25', '2073-07-09', '06166946188099515.jpg', '06166946188330481.jpg', '吴镇宇', '11111111111111111111', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (116, 'd5368190', '华晨公司', 99999999, 1, 2, 4, '中国 北京 北京 西城', '华晨公司', NULL, NULL, NULL, '代县话', '2005124', 'd536819@sina.cn', '513022198214514711', NULL, NULL, NULL, '代先华', '06177290860168730.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '代先华', 'd536819@163.com', NULL, NULL, NULL, NULL, NULL, NULL, 'd5368190', '华晨公司', 'a:1:{i:0;s:8:\"2,6,151,\";}', 'a:1:{i:0;s:49:\"营销管理/生产管理,开发培训,web培训,\";}', '40', 'dgsdgsdgsdgsdg', 2, '钻石店铺', '3', 'a:1:{s:8:\"sg_price\";s:11:\"2000元/年\";}', '    线下培训', '5', 0, '99', '06177294830510605.png', 'sdgsgsdgsdgsdg', 4000.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (118, 'd536819', 'ddd', 99999999, 0, 0, 0, '中国', '第三個電話', NULL, NULL, NULL, '的發揮地方', '發揮地方', '15545@sf.com', '51302215411541541', NULL, NULL, NULL, 'dgsdg', '06177926011795340.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'sfs', 'dgsdgsd', NULL, NULL, NULL, NULL, NULL, NULL, 'testdaixianhua', 'daixianhua', 'a:1:{i:0;s:8:\"167,169,\";}', 'a:1:{i:0;s:42:\"物流管理/体系化管理,审计管理,\";}', '40', '審核通過', 2, '贵宾', '4', 'a:1:{s:8:\"sg_price\";s:11:\"1000元/年\";}', '  服务', '3', 0, '99', '06177927598986188.png', '', 2000.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (119, 'taylor', 'www', 99999999, 801, 802, 805, '中国 上海 上海 长宁', 'ewrwerwr', NULL, NULL, NULL, 'werwer', 'eeeeeeeeeeee', 'eeeee@eeeeeeeeeeeee.com', '145464', NULL, NULL, NULL, 'ewrwer', '06178090182286863.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ererere', 'ererere', NULL, NULL, NULL, NULL, NULL, NULL, 'taylor', 'www', 'a:1:{i:0;s:6:\"1,157,\";}', 'a:1:{i:0;s:39:\"企业战略/人力资源,资本运作,\";}', '20', '来了', 1, '贵宾', '4', 'a:1:{s:8:\"sg_price\";s:11:\"1000元/年\";}', '    课程', '4', 0, '10', NULL, NULL, 1000.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (123, 'lybjx', '是大书房', 99999999, 99999999, 1, 2, '中国 北京 北京 西城', '阿萨德', '阿萨德', 0, 0, '阿萨德', '阿萨德', '', '是打发士大夫分', '中国 浙江 宁波 江东', '2019-11-04', '2019-12-05', '阿斯蒂芬啊飒飒的分', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '丁昊', '18516029954', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, '2019-11-08', '2019-11-27', '', '06265264224371857.png', '阿斯蒂芬', '阿萨德', '', '', '', 1);
INSERT INTO `bbc_vendor_joinin` VALUES (126, 'dylan', 'ceshi1', 99999999, 801, 802, 805, '中国 上海 上海 长宁', 'adfadsfa', NULL, NULL, NULL, 'dylan', '13131313', 'dylan@horizou.com', '1313131313131313', NULL, NULL, NULL, '董昊', '06180665008229293.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'q\'we\'q\'w\'e', 'q\'e\'w\'q\'e\'w\'q\'e\'w\'q\'e', NULL, NULL, NULL, NULL, NULL, NULL, '222222', '222222', 'a:1:{i:0;s:6:\"1,158,\";}', 'a:1:{i:0;s:39:\"企业战略/人力资源,战略综合,\";}', '40', 'OKde', 1, '钻石店铺', '3', 'a:1:{s:8:\"sg_price\";s:11:\"2000元/年\";}', '    课程', '4', 0, '1', '06180667641990054.png', '', 2000.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (127, 'a610846186', '梁雨测试', 99999999, 801, 802, 806, '中国 上海 上海 静安', '中原路', NULL, NULL, NULL, '梁雨', '15202156609', '610846186@qq.com', '341224199601170016', NULL, NULL, NULL, '梁雨', '06183990254303951.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梁永强', '15202156609', NULL, NULL, NULL, NULL, NULL, NULL, '梁雨测试', '梁雨', 'a:2:{i:0;s:6:\"1,156,\";i:1;s:8:\"2,6,151,\";}', 'a:2:{i:0;s:39:\"企业战略/人力资源,企业文化,\";i:1;s:49:\"营销管理/生产管理,开发培训,web培训,\";}', '40', '通过', 2, '钻石店铺', '3', 'a:1:{s:8:\"sg_price\";s:11:\"2000元/年\";}', '  服务', '3', 0, '1,1', '06183994989605614.png', '测试-梁雨', 4000.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (129, 'haohao', '信息', 99999999, 585, 597, 0, '中国 吉林 吉林', '急急急', NULL, NULL, NULL, '定', '13693875092', 'wwwwww@qq.com', '131234123456782345', NULL, NULL, NULL, '董', '06184000597244288.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '董昊', '13693875092', NULL, NULL, NULL, NULL, NULL, NULL, 'haohao', 'XINHAO', 'a:5:{i:0;s:6:\"1,156,\";i:1;s:6:\"1,157,\";i:2;s:6:\"1,158,\";i:3;s:4:\"3,4,\";i:4;s:4:\"3,5,\";}', 'a:5:{i:0;s:39:\"企业战略/人力资源,企业文化,\";i:1;s:39:\"企业战略/人力资源,资本运作,\";i:2;s:39:\"企业战略/人力资源,战略综合,\";i:3;s:36:\"财务管理/项目管理,互联网,\";i:4;s:30:\"财务管理/项目管理,MBA,\";}', '40', '通过', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  服务', '3', 0, '1,1,1,1,1', '06183995529783237.jpg', '测试图片', 100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (130, 'eva_li', '上海觉美企业管理有限公司', 99999999, 0, 0, 0, '中国', '九江路168号', NULL, NULL, NULL, '李侃', '13301683181', 'kan@hnb.eco', '310110197012233614', NULL, NULL, NULL, '李侃', '06184979805421172.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李蓓妮', 'li_bei_ni2001@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (132, 'qaz', '1', 10001, 100002, 0, 0, 'Afghanistan Kabul', '1111', NULL, NULL, NULL, '1', '111', '111@163.com', '1111', NULL, NULL, NULL, '1', '06185022102583790.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qaz', '1', 'a:1:{i:0;s:10:\"2,148,153,\";}', 'a:1:{i:0;s:48:\"营销管理/生产管理,设计培训,UI设计,\";}', '10', '1', 2, '白金店铺', '2', 'a:1:{s:8:\"sg_price\";s:10:\"200元/年\";}', '服务,课程,线下培训', '3,4,5', 0, '', NULL, NULL, 400.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (133, '测试用户100', '测试店铺233', 99999999, 801, 802, 805, '中国 上海 上海 长宁', '凄凄切切群群', NULL, NULL, NULL, 'dylan', '13800000000', 'wwwwwww@qq.com', '11111111111111111', NULL, NULL, NULL, 'eeeeee', '06185060964532051.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qweqe', 'qewqwewqeqew', NULL, NULL, NULL, NULL, NULL, NULL, '测试用户100', '测试233', 'a:4:{i:0;s:6:\"1,158,\";i:1;s:6:\"1,157,\";i:2;s:8:\"2,6,151,\";i:3;s:8:\"2,6,152,\";}', 'a:4:{i:0;s:39:\"企业战略/人力资源,战略综合,\";i:1;s:39:\"企业战略/人力资源,资本运作,\";i:2;s:49:\"营销管理/生产管理,开发培训,web培训,\";i:3;s:50:\"营销管理/生产管理,开发培训,java培训,\";}', '40', '通过', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  服务', '3', 0, '1,1,1,1', '06185088249239123.jpg', '', 100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (139, 'qq3655', '洪兴培训231123', 99999999, 0, 0, 0, '中国', '上海长宁区', NULL, NULL, NULL, '梁兵', '13300000000', '610846186@qq.com', '452501199609230421', NULL, NULL, NULL, '梁兵', '06189207694497303.jpg', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '梁兵', '13300000000', NULL, NULL, NULL, NULL, NULL, NULL, '洪兴培训123123', '洪兴培训123123', 'a:1:{i:0;s:8:\"2,6,151,\";}', 'a:1:{i:0;s:49:\"营销管理/生产管理,开发培训,web培训,\";}', '40', '通过', 1, '系统默认', '1', 'a:1:{s:8:\"sg_price\";s:10:\"100元/年\";}', '  服务', '3', 0, '2', '06189214440065810.jpg', '', 100.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO `bbc_vendor_joinin` VALUES (146, 'd538', '华晨网络科技有限公司', 99999999, 1, 2, 6, '中国 北京 北京 丰台', '上海市', NULL, NULL, NULL, '么么哒', '18698461584', 'admin@admin.com', '513541536468491', NULL, NULL, NULL, 'admin', '06245630437296884.png', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', 'admi', NULL, NULL, NULL, NULL, NULL, NULL, 'hahd', 'huancheng', 'a:1:{i:0;s:6:\"1,158,\";}', 'a:1:{i:0;s:39:\"企业战略/人力资源,战略综合,\";}', '31', 'tongguo', 2, '贵宾', '4', 'a:1:{s:8:\"sg_price\";s:11:\"1000元/年\";}', '  服务', '3', 0, '10', '06245642119625044.png', '', 2000.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2019_11_05_082300_create_vendor_doc_table', 0);
INSERT INTO `migrations` VALUES (2, '2019_11_05_082300_create_bbc_vendor_joinin_table', 0);
INSERT INTO `migrations` VALUES (3, '2019_11_05_082300_create_bbc_document_table', 0);
INSERT INTO `migrations` VALUES (4, '2019_11_05_083458_create_vendor_doc_table', 4);
INSERT INTO `migrations` VALUES (5, '2019_11_05_092021_create_vendor_doc_table', 0);
INSERT INTO `migrations` VALUES (6, '2019_11_05_095657_create_tags_table', 5);
INSERT INTO `migrations` VALUES (7, '2019_11_05_095827_care_book_tag_table', 5);
INSERT INTO `migrations` VALUES (8, '2019_11_05_100137_create_books_table', 5);
INSERT INTO `migrations` VALUES (9, '2019_11_05_183421_create_bbc_invoice_table', 0);
INSERT INTO `migrations` VALUES (10, '2019_11_05_185052_create_bbc_invoice_table', 0);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `last_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '登陆时的token',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '用户状态 -1代表已删除 0代表正常 1代表冻结',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'xander15', '$2y$10$0LJUOdqcJzY1wbvU8UyWQ.ZCwaYKKo7w.z7D3sgurZiZwCz9eWKea', NULL, 0, '2019-11-04 23:01:31', '2019-11-04 23:01:31');
INSERT INTO `users` VALUES (2, 'xander14', '$2y$10$FRA5HoESgfwIfRlEKe4FuuW.WDVoPHntur.3.8uTacBW3hs.MbC66', NULL, 0, '2019-11-04 23:01:55', '2019-11-04 23:01:55');
INSERT INTO `users` VALUES (3, 'xander13', '$2y$10$wlbXdt/UXHLCDeLvkYS.du8H9sj8Zkwc2EmESeNkFg9xXXQdHSd/W', NULL, 0, '2019-11-04 23:02:01', '2019-11-04 23:02:01');
INSERT INTO `users` VALUES (4, 'xander12', '$2y$10$E.FoXGz5I3N.Vh/tupPSYeieNu.LC90Slh76zsuUjI6CFzJEDdG6G', NULL, 0, '2019-11-04 23:02:08', '2019-11-04 23:02:08');
INSERT INTO `users` VALUES (5, 'xander11', '$2y$10$Vc9PCjuFZFmyNMD3C5iUY.Da6MUASkWXKTG.Z8tXIa6y4Iwkbp1NW', NULL, 0, '2019-11-04 23:02:13', '2019-11-04 23:02:13');
INSERT INTO `users` VALUES (6, 'xander10', '$2y$10$tNvTsYSILXRZgXkT5yUCB.pwJfZgjn7F2NDtk/hOqdMf9LYqr5uYe', NULL, 0, '2019-11-04 23:02:18', '2019-11-04 23:02:18');
INSERT INTO `users` VALUES (7, 'xander9', '$2y$10$gp2Vg4ndDjV2Ybv/vE.jGOABlXzf7E/KkJagMqqyPNSxopIVsJNta', NULL, 0, '2019-11-04 23:02:24', '2019-11-04 23:02:24');
INSERT INTO `users` VALUES (8, 'xander8', '$2y$10$RbjlkZm36tA8wdbH41ZhvuUVij8dZFY8dwts9.t9gLsfAhYFdG2r6', NULL, 0, '2019-11-04 23:02:29', '2019-11-04 23:02:29');
INSERT INTO `users` VALUES (9, 'xander7', '$2y$10$sOOO6.vzqIpvEt1gUrsYz.vgAhcbEglpkUXYvBErPayVJkrU03P9.', NULL, 0, '2019-11-04 23:02:42', '2019-11-04 23:02:42');
INSERT INTO `users` VALUES (10, 'xander6', '$2y$10$UUOsX31CPrHaxbKNedarBubyDcZAN8.lI04/hCTb1mG9Ja8lSUsMO', NULL, 0, '2019-11-04 23:02:47', '2019-11-04 23:02:47');
INSERT INTO `users` VALUES (11, 'xander5', '$2y$10$ficDjYsi8o09Ut6l9M76oOTFBiZd8YLOFh83feU1znfLNbl7Bkvwi', NULL, 0, '2019-11-04 23:02:51', '2019-11-04 23:02:51');
INSERT INTO `users` VALUES (12, 'xander4', '$2y$10$lLWOQt9aBNApQoXbJKIdHuaf46c9SwgOhj3dXJiwuPGihkglEj5ne', NULL, 0, '2019-11-04 23:02:55', '2019-11-04 23:02:55');
INSERT INTO `users` VALUES (13, 'xander3', '$2y$10$4YFoBVXd8I8fB9VpliATSurSCNyC1731wr.q8MTPJ0.QtcAEzmd2e', NULL, 0, '2019-11-04 23:03:02', '2019-11-04 23:03:02');
INSERT INTO `users` VALUES (14, 'xander2', '$2y$10$6vGJTnH7wBBuIJEvEzqKceVLjB.BOGt/8bg8kabRX5VNi0I7UnyLm', NULL, 0, '2019-11-04 23:03:06', '2019-11-04 23:03:06');
INSERT INTO `users` VALUES (15, 'xander1', '$2y$10$nYODUBQvj/hUN4YRNR8nAuBs43mDzEIWDYmevsUxxyiSgGAWnKypC', NULL, 0, '2019-11-04 23:03:09', '2019-11-04 23:03:09');
INSERT INTO `users` VALUES (16, 'ddd', '$2y$10$uosU/css1QFiTrS0E57DoeVKq4953a7qUGWJQn4WUzZCh2mYQn9sm', NULL, 0, '2019-11-07 21:39:12', '2019-11-07 21:39:12');
INSERT INTO `users` VALUES (17, 'horizou', '$2y$10$52ShVjyLPC8bHSGUjkZMQ..H./qnnNrbXsIcdrxLioo8WxMhc744W', NULL, 0, '2019-11-20 22:47:41', '2019-11-20 22:47:41');

-- ----------------------------
-- Table structure for vendor_doc
-- ----------------------------
DROP TABLE IF EXISTS `vendor_doc`;
CREATE TABLE `vendor_doc`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_id` int(11) NULL DEFAULT NULL COMMENT '文档合同id',
  `member_id` int(11) NULL DEFAULT NULL COMMENT '入住的商家的id',
  `process` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '同步状态 1,正在同步,2 同步完成,3其他异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vendor_doc
-- ----------------------------
INSERT INTO `vendor_doc` VALUES (1, 4, 116, '3');

SET FOREIGN_KEY_CHECKS = 1;
