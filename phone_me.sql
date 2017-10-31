/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : phone_me

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-11-01 00:24:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', 'Administrator', 'admin@admin.com', '$2y$10$QiNRVDLGtXd9hK2owAcET.MoMIoRaRgH9470SC7PobtzQcALD81MO', null, '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `admins` VALUES ('2', 'Editor', 'editor@editor.com', '$2y$10$LzKnfH1Eau/Ap2L25OZjy.NT5AiEaTJr.ID2mzZRZiJQL2LG6Taqy', null, '2017-11-01 00:18:08', '2017-11-01 00:18:08');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单链接',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '权限名称',
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级菜单id',
  `heightlight_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单高亮',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '系统', 'admin/menus', 'system.manage', 'fa fa-cogs', '0', '', '0', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `menus` VALUES ('2', '后台目录管理', 'admin/menus', 'menus.list', '', '1', '', '0', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `menus` VALUES ('3', '后台用户管理', 'admin/adminuser', 'adminuser.list', '', '1', '', '0', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `menus` VALUES ('4', '权限管理', 'admin/permission', 'permission.list', '', '1', '', '0', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `menus` VALUES ('5', '角色管理', 'admin/role', 'role.list', '', '1', '', '0', '2017-11-01 00:18:08', '2017-11-01 00:18:08');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_tables', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2017_06_02_131817_create_menus_table', '1');
INSERT INTO `migrations` VALUES ('2017_06_29_024954_entrust_setup_tables', '1');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'system.manage', '系统管理', '系统管理', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('2', 'menus.list', '目录列表', '目录列表', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('3', 'menus.add', '添加目录', '添加目录', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('4', 'menus.edit', '修改目录', '修改目录', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('5', 'menus.delete', '删除目录', '删除目录', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('6', 'adminuser.list', '后台用户列表', '后台用户列表', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('7', 'adminuser.add', '添加后台用户', '添加后台用户', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('8', 'adminuser.edit', '修改后台用户', '修改后台用户', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('9', 'adminuser.delete', '删除后台用户', '删除后台用户', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('10', 'permission.list', '权限列表', '权限列表', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('11', 'permission.add', '添加权限', '添加权限', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('12', 'permission.edit', '修改权限', '修改权限', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('13', 'permission.delete', '删除权限', '删除权限', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('14', 'role.list', '角色列表', '角色列表', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('15', 'role.add', '添加角色', '添加角色', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('16', 'role.edit', '修改角色', '修改角色', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `permissions` VALUES ('17', 'role.delete', '删除角色', '删除角色', '2017-11-01 00:18:08', '2017-11-01 00:18:08');

-- ----------------------------
-- Table structure for permission_role
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1');
INSERT INTO `permission_role` VALUES ('2', '1');
INSERT INTO `permission_role` VALUES ('3', '1');
INSERT INTO `permission_role` VALUES ('4', '1');
INSERT INTO `permission_role` VALUES ('5', '1');
INSERT INTO `permission_role` VALUES ('6', '1');
INSERT INTO `permission_role` VALUES ('7', '1');
INSERT INTO `permission_role` VALUES ('8', '1');
INSERT INTO `permission_role` VALUES ('9', '1');
INSERT INTO `permission_role` VALUES ('10', '1');
INSERT INTO `permission_role` VALUES ('11', '1');
INSERT INTO `permission_role` VALUES ('12', '1');
INSERT INTO `permission_role` VALUES ('13', '1');
INSERT INTO `permission_role` VALUES ('14', '1');
INSERT INTO `permission_role` VALUES ('15', '1');
INSERT INTO `permission_role` VALUES ('16', '1');
INSERT INTO `permission_role` VALUES ('17', '1');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'SuperAdmin', '超级管理员', '管理后台的角色', '2017-11-01 00:18:08', '2017-11-01 00:18:08');
INSERT INTO `roles` VALUES ('2', 'editor', '编辑', '编辑', '2017-11-01 00:18:08', '2017-11-01 00:18:08');

-- ----------------------------
-- Table structure for role_admin
-- ----------------------------
DROP TABLE IF EXISTS `role_admin`;
CREATE TABLE `role_admin` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_admin_role_id_foreign` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_admin
-- ----------------------------
INSERT INTO `role_admin` VALUES ('1', '1');
INSERT INTO `role_admin` VALUES ('2', '2');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'UserName', 'username@username.com', '$2y$10$AecHHirZ7XuLeQwqXRAEYuF1NZnuVvy/ckyakFev1MXM9IAPcvbKO', null, '2017-11-01 00:18:08', '2017-11-01 00:18:08');
