-- phpMyAdmin SQL Dump
-- version 4.0.10.11
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2019-10-07 19:13:39
-- 服务器版本: 5.5.54-log
-- PHP 版本: 5.6.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `hdlcms`
--

-- --------------------------------------------------------

--
-- 表的结构 `cms_admin`
--

CREATE TABLE IF NOT EXISTS `cms_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像图片地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `level` tinyint(4) NOT NULL DEFAULT '1' COMMENT '拥有权限等级',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除：0否 1是',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `cms_admin`
--

INSERT INTO `cms_admin` (`id`, `user_name`, `password`, `name`, `nickname`, `avatar`, `email`, `level`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$3bPTxO9JjeFz0XbZfD42YuruWBadZyjEIDT6Jo/51qWkINq/amqvq', NULL, NULL, NULL, NULL, 1, 0, '2019-09-10 02:02:02', '2019-09-10 02:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `cms_admin_log`
--

CREATE TABLE IF NOT EXISTS `cms_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL COMMENT '管理员id',
  `ip` varchar(20) NOT NULL COMMENT 'ip地址',
  `description` varchar(255) NOT NULL COMMENT '说明',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '是否删除0否1是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员日志' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cms_adverts`
--

CREATE TABLE IF NOT EXISTS `cms_adverts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '广告名称',
  `url` varchar(255) NOT NULL COMMENT '图片跳转地址',
  `location` varchar(50) NOT NULL COMMENT '广告位置',
  `img` varchar(255) NOT NULL COMMENT '图片',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='广告表' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `cms_adverts`
--

INSERT INTO `cms_adverts` (`id`, `name`, `url`, `location`, `img`, `sort`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '首页幻灯片', '/', 'index_slide', '/uploadfile/image/20191003/20191003232518_31511.jpg', 0, 0, '2019-10-03 15:32:42', NULL),
(2, '首页幻灯片', '/', 'index_slide', '/uploadfile/image/20191003/20191003232518_31511.jpg', 0, 0, '2019-10-03 15:34:09', NULL),
(3, '首页幻灯片', 'index_slide', 'index_slide', '/uploadfile/image/20191003/20191003232518_31511.jpg', 0, 0, '2019-10-03 15:34:31', '2019-10-04 03:49:47');

-- --------------------------------------------------------

--
-- 表的结构 `cms_article`
--

CREATE TABLE IF NOT EXISTS `cms_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `columns_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属栏目id',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `keywords` varchar(255) NOT NULL COMMENT '网页关键词',
  `description` varchar(255) NOT NULL COMMENT '网页描述',
  `img_url` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `content` text NOT NULL COMMENT '栏目内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，按从小到大排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1待审核 2审核通过 3审核不通过',
  `is_recommand` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1推荐 0不推荐',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除：0否1是',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cms_article1`
--

CREATE TABLE IF NOT EXISTS `cms_article1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `author` varchar(50) DEFAULT NULL COMMENT '作者',
  `keywords` varchar(255) NOT NULL COMMENT '网页关键词',
  `description` varchar(255) NOT NULL COMMENT '网页描述',
  `img_url` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `content` text NOT NULL COMMENT '栏目内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，按从小到大排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1待审核 2审核通过 3审核不通过',
  `is_recommand` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1推荐 0不推荐',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除：0否1是',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='独立页面' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cms_columns`
--

CREATE TABLE IF NOT EXISTS `cms_columns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '栏目名称',
  `type_id` int(11) NOT NULL DEFAULT '1' COMMENT '栏目类型',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级栏目id',
  `subname` varchar(50) DEFAULT NULL COMMENT '栏目副标题',
  `keywords` varchar(255) NOT NULL COMMENT '网页关键词',
  `description` varchar(255) NOT NULL COMMENT '网页描述',
  `img_url` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `content` text NOT NULL COMMENT '栏目内容',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除：0否1是',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cms_comments`
--

CREATE TABLE IF NOT EXISTS `cms_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1留言2评论',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` int(11) unsigned DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '注册用户id',
  `content` text NOT NULL COMMENT '内容',
  `reply` text NOT NULL COMMENT '回复内容',
  `is_display` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1显示 0不显示',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言或评论' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cms_config`
--

CREATE TABLE IF NOT EXISTS `cms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '网站标题',
  `keywords` varchar(255) NOT NULL COMMENT '网站关键字',
  `description` varchar(255) NOT NULL COMMENT '网站描述',
  `name` varchar(255) NOT NULL COMMENT '网站名称',
  `url` varchar(255) NOT NULL DEFAULT '/' COMMENT '网站域名',
  `icp` varchar(255) NOT NULL COMMENT '网站icp备案号',
  `contact_name` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话1',
  `tel2` varchar(20) DEFAULT NULL COMMENT '电话2',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `phone` int(11) unsigned DEFAULT NULL COMMENT '手机',
  `phone2` int(11) unsigned DEFAULT NULL COMMENT '手机2',
  `qq` int(11) unsigned DEFAULT NULL COMMENT 'qq',
  `qq2` int(11) unsigned DEFAULT NULL COMMENT 'qq2',
  `email` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `logo_img` varchar(255) DEFAULT NULL COMMENT 'logo图片地址',
  `news_check` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文章是否审核',
  `comments_check` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '留言评论是否审核',
  `open_register` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否允许注册，0不允许，1允许',
  `web_run` tinyint(4) NOT NULL DEFAULT '1' COMMENT '网站开启状态',
  `off_reason` varchar(255) DEFAULT NULL COMMENT '网站关闭原因',
  `copyright` varchar(255) DEFAULT NULL COMMENT 'coptright字符串',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='网站设置' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `cms_config`
--

INSERT INTO `cms_config` (`id`, `title`, `keywords`, `description`, `name`, `url`, `icp`, `contact_name`, `tel`, `tel2`, `fax`, `phone`, `phone2`, `qq`, `qq2`, `email`, `address`, `logo_img`, `news_check`, `comments_check`, `open_register`, `web_run`, `off_reason`, `copyright`, `created_at`, `updated_at`) VALUES
(1, 'HDLCMS', 'HDLCMS', 'HDLCMS', 'HDLCMS', '/', '黔ICP备', 'HDLCMS', '', NULL, '', 0, NULL, 0, NULL, '', '', '/uploadfile/image/20191002/20191002154254_51168.png', 0, 0, 1, 1, '', 'copyright&copyright;2019', '2019-10-02 07:03:33', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `cms_links`
--

CREATE TABLE IF NOT EXISTS `cms_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '链接名称',
  `url` varchar(255) NOT NULL COMMENT '链接地址',
  `img` varchar(255) NOT NULL COMMENT '链接图片地址',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '从小到大排序',
  `is_display` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0不显示1显示',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='友情链接' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cms_links`
--

INSERT INTO `cms_links` (`id`, `name`, `url`, `img`, `sort`, `is_display`, `is_delete`, `created_at`, `updated_at`) VALUES
(1, '友情链接1', '/', '', 0, 1, 0, '2019-10-05 02:34:25', '0000-00-00 00:00:00'),
(2, '百度一下', 'http://www.baidu.com', '', 0, 1, 0, '2019-10-05 08:42:39', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `cms_permission`
--

CREATE TABLE IF NOT EXISTS `cms_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限等级',
  `name` varchar(20) NOT NULL COMMENT '权限名称',
  `columns` varchar(255) NOT NULL COMMENT '权限栏目',
  `have_check` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审核权限1允许0不允许',
  `have_add` tinyint(4) NOT NULL DEFAULT '1' COMMENT '添加权限',
  `have_edit` tinyint(4) NOT NULL DEFAULT '1' COMMENT '修改权限',
  `have_delete` tinyint(4) NOT NULL DEFAULT '1' COMMENT '删除权限',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='权限表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cms_permission`
--

INSERT INTO `cms_permission` (`id`, `name`, `columns`, `have_check`, `have_add`, `have_edit`, `have_delete`, `created_at`, `updated_at`) VALUES
(1, '超级管理员', '0', 1, 1, 1, 1, '2019-09-10 05:42:12', NULL),
(2, '超级管理员', '0', 1, 1, 1, 1, '2019-09-10 05:42:15', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `cms_type`
--

CREATE TABLE IF NOT EXISTS `cms_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '类型名称',
  `front_page` varchar(20) NOT NULL COMMENT '前台页面样式',
  `add_page` varchar(20) NOT NULL COMMENT '后台添加页面样式',
  `edit_page` varchar(20) NOT NULL COMMENT '后台编辑页面样式',
  `manage_page` varchar(20) NOT NULL COMMENT '后台管理页面样式',
  `extra_table` varchar(20) DEFAULT NULL COMMENT '附加的数据表',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cms_user`
--

CREATE TABLE IF NOT EXISTS `cms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(50) DEFAULT NULL COMMENT '昵称',
  `name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `avatar` varchar(255) NOT NULL COMMENT '头像',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
