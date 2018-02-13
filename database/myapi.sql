/*
 Navicat Premium Data Transfer

 Source Server         : MICOLOR45
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : 192.168.123.45:3306
 Source Schema         : myapi

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 13/02/2018 21:31:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (9, '2016_06_01_000001_create_oauth_auth_codes_table', 2);
INSERT INTO `migrations` VALUES (10, '2016_06_01_000002_create_oauth_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (11, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2);
INSERT INTO `migrations` VALUES (12, '2016_06_01_000004_create_oauth_clients_table', 2);
INSERT INTO `migrations` VALUES (13, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
INSERT INTO `migrations` VALUES (14, '2018_02_13_013555_create_permission_tables', 2);

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_permissions_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`) USING BTREE,
  INDEX `model_has_roles_model_id_model_type_index`(`model_id`, `model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_access_tokens_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('37270ced94b93ba97e3ba72c18a8289740aa85576a94c32fcd8285168c23f6ceefb9b73509a1a10b', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 12:37:51', '2018-02-13 12:37:51', '2018-02-14 12:37:51');
INSERT INTO `oauth_access_tokens` VALUES ('3a02454d86b0653dd62a70e1478e1aca60f99f485ed11db7464931ea7ceceef209a9053cdfd52086', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 11:57:59', '2018-02-13 11:57:59', '2018-02-14 11:57:59');
INSERT INTO `oauth_access_tokens` VALUES ('455e853dcb26563b27991c26030463a849f4fae3649d4d37c78dbe15846ed75f07d1e71430be3aa1', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 11:58:04', '2018-02-13 11:58:04', '2018-02-14 11:58:04');
INSERT INTO `oauth_access_tokens` VALUES ('4c10e0a6b680418f928869094f669a09f05dd0641ea6f760e4bcfc53fb71f3c2f19d6782f663d000', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 03:57:15', '2018-02-13 03:57:15', '2018-02-14 03:57:15');
INSERT INTO `oauth_access_tokens` VALUES ('4c15a4ce3ec7788aa71b25a02c1a2cf98807cf1e5ba79f6c08d9cbc66d1e4f963d1f03f6f676afdd', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 11:58:36', '2018-02-13 11:58:36', '2018-02-14 11:58:36');
INSERT INTO `oauth_access_tokens` VALUES ('5bda61ccbdc70aab8050a0df4db6cdb3d4634e12c7e9f44a3813d9e45d1ea82a9066d2704d621a9a', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 03:57:23', '2018-02-13 03:57:23', '2018-02-14 03:57:23');
INSERT INTO `oauth_access_tokens` VALUES ('86a878fc737bcccf07c7f10046d23d7be9aded3c118b71067a90290dd146eedba37abe2c114f7dd4', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 03:52:39', '2018-02-13 03:52:39', '2018-02-14 03:52:39');
INSERT INTO `oauth_access_tokens` VALUES ('c427f17b8b60165fd9a6cf4bd732eed5d3dc65d03fa1e264e641d0ee322b6e20acb04e92f17e3c6f', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 12:15:05', '2018-02-13 12:15:05', '2018-02-14 12:15:05');
INSERT INTO `oauth_access_tokens` VALUES ('cb562933f912bed63f5b750bb54582428f4216c27322b60a10b70004f2d37ec267bc2d4313b3df93', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 12:56:02', '2018-02-13 12:56:02', '2018-02-14 12:56:02');
INSERT INTO `oauth_access_tokens` VALUES ('e483d626f37b16da9256ebb4b60dafa657e18274a89d61412ac9653a442bdb7427414f784e8130c7', 1, 2, NULL, '[\"*\"]', 0, '2018-02-13 11:57:49', '2018-02-13 11:57:49', '2018-02-14 11:57:49');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_clients_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES (1, NULL, 'Laravel Personal Access Client', 'dtjLzVFI2LdDBXwdWoeQkwnWKL6xWtLT8dUMAOy3', 'http://localhost', 1, 0, 0, '2018-02-13 03:52:05', '2018-02-13 03:52:05');
INSERT INTO `oauth_clients` VALUES (2, NULL, 'Laravel Password Grant Client', 'psi1tc9zVIPDSXVSy4nm94BXOv0AlMKikReAN40R', 'http://localhost', 0, 1, 0, '2018-02-13 03:52:05', '2018-02-13 03:52:05');

-- ----------------------------
-- Table structure for oauth_personal_access_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_personal_access_clients_client_id_index`(`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_personal_access_clients
-- ----------------------------
INSERT INTO `oauth_personal_access_clients` VALUES (1, 1, '2018-02-13 03:52:05', '2018-02-13 03:52:05');

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oauth_refresh_tokens_access_token_id_index`(`access_token_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
INSERT INTO `oauth_refresh_tokens` VALUES ('06ca31fbfa87720768d3126150703e5ac184772c3df63994bd4e630d52e3d9e3534e2b4a8c49aad5', 'cb562933f912bed63f5b750bb54582428f4216c27322b60a10b70004f2d37ec267bc2d4313b3df93', 0, '2018-02-15 12:56:02');
INSERT INTO `oauth_refresh_tokens` VALUES ('14f7f4e34d53a7e8a3eff0a2e30cfd9e0cfb1bc23f7f0e282d0a56ec7503989e73b20be44525e500', '86a878fc737bcccf07c7f10046d23d7be9aded3c118b71067a90290dd146eedba37abe2c114f7dd4', 0, '2018-02-15 03:52:39');
INSERT INTO `oauth_refresh_tokens` VALUES ('6d1f30262426297282a720278a314351333c0c50af82c58c24939909dff525bf9af6016856f61421', '455e853dcb26563b27991c26030463a849f4fae3649d4d37c78dbe15846ed75f07d1e71430be3aa1', 0, '2018-02-15 11:58:04');
INSERT INTO `oauth_refresh_tokens` VALUES ('72a3ab5ca9cb32184308bb8b2b22ed5d6b4d82add8b27104c7ae13fa01c35a404c58727515a6d34f', 'e483d626f37b16da9256ebb4b60dafa657e18274a89d61412ac9653a442bdb7427414f784e8130c7', 0, '2018-02-15 11:57:49');
INSERT INTO `oauth_refresh_tokens` VALUES ('9e74bb381cad94c39a0111446eb880ecb3e7a7bdb022554f0c52a5f7ce46274932a9d8db879f7721', 'c427f17b8b60165fd9a6cf4bd732eed5d3dc65d03fa1e264e641d0ee322b6e20acb04e92f17e3c6f', 0, '2018-02-15 12:15:05');
INSERT INTO `oauth_refresh_tokens` VALUES ('a228906e0a5d5b202a600bbc1ad8f246a1100ec74e678b2d76493abeb67f254754369c26b76ee76f', '5bda61ccbdc70aab8050a0df4db6cdb3d4634e12c7e9f44a3813d9e45d1ea82a9066d2704d621a9a', 0, '2018-02-15 03:57:23');
INSERT INTO `oauth_refresh_tokens` VALUES ('b587368b25b9a4974fe11a41f74b916cd7d7951ab7740b65fc817c17b624015bfaba18e1379e2fda', '4c15a4ce3ec7788aa71b25a02c1a2cf98807cf1e5ba79f6c08d9cbc66d1e4f963d1f03f6f676afdd', 0, '2018-02-15 11:58:36');
INSERT INTO `oauth_refresh_tokens` VALUES ('bdd90bbe270132872e15c84ca4befa688e7b93a40e518130799202f7a1f0300f99a7ab8439dacede', '3a02454d86b0653dd62a70e1478e1aca60f99f485ed11db7464931ea7ceceef209a9053cdfd52086', 0, '2018-02-15 11:57:59');
INSERT INTO `oauth_refresh_tokens` VALUES ('c14c87009675cbdae76a8dcc848cf163a356518bb3c9bdb694b3b39d43d00f035c49954a9f4321c8', '37270ced94b93ba97e3ba72c18a8289740aa85576a94c32fcd8285168c23f6ceefb9b73509a1a10b', 0, '2018-02-15 12:37:51');
INSERT INTO `oauth_refresh_tokens` VALUES ('d3db074bfa24518e01ecbb9aaf2b7999daea0a8f02928ae4ed91817b41db6a515ed39d16291cd063', '4c10e0a6b680418f928869094f669a09f05dd0641ea6f760e4bcfc53fb71f3c2f19d6782f663d000', 0, '2018-02-15 03:57:15');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions`  (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`) USING BTREE,
  INDEX `role_has_permissions_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (5, '111', 'api', '2018-02-13 05:53:57', '2018-02-13 11:56:36');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机',
  `avator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'MICOLOR', 'ann@micolor.com', '$2y$10$t1PjQbiHnPKWJK04xMJOIOGDMaJI04D.Cvl3OzIRK0EYdnoVdx5.u', NULL, '2018-01-31 09:07:53', '2018-01-31 09:07:53', '15161415003', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (2, 'Albertha Schaden III', 'juana71@example.net', '$2y$10$sNnhM4Ngbfs2s2U.Bit9y.iY4YbDNIJXH5C7O4gBxbBXSj81/0gVS', 'OQjmYSdkpU', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15136740722', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (3, 'Dena Keebler', 'dortha38@example.org', '$2y$10$vr1Xz0eUxZpL6fAreJm39.oEp7hCMzsysCiKSj4fIkvuUODnzfYEW', 'tTsXQRMHBB', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15167395324', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (4, 'Madelynn Jacobi DDS', 'elisabeth52@example.net', '$2y$10$BxE83/l2e54WARmISQZ5QOdMi2x9VyhPzC.ZUD0poSdqpBc9XcPOq', 'kd4PtiGXE8', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15199840698', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (5, 'Yoshiko Hills', 'yhirthe@example.com', '$2y$10$kkEajlOFVObJ.E9eaa.3aeba6aE.u4dlbaKgsdBcpVqYG4AEODKz6', 'Erm5qOFuiW', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15185605163', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (6, 'Miss Noemie Howell DVM', 'hassan30@example.org', '$2y$10$DX4mTbIeFOvTjjfu3AzMbei.0y2PMIshPrFPK1l/haEpqvxNX6HnK', '8Evon2kCrx', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15128775634', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (7, 'Dr. Kris Koelpin', 'aisha.konopelski@example.net', '$2y$10$XCF2A5If1hJrY7G0C2foP.QxeTrg/6pMvC8QTQEFsoZqR.1oiovY.', 'fcl2qR5k4C', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15182325744', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (8, 'Raoul Muller', 'damore.johnnie@example.org', '$2y$10$1qRaZwCMwpM3QrVH4ryAOeQsGg/3j4lb3X/82VRRoVw.Td4.nNcI2', 'Olqy9PySK2', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15167881469', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (9, 'Miss Cierra Kautzer I', 'obreitenberg@example.com', '$2y$10$Zfcbywvwz1ky0LKHGmnm5uBL2jdqRYEsCd4HOmPimx852IoGaJ4Uy', 'O477ehbZ7b', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15150174255', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (10, 'Ms. Kelly Pfeffer V', 'carissa.spencer@example.net', '$2y$10$Hgaq7ZP3IUsWE.MhFGFkNODYnh0g9EFBkjkCJ6tQw8c8/MI9v7knG', 'zqNni67wYT', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15142431640', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (11, 'Jakayla Halvorson', 'gutkowski.quinten@example.net', '$2y$10$13oIwxACTUgb9j3Zi4QjPuKHyorXIzruwprpMNw/vL5XTNe5wL9Zi', 'XMw3KvlLfU', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15123955383', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (12, 'Catherine Waelchi', 'magali64@example.net', '$2y$10$5Gro6tILqi8AiPwfc4w9QexCtShMHQ6Oh0yWWBc46xr2wgkIJlTnm', 'OBVod8UUdo', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15156137084', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (13, 'Electa Jacobi', 'eledner@example.org', '$2y$10$Q6r5jW/aNqZDWslo4zvBH.zIZtIohgfO4la9rbjJCsfv7HhcEzFLa', 'EQtVUTP2c7', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15158161315', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (14, 'Ms. Francesca Wilkinson MD', 'dustin.ernser@example.org', '$2y$10$ZOqHjilMVlqDPf72N54LQuUp79XMhN1a/rcA.X1sZGeABbwO53dqC', 'neJ4SMSwND', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15118646240', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (15, 'Ottilie Anderson', 'dickinson.alysa@example.com', '$2y$10$hBrO.pfMCJbTkOs7vxaCJOd8E07tGabrmwS.XI8nGPWBOqgqhCU4q', '3xldGVMPI3', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15124471740', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (16, 'Dr. Louie Hamill PhD', 'liliana67@example.org', '$2y$10$QftKfGtY.nNlDjpPupltqO4Xajp06Io0UWrqyUAEE2YtD0Mf.u33m', 'KHcZfeeucb', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15173045043', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (17, 'Lillian Raynor V', 'nbeahan@example.org', '$2y$10$B0IRqgRjpdQtIClRFd8r/.J0F08fkiIBS7SnXjkIT7hYJKTsHrv4u', 'NMVLfVHllh', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15139253845', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (18, 'Samantha Koepp', 'alicia.reichel@example.com', '$2y$10$UQtDNVB6zSA9gf2mCXUQz.yEnni5HIx9CQOsyHmva6i4Ba1VcP5JG', 'j07wCP2YSu', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15133356933', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (19, 'Christa Hamill', 'else.nicolas@example.net', '$2y$10$TIvm6fsB8MK8EFUoMcLC0eGa/V3w2yjKqjRVX14ejp2XH87odQBwy', 'SQTqDBePtK', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15181062316', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (20, 'Beth Purdy', 'kaelyn05@example.org', '$2y$10$WujzROGV0rVvRENW3b1X8.RMsD2jbRpdc6qsRfviPME7aeq13bkgO', 'WwzjIzRhmb', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15182042846', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (21, 'Dina Haag', 'metz.eva@example.org', '$2y$10$X3oUePjAN9nZ/hOIquDA1.Yzgs7NADyJEn.RSoZYbuiClHLH1Wi32', 'FDm1LmZWoU', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15158139343', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (22, 'Madilyn Reinger', 'huels.kenna@example.net', '$2y$10$IdkKjTR1mJhbsn/HFlPjLuSqNq6N0VMuDuVlnXFKGa/IGU3Q3ACve', 'TG1CbMiiPe', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15127501220', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (23, 'Miss Carole Dibbert', 'wbayer@example.com', '$2y$10$ZFvylSMlflIj1aOqCjtvGesjJZRzmu9JPlSqNnU/toYdR66SQPcQm', '7r7tTf8v7G', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15155914611', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (24, 'Antonetta O\'Kon', 'leffertz@example.net', '$2y$10$376fsqNrPtM63Qx2MF1Z1e10nPYHZ6FbibC7dl1JaZo2m48CIU1Ie', 'ULS25ZSX6A', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15191567993', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (25, 'Mr. Ferne Bradtke', 'erdman.thora@example.org', '$2y$10$De.WycWPZRoJWmbmI1L.W.SP5M/i8WZx9k6p7FBDRBeLoLSG.ifUy', 'WsIxC75VX4', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15144505310', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (26, 'Mrs. Dora Raynor V', 'marjorie.purdy@example.com', '$2y$10$NZ7QaIBmKRt4/O5Htr2MR.jqb1ENcaCvrzjNwH78w.1IPYpa8wX5K', 'IY1rXx1vBq', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15177016601', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (27, 'Mr. Ronaldo Reichert DVM', 'roconnell@example.net', '$2y$10$osanFhBJ2zmGAywzjO96gejrYDJD.x79Oc9qbcS5kOBbbYT28VJUi', 'i1ikw4fnKo', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15136216125', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (28, 'Wilmer Cormier', 'roy.mcdermott@example.com', '$2y$10$yrAymxlPrkbmgpLDuoSnUO9ZI.q/ZVOcllGt/tovq37FgpLn66BLW', 'ACnLhgF4zf', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15165057983', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (29, 'Bill Glover Jr.', 'qgerlach@example.org', '$2y$10$CLF3RJc9gzwjtSN91ZbZcOrC3MpdYZbMIGqGYkuNWaLmtf6kBk8ia', 'GQ2ybMh568', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15163039245', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (30, 'Miss Mariah Zboncak DDS', 'stephany.maggio@example.net', '$2y$10$bQO9ee1NS9lBRgGGVJfaduX8uI0QfCm/AVxqa5g9gWsLu3bLm0x3q', 'U4HpNUMYX5', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15132840576', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (31, 'Dr. Ezra Hamill', 'elijah79@example.net', '$2y$10$EAfl7YMTCFYEJxL9j6XltOa8QPfjAqpZmwvvoyrgjA1uEBIQZ5ftG', 'zbA8YmzR1P', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15164154357', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (32, 'Ms. Arvilla Considine', 'garrison83@example.net', '$2y$10$BBURU6X8ydAv/KMOYDW0nuwt2j.mi2/qKnjPAIl44fn5bkZxXlzYy', 'BZKhZgjmaH', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15110950317', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (33, 'Dora Brekke', 'leatha.weimann@example.net', '$2y$10$u.KZ8/J2wYEq2zJgabGfguNoCcq/BLJ9w2Bwz/ZHNQ5jJ3FcCjame', 'rzMM2YNbol', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15143428649', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (34, 'Miss Jazmin Keebler IV', 'louisa.gulgowski@example.com', '$2y$10$1PTI/CODjWODSvQqnxE9TeMC0pU3Audm9BlzaGpH9wcgIIZJ1gKpK', 'BoDz2tpN3U', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15160910644', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (35, 'Garrison Turner', 'gusikowski.francesco@example.org', '$2y$10$9AqKMSB0GoIcV7CdGLxmYOl.ikCsYcm/UTc8HKJVT6IDUd0gdhCEW', 'jjKgZtNUVM', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15146916809', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (36, 'Mrs. Glenna Prosacco Jr.', 'irwin.connelly@example.com', '$2y$10$rZPvrUqWO37v2XTR1lGSrOTU8PBMn1b71hRGWT5y3bvOPOkPYK0Uy', 'UkVAOBrY6E', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15172682495', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (37, 'Jammie Roberts', 'kshlerin.arlie@example.net', '$2y$10$sbreKMs7F9KUJJhQGYjGSePouNtZmiXeJECG10kzJ5RVGwiqSYgRW', 'pknSsx4aAf', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15150361022', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (38, 'Ms. Litzy Zulauf Sr.', 'caleigh26@example.org', '$2y$10$LjzBJJ6CkJT.4ThKBXxd0.xbgJ0Qu75P8xr/nzf5C8fbAJ/nKEy/u', 'E6AX6srSme', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15112164306', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (39, 'Mateo Bode III', 'brielle57@example.org', '$2y$10$l3ee5sXYdo1XH8qKgQCus.fYCXaV9gkoFPvS3mLzmE1z57vZm3FOi', 'IxDk2XJmWx', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15126690979', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (40, 'Foster Balistreri', 'milan45@example.org', '$2y$10$kKH7h1aM9SKkiw0eoa5nBO6YjZOShmi1iep.VAbOKoEg5o0pTNHty', 'G14lEVXxrv', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15178692016', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (41, 'Dewayne Haley', 'valerie.heathcote@example.net', '$2y$10$PG.kDZgIbGfYSsI8IJsjv.jie0zanBbH8rZmAU6z7nwC..NJbWYKS', 'anycWrJpCo', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15113523864', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (42, 'Mr. Johnathan Rodriguez IV', 'tkeebler@example.com', '$2y$10$sIoam4iFyt1DLW287xI8HuyIp6OtcXA9k2foKVS.IzZZbYxZZqijW', 'ttMYnd3cfE', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15152539062', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (43, 'Caleigh Runolfsdottir DDS', 'oconner.danika@example.net', '$2y$10$/HI7MHKruWi3UhCvh2nK0esj3qSWhy.RsqtC0JTWGfIb3cfPfIzJG', 'cKb7B6upIo', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15190664367', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (44, 'Fletcher Kessler', 'nathaniel07@example.net', '$2y$10$DLn8D/QQNViqz/osf1TNWettYA7fz3O2YJQs0TGa32hBVtQLYl2G6', 'QduVRwVJ4k', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15182416381', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (45, 'Evalyn Cremin', 'lsimonis@example.com', '$2y$10$Jedc5sEUmKJw/n0MmzMUIeknmiPrY.eWwLgTm4U83gqKIGcYOE5Oy', 'yp6R7AthEU', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15187604675', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (46, 'Ms. Corine Fay', 'bailey.joesph@example.org', '$2y$10$P6JhzUMaS5/u0D1YItBQv.kH0hBthyEZ4G5Xscq37nSLp4bLp/uUq', '7cKF1oqKCK', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15132972412', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (47, 'Mckayla Dibbert', 'pearl.shanahan@example.net', '$2y$10$eGXYVaYQET1Nmzz7FAycTuCkH8gw2.DBRHreUKTt3coY1PYXv..u6', '0gX5DRIZ3F', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15111024475', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (48, 'Ms. Connie Wisoky I', 'jbrekke@example.com', '$2y$10$KtA4re2wvnGKBrGQn.MHuOZKI7rINkR.2eJdjIFsMbiphD50X3IYO', 'j6ifLw2fSQ', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15192293090', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');
INSERT INTO `users` VALUES (49, 'Raphaelle Feest PhD', 'ebert.keyon@example.org', '$2y$10$Qb.pozDjSQm7a9QbneuaOO4UJJoc0i5dvKXvnXFz62LlWqyHjXWSq', 'E2V2zL3rC8', '2018-02-01 07:19:59', '2018-02-01 07:19:59', '15122290954', 'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3448484253,3685836170&fm=27&gp=0.jpg');

SET FOREIGN_KEY_CHECKS = 1;
