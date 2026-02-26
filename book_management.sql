/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : book_management

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 15/06/2025 16:03:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_emailaddress
-- ----------------------------
DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE `account_emailaddress`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_emailaddress_user_id_email_987c8728_uniq`(`user_id` ASC, `email` ASC) USING BTREE,
  INDEX `account_emailaddress_email_03be32b2`(`email` ASC) USING BTREE,
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_emailaddress
-- ----------------------------

-- ----------------------------
-- Table structure for account_emailconfirmation
-- ----------------------------
DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE `account_emailconfirmation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) NULL DEFAULT NULL,
  `key` varchar(64) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key` ASC) USING BTREE,
  INDEX `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e`(`email_address_id` ASC) USING BTREE,
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_emailconfirmation
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add email address', 6, 'add_emailaddress');
INSERT INTO `auth_permission` VALUES (22, 'Can change email address', 6, 'change_emailaddress');
INSERT INTO `auth_permission` VALUES (23, 'Can delete email address', 6, 'delete_emailaddress');
INSERT INTO `auth_permission` VALUES (24, 'Can view email address', 6, 'view_emailaddress');
INSERT INTO `auth_permission` VALUES (25, 'Can add email confirmation', 7, 'add_emailconfirmation');
INSERT INTO `auth_permission` VALUES (26, 'Can change email confirmation', 7, 'change_emailconfirmation');
INSERT INTO `auth_permission` VALUES (27, 'Can delete email confirmation', 7, 'delete_emailconfirmation');
INSERT INTO `auth_permission` VALUES (28, 'Can view email confirmation', 7, 'view_emailconfirmation');
INSERT INTO `auth_permission` VALUES (29, 'Can add 用户', 8, 'add_customuser');
INSERT INTO `auth_permission` VALUES (30, 'Can change 用户', 8, 'change_customuser');
INSERT INTO `auth_permission` VALUES (31, 'Can delete 用户', 8, 'delete_customuser');
INSERT INTO `auth_permission` VALUES (32, 'Can view 用户', 8, 'view_customuser');
INSERT INTO `auth_permission` VALUES (33, 'Can add 图书分类', 9, 'add_category');
INSERT INTO `auth_permission` VALUES (34, 'Can change 图书分类', 9, 'change_category');
INSERT INTO `auth_permission` VALUES (35, 'Can delete 图书分类', 9, 'delete_category');
INSERT INTO `auth_permission` VALUES (36, 'Can view 图书分类', 9, 'view_category');
INSERT INTO `auth_permission` VALUES (37, 'Can add 图书', 10, 'add_book');
INSERT INTO `auth_permission` VALUES (38, 'Can change 图书', 10, 'change_book');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 图书', 10, 'delete_book');
INSERT INTO `auth_permission` VALUES (40, 'Can view 图书', 10, 'view_book');

-- ----------------------------
-- Table structure for bookapp_book
-- ----------------------------
DROP TABLE IF EXISTS `bookapp_book`;
CREATE TABLE `bookapp_book`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `slug` varchar(200) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `cover_image` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `published_date` date NOT NULL,
  `status` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `category_id` bigint NULL DEFAULT NULL,
  `created_by_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE,
  INDEX `bookapp_book_category_id_78ecd850_fk_bookapp_category_id`(`category_id` ASC) USING BTREE,
  INDEX `bookapp_book_created_by_id_5d325a64_fk_users_customuser_id`(`created_by_id` ASC) USING BTREE,
  CONSTRAINT `bookapp_book_category_id_78ecd850_fk_bookapp_category_id` FOREIGN KEY (`category_id`) REFERENCES `bookapp_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `bookapp_book_created_by_id_5d325a64_fk_users_customuser_id` FOREIGN KEY (`created_by_id`) REFERENCES `users_customuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookapp_book
-- ----------------------------
INSERT INTO `bookapp_book` VALUES (7, '围城', 'fiction4', '钱钟书', '《围城》是一幅栩栩如生的世井百态图，人生的酸甜苦辣千般滋味均在其中得到了淋漓尽致的体现。钱钟书先生将自己的语言天才并入极其渊博的知识，再添加上一些讽刺主义的幽默调料，以一书而定江山。《围城》显示给我们一个真正的聪明人是怎样看人生，又怎样用所有作家都必得使用的文字来表述自己的“观”和“感”的。', 'book_covers/小说3.jpg', '2008-06-17', 'published', '2025-06-13 13:00:35.773976', '2025-06-13 13:00:35.773976', 1, 1);
INSERT INTO `bookapp_book` VALUES (9, '长安的荔枝', 'fiction5', '马伯庸', '唐朝诗人杜牧的一句“一骑红尘妃子笑，无人知是荔枝来”一千多年来引发了人们的无限遐想，但鲜荔枝的保鲜时限仅有三天，这场跨越五千余里的传奇转运之旅究竟是如何达成的，谁让杨贵妃在长安吃到了来自岭南的鲜荔枝？作者马伯庸就此展开了一场脑洞非常大的想象。\r\n沿袭马伯庸写作一贯以来的时空紧张感，不仅让读者看到了小人物的乱世生存之道，也感受到了事在人为的热血奋斗。随书附赠“荔枝鲜转运舆图”。', 'book_covers/小说2.jpg', '2022-10-09', 'published', '2025-06-13 12:55:29.097935', '2025-06-13 12:55:29.097935', 1, 1);
INSERT INTO `bookapp_book` VALUES (16, '平凡的世界', 'fiction1', '路遥', '《平凡的世界(套装共3册)》是一部现实主义小说，也是小说化的家族史。作家高度浓缩了中国西北农村的历史变迁过程，作品达到了思想性与艺术性的高度统一，特别是主人公面对困境艰苦奋斗的精神，对今天的大学生朋友仍有启迪。这是一部全景式地表现中国当代城乡社会生活的长篇小说。《平凡的 世界(套装共3册)》共三部。作者在近十年问广阔背景上，通过复杂的矛盾纠葛，刻画了社会各阶层众多普通人的形象。劳动与爱情，挫折与追求，痛苦与欢乐，日常生活与巨大社会冲突，纷繁地交织在一起，深刻地展示了普通人在大时代历史进程中所走过的艰难曲折的道路。', 'book_covers/小说1_dh3sjuV.jpg', '2004-07-24', 'published', '2025-06-13 14:16:57.461086', '2025-06-13 14:16:57.496394', 1, 1);
INSERT INTO `bookapp_book` VALUES (17, '蜡笔小新', 'science1', '马昌建', '《蜡笔小新》的故事围绕着一个五岁的小男孩野原新之助（通称小新）展开。小新居住在日本埼玉县春日部市的一个普通家庭中，他的家庭成员包括工作繁忙的父亲野原广志、贤惠的母亲野原美冴，以及比他小两岁的妹妹野原向日葵。此外，家里还有一只名叫小白的小狗。', 'book_covers/3.png', '2012-07-12', 'published', '2025-06-13 14:18:35.162804', '2025-06-13 15:27:52.090231', 2, 1);
INSERT INTO `bookapp_book` VALUES (18, '中国少年儿童百科全书（全四册）', 'science', '林崇德', '6000多个知识条目、200多万字的阐述说明，在少儿类的百科书中堪称“巨无霸”，沉甸甸地诠释着世界的丰富精彩，也让孩子们充分体验到有问必答的满足。6000多幅生动精彩的彩色图片结合国际流行的版面设计大大提升了百科全书的视觉表现力，让阅读者获取知识的过程成为享受。版面上精心设置的各种小栏目更在细节处展现了新一代百科全书对多媒体、网络等先进手段的吸收运用。', 'book_covers/科普1_BvBCKhE.jpg', '1991-06-10', 'published', '2025-06-13 14:20:26.148893', '2025-06-13 14:20:32.389217', 2, 1);
INSERT INTO `bookapp_book` VALUES (19, '集体智慧编程', 'science3', 'Toby Segaran', '本书以机器学习与计算统计为主题背景，专门讲述如何挖掘和分析Web上的数据和资源，如何分析用户体验、市场营销、个人品味等诸多信息，并得出有用的结论，通过复杂的算法来从Web网站获取、收集并分析用户的数据和反馈信息，以便创造新的用户价值和商业价值。全书内容翔实，包括协作过滤技术（实现关联产品推荐功能）、集群数据分析（在大规模数据集中发掘相似的数据子集）、搜索引擎核心技术（爬虫、索引、查询引擎、PageRank算法等）、搜索海量信息并进行分析统计得出结论的优化算法、贝叶斯过滤技术（垃圾邮件过滤、文本过滤）、用决策树技术实现预测和决策建模功能、社交网络的信息匹配技术、机器学习和人工智能应用等。', 'book_covers/科普3.jpg', '2009-01-17', 'published', '2025-06-13 16:33:31.097272', '2025-06-13 16:33:31.112426', 2, 10);
INSERT INTO `bookapp_book` VALUES (20, '树叶博物馆', 'science2', '[英] 艾伦·J.库姆斯 / [匈] 若尔特·德布雷齐', '在本书中，充实了我们生活的树木终于得到了应有的关注。我们聚焦于树叶这个部位，它们看上去不起眼，但在某种意义上来说却是树木展现的公众形象。《树叶博物馆》为全世界600种zui美丽、zui能给人深刻印象的树叶提供了一部具有视觉震撼性和迷人科学色彩的指南。每片树叶在书中都以摄于灯箱的实际大小的全彩照片复现，并有文字信息介绍生有这种树叶的树种的分布范围、常见程度和生境，以及简洁的科学和历史知识介绍。无论是我们后院里那些熟悉的朋友，还是密林深处的巨人，《树叶博物馆》都以空前的方式让森林变得栩栩如生，也让我们的居室充满绿色活力。', 'book_covers/科普2.jpg', '2020-02-10', 'published', '2025-06-13 16:38:54.930460', '2025-06-13 16:38:54.967187', 2, 10);

-- ----------------------------
-- Table structure for bookapp_category
-- ----------------------------
DROP TABLE IF EXISTS `bookapp_category`;
CREATE TABLE `bookapp_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `description` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `slug`(`slug` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookapp_category
-- ----------------------------
INSERT INTO `bookapp_category` VALUES (1, '小说', 'fiction', '');
INSERT INTO `bookapp_category` VALUES (2, '科普', 'science', '');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_customuser_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (6, 'account', 'emailaddress');
INSERT INTO `django_content_type` VALUES (7, 'account', 'emailconfirmation');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (10, 'bookapp', 'book');
INSERT INTO `django_content_type` VALUES (9, 'bookapp', 'category');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (8, 'users', 'customuser');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-06-11 05:01:24.108223');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2025-06-11 05:01:24.313885');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2025-06-11 05:01:24.496522');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2025-06-11 05:01:24.595692');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2025-06-11 05:01:24.609968');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2025-06-11 05:01:24.620347');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2025-06-11 05:01:24.638023');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2025-06-11 05:01:24.642539');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2025-06-11 05:01:24.652986');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2025-06-11 05:01:24.652986');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2025-06-11 05:01:24.666529');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2025-06-11 05:01:24.691837');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2025-06-11 05:01:24.698133');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2025-06-11 05:01:24.702531');
INSERT INTO `django_migrations` VALUES (15, 'users', '0001_initial', '2025-06-11 05:01:24.948345');
INSERT INTO `django_migrations` VALUES (16, 'account', '0001_initial', '2025-06-11 05:01:25.107557');
INSERT INTO `django_migrations` VALUES (17, 'account', '0002_email_max_length', '2025-06-11 05:01:25.129848');
INSERT INTO `django_migrations` VALUES (18, 'account', '0003_alter_emailaddress_create_unique_verified_email', '2025-06-11 05:01:25.153281');
INSERT INTO `django_migrations` VALUES (19, 'account', '0004_alter_emailaddress_drop_unique_email', '2025-06-11 05:01:25.188907');
INSERT INTO `django_migrations` VALUES (20, 'account', '0005_emailaddress_idx_upper_email', '2025-06-11 05:01:25.214234');
INSERT INTO `django_migrations` VALUES (21, 'account', '0006_emailaddress_lower', '2025-06-11 05:01:25.228183');
INSERT INTO `django_migrations` VALUES (22, 'account', '0007_emailaddress_idx_email', '2025-06-11 05:01:25.276396');
INSERT INTO `django_migrations` VALUES (23, 'account', '0008_emailaddress_unique_primary_email_fixup', '2025-06-11 05:01:25.286277');
INSERT INTO `django_migrations` VALUES (24, 'account', '0009_emailaddress_unique_primary_email', '2025-06-11 05:01:25.291283');
INSERT INTO `django_migrations` VALUES (25, 'admin', '0001_initial', '2025-06-11 05:01:25.430549');
INSERT INTO `django_migrations` VALUES (26, 'admin', '0002_logentry_remove_auto_add', '2025-06-11 05:01:25.434706');
INSERT INTO `django_migrations` VALUES (27, 'admin', '0003_logentry_add_action_flag_choices', '2025-06-11 05:01:25.447518');
INSERT INTO `django_migrations` VALUES (28, 'bookapp', '0001_initial', '2025-06-11 05:01:25.521402');
INSERT INTO `django_migrations` VALUES (29, 'bookapp', '0002_initial', '2025-06-11 05:01:25.564453');
INSERT INTO `django_migrations` VALUES (30, 'sessions', '0001_initial', '2025-06-11 05:01:25.590390');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0tghaemjsl07gowar39sz4f4lis2rb0a', 'eyJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPeRc:FqhnmNYyMvTat0sfmackGI5KinbOrhqR9aBBF6hwwlc', '2025-06-12 17:47:00.610260');
INSERT INTO `django_session` VALUES ('1xysnxv5a2xcpy3qap0rn2i42oxcm8eb', '.eJxVjEEOgyAQRe_CuiEgyoDL7nsGMg5jpW3AiCZtmt69MXHj9r_3_leEyrWmkgO_57R8RG-UuoiA2zqFrfISUhS9AHHaBqQn5x3EB-Z7kVTyuqRB7oo8aJW3Evl1PdzTwYR12usG29iYkViz6yiC8aSN814jgvJ26JyyMFoDLYMGOxqjPUV01ERolRe_P111Pv8:1uPtlF:59LPaYmnSw_LUtO_Byvagz0EAXFTB0ASX-cnIghhs_0', '2025-06-13 10:08:17.080344');
INSERT INTO `django_session` VALUES ('2l0luvwjfui61vtklxj0azuitm07yc8n', 'eyJjYXB0Y2hhX2NvZGUiOiIyU1BLM1ciLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPe4u:d902was323rzeqUG3ITXxWiITyCRoHlij14YeXG_5uo', '2025-06-12 17:23:32.988850');
INSERT INTO `django_session` VALUES ('3i5oimxhsyddavuu01pcfk1kaq8bwsdp', 'eyJjYXB0Y2hhX2NvZGUiOiI3NTdQTlAiLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPf8w:qX0I-eV8Pb67SwY6ct8zO55etW84Vqv3AM2sRx6fpfg', '2025-06-12 18:31:46.421598');
INSERT INTO `django_session` VALUES ('5pmgcgcvlm2g0e93fxw2i2j5xjj4a9zw', '.eJxVjEEOgyAQRe_CuiEgyoDL7nsGMg5jpW3AiCZtmt69MXHj9r_3_leEyrWmkgO_57R8RG-UuoiA2zqFrfISUhS9AHHaBqQn5x3EB-Z7kVTyuqRB7oo8aJW3Evl1PdzTwYR12usG29iYkViz6yiC8aSN814jgvJ26JyyMFoDLYMGOxqjPUV01ERolRe_P111Pv8:1uPuAI:2bP6Xo8zNZG7i0jo_QOfNy9axMPzfJ21GbYNLyfeaUg', '2025-06-13 10:34:10.521350');
INSERT INTO `django_session` VALUES ('6yjbeeohobsh3t2vs0a8ed99yph8c8m7', 'eyJjYXB0Y2hhX2NvZGUiOiJJUUs1UTkiLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPevk:OgWLvRj-OpTObe1Jxu0AGnSIlHgzPckZIc5-TH2PjdM', '2025-06-12 18:18:08.276257');
INSERT INTO `django_session` VALUES ('af8r493riuug9awwc8of9qf3z63ewwtw', '.eJxVjEEOgyAQRe_CuiEgyoDL7nsGMg5jpW3AiCZtmt69MXHj9r_3_leEyrWmkgO_57R8RG-UuoiA2zqFrfISUhS9AHHaBqQn5x3EB-Z7kVTyuqRB7oo8aJW3Evl1PdzTwYR12usG29iYkViz6yiC8aSN814jgvJ26JyyMFoDLYMGOxqjPUV01ERolRe_P111Pv8:1uPuPe:Y7XVEm08xX98UEpWX0c9npD4pdn31p9E2weRdIxg0qQ', '2025-06-13 10:50:02.310269');
INSERT INTO `django_session` VALUES ('dswslvpn5y5w03k8tw9zbnhzhm7rnoac', '.eJxVjMEOwiAQBf-FsyG0FLr06N1vIAssFjVgoE00xn_XJr30-mbmfZht1Foq2dLrmeqbTVKIE7O4LrNdG1WbAptYxw6bQ3-nvIFww3wt3Je81OT4pvCdNn4pgR7n3T0czNjmf22McDRAD6CM0l30ApUcYQAapUYdTRSjijJERIyddAAUDWlEEKb3YNj3B0hdP3I:1uPvxb:1r99ng4zYDzo5s1bLBWWwbR7gk6MZT1dNE5_ydHmjhA', '2025-06-13 12:29:11.229064');
INSERT INTO `django_session` VALUES ('f1ofet6jtmoealg4j287vnu0aj2lg446', '.eJxVjEEOgyAURO_CuiEogh-X3fcM5AOfStuAEU3aNL17NXHjLOe9mS-zlWpNJVt6T2n-sEGKLRdmcV1Gu1aabQpsYA07dQ79k_IOwgPzvXBf8jInx3eFH7TyWwn0uh7u6WDEOm5rY4SjDloAZZRuoheoZA8dUC816mii6FWUISJibKQDoGhII4IwrQfDfn-Y7T_S:1uPzyJ:0Txh_gJUgkDsHkK2EhY2bgAca3dKnFQ0-aKlmiNRJK4', '2025-06-14 01:01:11.093315');
INSERT INTO `django_session` VALUES ('f5x44nig978kd3ow4gayn1gj4flswq8z', 'eyJjYXB0Y2hhX2NvZGUiOiJHVjJLWFgiLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPdua:DAtu780LfSP8pwJjdjnwzXTlRH9LfusSo6msvMeQMbc', '2025-06-12 17:12:52.084654');
INSERT INTO `django_session` VALUES ('gnvlv1eneazduv93n420q8juzabs154e', 'eyJjYXB0Y2hhX2NvZGUiOiJHVTREUUciLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPem8:fsEZTN1f0AkprQXlH8t3vOKKN8FgUOpNDXbtSQ65KaM', '2025-06-12 18:08:12.703966');
INSERT INTO `django_session` VALUES ('gswryxvzwf8web8ls2195zy2m6at7x93', '.eJxVjMEOwiAQBf-FsyG0FLr06N1vIAssFjVgoE00xn_XJr30-mbmfZht1Foq2dLrmeqbTVIIcWIW12W2a6NqU2AT69hhc-jvlDcQbpivhfuSl5oc3xS-08YvJdDjvLuHgxnb_K-NEY4G6AGUUbqLXqCSIwxAo9Soo4liVFGGiIixkw6AoiGNCML0Hgz7_gBwjT-i:1uPwPG:gEqfLQIEMYCHwIrV5pOX27hbh8OawY10WR8glTP7CQ0', '2025-06-13 13:42:46.736301');
INSERT INTO `django_session` VALUES ('hy9wfavync85bib0s96g4eilnltcyh3s', '.eJxVjEEOgyAQRe_CuiEgyoDL7nsGMg5jpW3AiCZtmt69MXHj9r_3_leEyrWmkgO_57R8RG-UuoiA2zqFrfISUhS9AHHaBqQn5x3EB-Z7kVTyuqRB7oo8aJW3Evl1PdzTwYR12usG29iYkViz6yiC8aSN814jgvJ26JyyMFoDLYMGOxqjPUV01ERolRe_P111Pv8:1uPusK:Ss_OtCgAOkNcUI7M0q-rFqJo2NASYiHcAhks6rZ_L9w', '2025-06-13 11:19:40.611469');
INSERT INTO `django_session` VALUES ('j6lipquojmkwnev3jce5oyhmmvt3vdgw', '.eJxVjT0PgjAURf9LZ9O0FPrB6MKki4tOzeO1WNS0hEKiMf53IWFhvefec7_EZp9zn6L176EfP6QWjB2IhXkKds5-tL0jNVFkl7WATx9X4B4Q74liitPYt3St0I1mekrOv45bdycIkMO6LqB0hejQc68rdEoY5EIbwwEUM7KtNJOqk0KVXnElOyG4QQcaC6dKZhYpwjBhAIvL12K8NrfLuSG_P6VSRps:1uPecB:MVbGZiO7AUyrECvwetB4GsAWtUNZ3lPgoIPMy6xpP9w', '2025-06-12 17:57:55.440933');
INSERT INTO `django_session` VALUES ('jb7buobt3y5iwb0l7kos8jxj5ihaosjs', 'eyJjYXB0Y2hhX2NvZGUiOiIxSlNBTDciLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPu3H:32a9hi4cvHDGM4KOkGIdXegT3svhZF9anay_Yp-uzu4', '2025-06-13 10:26:55.398088');
INSERT INTO `django_session` VALUES ('pwvahm2pbobvjjae7kgsuif5fsk7fu5c', '.eJxVjMEOwiAQBf-FsyG0FLr06N1vIAssFjVgoE00xn_XJr30-mbmfZht1Foq2dLrmeqbTVKIE7O4LrNdG1WbAptYxw6bQ3-nvIFww3wt3Je81OT4pvCdNn4pgR7n3T0czNjmf22McDRAD6CM0l30ApUcYQAapUYdTRSjijJERIyddAAUDWlEEKb3YNj3B0hdP3I:1uPw7I:3IpyorJX6keoCqc2FQvFAFAujh-B49q_l2yXuxBcYcs', '2025-06-13 12:39:12.571404');
INSERT INTO `django_session` VALUES ('qxc47jzfb2n7ckt3sxwxo41jdq9gtnd7', '.eJxVjEEOgyAQRe_CuiEgyoDL7nsGMg5jpW3AiCZtmt69MXHj9r_3_leEyrWmkgO_57R8RG-UuoiA2zqFrfISUhS9AHHaBqQn5x3EB-Z7kVTyuqRB7oo8aJW3Evl1PdzTwYR12usG29iYkViz6yiC8aSN814jgvJ26JyyMFoDLYMGOxqjPUV01ERolRe_P111Pv8:1uPtQb:x5boxSF19gu5uj5MShsCndh8Iw-FhzWdDZKt2s-Ad7c', '2025-06-13 09:46:57.137064');
INSERT INTO `django_session` VALUES ('r215uv00b40xms65sh2oolsq5ah1omlo', '.eJxVjEEOgyAQRe_CuiEgyoDL7nsGMg5jpW3AiCZtmt69MXHj9r_3_leEyrWmkgO_57R8RG-UuoiA2zqFrfISUhS9AHHaBqQn5x3EB-Z7kVTyuqRB7oo8aJW3Evl1PdzTwYR12usG29iYkViz6yiC8aSN814jgvJ26JyyMFoDLYMGOxqjPUV01ERolRe_P111Pv8:1uPtff:irf92WDEF9CkC1DhKO2rdOTImxP2TVj-5_mO_9L9grc', '2025-06-13 10:02:31.920838');
INSERT INTO `django_session` VALUES ('rnzpli7smdnzwys9zseees8kve8ho8te', '.eJxVjMEOwiAQBf-FsyG0FLr06N1vIAssFjVgoE00xn_XJr30-mbmfZht1Foq2dLrmeqbTVKIE7O4LrNdG1WbAptYxw6bQ3-nvIFww3wt3Je81OT4pvCdNn4pgR7n3T0czNjmf22McDRAD6CM0l30ApUcYQAapUYdTRSjijJERIyddAAUDWlEEKb3YNj3B0hdP3I:1uPuzs:IF-Lif-vhEuJeLRjX6sxSuWfgK_iPusZM947HtE5Tzo', '2025-06-13 11:27:28.418343');
INSERT INTO `django_session` VALUES ('tll8r3e9vn5bchmvfnw4n7d10ituc5gh', 'eyJjYXB0Y2hhX2NvZGUiOiJaOEJDMFIiLCJfc2Vzc2lvbl9leHBpcnkiOjMwMH0:1uPeu2:h9mKaRJ9RTR50pK5avYj7JEmpb_BsFNDd4oLGevAHOw', '2025-06-12 18:16:22.465785');
INSERT INTO `django_session` VALUES ('xs5u1xgecgmi3tx5erwzeddrt9075jec', '.eJxVjTsLwjAUhf9LZilp08eNo6CbiJtbuElvTFSS0rSgiP_dFLr0jOfxnS9TiVLyMSh6D378sL3gWTumcJ6cmhONyvdsz0q28TSaJ4Ul6B8Y7rEwMUyj18VSKdY0FefY0-uwdjcAh8nltZRcUw0VQCObtrSGYyM6qIE60WJrpeVdY0VvEdGWQgOQldQiApeVAZmhBofJOFQmf2XiSV6Otyv7_QHzZEdK:1uQhlE:ZMt4UIhPER5BVa_JEW5tV-r5jDT_mtM9-M6s4KjE5YA', '2025-06-15 23:46:36.580923');

-- ----------------------------
-- Table structure for users_customuser
-- ----------------------------
DROP TABLE IF EXISTS `users_customuser`;
CREATE TABLE `users_customuser`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(20) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `profile_picture` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL,
  `bio` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_customuser
-- ----------------------------
INSERT INTO `users_customuser` VALUES (1, 'pbkdf2_sha256$600000$jHq4kJJJFtmJhf2ZwaMMOr$zamdP6V222zkQE0yHZC+IpGUt9F5wwcjwnbTki+i1W0=', '2025-06-15 15:20:38.809164', 1, 'mcj', '', '', '10086@qq.com', 1, 1, '2025-06-11 05:02:08.821899', 'admin', '', NULL);
INSERT INTO `users_customuser` VALUES (3, 'pbkdf2_sha256$600000$hSkonF1N4nhWBjDkoaIw3E$nRgAejv7rUnu0K91clbf93mRfEZdo2cJzx+SIc4y414=', NULL, 0, 'user1', '', '', 'user1@example.com', 0, 1, '2025-06-11 05:07:43.812172', 'regular', '', NULL);
INSERT INTO `users_customuser` VALUES (6, 'pbkdf2_sha256$600000$Xg9AS1la4bIBxdyZEuiRci$YEHeHo6YOjSvFeWTtJIBCENse4YhmXriJPIbKvgFpE4=', NULL, 0, 'user01', '', '', '2222@555.com', 0, 1, '2025-06-12 17:42:00.447868', 'regular', '', NULL);
INSERT INTO `users_customuser` VALUES (7, 'pbkdf2_sha256$600000$mwxBWCFB8MmeGo2orF8Y6D$k0cmInoM/g4nkdY+K+OkrKMqoAu1H61TJ3VkwLGcuY8=', '2025-06-15 09:08:04.789547', 0, '5555555', '', '', '4444@222.com', 0, 1, '2025-06-12 17:51:38.446019', 'regular', '', NULL);
INSERT INTO `users_customuser` VALUES (10, 'pbkdf2_sha256$600000$3EwWfhcYxwWEV2zk0VWYf4$2l+1rBf96cxC60Z/2InuZ37Z5m5pjMeJu/sfJ4eppEs=', '2025-06-15 09:05:19.413346', 0, 'admin', '', '', '3208028391@qq.com', 0, 1, '2025-06-13 16:22:42.896741', 'admin', '', NULL);

-- ----------------------------
-- Table structure for users_customuser_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_customuser_groups`;
CREATE TABLE `users_customuser_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_customuser_groups_customuser_id_group_id_76b619e3_uniq`(`customuser_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `users_customuser_groups_group_id_01390b14_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `users_customuser_gro_customuser_id_958147bf_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_customuser_groups_group_id_01390b14_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_customuser_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_customuser_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_customuser_user_permissions`;
CREATE TABLE `users_customuser_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_customuser_user_pe_customuser_id_permission_7a7debf6_uniq`(`customuser_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `users_customuser_use_permission_id_baaa2f74_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `users_customuser_use_customuser_id_5771478b_fk_users_cus` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_customuser_use_permission_id_baaa2f74_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf32 COLLATE = utf32_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_customuser_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
