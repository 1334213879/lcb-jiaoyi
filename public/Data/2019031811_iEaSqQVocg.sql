-- CLTPHP SQL Backup
-- Time:2019-03-18 11:50:42
-- http://www.cltphp.com 

--
-- 表的结构 `clt_ad_type`
-- 
DROP TABLE IF EXISTS `clt_ad_type`;
CREATE TABLE `clt_ad_type` (
  `type_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `sort` int(11) NOT NULL COMMENT '广告位排序',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_ad_type`表中的数据 `clt_ad_type`
--
INSERT INTO `clt_ad_type` VALUES (10,应用,50);
INSERT INTO `clt_ad_type` VALUES (9,公告,50);
--
-- 表的结构 `clt_admin`
-- 
DROP TABLE IF EXISTS `clt_admin`;
CREATE TABLE `clt_admin` (
  `admin_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(20) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(70) NOT NULL COMMENT '管理员密码',
  `group_id` mediumint(8) DEFAULT NULL COMMENT '分组ID',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `mdemail` varchar(50) DEFAULT '0' COMMENT '传递修改密码参数加密',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '审核状态',
  `login_number` int(10) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `admin_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_admin`表中的数据 `clt_admin`
--
INSERT INTO `clt_admin` VALUES (1,admin,9c59ea3c2568c56a76a2429e24d3d9fb,1,11093@qq.com,,18792425865,111.221.144.57,1482132862,0,1,116,1552732816);
INSERT INTO `clt_admin` VALUES (12,super,8104402e6a3bb4eb3c871a8f8ab98dd8,1,1111111@qq.com,,17899888877,61.90.19.46,1534317232,0,1,50,1546771284);
INSERT INTO `clt_admin` VALUES (13,xmtadmin1,535649b032069346b35d260a6b086bc0,3,1211515121@qq.com,,13555555555,112.65.61.45,1545183494,0,0,15,1545881598);
INSERT INTO `clt_admin` VALUES (14,xmtadmin2,e10adc3949ba59abbe56e057f20f883e,3,1211515121@qq.com,,17899888877,122.226.184.18,1545183791,0,0,12,1545828415);
INSERT INTO `clt_admin` VALUES (15,xmtadmin3,e10adc3949ba59abbe56e057f20f883e,3,1211515121@qq.com,,17899888877,122.226.184.18,1545183811,0,0,12,1545828415);
INSERT INTO `clt_admin` VALUES (16,xmtadmin4,e10adc3949ba59abbe56e057f20f883e,3,1211515121@qq.com,,17899888877,122.226.184.18,1545183838,0,0,12,1545828415);
INSERT INTO `clt_admin` VALUES (17,xmtadmin5,e10adc3949ba59abbe56e057f20f883e,3,1211515121@qq.com,,17899888877,122.226.184.18,1545183858,0,0,12,1545828415);
INSERT INTO `clt_admin` VALUES (18,xmtadmin6,e10adc3949ba59abbe56e057f20f883e,3,1211515121@qq.com,,17899888877,122.226.184.18,1545183880,0,0,12,1545828415);
INSERT INTO `clt_admin` VALUES (19,20213@qq.com,c3c5d02d6b2df39f54636a5369fceac3,3,20213@qq.com,,13267118125,112.97.57.31,1552661788,0,0,0,0);
--
-- 表的结构 `clt_auth_group`
-- 
DROP TABLE IF EXISTS `clt_auth_group`;
CREATE TABLE `clt_auth_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '全新ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `rules` longtext COMMENT '规则',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_auth_group`表中的数据 `clt_auth_group`
--
INSERT INTO `clt_auth_group` VALUES (1,超级管理员,1,0,1,2,15,16,119,120,121,145,17,149,116,117,118,181,151,18,108,114,112,109,110,111,27,29,161,163,164,162,297,295,296,28,45,170,171,175,174,173,46,176,183,179,178,278,293,298,300,302,272,304,273,280,,1465114224);
INSERT INTO `clt_auth_group` VALUES (3,管理员,0,27,29,161,28,278,,1515229561);
--
-- 表的结构 `clt_auth_rule`
-- 
DROP TABLE IF EXISTS `clt_auth_rule`;
CREATE TABLE `clt_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=310 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_auth_rule`表中的数据 `clt_auth_rule`
--
INSERT INTO `clt_auth_rule` VALUES (1,System,系统设置,1,1,0,fa-cogs,,0,0,1446535750,1,1);
INSERT INTO `clt_auth_rule` VALUES (2,System/system,系统设置,1,1,0,,,1,1,1446535789,1,1);
INSERT INTO `clt_auth_rule` VALUES (4,Database/restore,还原数据库,1,1,0,,,3,10,1446535750,1,1);
INSERT INTO `clt_auth_rule` VALUES (5,Database/database,数据库备份,1,1,0,,,3,1,1446535834,1,1);
INSERT INTO `clt_auth_rule` VALUES (9,Category/index,栏目列表,1,1,0,,,7,0,1446535750,1,1);
INSERT INTO `clt_auth_rule` VALUES (13,Category/edit,操作-修改,1,1,0,,,9,3,1446535750,1,0);
INSERT INTO `clt_auth_rule` VALUES (14,Category/add,操作-添加,1,1,0,,,9,0,1446535750,1,0);
INSERT INTO `clt_auth_rule` VALUES (15,Auth/adminList,权限管理,1,1,0,fa-id-badge,,0,1,1446535750,1,1);
INSERT INTO `clt_auth_rule` VALUES (16,Auth/adminList,管理员列表,1,1,0,,,15,0,1446535750,1,1);
INSERT INTO `clt_auth_rule` VALUES (17,Auth/adminGroup,用户组列表,1,1,0,,,15,1,1446535750,1,1);
INSERT INTO `clt_auth_rule` VALUES (18,Auth/adminRule,权限管理,1,1,0,,,15,2,1446535750,1,1);
INSERT INTO `clt_auth_rule` VALUES (23,Help/soft,软件下载,1,1,0,,,22,50,1446711421,0,1);
INSERT INTO `clt_auth_rule` VALUES (27,Users,会员管理,1,1,0,fa-user,,0,5,1447231507,1,1);
INSERT INTO `clt_auth_rule` VALUES (28,Function,系统功能,1,1,0,fa-sun-o,,0,6,1447231590,1,1);
INSERT INTO `clt_auth_rule` VALUES (29,Users/index,会员列表,1,1,0,,,27,10,1447232085,1,1);
INSERT INTO `clt_auth_rule` VALUES (32,Link/add,操作-添加,1,1,0,,,31,1,1447639935,0,0);
INSERT INTO `clt_auth_rule` VALUES (36,We/we_menu,自定义菜单,1,1,0,,,35,50,1447842477,0,1);
INSERT INTO `clt_auth_rule` VALUES (39,We/we_menu,自定义菜单,1,1,0,,,36,50,1448501584,0,1);
INSERT INTO `clt_auth_rule` VALUES (45,Ad/index,广告管理,1,1,0,,,28,3,1450314297,1,0);
INSERT INTO `clt_auth_rule` VALUES (46,Ad/type,广告位管理,1,1,0,,,28,4,1450314324,1,1);
INSERT INTO `clt_auth_rule` VALUES (105,System/runsys,操作-保存,1,1,0,,,6,50,1461036331,1,0);
INSERT INTO `clt_auth_rule` VALUES (106,System/runwesys,操作-保存,1,1,0,,,10,50,1461037680,0,0);
INSERT INTO `clt_auth_rule` VALUES (107,System/runemail,操作-保存,1,1,0,,,19,50,1461039346,1,0);
INSERT INTO `clt_auth_rule` VALUES (108,Auth/ruleAdd,操作-添加,1,1,0,,,18,0,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (109,Auth/ruleState,操作-状态,1,1,0,,,18,5,1461550949,1,0);
INSERT INTO `clt_auth_rule` VALUES (110,Auth/ruleTz,操作-验证,1,1,0,,,18,6,1461551129,1,0);
INSERT INTO `clt_auth_rule` VALUES (111,Auth/ruleorder,操作-排序,1,1,0,,,18,7,1461551263,1,0);
INSERT INTO `clt_auth_rule` VALUES (112,Auth/ruleDel,操作-删除,1,1,0,,,18,4,1461551536,1,0);
INSERT INTO `clt_auth_rule` VALUES (114,Auth/ruleEdit,操作-修改,1,1,0,,,18,2,1461551913,1,0);
INSERT INTO `clt_auth_rule` VALUES (116,Auth/groupEdit,操作-修改,1,1,0,,,17,3,1461552326,1,0);
INSERT INTO `clt_auth_rule` VALUES (117,Auth/groupDel,操作-删除,1,1,0,,,17,30,1461552349,1,0);
INSERT INTO `clt_auth_rule` VALUES (118,Auth/groupAccess,操作-权限,1,1,0,,,17,40,1461552404,1,0);
INSERT INTO `clt_auth_rule` VALUES (119,Auth/adminAdd,操作-添加,1,1,0,,,16,0,1461553162,1,0);
INSERT INTO `clt_auth_rule` VALUES (120,Auth/adminEdit,操作-修改,1,1,0,,,16,2,1461554130,1,0);
INSERT INTO `clt_auth_rule` VALUES (121,Auth/adminDel,操作-删除,1,1,0,,,16,4,1461554152,1,0);
INSERT INTO `clt_auth_rule` VALUES (122,System/source_runadd,操作-添加,1,1,0,,,43,10,1461036331,1,0);
INSERT INTO `clt_auth_rule` VALUES (123,System/source_order,操作-排序,1,1,0,,,43,50,1461037680,1,0);
INSERT INTO `clt_auth_rule` VALUES (124,System/source_runedit,操作-改存,1,1,0,,,43,30,1461039346,1,0);
INSERT INTO `clt_auth_rule` VALUES (125,System/source_del,操作-删除,1,1,0,,,43,40,146103934,1,0);
INSERT INTO `clt_auth_rule` VALUES (126,Database/export,操作-备份,1,1,0,,,5,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (127,Database/optimize,操作-优化,1,1,0,,,5,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (128,Database/repair,操作-修复,1,1,0,,,5,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (129,Database/delSqlFiles,操作-删除,1,1,0,,,4,3,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (130,System/bxgs_state,操作-状态,1,1,0,,,67,5,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (131,System/bxgs_edit,操作-修改,1,1,0,,,67,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (132,System/bxgs_runedit,操作-改存,1,1,0,,,67,2,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (134,System/myinfo_runedit,个人资料修改,1,1,0,,,68,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (236,Category/del,操作-删除,1,1,0,,,9,5,1497424900,,0);
INSERT INTO `clt_auth_rule` VALUES (230,Database/restoreData,操作-还原,1,1,0,,,4,1,1497423595,,0);
INSERT INTO `clt_auth_rule` VALUES (145,Auth/adminState,操作-状态,1,1,0,,,16,5,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (149,Auth/groupAdd,操作-添加,1,1,0,,,17,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (151,Auth/groupRunaccess,操作-权存,1,1,0,,,17,50,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (153,System/bxgs_runadd,操作-添存,1,1,0,,,66,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (234,Category/insert,操作-添存,1,1,0,,,9,2,1497424143,,0);
INSERT INTO `clt_auth_rule` VALUES (240,Module/del,操作-删除,1,1,0,,,190,4,1497425850,,0);
INSERT INTO `clt_auth_rule` VALUES (239,Module/moduleState,操作-状态,1,1,0,,,190,5,1497425764,,0);
INSERT INTO `clt_auth_rule` VALUES (238,page/edit,单页编辑,1,1,0,,,7,2,1497425142,,0);
INSERT INTO `clt_auth_rule` VALUES (237,Category/cOrder,操作-排序,1,1,0,,,9,6,1497424979,,0);
INSERT INTO `clt_auth_rule` VALUES (161,Users/usersState,操作-状态,1,1,0,,,29,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (162,Users/delall,操作-全部删除,1,1,0,,,29,4,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (163,Users/edit,操作-编辑,1,1,0,,,29,2,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (164,Users/usersDel,操作-删除,1,1,0,,,29,3,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (247,Message/del,操作-删除,1,1,0,,,48,1,1497427449,,0);
INSERT INTO `clt_auth_rule` VALUES (166,Users/groupOrder,操作-排序,1,1,0,,,38,50,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (167,Users/groupAdd,操作-添加,1,1,0,,,38,10,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (169,Users/groupDel,操作-删除,1,1,0,,,38,30,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (170,Ad/add,操作-添加,1,1,0,,,45,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (171,Ad/edit,操作-修改,1,1,0,,,45,2,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (173,Ad/del,操作-删除,1,1,0,,,45,5,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (174,Ad/adOrder,操作-排序,1,1,0,,,45,4,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (175,Ad/editState,操作-状态,1,1,0,,,45,3,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (176,Ad/addType,操作-添加,1,1,0,,,46,1,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (252,Template/edit,操作-编辑,1,1,0,,,197,3,1497428906,,0);
INSERT INTO `clt_auth_rule` VALUES (178,Ad/delType,操作-删除,1,1,0,,,46,4,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (179,Ad/typeOrder,操作-排序,1,1,0,,,46,3,1461550835,1,0);
INSERT INTO `clt_auth_rule` VALUES (180,System/source_edit,操作-修改,1,1,0,,,43,20,1461832933,1,0);
INSERT INTO `clt_auth_rule` VALUES (181,Auth/groupState,操作-状态,1,1,0,,,17,50,1461834340,1,0);
INSERT INTO `clt_auth_rule` VALUES (182,Users/groupEdit,操作-修改,1,1,0,,,38,15,1461834780,1,0);
INSERT INTO `clt_auth_rule` VALUES (183,Ad/editType,操作-修改,1,1,0,,,46,2,1461834988,1,0);
INSERT INTO `clt_auth_rule` VALUES (188,Plug/donation,捐赠列表,1,1,0,,,187,50,1466563673,0,1);
INSERT INTO `clt_auth_rule` VALUES (190,Module/index,模型列表,1,1,0,,,189,1,1466826681,0,1);
INSERT INTO `clt_auth_rule` VALUES (192,Module/edit,操作-修改,1,1,0,,,190,2,1467007920,0,0);
INSERT INTO `clt_auth_rule` VALUES (193,Module/add,操作-添加,1,1,0,,,190,1,1467007955,0,0);
INSERT INTO `clt_auth_rule` VALUES (197,Template/index,模版管理,1,1,0,,,196,1,1481857540,0,1);
INSERT INTO `clt_auth_rule` VALUES (198,Template/insert,操作-添存,1,1,0,,,197,2,1481857587,0,0);
INSERT INTO `clt_auth_rule` VALUES (202,Template/add,操作-添加,1,1,0,,,197,1,1481859447,0,0);
INSERT INTO `clt_auth_rule` VALUES (203,Debris/index,碎片管理,1,1,0,,,196,2,1484797759,0,1);
INSERT INTO `clt_auth_rule` VALUES (204,Debris/edit,操作-编辑,1,1,0,,,203,2,1484797849,0,0);
INSERT INTO `clt_auth_rule` VALUES (205,Debris/add,操作-添加,1,1,0,,,203,1,1484797878,0,0);
INSERT INTO `clt_auth_rule` VALUES (207,Wechat/index,公众号管理,1,1,0,,,206,1,1487063705,0,1);
INSERT INTO `clt_auth_rule` VALUES (208,Wechat/menu,菜单管理,1,1,0,,,206,2,1487063765,0,1);
INSERT INTO `clt_auth_rule` VALUES (209,Wechat/text,文本回复,1,1,0,,,206,3,1487063834,0,1);
INSERT INTO `clt_auth_rule` VALUES (210,Wechat/img,图文回复,1,1,0,,,206,4,1487063858,0,1);
INSERT INTO `clt_auth_rule` VALUES (211,Wechat/news,消息推送,1,1,0,,,206,5,1487063934,0,0);
INSERT INTO `clt_auth_rule` VALUES (212,Wechat/weixin,操作-设置,1,1,0,,,207,1,1487064541,0,0);
INSERT INTO `clt_auth_rule` VALUES (213,Wechat/addMenu,操作-添加,1,1,0,,,208,1,1487149151,0,0);
INSERT INTO `clt_auth_rule` VALUES (214,Wechat/editText,操作-编辑,1,1,0,,,209,2,1487233984,0,0);
INSERT INTO `clt_auth_rule` VALUES (215,Wechat/addText,操作-添加,1,1,0,,,209,1,1487234062,0,0);
INSERT INTO `clt_auth_rule` VALUES (216,Wechat/editImg,操作-编辑,1,1,0,,,210,2,1487318148,0,0);
INSERT INTO `clt_auth_rule` VALUES (217,Wechat/addImg,操作-添加,1,1,0,,,210,1,1487318175,0,0);
INSERT INTO `clt_auth_rule` VALUES (232,Database/downFile,操作-下载,1,1,0,,,4,2,1497423744,,0);
INSERT INTO `clt_auth_rule` VALUES (235,Category/catUpdate,操作-该存,1,1,0,,,9,4,1497424301,,0);
INSERT INTO `clt_auth_rule` VALUES (241,Module/field,模型字段,1,1,0,,,190,6,1497425972,,0);
INSERT INTO `clt_auth_rule` VALUES (242,Module/fieldStatus,操作-状态,1,1,0,,,241,4,1497426044,,0);
INSERT INTO `clt_auth_rule` VALUES (243,Module/fieldAdd,操作-添加,1,1,0,,,241,1,1497426089,,0);
INSERT INTO `clt_auth_rule` VALUES (244,Module/fieldEdit,操作-修改,1,1,0,,,241,2,1497426134,,0);
INSERT INTO `clt_auth_rule` VALUES (245,Module/listOrder,操作-排序,1,1,0,,,241,3,1497426179,,0);
INSERT INTO `clt_auth_rule` VALUES (246,Module/fieldDel,操作-删除,1,1,0,,,241,5,1497426241,,0);
INSERT INTO `clt_auth_rule` VALUES (248,Message/delall,操作-删除全部,1,1,0,,,48,2,1497427534,,0);
INSERT INTO `clt_auth_rule` VALUES (249,Link/edit,操作-编辑,1,1,0,,,31,2,1497427694,,0);
INSERT INTO `clt_auth_rule` VALUES (250,Link/linkState,操作-状态,1,1,0,,,31,3,1497427734,,0);
INSERT INTO `clt_auth_rule` VALUES (251,Link/del,操作-删除,1,1,0,,,31,4,1497427780,,0);
INSERT INTO `clt_auth_rule` VALUES (253,Template/update,操作-改存,1,1,0,,,197,4,1497428951,,0);
INSERT INTO `clt_auth_rule` VALUES (254,Template/delete,操作-删除,1,1,0,,,197,5,1497429018,,0);
INSERT INTO `clt_auth_rule` VALUES (255,Template/images,媒体文件管理,1,1,0,,,197,6,1497429157,,0);
INSERT INTO `clt_auth_rule` VALUES (256,Template/imgDel,操作-文件删除,1,1,0,,,255,1,1497429217,,0);
INSERT INTO `clt_auth_rule` VALUES (257,Debris/del,操作-删除,1,1,0,,,203,3,1497429416,,0);
INSERT INTO `clt_auth_rule` VALUES (258,Wechat/editMenu,操作-编辑,1,1,0,,,208,2,1497429671,,0);
INSERT INTO `clt_auth_rule` VALUES (259,Wechat/menuOrder,操作-排序,1,1,0,,,208,3,1497429707,,0);
INSERT INTO `clt_auth_rule` VALUES (260,Wechat/menuState,操作-状态,1,1,0,,,208,4,1497429764,,0);
INSERT INTO `clt_auth_rule` VALUES (261,Wechat/delMenu,操作-删除,1,1,0,,,208,5,1497429822,,0);
INSERT INTO `clt_auth_rule` VALUES (262,Wechat/createMenu,操作-生成菜单,1,1,0,,,208,6,1497429886,,0);
INSERT INTO `clt_auth_rule` VALUES (263,Wechat/delText,操作-删除,1,1,0,,,209,3,1497430020,,0);
INSERT INTO `clt_auth_rule` VALUES (264,Wechat/delImg,操作-删除,1,1,0,,,210,3,1497430159,,0);
INSERT INTO `clt_auth_rule` VALUES (295,Users/recharge,充值,1,1,0,,,29,50,1533369518,,0);
INSERT INTO `clt_auth_rule` VALUES (266,Wechat/news,多图文回复,1,1,0,,,206,7,1501221710,,1);
INSERT INTO `clt_auth_rule` VALUES (269,Plugin/login,登录插件,1,1,1,,,267,1,1501466732,,1);
INSERT INTO `clt_auth_rule` VALUES (272,News/index,公告,1,1,1,,,28,50,1512463320,,1);
INSERT INTO `clt_auth_rule` VALUES (273,goods/check,交易已审核异常,1,1,1,,,28,51,1512531063,,1);
INSERT INTO `clt_auth_rule` VALUES (278,goods/tj,统计,1,1,1,,,28,50,1512973616,,0);
INSERT INTO `clt_auth_rule` VALUES (280,goods/check1,交易异常待处理,1,1,1,,,28,52,1513664042,,1);
INSERT INTO `clt_auth_rule` VALUES (282,tx/check1,已提交,1,1,1,,,281,50,1513908009,,0);
INSERT INTO `clt_auth_rule` VALUES (283,tx/check,待处理,1,1,1,,,281,50,1513908038,,1);
INSERT INTO `clt_auth_rule` VALUES (285,tx/check2,已处理,1,1,1,,,281,50,1513908117,,1);
INSERT INTO `clt_auth_rule` VALUES (296,Users/zw,会员等级,1,1,1,,,27,50,1543742191,,1);
INSERT INTO `clt_auth_rule` VALUES (293,Yy/index,应用,1,1,0,,,28,50,1531126727,,1);
INSERT INTO `clt_auth_rule` VALUES (297,Users/adduser,添加会员,1,1,1,,,29,50,1545183671,,0);
INSERT INTO `clt_auth_rule` VALUES (298,Goods/index,交易管理,1,1,1,,,28,50,1545821486,,1);
INSERT INTO `clt_auth_rule` VALUES (300,Goods/cz,审核USDT充值,1,1,1,,,28,50,1551409858,,1);
INSERT INTO `clt_auth_rule` VALUES (302,Goods/code,激活码管理,1,1,1,,,28,50,1551668416,,1);
INSERT INTO `clt_auth_rule` VALUES (304,Goods/tj,统计,1,1,1,,,28,50,1552634923,,1);
INSERT INTO `clt_auth_rule` VALUES (307,Database/database,数据库管理,1,1,1,fa-database,,0,2,1552879315,,1);
INSERT INTO `clt_auth_rule` VALUES (308,Database/database,数据库备份,1,1,1,,,307,1,1552879377,,1);
INSERT INTO `clt_auth_rule` VALUES (309,Database/restore,还原数据库,1,1,1,,,307,10,1552879455,,1);
--
-- 表的结构 `clt_category`
-- 
DROP TABLE IF EXISTS `clt_category`;
CREATE TABLE `clt_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `parentdir` varchar(50) NOT NULL DEFAULT '',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `module` char(24) NOT NULL DEFAULT '',
  `arrparentid` varchar(100) NOT NULL DEFAULT '',
  `arrchildid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `template_list` varchar(20) NOT NULL DEFAULT '',
  `template_show` varchar(20) NOT NULL DEFAULT '',
  `pagesize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `listtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_category`表中的数据 `clt_category`
--
INSERT INTO `clt_category` VALUES (1,最新动态,news,,0,2,article,0,1,49,51,0,最新动态,最新动态,最新动态,4,0,1,0,,1,/index.php?m=Article&a=index&id=1,article-list,article-show,0,1,2,3,0,0);
INSERT INTO `clt_category` VALUES (8,关于我们,about,,0,1,page,0,8,0,关于我们-CLTPHP,关于我们,CLTPHP,CLTPHP内容管理系统,CLTPHP内容管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。,0,0,1,0,/uploads/20170802/dd2106481b454c020d66c9ecdeeb4e65.jpg,0,/index.php?m=Page&a=index&id=8,,,0,,0,0);
INSERT INTO `clt_category` VALUES (33,系统操作,system,,0,3,picture,0,33,0,CLTPHP系统操作,CLTPHP系统操作,CLTPHP,CLTPHP内容管理系统,CLTPHP系统操作,CLTPHP,CLTPHP内容管理系统,2,0,1,0,,0,,,,0,1,2,3,0,0);
INSERT INTO `clt_category` VALUES (24,测试新闻子,tests,test/,23,1,Page,0,23,24,0,,,,0,0,1,0,,0,/index.php?m=Page&a=index&id=24,,,0,,0,0);
INSERT INTO `clt_category` VALUES (43,联系我们,contact,,0,1,page,0,43,0,联系我们,联系我们,CLTPHP,CLTPHP内容管理系统,联系我们,CLTPHP,CLTPHP内容管理系统,7,0,1,0,,0,,page_show_contace,page_show_contace,0,,0,0);
INSERT INTO `clt_category` VALUES (41,精英团队,team,,0,6,team,0,41,0,精英团队,精英团队,CLTPHP,CLTPHP内容管理系统,精英团队,CLTPHP,CLTPHP内容管理系统,5,0,1,0,,0,,,,0,,0,0);
INSERT INTO `clt_category` VALUES (49,CLTPHP动态,news,news/,1,2,article,0,1,49,0,CLTPHP动态,CLTPHP动态,CLTPHP,CLTPHP内容管理系统,CLTPHP动态,CLTPHP,CLTPHP内容管理系统,0,0,1,0,,0,,,,0,1,2,3,0,0);
INSERT INTO `clt_category` VALUES (51,相关知识 ,news,news/,1,2,article,0,1,51,0,CLTPHP相关知识,CLTPHP相关知识,CLTPHP,CLTPHP内容管理系统,CLTPHP相关知识,CLTPHP,CLTPHP内容管理系统,0,0,1,0,,0,,,,0,,0,0);
--
-- 表的结构 `clt_code`
-- 
DROP TABLE IF EXISTS `clt_code`;
CREATE TABLE `clt_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` varchar(50) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `code` varchar(100) DEFAULT NULL,
  `use_id` int(50) DEFAULT NULL COMMENT '使用者',
  `use_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_code`表中的数据 `clt_code`
--
INSERT INTO `clt_code` VALUES (84,1552719377,1161,1,6QN1M9,,);
INSERT INTO `clt_code` VALUES (83,1552719372,1161,1,EG7R9Q,,);
INSERT INTO `clt_code` VALUES (82,1552719366,1161,0,OEIHNS,1161,1552720095);
INSERT INTO `clt_code` VALUES (81,1552718735,1171,0,M6RP7I,1171,1552718788);
INSERT INTO `clt_code` VALUES (80,1552716764,1139,0,QO1SSN,1139,1552716885);
INSERT INTO `clt_code` VALUES (79,1552713701,1147,0,2FKJLS,1147,1552713808);
INSERT INTO `clt_code` VALUES (78,1552713670,1147,0,FLHYCT,1209,1552718904);
INSERT INTO `clt_code` VALUES (77,1552638696,0,0,G0CBYE,1077,1552638895);
INSERT INTO `clt_code` VALUES (76,1552638696,0,0,O0E5BE,1058,1552648943);
INSERT INTO `clt_code` VALUES (75,1552638696,0,0,45FY7M,1359,1552718821);
INSERT INTO `clt_code` VALUES (74,1552638696,0,0,R3B7U5,1142,1552720004);
INSERT INTO `clt_code` VALUES (73,1552638696,0,0,H7WOMP,1153,1552720178);
INSERT INTO `clt_code` VALUES (72,1552635952,0,0,JTECO2,1076,1552636121);
INSERT INTO `clt_code` VALUES (71,1552633298,0,0,CW1NYH,1054,1552633511);
INSERT INTO `clt_code` VALUES (70,1552631287,0,0,QI4BM3,1063,1552631665);
INSERT INTO `clt_code` VALUES (69,1552631287,0,0,X1LED3,1064,1552631686);
INSERT INTO `clt_code` VALUES (68,1552628693,0,0,25J14O,1061,1552630130);
INSERT INTO `clt_code` VALUES (67,1552628693,0,0,OJ55RN,1062,1552630045);
INSERT INTO `clt_code` VALUES (66,1552628693,0,0,LLJ7F5,1055,1552631537);
INSERT INTO `clt_code` VALUES (65,1552628693,0,0,OMP1HM,1053,1552630249);
INSERT INTO `clt_code` VALUES (64,1552565276,1051,0,BSWNWT,1051,1552565289);
INSERT INTO `clt_code` VALUES (85,1552720104,1181,0,5EKHUK,1181,1552721147);
INSERT INTO `clt_code` VALUES (86,1552720267,0,0,8D39II,1167,1552720771);
INSERT INTO `clt_code` VALUES (87,1552720267,0,0,A309MI,1191,1552720989);
INSERT INTO `clt_code` VALUES (88,1552720267,0,0,TMXCI3,1180,1552721055);
INSERT INTO `clt_code` VALUES (89,1552720267,0,0,PUUYIW,1210,1552721344);
INSERT INTO `clt_code` VALUES (90,1552720267,0,0,YCY8NV,1220,1552721251);
INSERT INTO `clt_code` VALUES (91,1552720267,0,0,BY59XF,1178,1552720700);
INSERT INTO `clt_code` VALUES (92,1552720267,0,0,QV6SE8,1177,1552720601);
INSERT INTO `clt_code` VALUES (93,1552720267,0,0,RDQT7J,1176,1552720467);
INSERT INTO `clt_code` VALUES (94,1552720267,0,0,CNQK01,1156,1552720381);
INSERT INTO `clt_code` VALUES (95,1552720267,0,0,9IGUIY,1155,1552720305);
INSERT INTO `clt_code` VALUES (96,1552720336,1171,1,190RKI,,);
INSERT INTO `clt_code` VALUES (97,1552721423,0,0,030EPQ,1211,1552721438);
INSERT INTO `clt_code` VALUES (98,1552721423,0,0,RGE7P1,1213,1552721524);
INSERT INTO `clt_code` VALUES (99,1552721423,0,0,HCYO7E,1216,1552721636);
INSERT INTO `clt_code` VALUES (100,1552721423,0,0,S3NJ56,1222,1552721794);
INSERT INTO `clt_code` VALUES (101,1552721423,0,0,RPQ0Y7,1281,1552727997);
INSERT INTO `clt_code` VALUES (102,1552722658,1171,1,DHN5H1,,);
INSERT INTO `clt_code` VALUES (103,1552722714,1171,1,5A6PHT,,);
INSERT INTO `clt_code` VALUES (104,1552787437,0,0,QPD1QY,1301,1552789189);
INSERT INTO `clt_code` VALUES (105,1552787437,0,0,L3CR0O,1280,1552788862);
INSERT INTO `clt_code` VALUES (106,1552787437,0,0,FAH05D,1340,1552788636);
INSERT INTO `clt_code` VALUES (107,1552787437,0,0,39DUM1,1065,1552787944);
INSERT INTO `clt_code` VALUES (108,1552787437,0,0,AEHA3S,1066,1552787872);
INSERT INTO `clt_code` VALUES (109,1552787608,1074,0,YHKA1B,1074,1552787826);
INSERT INTO `clt_code` VALUES (110,1552787608,1074,0,P0SLJC,1160,1552791442);
INSERT INTO `clt_code` VALUES (111,1552787608,1074,0,S8NR1B,1370,1552792607);
INSERT INTO `clt_code` VALUES (112,1552787608,1074,0,SGHOB2,1401,1552799903);
INSERT INTO `clt_code` VALUES (113,1552787608,1074,0,CQ58O3,1268,1552791316);
INSERT INTO `clt_code` VALUES (114,1552787608,1074,0,3CLARD,1400,1552800184);
INSERT INTO `clt_code` VALUES (115,1552787608,1074,0,GOP1PL,1186,1552791025);
INSERT INTO `clt_code` VALUES (116,1552787608,1074,0,ANJMOG,1214,1552790916);
INSERT INTO `clt_code` VALUES (117,1552787608,1074,0,LKEWXV,1232,1552790834);
INSERT INTO `clt_code` VALUES (118,1552787608,1074,0,W54OU0,1267,1552791256);
INSERT INTO `clt_code` VALUES (119,1552789281,0,0,INW79K,1264,1552789670);
INSERT INTO `clt_code` VALUES (120,1552789281,0,0,JTL1AS,1274,1552789492);
INSERT INTO `clt_code` VALUES (121,1552789281,0,0,CK7QVX,1273,1552789434);
INSERT INTO `clt_code` VALUES (122,1552789281,0,0,P8UOLM,1272,1552789363);
INSERT INTO `clt_code` VALUES (123,1552789281,0,0,8RWNXO,1283,1552789297);
INSERT INTO `clt_code` VALUES (124,1552789829,0,0,D48DNQ,1230,1552790256);
INSERT INTO `clt_code` VALUES (125,1552789829,0,0,GRJCAK,1266,1552790062);
INSERT INTO `clt_code` VALUES (126,1552789829,0,0,1ETTIQ,1259,1552789989);
INSERT INTO `clt_code` VALUES (127,1552789829,0,0,WBANMC,1258,1552789912);
INSERT INTO `clt_code` VALUES (128,1552789829,0,0,O1HJVN,1265,1552789842);
INSERT INTO `clt_code` VALUES (129,1552790275,0,0,CAT41K,1228,1552790583);
INSERT INTO `clt_code` VALUES (130,1552790275,0,0,UB5JH6,1227,1552790523);
INSERT INTO `clt_code` VALUES (131,1552790275,0,0,IK97NO,1226,1552790443);
INSERT INTO `clt_code` VALUES (132,1552790275,0,0,7YLFKU,1231,1552790720);
INSERT INTO `clt_code` VALUES (133,1552790275,0,0,9YJ7RO,1225,1552790379);
INSERT INTO `clt_code` VALUES (134,1552810523,1380,0,UO3AKC,1380,1552810534);
INSERT INTO `clt_code` VALUES (135,1552819652,1406,0,U1WXG4,1406,1552819664);
INSERT INTO `clt_code` VALUES (136,1552823981,1402,0,HI99TY,1402,1552824006);
INSERT INTO `clt_code` VALUES (137,1552829396,1403,0,P25BAT,1403,1552829411);
INSERT INTO `clt_code` VALUES (138,1552836156,1398,0,IWFOV2,1398,1552836168);
INSERT INTO `clt_code` VALUES (139,1552837334,1421,1,PLGCQO,,);
INSERT INTO `clt_code` VALUES (140,1552837365,1421,1,0BWGS1,,);
INSERT INTO `clt_code` VALUES (141,1552837529,1421,1,VOOH79,,);
INSERT INTO `clt_code` VALUES (142,1552837546,1421,0,CEJKB0,1421,1552838102);
INSERT INTO `clt_code` VALUES (143,1552877965,1067,0,RDJMYE,1067,1552877989);
--
-- 表的结构 `clt_field`
-- 
DROP TABLE IF EXISTS `clt_field`;
CREATE TABLE `clt_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` mediumtext NOT NULL,
  `ispost` tinyint(1) NOT NULL DEFAULT '0',
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_field`表中的数据 `clt_field`
--
INSERT INTO `clt_field` VALUES (1,1,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (2,1,hits,点击次数,,0,0,8,,,,number,array (
  'size' => '10',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,8,0,0);
INSERT INTO `clt_field` VALUES (3,1,createtime,发布时间,,1,0,0,date,,,datetime,,1,,97,1,1);
INSERT INTO `clt_field` VALUES (4,1,template,模板,,0,0,0,,,,template,,1,,99,1,1);
INSERT INTO `clt_field` VALUES (5,1,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),0,,98,1,1);
INSERT INTO `clt_field` VALUES (6,1,content,内容,,1,0,0,defaul,,content,editor,array (
  'edittype' => 'layedit',
),0,,3,1,0);
INSERT INTO `clt_field` VALUES (7,2,catid,栏目,,1,1,6,,必须选择一个栏目,,catid,,1,,1,1,1);
INSERT INTO `clt_field` VALUES (8,2,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (9,2,keywords,关键词,,0,0,80,,,,text,array (
  'size' => '55',
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),1,,3,1,1);
INSERT INTO `clt_field` VALUES (10,2,description,SEO简介,,0,0,0,,,,textarea,array (
  'fieldtype' => 'mediumtext',
  'rows' => '4',
  'cols' => '55',
  'default' => '',
),1,,4,1,1);
INSERT INTO `clt_field` VALUES (11,2,content,内容,,0,0,0,defaul,,content,editor,array (
  'edittype' => 'layedit',
),1,,5,1,1);
INSERT INTO `clt_field` VALUES (12,2,createtime,发布时间,,1,0,0,date,,,datetime,,1,,6,1,1);
INSERT INTO `clt_field` VALUES (13,2,recommend,允许评论,,0,0,1,,,,radio,array (
  'options' => '允许评论|1
不允许评论|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '',
  'default' => '',
),1,,10,0,0);
INSERT INTO `clt_field` VALUES (14,2,readpoint,阅读收费,,0,0,5,,,,number,array (
  'size' => '5',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,11,0,0);
INSERT INTO `clt_field` VALUES (15,2,hits,点击次数,,0,0,8,,,,number,array (
  'size' => '10',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,12,1,0);
INSERT INTO `clt_field` VALUES (16,2,readgroup,访问权限,,0,0,0,,,,groupid,array (
  'inputtype' => 'checkbox',
  'fieldtype' => 'tinyint',
  'labelwidth' => '85',
  'default' => '',
),1,,13,1,1);
INSERT INTO `clt_field` VALUES (17,2,posid,推荐位,,0,0,0,,,,posid,,1,,14,1,1);
INSERT INTO `clt_field` VALUES (18,2,template,模板,,0,0,0,,,,template,,1,,15,1,1);
INSERT INTO `clt_field` VALUES (19,2,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,7,1,1);
INSERT INTO `clt_field` VALUES (20,3,catid,栏目,,1,1,6,,必须选择一个栏目,,catid,,1,,1,1,1);
INSERT INTO `clt_field` VALUES (21,3,title,标题,,1,1,80,defaul,标题必须为1-80个字符,,title,array (
  'thumb' => '0',
  'style' => '0',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (22,3,keywords,关键词,,0,0,80,,,,text,array (
  'size' => '55',
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),1,,3,1,1);
INSERT INTO `clt_field` VALUES (23,3,description,SEO简介,,0,0,0,,,,textarea,array (
  'fieldtype' => 'mediumtext',
  'rows' => '4',
  'cols' => '55',
  'default' => '',
),1,,4,1,1);
INSERT INTO `clt_field` VALUES (24,3,content,内容,,0,0,0,defaul,,content,editor,array (
  'edittype' => 'layedit',
),1,,7,1,1);
INSERT INTO `clt_field` VALUES (25,3,createtime,发布时间,,1,0,0,date,,,datetime,,1,,8,1,1);
INSERT INTO `clt_field` VALUES (26,3,recommend,允许评论,,0,0,1,,,,radio,array (
  'options' => '允许评论|1
不允许评论|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '',
  'default' => '',
),1,,10,0,0);
INSERT INTO `clt_field` VALUES (27,3,readpoint,阅读收费,,0,0,5,,,,number,array (
  'size' => '5',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,11,0,0);
INSERT INTO `clt_field` VALUES (28,3,hits,点击次数,,0,0,8,,,,number,array (
  'size' => '10',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,12,0,0);
INSERT INTO `clt_field` VALUES (29,3,readgroup,访问权限,,0,0,0,,,,groupid,array (
  'inputtype' => 'checkbox',
  'fieldtype' => 'tinyint',
  'labelwidth' => '85',
  'default' => '',
),1,,13,0,1);
INSERT INTO `clt_field` VALUES (30,3,posid,推荐位,,0,0,0,,,,posid,,1,,14,1,1);
INSERT INTO `clt_field` VALUES (31,3,template,模板,,0,0,0,,,,template,,1,,15,1,1);
INSERT INTO `clt_field` VALUES (32,3,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,9,1,1);
INSERT INTO `clt_field` VALUES (33,3,pic,图片,,1,0,0,defaul,,pic,image,,0,,5,1,0);
INSERT INTO `clt_field` VALUES (34,3,group,类型,,1,0,0,defaul,,group,select,array (
  'options' => '模型管理|1
分类管理|2
内容管理|3',
  'multiple' => '0',
  'fieldtype' => 'varchar',
  'numbertype' => '1',
  'size' => '',
  'default' => '',
),0,,6,1,0);
INSERT INTO `clt_field` VALUES (35,4,catid,栏目,,1,1,6,,必须选择一个栏目,,catid,,1,,1,1,1);
INSERT INTO `clt_field` VALUES (36,4,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (37,4,keywords,关键词,,0,0,80,,,,text,array (
  'size' => '55',
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),1,,3,1,1);
INSERT INTO `clt_field` VALUES (38,4,description,SEO简介,,0,0,0,,,,textarea,array (
  'fieldtype' => 'mediumtext',
  'rows' => '4',
  'cols' => '55',
  'default' => '',
),1,,4,1,1);
INSERT INTO `clt_field` VALUES (39,4,content,内容,,0,0,0,defaul,,content,editor,array (
  'edittype' => 'layedit',
),1,,8,1,1);
INSERT INTO `clt_field` VALUES (40,4,createtime,发布时间,,1,0,0,date,,,datetime,,1,,9,1,1);
INSERT INTO `clt_field` VALUES (41,4,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,10,1,1);
INSERT INTO `clt_field` VALUES (42,4,recommend,允许评论,,0,0,1,,,,radio,array (
  'options' => '允许评论|1
不允许评论|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '',
  'default' => '',
),1,,11,0,0);
INSERT INTO `clt_field` VALUES (43,4,readpoint,阅读收费,,0,0,5,,,,number,array (
  'size' => '5',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,12,0,0);
INSERT INTO `clt_field` VALUES (44,4,hits,点击次数,,0,0,8,,,,number,array (
  'size' => '10',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,13,0,0);
INSERT INTO `clt_field` VALUES (45,4,readgroup,访问权限,,0,0,0,,,,groupid,array (
  'inputtype' => 'checkbox',
  'fieldtype' => 'tinyint',
  'labelwidth' => '85',
  'default' => '',
),1,,14,0,1);
INSERT INTO `clt_field` VALUES (46,4,posid,推荐位,,0,0,0,,,,posid,,1,,15,1,1);
INSERT INTO `clt_field` VALUES (47,4,template,模板,,0,0,0,,,,template,,1,,16,1,1);
INSERT INTO `clt_field` VALUES (48,4,price,价格,,1,0,0,defaul,,price,number,array (
  'size' => '',
  'numbertype' => '1',
  'decimaldigits' => '2',
  'default' => '0.00',
),0,,5,1,0);
INSERT INTO `clt_field` VALUES (49,4,xinghao,型号,,0,0,0,defaul,,,text,array (
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,6,1,0);
INSERT INTO `clt_field` VALUES (50,4,pics,图组,,0,0,0,defaul,,pics,images,,0,,7,1,0);
INSERT INTO `clt_field` VALUES (51,5,catid,栏目,,1,1,6,,必须选择一个栏目,,catid,,1,,1,1,1);
INSERT INTO `clt_field` VALUES (52,5,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (53,5,keywords,关键词,,0,0,80,,,,text,array (
  'size' => '55',
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),1,,3,1,1);
INSERT INTO `clt_field` VALUES (54,5,description,SEO简介,,0,0,0,,,,textarea,array (
  'fieldtype' => 'mediumtext',
  'rows' => '4',
  'cols' => '55',
  'default' => '',
),1,,4,1,1);
INSERT INTO `clt_field` VALUES (55,5,content,内容,,0,0,0,defaul,,content,editor,array (
  'edittype' => 'layedit',
),1,,9,1,1);
INSERT INTO `clt_field` VALUES (56,5,createtime,发布时间,,1,0,0,date,,,datetime,,1,,10,1,1);
INSERT INTO `clt_field` VALUES (57,5,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,11,1,1);
INSERT INTO `clt_field` VALUES (58,5,recommend,允许评论,,0,0,1,,,,radio,array (
  'options' => '允许评论|1
不允许评论|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '',
  'default' => '',
),1,,12,0,0);
INSERT INTO `clt_field` VALUES (59,5,readpoint,阅读收费,,0,0,5,,,,number,array (
  'size' => '5',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,13,0,0);
INSERT INTO `clt_field` VALUES (60,5,hits,点击次数,,0,0,8,,,,number,array (
  'size' => '10',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,14,0,0);
INSERT INTO `clt_field` VALUES (61,5,readgroup,访问权限,,0,0,0,,,,groupid,array (
  'inputtype' => 'checkbox',
  'fieldtype' => 'tinyint',
  'labelwidth' => '85',
  'default' => '',
),1,,15,0,1);
INSERT INTO `clt_field` VALUES (62,5,posid,推荐位,,0,0,0,,,,posid,,1,,16,1,1);
INSERT INTO `clt_field` VALUES (63,5,template,模板,,0,0,0,,,,template,,1,,17,1,1);
INSERT INTO `clt_field` VALUES (64,5,file,上传文件,,0,0,0,defaul,,file,file,array (
  'upload_maxsize' => '2',
  'upload_allowext' => 'zip,rar,doc,ppt',
),0,,5,1,0);
INSERT INTO `clt_field` VALUES (65,5,ext,文档类型,,0,0,0,defaul,,ext,text,array (
  'default' => 'zip',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,6,1,0);
INSERT INTO `clt_field` VALUES (66,5,size,文档大小,,0,0,0,defaul,,size,text,array (
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,7,1,0);
INSERT INTO `clt_field` VALUES (67,5,downs,下载次数,,0,0,0,defaul,,,number,array (
  'size' => '',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '',
),0,,8,1,0);
INSERT INTO `clt_field` VALUES (68,6,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (69,6,hits,点击次数,,0,0,8,,,,number,array (
  'size' => '10',
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '0',
),1,,6,0,0);
INSERT INTO `clt_field` VALUES (70,6,createtime,发布时间,,1,0,0,date,,,datetime,,1,,4,1,1);
INSERT INTO `clt_field` VALUES (71,6,template,模板,,0,0,0,,,,template,,1,,7,1,1);
INSERT INTO `clt_field` VALUES (72,6,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,5,1,1);
INSERT INTO `clt_field` VALUES (73,6,catid,分类,,1,0,0,defaul,,catid,catid,,0,,1,1,0);
INSERT INTO `clt_field` VALUES (74,6,info,简介,,1,0,0,defaul,,info,editor,array (
  'edittype' => 'layedit',
),0,,3,1,0);
INSERT INTO `clt_field` VALUES (75,2,copyfrom,来源,,0,0,0,defaul,,copyfrom,text,array (
  'default' => 'CLTPHP',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,8,1,0);
INSERT INTO `clt_field` VALUES (76,2,fromlink,来源网址,,0,0,0,defaul,,fromlink,text,array (
  'default' => 'http://www.cltphp.com/',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,9,1,0);
INSERT INTO `clt_field` VALUES (78,7,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (83,7,money,购买的价格,,0,0,0,defaul,,,number,array (
  'decimaldigits' => '2',
  'default' => '',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (80,7,createtime,发布时间,,1,0,0,date,,,datetime,,1,,97,1,1);
INSERT INTO `clt_field` VALUES (81,7,template,模板,,0,0,0,,,,template,,1,,99,1,1);
INSERT INTO `clt_field` VALUES (82,7,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,98,1,1);
INSERT INTO `clt_field` VALUES (84,7,week,已返回周数,,0,0,0,defaul,,,number,array (
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (85,8,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (90,8,re_time,返还时间,,0,0,0,defaul,,,datetime,,0,,0,1,0);
INSERT INTO `clt_field` VALUES (91,8,money,返还金额,,0,0,0,defaul,,,number,array (
  'decimaldigits' => '2',
  'default' => '',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (87,8,createtime,发布时间,,1,0,0,date,,,datetime,,1,,97,1,1);
INSERT INTO `clt_field` VALUES (88,8,template,模板,,0,0,0,,,,template,,1,,99,1,1);
INSERT INTO `clt_field` VALUES (89,8,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,98,1,1);
INSERT INTO `clt_field` VALUES (92,8,pid,购买产品id,,0,0,0,defaul,,,number,array (
  'decimaldigits' => '0',
  'default' => '',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (93,9,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (98,9,price,价格,,0,0,0,defaul,,,number,array (
  'numbertype' => '1',
  'decimaldigits' => '2',
  'default' => '',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (95,9,createtime,发布时间,,1,0,0,date,,,datetime,,1,,97,1,1);
INSERT INTO `clt_field` VALUES (96,9,template,模板,,0,0,0,,,,template,,1,,99,1,1);
INSERT INTO `clt_field` VALUES (97,9,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,98,1,1);
INSERT INTO `clt_field` VALUES (99,9,content,详情,,0,0,0,defaul,,,editor,array (
  'edittype' => 'UEditor',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (100,9,jl,活动奖励,,0,0,0,defaul,,,text,array (
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (101,9,htime,活动时间段,,0,0,0,defaul,,,text,array (
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (106,10,title,标题,,1,1,80,,标题必须为1-80个字符,,title,array (
  'thumb' => '1',
  'style' => '1',
  'size' => '55',
),1,,2,1,1);
INSERT INTO `clt_field` VALUES (105,7,jl,奖励,,0,0,0,defaul,,,text,array (
  'default' => '',
  'ispassword' => '0',
  'fieldtype' => 'varchar',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (104,7,note,备注,,0,0,0,defaul,,,textarea,array (
  'fieldtype' => 'mediumtext',
  'default' => '',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (107,10,money,加速金额,,0,0,10,defaul,,,number,array (
  'numbertype' => '1',
  'decimaldigits' => '2',
  'default' => '0',
),1,,8,0,0);
INSERT INTO `clt_field` VALUES (108,10,createtime,发布时间,,1,0,0,date,,,datetime,,1,,97,1,1);
INSERT INTO `clt_field` VALUES (109,10,template,模板,,0,0,0,,,,template,,1,,99,1,1);
INSERT INTO `clt_field` VALUES (110,10,status,状态,,0,0,0,,,,radio,array (
  'options' => '发布|1
定时发布|0',
  'fieldtype' => 'tinyint',
  'numbertype' => '1',
  'labelwidth' => '75',
  'default' => '1',
),1,,98,1,1);
INSERT INTO `clt_field` VALUES (111,10,day,天数,,0,0,2,defaul,,,number,array (
  'numbertype' => '1',
  'decimaldigits' => '0',
  'default' => '',
),0,,0,1,0);
INSERT INTO `clt_field` VALUES (112,10,bili,比例,,0,1,2,defaul,,,number,array (
  'numbertype' => '1',
  'decimaldigits' => '2',
  'default' => '',
),0,,0,1,0);
--
-- 表的结构 `clt_gm`
-- 
DROP TABLE IF EXISTS `clt_gm`;
CREATE TABLE `clt_gm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `time` int(30) NOT NULL COMMENT '添加时间',
  `jg` decimal(20,8) DEFAULT NULL,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0表示挂卖，1表示购买待打款，2表示已打款，3已确认打款，4挂卖没人买下架，5已打款未确定，交易异常，6过期交易信息',
  `dj` decimal(20,2) DEFAULT NULL,
  `gs` int(10) DEFAULT NULL,
  `time1` int(30) DEFAULT NULL,
  `buy_id` int(10) DEFAULT NULL,
  `time2` int(30) DEFAULT NULL,
  `time3` int(30) DEFAULT NULL,
  `img` varchar(225) DEFAULT NULL,
  `yhk` varchar(225) DEFAULT NULL,
  `yhk_h` varchar(225) DEFAULT NULL,
  `yhk_name` varchar(225) DEFAULT NULL,
  `zg` decimal(20,2) DEFAULT NULL,
  `ht` int(1) DEFAULT '0',
  `nickname` varchar(50) DEFAULT NULL,
  `buyname` varchar(50) DEFAULT NULL,
  `lang` varchar(50) DEFAULT '挂卖',
  `zt` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`) ,
  KEY `ht` (`ht`) 
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
--
-- 表的结构 `clt_goods`
-- 
DROP TABLE IF EXISTS `clt_goods`;
CREATE TABLE `clt_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `listorder` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `template` varchar(40) NOT NULL DEFAULT '',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `content` text NOT NULL,
  `jl` varchar(255) NOT NULL DEFAULT '',
  `htime` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
--
-- 表的结构 `clt_log`
-- 
DROP TABLE IF EXISTS `clt_log`;
CREATE TABLE `clt_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` int(50) DEFAULT NULL,
  `type` int(1) DEFAULT NULL,
  `text` varchar(225) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `usdt` decimal(20,8) DEFAULT '0.00000000' COMMENT '充值usdt',
  `status` int(1) DEFAULT '1',
  `reward3` decimal(20,8) DEFAULT '0.00000000',
  `reward2` decimal(20,8) DEFAULT '0.00000000',
  `reward1` decimal(20,8) DEFAULT '0.00000000' COMMENT '奖励数',
  `title` varchar(30) DEFAULT NULL,
  `nmct` decimal(20,8) DEFAULT '0.00000000',
  `nmct_dj` decimal(20,8) DEFAULT '0.00000000',
  `xmt` decimal(20,8) DEFAULT '0.00000000',
  `img` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14476 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_log`表中的数据 `clt_log`
--
INSERT INTO `clt_log` VALUES (12405,1552562907,2,,1028,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12404,1552562907,1,,1028,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12403,1552562859,5,,1027,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12402,1552562859,2,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12401,1552562859,1,,1027,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12400,1552562819,5,,1026,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12399,1552562819,2,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12398,1552562819,1,,1026,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12397,1552562769,5,,1025,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12396,1552562769,2,,1025,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12395,1552562769,1,,1025,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12394,1552562710,5,,1024,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12393,1552562710,2,,1024,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12392,1552562710,1,,1024,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12391,1552562623,5,,1023,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12390,1552562623,2,,1023,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12389,1552562623,1,,1023,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12388,1552562532,5,,1022,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12387,1552562532,2,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12386,1552562532,1,,1022,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12385,1552562387,5,,1021,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12384,1552562387,2,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12383,1552562387,1,,1021,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12382,1552562352,5,,1020,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12381,1552562352,2,,1020,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12380,1552562352,1,,1020,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12379,1552562322,5,,1019,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12378,1552562322,2,,1019,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12377,1552562322,1,,1019,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12376,1552562259,5,,1018,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12375,1552562259,2,,1018,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12374,1552562259,1,,1018,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12373,1552562223,5,,1017,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12372,1552562223,2,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12371,1552562223,1,,1017,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12369,1552562190,2,,1016,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12370,1552562190,5,,1016,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12368,1552562190,1,,1016,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12367,1552562148,5,,1015,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12366,1552562148,2,,1015,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12365,1552562148,1,,1015,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12364,1552562108,5,,1014,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12363,1552562108,2,,1014,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12362,1552562108,1,,1014,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12361,1552562031,5,,1013,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12360,1552562031,2,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12359,1552562031,1,,1013,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12358,1552560591,1,,1000,100000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12406,1552562907,5,,1028,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12407,1552562964,1,,1029,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12408,1552562964,2,,1029,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12409,1552562964,5,,1029,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12410,1552563051,1,,1030,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12411,1552563051,2,,1030,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12412,1552563051,5,,1030,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12413,1552563087,1,,1031,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12414,1552563087,2,,1031,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12415,1552563087,5,,1031,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12416,1552563147,1,,1032,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12417,1552563147,2,,1032,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12418,1552563147,5,,1032,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12419,1552563188,1,,1033,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12420,1552563188,2,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12421,1552563188,5,,1033,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12422,1552563272,1,,1034,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12423,1552563272,2,,1034,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12424,1552563272,5,,1034,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12425,1552563320,1,,1035,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12426,1552563320,2,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12427,1552563320,5,,1035,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12428,1552563353,1,,1036,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12429,1552563353,2,,1036,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12430,1552563353,5,,1036,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12431,1552563442,1,,1037,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12432,1552563442,2,,1037,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12433,1552563442,5,,1037,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12434,1552563488,1,,1038,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12435,1552563488,2,,1038,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12436,1552563488,5,,1038,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12437,1552563556,1,,1039,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12438,1552563556,2,,1039,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12439,1552563556,5,,1039,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12440,1552563638,1,,1040,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12441,1552563638,2,,1040,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12442,1552563638,5,,1040,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12443,1552563754,1,,1041,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12444,1552563754,2,,1041,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12445,1552563754,5,,1041,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12446,1552563785,1,,1042,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12447,1552563785,2,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12448,1552563785,5,,1042,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12449,1552563829,1,,1043,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12450,1552563829,2,,1043,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12451,1552563829,5,,1043,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12452,1552563863,1,,1044,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12453,1552563863,2,,1044,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12454,1552563863,5,,1044,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12455,1552563912,1,,1045,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12456,1552563912,2,,1045,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12457,1552563912,5,,1045,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12458,1552564032,1,,1046,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12459,1552564032,2,,1046,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12460,1552564032,5,,1046,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12461,1552564070,1,,1047,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12462,1552564070,2,,1047,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12463,1552564070,5,,1047,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12464,1552564160,1,,1048,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12465,1552564160,2,,1048,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12466,1552564160,5,,1048,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12467,1552564208,1,,1049,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12468,1552564208,2,,1049,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12469,1552564208,5,,1049,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12470,1552564434,1,,1050,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12471,1552564434,2,,1050,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12472,1552564434,5,,1050,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12473,1552564535,6,,1000,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (12474,1552564535,7,,1000,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (12512,1552624386,7,,1030,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12511,1552624386,6,,1030,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12510,1552622330,2,,1058,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12509,1552621655,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-500.00000000,3000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12480,1552569761,2,,1052,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12481,1552581160,6,,1021,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (12482,1552581160,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12483,1552581950,6,,1027,0.00000000,1,0.00000000,1575.79200000,525.26400000,领取红包,2101.05600000,-2101.05600000,0.00000000,);
INSERT INTO `clt_log` VALUES (12484,1552581950,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1050.52800000,1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (12485,1552582094,6,,1000,0.00000000,1,0.00000000,15.70637465,6.54432277,领取红包,22.25069742,-22.25069742,0.00000000,);
INSERT INTO `clt_log` VALUES (12486,1552582094,7,,1000,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-11.12534871,11.12534871,0.00000000,);
INSERT INTO `clt_log` VALUES (12487,1552582113,6,,1015,0.00000000,1,0.00000000,609.52800000,525.26400000,领取红包,1134.79200000,-1134.79200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12488,1552582113,7,,1015,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-567.39600000,567.39600000,0.00000000,);
INSERT INTO `clt_log` VALUES (12489,1552582116,6,,1018,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12490,1552582116,7,,1018,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12491,1552588005,6,,1036,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12492,1552588005,7,,1036,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12493,1552608606,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1000.00000000,6000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12494,1552611456,6,,1035,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12495,1552611456,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12496,1552611992,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.00000000,1572.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12497,1552613022,6,,1023,0.00000000,1,0.00000000,1155.58080000,525.26400000,领取红包,1680.84480000,-1680.84480000,0.00000000,);
INSERT INTO `clt_log` VALUES (12498,1552613022,7,,1023,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-840.42240000,840.42240000,0.00000000,);
INSERT INTO `clt_log` VALUES (12499,1552613142,2,,1053,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12500,1552613334,2,,1054,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12501,1552613695,2,,1055,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12502,1552613904,2,,1056,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12503,1552615014,7,,1023,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-840.00000000,5040.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12504,1552615301,2,,1057,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12505,1552621066,6,,1033,0.00000000,1,0.00000000,1365.68640000,525.26400000,领取红包,1890.95040000,-1890.95040000,0.00000000,);
INSERT INTO `clt_log` VALUES (12506,1552621066,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-945.47520000,945.47520000,0.00000000,);
INSERT INTO `clt_log` VALUES (12507,1552621347,6,,1042,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (12508,1552621347,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12513,1552624518,7,,1030,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.63200000,1575.79200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12514,1552626630,6,,1016,0.00000000,1,0.00000000,2626.32000000,525.26400000,领取红包,3151.58400000,-3151.58400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12515,1552626630,7,,1016,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1575.79200000,1575.79200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12516,1552626946,1,,1059,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12517,1552626946,2,,1059,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12518,1552626946,5,,1059,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12519,1552627032,2,,1060,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12520,1552627059,2,,1061,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12521,1552627116,2,,1062,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12522,1552629065,1,,1055,500.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12523,1552630045,5,,1062,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：OJ55RN激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12524,1552630130,5,,1061,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：25J14O激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12525,1552630249,5,,1053,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：OMP1HM激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12526,1552630327,2,,1063,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12527,1552630346,2,,1064,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12528,1552630444,6,,1026,0.00000000,1,0.00000000,1890.95040000,525.26400000,领取红包,2416.21440000,-2416.21440000,0.00000000,);
INSERT INTO `clt_log` VALUES (12529,1552630444,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1208.10720000,1208.10720000,0.00000000,);
INSERT INTO `clt_log` VALUES (12530,1552630499,2,,1065,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12531,1552630509,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1200.00000000,7200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12532,1552631507,1,,1063,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12533,1552631524,2,,1066,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12534,1552631537,5,,1055,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：LLJ7F5激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12535,1552631623,5,,1055,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12536,1552631664,5,,1063,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：QI4BM3激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12537,1552631674,5,,1063,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12538,1552631686,5,,1064,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：X1LED3激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12539,1552632012,2,,1067,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12540,1552632186,2,,1068,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12541,1552632349,2,,1069,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12542,1552632522,2,,1070,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12543,1552632730,2,,1071,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12544,1552633271,2,,1072,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12545,1552633383,2,,1073,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12546,1552633511,5,,1054,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：CW1NYH激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12547,1552634798,2,,1074,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12548,1552634865,1,,1061,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12549,1552635034,2,,1075,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12550,1552635819,2,,1076,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12551,1552636121,5,,1076,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：JTECO2激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12552,1552636716,6,,1034,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12553,1552636716,7,,1034,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12554,1552638202,2,,1077,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12555,1552638895,5,,1077,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：G0CBYE激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12556,1552639291,6,,1028,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12557,1552639291,7,,1028,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12558,1552639389,1,,1077,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12559,1552639455,6,,1013,0.00000000,1,0.00000000,6093.06240000,525.26400000,领取红包,6618.32640000,-6618.32640000,0.00000000,);
INSERT INTO `clt_log` VALUES (12560,1552639455,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3309.16320000,3309.16320000,0.00000000,);
INSERT INTO `clt_log` VALUES (12561,1552639540,6,,1017,0.00000000,1,0.00000000,735.36960000,525.26400000,领取红包,1260.63360000,-1260.63360000,0.00000000,);
INSERT INTO `clt_log` VALUES (12562,1552639540,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-630.31680000,630.31680000,0.00000000,);
INSERT INTO `clt_log` VALUES (12563,1552639686,7,,1028,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.00000000,1572.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12564,1552639852,6,,1024,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (12565,1552639852,7,,1024,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12566,1552640039,7,,1024,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-525.00000000,3150.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12567,1552640093,6,,1041,0.00000000,1,0.00000000,1155.58080000,525.26400000,领取红包,1680.84480000,-1680.84480000,0.00000000,);
INSERT INTO `clt_log` VALUES (12568,1552640093,7,,1041,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-840.42240000,840.42240000,0.00000000,);
INSERT INTO `clt_log` VALUES (12569,1552641007,2,,1078,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12570,1552641026,6,,1044,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12571,1552641026,7,,1044,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12572,1552641176,7,,1041,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-800.00000000,4800.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12573,1552641339,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-630.00000000,3780.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12574,1552641394,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-525.00000000,3150.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12575,1552641500,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-3309.00000000,19854.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12576,1552641619,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-945.00000000,5670.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12577,1552643623,2,,1079,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12578,1552647291,2,,1080,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12579,1552648943,5,,1058,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：O0E5BE激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12580,1552649870,1,,1081,5600.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12581,1552649870,2,,1081,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12582,1552649870,5,,1081,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12583,1552650001,1,,1082,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12584,1552650001,2,,1082,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12585,1552650001,5,,1082,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12586,1552650069,1,,1083,5100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12587,1552650069,2,,1083,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12588,1552650069,5,,1083,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12589,1552650115,1,,1084,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12590,1552650115,2,,1084,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12591,1552650115,5,,1084,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12592,1552650168,1,,1085,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12593,1552650168,2,,1085,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12594,1552650168,5,,1085,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12595,1552650214,1,,1086,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12596,1552650214,2,,1086,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12597,1552650214,5,,1086,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12598,1552650300,1,,1087,3000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12599,1552650300,2,,1087,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12600,1552650300,5,,1087,-3000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V4,0.00000000,94500.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12601,1552650820,1,,1088,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12602,1552650820,2,,1088,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12603,1552650820,5,,1088,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12604,1552650861,1,,1089,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12605,1552650861,2,,1089,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12606,1552650861,5,,1089,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12607,1552650903,1,,1090,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12608,1552650903,2,,1090,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12609,1552650903,5,,1090,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12610,1552650941,1,,1091,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12611,1552650941,2,,1091,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12612,1552650941,5,,1091,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12613,1552650976,1,,1092,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12614,1552650976,2,,1092,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12615,1552650976,5,,1092,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12616,1552651024,1,,1093,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12617,1552651024,2,,1093,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12618,1552651024,5,,1093,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12619,1552651071,1,,1094,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12620,1552651071,2,,1094,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12621,1552651071,5,,1094,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12622,1552651127,1,,1095,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12623,1552651127,2,,1095,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12624,1552651127,5,,1095,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12625,1552651169,1,,1096,500.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12626,1552651169,2,,1096,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12627,1552651169,5,,1096,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12628,1552651215,1,,1097,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12629,1552651215,2,,1097,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12630,1552651215,5,,1097,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12631,1552651334,1,,1098,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12632,1552651334,2,,1098,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12633,1552651334,5,,1098,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12634,1552651369,1,,1099,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12635,1552651369,2,,1099,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12636,1552651369,5,,1099,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12637,1552651420,1,,1100,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12638,1552651420,2,,1100,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12639,1552651420,5,,1100,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12640,1552651468,1,,1101,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12641,1552651468,2,,1101,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12642,1552651468,5,,1101,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12643,1552651510,1,,1102,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12644,1552651510,2,,1102,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12645,1552651510,5,,1102,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12646,1552651561,1,,1103,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12647,1552651561,2,,1103,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12648,1552651561,5,,1103,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12649,1552651599,1,,1104,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12650,1552651599,2,,1104,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12651,1552651599,5,,1104,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12652,1552651641,1,,1105,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12653,1552651641,2,,1105,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12654,1552651641,5,,1105,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12655,1552651676,1,,1106,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12656,1552651676,2,,1106,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12657,1552651676,5,,1106,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12658,1552651703,1,,1107,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12659,1552651703,2,,1107,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12660,1552651703,5,,1107,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12661,1552651782,1,,1108,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12662,1552651782,2,,1108,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12663,1552651782,5,,1108,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12664,1552651821,1,,1109,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12665,1552651821,2,,1109,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12666,1552651821,5,,1109,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12667,1552651858,1,,1110,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12668,1552651858,2,,1110,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12669,1552651858,5,,1110,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12670,1552651912,1,,1111,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12671,1552651912,2,,1111,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12672,1552651912,5,,1111,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12673,1552652011,1,,1112,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12674,1552652011,2,,1112,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12675,1552652011,5,,1112,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12676,1552652056,1,,1113,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12677,1552652056,2,,1113,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12678,1552652056,5,,1113,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12679,1552652098,1,,1114,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12680,1552652098,2,,1114,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12681,1552652098,5,,1114,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12682,1552652137,1,,1115,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12683,1552652137,2,,1115,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12684,1552652137,5,,1115,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12685,1552653578,6,,1022,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12686,1552653578,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12687,1552653626,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-260.00000000,1560.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12688,1552653892,6,,1029,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12689,1552653892,7,,1029,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12690,1552653915,7,,1029,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-260.00000000,1560.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12691,1552653976,6,,1045,0.00000000,1,0.00000000,2101.05600000,525.26400000,领取红包,2626.32000000,-2626.32000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12692,1552653976,7,,1045,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1313.16000000,1313.16000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12693,1552654848,6,,1043,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (12694,1552654848,7,,1043,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12695,1552655231,2,,1116,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12696,1552655496,6,,1046,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12697,1552655496,7,,1046,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12698,1552655771,6,,1049,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (12699,1552655771,7,,1049,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (12700,1552656070,1,,1117,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12701,1552656070,2,,1117,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12702,1552656070,5,,1117,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12703,1552656111,1,,1118,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12704,1552656111,2,,1118,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12705,1552656111,5,,1118,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12706,1552656148,1,,1119,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12707,1552656148,2,,1119,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12708,1552656148,5,,1119,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12709,1552656196,1,,1120,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12710,1552656196,2,,1120,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12711,1552656196,5,,1120,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12712,1552656243,1,,1121,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12713,1552656243,2,,1121,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12714,1552656243,5,,1121,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12715,1552656329,1,,1122,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12716,1552656329,2,,1122,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12717,1552656329,5,,1122,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12718,1552656384,1,,1123,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12719,1552656384,2,,1123,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12720,1552656384,5,,1123,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12721,1552656446,1,,1124,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12722,1552656446,2,,1124,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12723,1552656446,5,,1124,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12724,1552656501,1,,1125,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12725,1552656501,2,,1125,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12726,1552656501,5,,1125,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12727,1552656548,1,,1126,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12728,1552656548,2,,1126,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12729,1552656548,5,,1126,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12730,1552656647,1,,1127,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12731,1552656648,2,,1127,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12732,1552656648,5,,1127,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12733,1552656698,1,,1128,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12734,1552656698,2,,1128,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12735,1552656698,5,,1128,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12736,1552656751,1,,1129,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12737,1552656751,2,,1129,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12738,1552656751,5,,1129,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12739,1552656807,1,,1130,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12740,1552656807,2,,1130,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12741,1552656807,5,,1130,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12742,1552656843,1,,1131,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12743,1552656843,2,,1131,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12744,1552656843,5,,1131,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12745,1552656887,1,,1132,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12746,1552656887,2,,1132,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12747,1552656887,5,,1132,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12748,1552656925,1,,1133,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12749,1552656925,2,,1133,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12750,1552656925,5,,1133,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12751,1552656954,1,,1134,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12752,1552656955,2,,1134,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12753,1552656955,5,,1134,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12754,1552656988,1,,1135,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12755,1552656988,2,,1135,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12756,1552656988,5,,1135,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12757,1552657012,5,,1077,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12758,1552657022,1,,1136,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12759,1552657022,2,,1136,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12760,1552657022,5,,1136,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12761,1552657052,1,,1137,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12762,1552657052,2,,1137,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12763,1552657052,5,,1137,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12764,1552657397,1,,1138,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12765,1552657397,2,,1138,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12766,1552657397,5,,1138,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12767,1552657450,1,,1139,2057.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12768,1552657450,2,,1139,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12769,1552657489,1,,1140,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12770,1552657489,2,,1140,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12771,1552657489,5,,1140,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12772,1552657537,1,,1141,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12773,1552657537,2,,1141,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12774,1552657537,5,,1141,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12775,1552657629,1,,1142,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12776,1552657629,2,,1142,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14201,1552841821,5,,1423,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14200,1552841821,2,,1423,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14199,1552841821,1,,1423,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12780,1552657729,1,,1144,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12781,1552657729,2,,1144,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12782,1552657729,5,,1144,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12783,1552657754,1,,1145,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12784,1552657754,2,,1145,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12785,1552657754,5,,1145,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12786,1552657781,1,,1146,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12787,1552657781,2,,1146,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12788,1552657781,5,,1146,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12789,1552657838,1,,1147,1414.28571428,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12790,1552657838,2,,1147,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12791,1552657891,1,,1148,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12792,1552657891,2,,1148,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12793,1552657891,5,,1148,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12794,1552657997,1,,1149,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12795,1552657997,2,,1149,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12796,1552657997,5,,1149,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12797,1552658066,1,,1150,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12798,1552658066,2,,1150,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12799,1552658066,5,,1150,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12800,1552658124,1,,1151,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12801,1552658124,2,,1151,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12802,1552658124,5,,1151,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12803,1552658209,1,,1152,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12804,1552658210,2,,1152,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12805,1552658210,5,,1152,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12806,1552658283,1,,1153,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12807,1552658283,2,,1153,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12811,1552658396,2,,1155,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12810,1552658396,1,,1155,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12812,1552658433,1,,1156,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12813,1552658433,2,,1156,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12814,1552658455,1,,1157,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12815,1552658455,2,,1157,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12816,1552658455,5,,1157,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12817,1552658474,1,,1158,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12818,1552658474,2,,1158,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12819,1552658474,5,,1158,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12820,1552658493,1,,1159,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12821,1552658493,2,,1159,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12822,1552658493,5,,1159,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12823,1552658601,1,,1160,1400.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12824,1552658601,2,,1160,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14226,1552842930,6,,1228,0.00000000,1,0.00000000,0.00000000,43.31400000,领取红包,43.31400000,-43.31400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14225,1552842757,5,,1430,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12827,1552658738,1,,1162,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12828,1552658738,2,,1162,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12829,1552658738,5,,1162,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14216,1552842253,5,,1427,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14215,1552842253,2,,1427,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14214,1552842253,1,,1427,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14213,1552842194,5,,1426,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14212,1552842194,2,,1426,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14211,1552842194,1,,1426,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12836,1552658913,1,,1165,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12837,1552658913,2,,1165,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12838,1552658913,5,,1165,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12839,1552658935,1,,1166,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12840,1552658935,2,,1166,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12841,1552658935,5,,1166,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12842,1552659003,1,,1167,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12843,1552659003,2,,1167,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12844,1552659036,1,,1168,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12845,1552659036,2,,1168,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12846,1552659036,5,,1168,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12847,1552659054,1,,1169,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12848,1552659054,2,,1169,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12849,1552659054,5,,1169,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12850,1552659073,1,,1170,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12851,1552659073,2,,1170,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12852,1552659073,5,,1170,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12853,1552659106,1,,1171,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12854,1552659106,2,,1171,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12855,1552659128,1,,1172,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12856,1552659128,2,,1172,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12857,1552659128,5,,1172,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12858,1552659146,1,,1173,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12859,1552659146,2,,1173,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12860,1552659146,5,,1173,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12861,1552659188,1,,1174,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12862,1552659188,2,,1174,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12863,1552659188,5,,1174,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12864,1552659334,1,,1175,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12865,1552659334,2,,1175,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12866,1552659334,5,,1175,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12867,1552659386,1,,1176,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12868,1552659386,2,,1176,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12869,1552659438,1,,1147,300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12870,1552659553,1,,1177,1600.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12871,1552659553,2,,1177,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12872,1552659592,1,,1178,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12873,1552659592,2,,1178,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12874,1552659612,1,,1179,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12875,1552659612,2,,1179,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12876,1552659612,5,,1179,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12877,1552659740,1,,1180,4157.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12878,1552659740,2,,1180,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12879,1552659787,1,,1181,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12880,1552659787,2,,1181,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12881,1552659841,1,,1182,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12882,1552659841,2,,1182,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12883,1552659841,5,,1182,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12884,1552659923,1,,1183,5100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12885,1552659923,2,,1183,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12886,1552659923,5,,1183,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12887,1552659980,1,,1184,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12888,1552659980,2,,1184,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12889,1552659980,5,,1184,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12890,1552660013,1,,1185,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12891,1552660013,2,,1185,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12892,1552660013,5,,1185,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12893,1552660118,1,,1186,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12894,1552660118,2,,1186,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12895,1552660141,5,,1061,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12896,1552660169,1,,1187,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12897,1552660169,2,,1187,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12898,1552660169,5,,1187,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12899,1552662757,1,,1188,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12900,1552662757,2,,1188,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12901,1552662757,5,,1188,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12902,1552662952,1,,1189,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12903,1552662952,2,,1189,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12904,1552662952,5,,1189,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12905,1552662980,1,,1190,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12906,1552662980,2,,1190,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12907,1552662980,5,,1190,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12908,1552663012,1,,1191,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12909,1552663012,2,,1191,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12910,1552663049,1,,1192,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12911,1552663049,2,,1192,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12912,1552663049,5,,1192,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12913,1552663076,1,,1193,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12914,1552663076,2,,1193,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12915,1552663076,5,,1193,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12916,1552663121,1,,1194,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12917,1552663121,2,,1194,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12918,1552663121,5,,1194,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12919,1552663219,1,,1195,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12920,1552663219,2,,1195,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12921,1552663219,5,,1195,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12922,1552663278,1,,1196,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12923,1552663278,2,,1196,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12924,1552663278,5,,1196,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12925,1552663342,1,,1197,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12926,1552663342,2,,1197,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12927,1552663342,5,,1197,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14234,1552845722,6,,1279,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14233,1552845278,7,,1187,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-45.34095600,45.34095600,0.00000000,);
INSERT INTO `clt_log` VALUES (14227,1552842930,7,,1228,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-21.65700000,21.65700000,0.00000000,);
INSERT INTO `clt_log` VALUES (14228,1552843160,6,,1029,0.00000000,1,0.00000000,0.00000000,527.56863569,领取红包,527.56863569,-527.56863569,0.00000000,);
INSERT INTO `clt_log` VALUES (14229,1552843160,7,,1029,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-263.78431785,263.78431785,0.00000000,);
INSERT INTO `clt_log` VALUES (14230,1552843648,6,,1147,0.00000000,1,0.00000000,0.00000000,84.13760400,领取红包,84.13760400,-84.13760400,0.00000000,);
INSERT INTO `clt_log` VALUES (14231,1552843648,7,,1147,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.06880200,42.06880200,0.00000000,);
INSERT INTO `clt_log` VALUES (14232,1552845278,6,,1187,0.00000000,1,0.00000000,6.55415400,84.12775800,领取红包,90.68191200,-90.68191200,0.00000000,);
INSERT INTO `clt_log` VALUES (12937,1552663528,1,,1201,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12938,1552663528,2,,1201,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12939,1552663528,5,,1201,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12940,1552663553,1,,1202,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12941,1552663553,2,,1202,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12942,1552663553,5,,1202,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12943,1552663659,2,,1203,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12944,1552663684,1,,1204,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12945,1552663684,2,,1204,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12946,1552663684,5,,1204,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12947,1552663708,1,,1205,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12948,1552663708,2,,1205,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12949,1552663708,5,,1205,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12950,1552663727,1,,1206,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12951,1552663727,2,,1206,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12952,1552663727,5,,1206,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12953,1552663775,1,,1207,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12954,1552663775,2,,1207,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12955,1552663775,5,,1207,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12956,1552663792,1,,1208,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12957,1552663792,2,,1208,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12958,1552663792,5,,1208,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12959,1552663817,1,,1209,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12960,1552663817,2,,1209,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12961,1552663873,1,,1210,557.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12962,1552663873,2,,1210,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12963,1552663901,1,,1211,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12964,1552663901,2,,1211,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12965,1552663935,1,,1212,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12966,1552663935,2,,1212,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12967,1552663935,5,,1212,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12968,1552663960,1,,1213,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12969,1552663960,2,,1213,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12970,1552663987,1,,1214,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12971,1552663987,2,,1214,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12972,1552664016,1,,1215,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12973,1552664016,2,,1215,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12974,1552664016,5,,1215,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12975,1552664060,1,,1216,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12976,1552664060,2,,1216,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12977,1552664100,1,,1217,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12978,1552664100,2,,1217,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12979,1552664100,5,,1217,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12980,1552664135,1,,1218,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12981,1552664135,2,,1218,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12982,1552664135,5,,1218,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12983,1552664158,1,,1219,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12984,1552664158,2,,1219,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12985,1552664158,5,,1219,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12986,1552664197,1,,1220,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12987,1552664197,2,,1220,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12988,1552664228,1,,1221,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12989,1552664228,2,,1221,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12990,1552664228,5,,1221,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12991,1552664290,1,,1222,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12992,1552664290,2,,1222,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12993,1552664311,1,,1223,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12994,1552664311,2,,1223,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12995,1552664311,5,,1223,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12996,1552664364,1,,1224,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12997,1552664364,2,,1224,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12998,1552664364,5,,1224,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (12999,1552664513,1,,1225,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13000,1552664513,2,,1225,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13001,1552664559,1,,1226,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13002,1552664559,2,,1226,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13003,1552664595,1,,1227,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13004,1552664595,2,,1227,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13005,1552664617,1,,1228,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13006,1552664617,2,,1228,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13007,1552664642,1,,1229,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13008,1552664642,2,,1229,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13009,1552664642,5,,1229,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13010,1552664669,1,,1230,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13011,1552664669,2,,1230,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13012,1552664708,1,,1231,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13013,1552664708,2,,1231,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13014,1552664749,1,,1232,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13015,1552664749,2,,1232,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13016,1552664783,1,,1233,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13017,1552664783,2,,1233,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13018,1552664783,5,,1233,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13019,1552664800,1,,1234,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13020,1552664800,2,,1234,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13021,1552664800,5,,1234,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13022,1552664828,1,,1235,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13023,1552664828,2,,1235,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13024,1552664828,5,,1235,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13025,1552664898,1,,1236,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13026,1552664898,2,,1236,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13027,1552664898,5,,1236,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13028,1552664932,1,,1237,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13029,1552664932,2,,1237,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13030,1552664932,5,,1237,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13031,1552664988,1,,1238,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13032,1552664988,2,,1238,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13033,1552664988,5,,1238,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13034,1552665008,1,,1239,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13035,1552665008,2,,1239,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13036,1552665008,5,,1239,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13037,1552665026,1,,1240,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13038,1552665026,2,,1240,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13039,1552665026,5,,1240,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13050,1552665265,2,,1244,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13046,1552665244,1,,1243,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13047,1552665244,2,,1243,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13048,1552665244,5,,1243,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13049,1552665265,1,,1244,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13051,1552665265,5,,1244,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13052,1552665291,1,,1245,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13053,1552665291,2,,1245,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13054,1552665291,5,,1245,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13055,1552665318,1,,1246,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13056,1552665319,2,,1246,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13057,1552665319,5,,1246,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13058,1552665343,1,,1247,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13059,1552665343,2,,1247,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13060,1552665343,5,,1247,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13061,1552665362,1,,1248,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13062,1552665362,2,,1248,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13063,1552665362,5,,1248,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13064,1552665378,1,,1249,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13065,1552665378,2,,1249,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13066,1552665378,5,,1249,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13067,1552665398,1,,1250,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13068,1552665398,2,,1250,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13069,1552665398,5,,1250,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13070,1552665417,1,,1251,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13071,1552665417,2,,1251,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13072,1552665417,5,,1251,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13073,1552665443,1,,1252,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13074,1552665443,2,,1252,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13075,1552665443,5,,1252,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13076,1552665462,1,,1253,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13077,1552665462,2,,1253,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13078,1552665462,5,,1253,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13079,1552665503,1,,1254,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13080,1552665503,2,,1254,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13081,1552665503,5,,1254,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13082,1552665612,6,,1035,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13083,1552665612,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13084,1552665613,6,,1033,0.00000000,1,0.00000000,1365.68640000,525.26400000,领取红包,1890.95040000,-1890.95040000,0.00000000,);
INSERT INTO `clt_log` VALUES (13085,1552665613,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-945.47520000,945.47520000,0.00000000,);
INSERT INTO `clt_log` VALUES (13086,1552665754,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-945.00000000,5670.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13087,1552665824,1,,1255,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13088,1552665824,2,,1255,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13089,1552665824,5,,1255,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13090,1552665947,1,,1256,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13091,1552665947,2,,1256,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13092,1552665947,5,,1256,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13098,1552666076,2,,1258,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13097,1552666076,1,,1258,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13095,1552666031,6,,1041,0.00000000,1,0.00000000,1155.58080000,525.26400000,领取红包,1680.84480000,-1680.84480000,0.00000000,);
INSERT INTO `clt_log` VALUES (13096,1552666031,7,,1041,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-840.42240000,840.42240000,0.00000000,);
INSERT INTO `clt_log` VALUES (13099,1552666111,1,,1259,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13100,1552666111,2,,1259,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13101,1552666125,6,,1042,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13102,1552666125,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13103,1552666161,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-525.00000000,3150.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13104,1552666273,1,,1260,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13105,1552666273,2,,1260,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13106,1552666273,5,,1260,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13107,1552666302,1,,1261,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13108,1552666302,2,,1261,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13109,1552666302,5,,1261,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13110,1552666342,1,,1262,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13111,1552666342,2,,1262,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13112,1552666342,5,,1262,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13113,1552666385,1,,1263,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13114,1552666385,2,,1263,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13115,1552666385,5,,1263,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13116,1552666425,1,,1264,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13117,1552666425,2,,1264,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13118,1552666485,1,,1265,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13119,1552666485,2,,1265,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13120,1552666517,6,,1016,0.00000000,1,0.00000000,2626.32000000,525.26400000,领取红包,3151.58400000,-3151.58400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13121,1552666517,7,,1016,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1575.79200000,1575.79200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13122,1552666540,1,,1266,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13123,1552666540,2,,1266,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13124,1552666566,1,,1267,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13125,1552666566,2,,1267,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13126,1552666598,1,,1268,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13127,1552666598,2,,1268,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13128,1552666642,1,,1269,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13129,1552666642,2,,1269,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13130,1552666642,5,,1269,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13131,1552666667,1,,1270,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13132,1552666667,2,,1270,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13133,1552666667,5,,1270,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13134,1552666728,1,,1271,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13135,1552666728,2,,1271,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13136,1552666728,5,,1271,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13137,1552666957,1,,1272,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13138,1552666957,2,,1272,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13139,1552667044,1,,1273,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13140,1552667044,2,,1273,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13141,1552667147,1,,1274,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13142,1552667147,2,,1274,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13143,1552667333,1,,1273,300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13144,1552667416,1,,1275,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13145,1552667416,2,,1275,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13146,1552667416,5,,1275,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13147,1552667485,1,,1276,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13148,1552667485,2,,1276,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13149,1552667485,5,,1276,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13150,1552667547,1,,1277,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13151,1552667547,2,,1277,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13152,1552667547,5,,1277,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13153,1552667567,1,,1278,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13154,1552667567,2,,1278,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13155,1552667567,5,,1278,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13156,1552667587,1,,1279,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13157,1552667587,2,,1279,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13158,1552667587,5,,1279,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13159,1552667670,1,,1280,1714.28571428,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13160,1552667670,2,,1280,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13161,1552667808,1,,1281,257.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13162,1552667808,2,,1281,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13163,1552667892,1,,1282,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13164,1552667892,2,,1282,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13165,1552667892,5,,1282,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13166,1552667948,6,,1036,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (13167,1552667948,7,,1036,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (13168,1552667968,1,,1283,857.14285714,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13169,1552667968,2,,1283,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13170,1552668078,1,,1284,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13171,1552668078,2,,1284,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13172,1552668078,5,,1284,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13173,1552668099,1,,1285,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13174,1552668099,2,,1285,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13175,1552668099,5,,1285,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13176,1552668153,1,,1286,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13177,1552668153,2,,1286,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13178,1552668153,5,,1286,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13179,1552668201,1,,1287,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13180,1552668201,2,,1287,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13181,1552668201,5,,1287,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13182,1552668541,1,,1288,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13183,1552668541,2,,1288,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13184,1552668541,5,,1288,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13185,1552668566,1,,1289,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13186,1552668566,2,,1289,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13187,1552668566,5,,1289,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13188,1552668585,1,,1290,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13189,1552668585,2,,1290,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13190,1552668585,5,,1290,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13191,1552668591,6,,1018,0.00000000,1,0.00000000,1909.17833280,524.47610400,领取红包,2433.65443680,-2433.65443680,0.00000000,);
INSERT INTO `clt_log` VALUES (13192,1552668591,7,,1018,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1216.82721840,1216.82721840,0.00000000,);
INSERT INTO `clt_log` VALUES (13193,1552668609,1,,1291,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13194,1552668609,2,,1291,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13195,1552668609,5,,1291,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13196,1552668630,1,,1292,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13197,1552668630,2,,1292,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13198,1552668630,5,,1292,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13199,1552668689,1,,1293,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13200,1552668689,2,,1293,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13201,1552668689,5,,1293,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13202,1552668728,1,,1294,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13203,1552668728,2,,1294,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13204,1552668728,5,,1294,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13205,1552668757,1,,1295,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13206,1552668757,2,,1295,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13207,1552668757,5,,1295,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14204,1552841916,5,,1424,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14203,1552841916,2,,1424,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14202,1552841916,1,,1424,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13211,1552668835,1,,1297,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13212,1552668835,2,,1297,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13213,1552668835,5,,1297,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13214,1552668882,1,,1298,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13215,1552668882,2,,1298,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13216,1552668882,5,,1298,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13217,1552668924,1,,1299,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13218,1552668924,2,,1299,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13219,1552668924,5,,1299,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13220,1552668950,1,,1300,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13221,1552668950,2,,1300,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13222,1552668950,5,,1300,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13223,1552669007,1,,1301,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13224,1552669007,2,,1301,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13225,1552669035,1,,1302,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13226,1552669035,2,,1302,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13227,1552669035,5,,1302,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13228,1552669070,1,,1303,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13229,1552669070,2,,1303,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13230,1552669070,5,,1303,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13231,1552669093,1,,1304,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13232,1552669093,2,,1304,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13233,1552669093,5,,1304,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13234,1552669131,1,,1305,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13235,1552669131,2,,1305,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13236,1552669131,5,,1305,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13237,1552669152,1,,1306,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13238,1552669152,2,,1306,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13239,1552669152,5,,1306,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13240,1552669176,1,,1307,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13241,1552669176,2,,1307,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13242,1552669176,5,,1307,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13243,1552669211,1,,1308,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13244,1552669211,2,,1308,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13245,1552669211,5,,1308,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13246,1552669234,1,,1309,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13247,1552669234,2,,1309,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13248,1552669234,5,,1309,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13249,1552669270,1,,1310,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13250,1552669270,2,,1310,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13251,1552669270,5,,1310,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13252,1552669293,1,,1311,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13253,1552669293,2,,1311,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13254,1552669293,5,,1311,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13255,1552669319,1,,1312,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13256,1552669319,2,,1312,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13257,1552669319,5,,1312,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13258,1552669356,1,,1313,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13259,1552669356,2,,1313,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13260,1552669356,5,,1313,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13261,1552669451,1,,1314,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13262,1552669451,2,,1314,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13263,1552669451,5,,1314,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13264,1552669488,1,,1315,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13265,1552669488,2,,1315,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13266,1552669488,5,,1315,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13267,1552669523,1,,1316,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13268,1552669523,2,,1316,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13269,1552669523,5,,1316,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13270,1552669568,1,,1317,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13271,1552669568,2,,1317,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13272,1552669568,5,,1317,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13273,1552669621,1,,1318,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13274,1552669621,2,,1318,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13275,1552669621,5,,1318,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13276,1552669656,1,,1319,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13277,1552669656,2,,1319,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13278,1552669656,5,,1319,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13279,1552669700,1,,1320,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13280,1552669700,2,,1320,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13281,1552669700,5,,1320,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13289,1552669915,1,,1324,3000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13288,1552669885,5,,1323,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13286,1552669885,1,,1323,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13287,1552669885,2,,1323,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13290,1552669915,2,,1324,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13291,1552669915,5,,1324,-3000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V4,0.00000000,94500.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13292,1552670090,1,,1325,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13293,1552670090,2,,1325,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13294,1552670090,5,,1325,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13295,1552670193,1,,1326,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13296,1552670193,2,,1326,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13297,1552670193,5,,1326,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13298,1552670224,1,,1327,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13299,1552670224,2,,1327,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13300,1552670224,5,,1327,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13301,1552670253,1,,1328,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13302,1552670253,2,,1328,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13303,1552670253,5,,1328,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13304,1552670279,1,,1329,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13305,1552670279,2,,1329,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13306,1552670279,5,,1329,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13307,1552670295,6,,1022,0.00000000,1,0.00000000,13.12800000,529.15610400,领取红包,542.28410400,-542.28410400,0.00000000,);
INSERT INTO `clt_log` VALUES (13308,1552670295,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-271.14205200,271.14205200,0.00000000,);
INSERT INTO `clt_log` VALUES (13309,1552670327,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-273.00000000,1638.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13310,1552670586,6,,1017,0.00000000,1,0.00000000,2676.02576064,534.71304960,领取红包,3210.73881024,-3210.73881024,0.00000000,);
INSERT INTO `clt_log` VALUES (13311,1552670586,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1605.36940512,1605.36940512,0.00000000,);
INSERT INTO `clt_log` VALUES (13312,1552670614,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1605.00000000,9630.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13313,1552670692,6,,1040,0.00000000,1,0.00000000,131.09760000,525.26400000,领取红包,656.36160000,-656.36160000,0.00000000,);
INSERT INTO `clt_log` VALUES (13314,1552670692,7,,1040,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-328.18080000,328.18080000,0.00000000,);
INSERT INTO `clt_log` VALUES (13315,1552670934,7,,1040,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-300.00000000,1800.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13316,1552671069,6,,1021,0.00000000,1,0.00000000,1484.96987040,532.68820800,领取红包,2017.65807840,-2017.65807840,0.00000000,);
INSERT INTO `clt_log` VALUES (13317,1552671069,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1008.82903920,1008.82903920,0.00000000,);
INSERT INTO `clt_log` VALUES (13318,1552671421,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1000.00000000,6000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13319,1552672311,1,,1330,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13320,1552672311,2,,1330,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13321,1552672311,5,,1330,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13322,1552672389,1,,1331,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13323,1552672389,2,,1331,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13324,1552672389,5,,1331,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13325,1552672426,1,,1332,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13326,1552672426,2,,1332,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13327,1552672426,5,,1332,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13328,1552672465,1,,1333,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13329,1552672465,2,,1333,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13330,1552672465,5,,1333,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13331,1552672511,1,,1334,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13332,1552672511,2,,1334,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13333,1552672511,5,,1334,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13334,1552672537,1,,1335,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13335,1552672537,2,,1335,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13336,1552672537,5,,1335,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13337,1552672571,1,,1336,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13338,1552672571,2,,1336,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13339,1552672571,5,,1336,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13340,1552672598,1,,1337,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13341,1552672598,2,,1337,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13342,1552672598,5,,1337,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13343,1552672627,1,,1338,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13344,1552672627,2,,1338,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13345,1552672627,5,,1338,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13346,1552672657,1,,1339,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13347,1552672657,2,,1339,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13348,1552672657,5,,1339,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13349,1552672714,1,,1340,1300.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13350,1552672714,2,,1340,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13351,1552672746,1,,1341,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13352,1552672746,2,,1341,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13353,1552672746,5,,1341,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13354,1552672773,1,,1342,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13355,1552672773,2,,1342,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13356,1552672773,5,,1342,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13357,1552672796,1,,1343,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13358,1552672796,2,,1343,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13359,1552672796,5,,1343,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13360,1552672824,1,,1344,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13361,1552672824,2,,1344,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13362,1552672824,5,,1344,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13363,1552672849,1,,1345,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13364,1552672849,2,,1345,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13365,1552672849,5,,1345,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13366,1552672877,1,,1346,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13367,1552672877,2,,1346,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13368,1552672877,5,,1346,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13369,1552672942,1,,1347,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13370,1552672942,2,,1347,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13371,1552672942,5,,1347,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13372,1552672977,1,,1348,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13373,1552672977,2,,1348,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13374,1552672977,5,,1348,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13375,1552673012,1,,1349,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13376,1552673012,2,,1349,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13377,1552673012,5,,1349,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13378,1552673045,1,,1350,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13379,1552673045,2,,1350,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13380,1552673045,5,,1350,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13381,1552673080,1,,1351,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13382,1552673080,2,,1351,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13383,1552673080,5,,1351,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13384,1552673115,1,,1352,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13385,1552673115,2,,1352,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13386,1552673115,5,,1352,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13387,1552673233,1,,1353,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13388,1552673233,2,,1353,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13389,1552673233,5,,1353,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13390,1552673330,1,,1354,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13391,1552673330,2,,1354,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13392,1552673330,5,,1354,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13393,1552673354,1,,1355,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13394,1552673354,2,,1355,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13395,1552673354,5,,1355,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13396,1552676875,6,,1055,0.00000000,1,0.00000000,0.00000000,37.01400000,领取红包,37.01400000,-37.01400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13397,1552676875,7,,1055,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.50700000,18.50700000,0.00000000,);
INSERT INTO `clt_log` VALUES (13398,1552687977,6,,1034,0.00000000,1,0.00000000,7.87680000,524.47610400,领取红包,532.35290400,-532.35290400,0.00000000,);
INSERT INTO `clt_log` VALUES (13399,1552687977,7,,1034,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-266.17645200,266.17645200,0.00000000,);
INSERT INTO `clt_log` VALUES (13400,1552691505,6,,1077,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13401,1552691505,7,,1077,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13402,1552691836,6,,1059,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13403,1552691836,7,,1059,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13404,1552697712,6,,1061,0.00000000,1,0.00000000,6.56400000,6.56400000,领取红包,13.12800000,-13.12800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13405,1552697712,7,,1061,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-6.56400000,6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13406,1552699497,6,,1044,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (13407,1552699497,7,,1044,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (13408,1552699541,6,,1027,0.00000000,1,0.00000000,1587.55168800,540.11241600,领取红包,2127.66410400,-2127.66410400,0.00000000,);
INSERT INTO `clt_log` VALUES (13409,1552699541,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1063.83205200,1063.83205200,0.00000000,);
INSERT INTO `clt_log` VALUES (13410,1552699665,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1000.00000000,6000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13411,1552699839,6,,1026,0.00000000,1,0.00000000,1908.15075360,543.23967840,领取红包,2451.39043200,-2451.39043200,0.00000000,);
INSERT INTO `clt_log` VALUES (13412,1552699839,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1225.69521600,1225.69521600,0.00000000,);
INSERT INTO `clt_log` VALUES (13413,1552700034,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1200.00000000,7200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13414,1552700153,6,,1063,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13415,1552700153,7,,1063,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13416,1552700350,6,,1028,0.00000000,1,0.00000000,0.00000000,529.19210400,领取红包,529.19210400,-529.19210400,0.00000000,);
INSERT INTO `clt_log` VALUES (13417,1552700350,7,,1028,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.59605200,264.59605200,0.00000000,);
INSERT INTO `clt_log` VALUES (13418,1552700455,7,,1028,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-265.00000000,1590.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13419,1552700572,6,,1023,0.00000000,1,0.00000000,1165.97475456,537.86273280,领取红包,1703.83748736,-1703.83748736,0.00000000,);
INSERT INTO `clt_log` VALUES (13420,1552700572,7,,1023,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-851.91874368,851.91874368,0.00000000,);
INSERT INTO `clt_log` VALUES (13421,1552700633,7,,1023,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-852.00000000,5112.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13422,1552704774,2,,1356,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13423,1552704819,7,,1059,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-200.00000000,1200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13424,1552705228,2,,1357,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13425,1552705477,2,,1358,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13426,1552705728,9,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证转XMT通证,-100.00000000,0.00000000,33.33333333,);
INSERT INTO `clt_log` VALUES (13427,1552705876,6,,1261,0.00000000,1,0.00000000,84.26400000,84.26400000,领取红包,168.52800000,-168.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13428,1552705876,7,,1261,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-84.26400000,84.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13429,1552706246,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-100.00000000,600.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13430,1552706548,6,,1262,0.00000000,1,0.00000000,0.00000000,84.26400000,领取红包,84.26400000,-84.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13431,1552706548,7,,1262,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.13200000,42.13200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13432,1552706689,6,,1024,0.00000000,1,0.00000000,533.13820800,533.13820800,领取红包,1066.27641600,-1066.27641600,0.00000000,);
INSERT INTO `clt_log` VALUES (13433,1552706689,7,,1024,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-533.13820800,533.13820800,0.00000000,);
INSERT INTO `clt_log` VALUES (13434,1552706727,7,,1024,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-533.40000000,3200.40000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13435,1552707637,2,,1359,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13436,1552708353,2,,1360,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13437,1552708864,2,,1361,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13438,1552709091,1,,1359,500.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13439,1552709316,2,,1362,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13440,1552709572,2,,1363,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13444,1552709867,2,,1365,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13443,1552709867,1,,1365,500.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13445,1552709867,5,,1365,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13446,1552711007,2,,1366,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13447,1552711552,2,,1367,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13448,1552712490,6,,1174,0.00000000,1,0.00000000,28.66800000,525.26400000,领取红包,553.93200000,-553.93200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13449,1552712490,7,,1174,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-276.96600000,276.96600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13450,1552712634,6,,1013,0.00000000,1,0.00000000,7707.39175008,574.89851040,领取红包,8282.29026048,-8282.29026048,0.00000000,);
INSERT INTO `clt_log` VALUES (13451,1552712634,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-4141.14513024,4141.14513024,0.00000000,);
INSERT INTO `clt_log` VALUES (13452,1552713146,6,,1086,0.00000000,1,0.00000000,35.44560000,525.26400000,领取红包,560.70960000,-560.70960000,0.00000000,);
INSERT INTO `clt_log` VALUES (13453,1552713146,7,,1086,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-280.35480000,280.35480000,0.00000000,);
INSERT INTO `clt_log` VALUES (13454,1552713632,6,,1110,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13455,1552713632,7,,1110,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13456,1552713670,10,,1147,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13457,1552713701,10,,1147,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13458,1552713804,6,,1115,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13459,1552713804,7,,1115,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13460,1552713808,5,,1147,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：2FKJLS激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13461,1552713926,2,,1368,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13462,1552713964,6,,1140,0.00000000,1,0.00000000,45.94800000,525.26400000,领取红包,571.21200000,-571.21200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13463,1552713964,7,,1140,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-285.60600000,285.60600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13464,1552714017,6,,1112,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13465,1552714017,7,,1112,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13466,1552714237,6,,1113,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13467,1552714237,7,,1113,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13468,1552714491,6,,1114,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13469,1552714491,7,,1114,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13470,1552714569,6,,1015,0.00000000,1,0.00000000,2288.22808560,523.56181200,领取红包,2811.78989760,-2811.78989760,0.00000000,);
INSERT INTO `clt_log` VALUES (13471,1552714569,7,,1015,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1405.89494880,1405.89494880,0.00000000,);
INSERT INTO `clt_log` VALUES (13472,1552714970,6,,1111,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13473,1552714970,7,,1111,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13474,1552715162,6,,1082,0.00000000,1,0.00000000,65.64000000,525.26400000,领取红包,590.90400000,-590.90400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13475,1552715162,7,,1082,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-295.45200000,295.45200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13476,1552715191,5,,1147,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13477,1552715275,2,,1369,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13478,1552715403,6,,1085,0.00000000,1,0.00000000,317.89680000,525.26400000,领取红包,843.16080000,-843.16080000,0.00000000,);
INSERT INTO `clt_log` VALUES (13479,1552715403,7,,1085,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-421.58040000,421.58040000,0.00000000,);
INSERT INTO `clt_log` VALUES (13480,1552715582,2,,1370,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13481,1552715592,2,,1371,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13482,1552715798,2,,1372,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13483,1552715890,1,,1373,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13484,1552715890,2,,1373,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13485,1552715890,5,,1373,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13486,1552716046,2,,1374,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13487,1552716075,1,,1375,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13488,1552716075,2,,1375,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13489,1552716075,5,,1375,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13490,1552716102,6,,1108,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13491,1552716102,7,,1108,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13492,1552716764,10,,1139,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13493,1552716885,5,,1139,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：QO1SSN激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13494,1552716911,5,,1139,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13495,1552717285,7,,1140,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-285.60600000,1713.63600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13496,1552718735,10,,1171,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13497,1552718788,5,,1171,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：M6RP7I激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13498,1552718801,5,,1171,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13499,1552718821,5,,1359,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：45FY7M激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13500,1552718822,1,,1171,10.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13501,1552718904,5,,1209,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：FLHYCT激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13502,1552718913,5,,1209,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13503,1552719058,1,,1172,1200.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13504,1552719069,5,,1172,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14224,1552842757,2,,1430,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14223,1552842757,1,,1430,500.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14222,1552842722,5,,1429,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13508,1552719985,2,,1376,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13509,1552720004,5,,1142,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：R3B7U5激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13510,1552720023,5,,1142,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14221,1552842722,2,,1429,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13513,1552720104,10,,1181,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13514,1552720178,5,,1153,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：H7WOMP激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13515,1552720188,5,,1153,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13516,1552720305,5,,1155,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：9IGUIY激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13517,1552720314,5,,1155,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13518,1552720336,10,,1171,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13519,1552720381,5,,1156,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：CNQK01激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13520,1552720387,5,,1156,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13521,1552720467,5,,1176,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：RDQT7J激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13522,1552720474,5,,1176,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13523,1552720601,5,,1177,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：QV6SE8激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13524,1552720608,5,,1177,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13525,1552720700,5,,1178,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：BY59XF激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13526,1552720706,5,,1178,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13527,1552720771,5,,1167,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：8D39II激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13528,1552720776,5,,1167,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13529,1552720989,5,,1191,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：A309MI激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13530,1552720994,5,,1191,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13531,1552721055,5,,1180,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：TMXCI3激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13532,1552721068,5,,1180,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13533,1552721074,5,,1180,-3000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V4,0.00000000,94500.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13534,1552721147,5,,1181,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：5EKHUK激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13535,1552721153,5,,1181,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13536,1552721251,5,,1220,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：YCY8NV激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13537,1552721257,5,,1220,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13538,1552721344,5,,1210,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：PUUYIW激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13539,1552721351,5,,1210,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13540,1552721438,5,,1211,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：030EPQ激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13541,1552721444,5,,1211,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13542,1552721449,5,,1211,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13543,1552721524,5,,1213,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：RGE7P1激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13544,1552721551,6,,1030,0.00000000,1,0.00000000,0.00000000,529.20348000,领取红包,529.20348000,-529.20348000,0.00000000,);
INSERT INTO `clt_log` VALUES (13545,1552721551,7,,1030,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.60174000,264.60174000,0.00000000,);
INSERT INTO `clt_log` VALUES (13546,1552721559,5,,1213,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13547,1552721563,5,,1213,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13548,1552721631,7,,1030,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-264.60000000,1587.60000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13549,1552721636,5,,1216,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：HCYO7E激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13550,1552721794,5,,1222,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：S3NJ56激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13551,1552721801,5,,1222,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13552,1552721806,5,,1222,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13553,1552722658,10,,1171,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13554,1552722714,10,,1171,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13555,1552722988,6,,1208,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13556,1552722988,7,,1208,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13557,1552723860,6,,1188,0.00000000,1,0.00000000,0.00000000,84.26400000,领取红包,84.26400000,-84.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13558,1552723860,7,,1188,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.13200000,42.13200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13559,1552724367,6,,1083,0.00000000,1,0.00000000,1712.62560000,525.26400000,领取红包,2237.88960000,-2237.88960000,0.00000000,);
INSERT INTO `clt_log` VALUES (13560,1552724367,7,,1083,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1118.94480000,1118.94480000,0.00000000,);
INSERT INTO `clt_log` VALUES (13561,1552724464,7,,1085,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-421.50000000,2529.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13562,1552724487,1,,1377,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13563,1552724487,2,,1377,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13564,1552724487,5,,1377,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13565,1552724530,1,,1378,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13566,1552724530,2,,1378,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13567,1552724530,5,,1378,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13568,1552724556,1,,1379,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13569,1552724556,2,,1379,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13570,1552724556,5,,1379,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13571,1552724587,7,,1086,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-280.35000000,1682.10000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13572,1552725103,2,,1380,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13573,1552726023,6,,1029,0.00000000,1,0.00000000,0.00000000,529.15610400,领取红包,529.15610400,-529.15610400,0.00000000,);
INSERT INTO `clt_log` VALUES (13574,1552726023,7,,1029,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.57805200,264.57805200,0.00000000,);
INSERT INTO `clt_log` VALUES (13575,1552726059,2,,1381,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13576,1552726718,6,,1212,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13577,1552726718,7,,1212,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13578,1552727126,6,,1172,0.00000000,1,0.00000000,19.69200000,6.56400000,领取红包,26.25600000,-26.25600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13579,1552727126,7,,1172,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-13.12800000,13.12800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13580,1552727918,1,,1281,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13581,1552727997,5,,1281,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：RPQ0Y7激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13582,1552728003,5,,1281,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13583,1552729649,6,,1248,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13584,1552729649,7,,1248,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13585,1552730289,6,,1109,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13586,1552730289,7,,1109,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13587,1552730371,7,,1083,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1118.94000000,6713.64000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13588,1552730448,6,,1049,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (13589,1552730448,7,,1049,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (13590,1552730540,6,,1045,0.00000000,1,0.00000000,2085.29808000,521.32452000,领取红包,2606.62260000,-2606.62260000,0.00000000,);
INSERT INTO `clt_log` VALUES (13591,1552730540,7,,1045,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1303.31130000,1303.31130000,0.00000000,);
INSERT INTO `clt_log` VALUES (13592,1552730692,6,,1043,0.00000000,1,0.00000000,521.32452000,523.68820800,领取红包,1045.01272800,-1045.01272800,0.00000000,);
INSERT INTO `clt_log` VALUES (13593,1552730692,7,,1043,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-522.50636400,522.50636400,0.00000000,);
INSERT INTO `clt_log` VALUES (13594,1552730875,1,,1382,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13595,1552730875,2,,1382,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13596,1552730875,5,,1382,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13597,1552731079,1,,1383,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13598,1552731079,2,,1383,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13599,1552731079,5,,1383,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13600,1552731344,1,,1384,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13601,1552731344,2,,1384,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13602,1552731344,5,,1384,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13603,1552731435,1,,1385,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13604,1552731435,2,,1385,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13605,1552731435,5,,1385,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13606,1552733776,2,,1386,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13607,1552735229,6,,1084,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13608,1552735229,7,,1084,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13609,1552735281,7,,1084,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.63000000,1575.78000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13610,1552735364,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-4141.00000000,24846.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13611,1552739557,2,,1387,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13612,1552740018,6,,1048,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13613,1552740018,7,,1048,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13614,1552740449,6,,1046,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (13615,1552740449,7,,1046,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (13616,1552740621,6,,1047,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13617,1552740621,7,,1047,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13618,1552740870,6,,1206,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13619,1552740870,7,,1206,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13620,1552741436,2,,1388,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13621,1552742540,7,,1015,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1900.00000000,11400.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13622,1552743092,6,,1081,0.00000000,1,0.00000000,634.48200000,525.26400000,领取红包,1159.74600000,-1159.74600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13623,1552743092,7,,1081,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-579.87300000,579.87300000,0.00000000,);
INSERT INTO `clt_log` VALUES (13624,1552743151,7,,1082,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-295.00000000,1770.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13625,1552743810,6,,1088,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13626,1552743810,7,,1088,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13627,1552745371,6,,1089,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13628,1552745371,7,,1089,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13629,1552745553,6,,1091,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13630,1552745553,7,,1091,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13631,1552745669,6,,1090,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13632,1552745669,7,,1090,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13633,1552745731,6,,1092,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13634,1552745731,7,,1092,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13635,1552745774,6,,1093,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13636,1552745774,7,,1093,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13637,1552745819,6,,1094,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13638,1552745819,7,,1094,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13639,1552745843,6,,1096,0.00000000,1,0.00000000,0.00000000,37.01400000,领取红包,37.01400000,-37.01400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13640,1552745843,7,,1096,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.50700000,18.50700000,0.00000000,);
INSERT INTO `clt_log` VALUES (13641,1552745871,6,,1095,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13642,1552745871,7,,1095,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13643,1552745915,6,,1097,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13644,1552745915,7,,1097,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13645,1552745972,6,,1087,0.00000000,1,0.00000000,72.20400000,283.76400000,领取红包,355.96800000,-355.96800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13646,1552745972,7,,1087,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-177.98400000,177.98400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13647,1552746024,5,,1359,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13648,1552746052,6,,1127,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13649,1552746052,7,,1127,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13650,1552746098,6,,1128,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13651,1552746098,7,,1128,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13652,1552746136,6,,1129,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13653,1552746136,7,,1129,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13654,1552746185,6,,1130,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13655,1552746185,7,,1130,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13656,1552746237,6,,1131,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13657,1552746237,7,,1131,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13658,1552746300,6,,1132,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13659,1552746300,7,,1132,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13660,1552746356,6,,1133,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13661,1552746356,7,,1133,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13662,1552746378,1,,1389,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13663,1552746378,2,,1389,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13664,1552746378,5,,1389,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13665,1552746403,6,,1134,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13666,1552746403,7,,1134,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13667,1552746405,1,,1390,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13668,1552746405,2,,1390,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13669,1552746405,5,,1390,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13670,1552746452,6,,1135,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13671,1552746452,7,,1135,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13672,1552746489,6,,1136,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13673,1552746489,7,,1136,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13674,1552746531,6,,1137,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13675,1552746531,7,,1137,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13676,1552746580,6,,1124,0.00000000,1,0.00000000,13.12800000,6.56400000,领取红包,19.69200000,-19.69200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13677,1552746580,7,,1124,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-9.84600000,9.84600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13678,1552746588,6,,1196,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13679,1552746588,7,,1196,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13680,1552746643,6,,1125,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13681,1552746643,7,,1125,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13682,1552746703,6,,1126,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13683,1552746703,7,,1126,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13684,1552747221,1,,1391,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13685,1552747221,2,,1391,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13686,1552747221,5,,1391,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13687,1552751004,6,,1148,0.00000000,1,0.00000000,101.11680000,84.26400000,领取红包,185.38080000,-185.38080000,0.00000000,);
INSERT INTO `clt_log` VALUES (13688,1552751004,7,,1148,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-92.69040000,92.69040000,0.00000000,);
INSERT INTO `clt_log` VALUES (13689,1552751258,7,,1081,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-579.83700000,3479.02200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13690,1552751275,6,,1098,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13691,1552751275,7,,1098,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13692,1552752113,6,,1029,0.00000000,1,0.00000000,0.00000000,529.15610400,领取红包,529.15610400,-529.15610400,0.00000000,);
INSERT INTO `clt_log` VALUES (13693,1552752113,7,,1029,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.57805200,264.57805200,0.00000000,);
INSERT INTO `clt_log` VALUES (13694,1552752320,6,,1082,0.00000000,1,0.00000000,65.64000000,525.26400000,领取红包,590.90400000,-590.90400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13695,1552752320,7,,1082,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-295.45200000,295.45200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13696,1552752410,7,,1082,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-295.00000000,1770.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13697,1552752521,6,,1148,0.00000000,1,0.00000000,101.11680000,84.26400000,领取红包,185.38080000,-185.38080000,0.00000000,);
INSERT INTO `clt_log` VALUES (13698,1552752521,7,,1148,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-92.69040000,92.69040000,0.00000000,);
INSERT INTO `clt_log` VALUES (13699,1552752942,6,,1262,0.00000000,1,0.00000000,0.00000000,84.26400000,领取红包,84.26400000,-84.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13700,1552752942,7,,1262,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.13200000,42.13200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13701,1552753813,6,,1081,0.00000000,1,0.00000000,643.03334280,533.96144700,领取红包,1176.99478980,-1176.99478980,0.00000000,);
INSERT INTO `clt_log` VALUES (13702,1552753813,7,,1081,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-588.49739490,588.49739490,0.00000000,);
INSERT INTO `clt_log` VALUES (13703,1552755024,6,,1291,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13704,1552755024,7,,1291,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13705,1552755208,6,,1282,0.00000000,1,0.00000000,6.56400000,6.56400000,领取红包,13.12800000,-13.12800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13706,1552755208,7,,1282,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-6.56400000,6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13707,1552756032,6,,1327,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13708,1552756032,7,,1327,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13709,1552757909,6,,1035,0.00000000,1,0.00000000,43.51263300,530.20420800,领取红包,573.71684100,-573.71684100,0.00000000,);
INSERT INTO `clt_log` VALUES (13710,1552757909,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-286.85842050,286.85842050,0.00000000,);
INSERT INTO `clt_log` VALUES (13711,1552757954,6,,1015,0.00000000,1,0.00000000,3131.52006594,553.54412715,领取红包,3685.06419309,-3685.06419309,0.00000000,);
INSERT INTO `clt_log` VALUES (13712,1552757954,7,,1015,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1842.53209655,1842.53209655,0.00000000,);
INSERT INTO `clt_log` VALUES (13713,1552757979,6,,1317,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13714,1552757979,7,,1317,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13715,1552758067,7,,1317,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.00000000,1572.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13716,1552758774,6,,1261,0.00000000,1,0.00000000,84.01120800,84.01120800,领取红包,168.02241600,-168.02241600,0.00000000,);
INSERT INTO `clt_log` VALUES (13717,1552758774,7,,1261,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-84.01120800,84.01120800,0.00000000,);
INSERT INTO `clt_log` VALUES (13718,1552760755,6,,1316,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13719,1552760755,7,,1316,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13720,1552760766,7,,1316,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.00000000,1572.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13721,1552762576,6,,1040,0.00000000,1,0.00000000,1746.71314080,529.67945760,领取红包,2276.39259840,-2276.39259840,0.00000000,);
INSERT INTO `clt_log` VALUES (13722,1552762576,7,,1040,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1138.19629920,1138.19629920,0.00000000,);
INSERT INTO `clt_log` VALUES (13723,1552762586,7,,1040,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1160.00000000,6960.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13724,1552765975,6,,1055,0.00000000,1,0.00000000,0.00000000,36.95847900,领取红包,36.95847900,-36.95847900,0.00000000,);
INSERT INTO `clt_log` VALUES (13725,1552765975,7,,1055,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.47923950,18.47923950,0.00000000,);
INSERT INTO `clt_log` VALUES (13726,1552767174,2,,1392,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13727,1552773924,6,,1063,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13728,1552773924,7,,1063,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13729,1552774322,6,,1059,0.00000000,1,0.00000000,0.00000000,528.07610400,领取红包,528.07610400,-528.07610400,0.00000000,);
INSERT INTO `clt_log` VALUES (13730,1552774322,7,,1059,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.03805200,264.03805200,0.00000000,);
INSERT INTO `clt_log` VALUES (13731,1552776038,6,,1208,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13732,1552776038,7,,1208,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13733,1552776372,6,,1036,0.00000000,1,0.00000000,0.00000000,523.68938984,领取红包,523.68938984,-523.68938984,0.00000000,);
INSERT INTO `clt_log` VALUES (13734,1552776372,7,,1036,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-261.84469492,261.84469492,0.00000000,);
INSERT INTO `clt_log` VALUES (13735,1552776459,7,,1261,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-168.00000000,1008.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13736,1552776519,6,,1019,0.00000000,1,0.00000000,310.23803160,525.26400000,领取红包,835.50203160,-835.50203160,0.00000000,);
INSERT INTO `clt_log` VALUES (13737,1552776519,7,,1019,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-417.75101580,417.75101580,0.00000000,);
INSERT INTO `clt_log` VALUES (13738,1552777257,6,,1034,0.00000000,1,0.00000000,44.86913880,523.67757464,领取红包,568.54671344,-568.54671344,0.00000000,);
INSERT INTO `clt_log` VALUES (13739,1552777257,7,,1034,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-284.27335672,284.27335672,0.00000000,);
INSERT INTO `clt_log` VALUES (14220,1552842722,1,,1429,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14219,1552842475,5,,1428,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13742,1552778730,6,,1018,0.00000000,1,0.00000000,2887.88142583,520.82562234,领取红包,3408.70704817,-3408.70704817,0.00000000,);
INSERT INTO `clt_log` VALUES (13743,1552778730,7,,1018,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1704.35352409,1704.35352409,0.00000000,);
INSERT INTO `clt_log` VALUES (13744,1552778831,6,,1077,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13745,1552778831,7,,1077,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13746,1552779560,6,,1188,0.00000000,1,0.00000000,14.44080000,84.13760400,领取红包,98.57840400,-98.57840400,0.00000000,);
INSERT INTO `clt_log` VALUES (13747,1552779560,7,,1188,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-49.28920200,49.28920200,0.00000000,);
INSERT INTO `clt_log` VALUES (13748,1552779659,6,,1290,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13749,1552779659,7,,1290,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13750,1552779768,7,,1327,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.00000000,1572.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13751,1552780385,6,,1086,0.00000000,1,0.00000000,36.72492360,529.46923560,领取红包,566.19415920,-566.19415920,0.00000000,);
INSERT INTO `clt_log` VALUES (13752,1552780385,7,,1086,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-283.09707960,283.09707960,0.00000000,);
INSERT INTO `clt_log` VALUES (13753,1552780426,7,,1086,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-283.10000000,1698.60000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13754,1552780738,6,,1174,0.00000000,1,0.00000000,188.84255400,524.43310200,领取红包,713.27565600,-713.27565600,0.00000000,);
INSERT INTO `clt_log` VALUES (13755,1552780738,7,,1174,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-356.63782800,356.63782800,0.00000000,);
INSERT INTO `clt_log` VALUES (13756,1552781243,6,,1210,0.00000000,1,0.00000000,19.69200000,37.01400000,领取红包,56.70600000,-56.70600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13757,1552781243,7,,1210,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-28.35300000,28.35300000,0.00000000,);
INSERT INTO `clt_log` VALUES (13758,1552781311,6,,1209,0.00000000,1,0.00000000,19.69200000,84.26400000,领取红包,103.95600000,-103.95600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13759,1552781311,7,,1209,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-51.97800000,51.97800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13760,1552781688,6,,1373,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13761,1552781688,7,,1373,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13762,1552782028,2,,1393,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13763,1552782153,6,,1013,0.00000000,1,0.00000000,11029.40141990,637.01307501,领取红包,11666.41449491,-11666.41449491,0.00000000,);
INSERT INTO `clt_log` VALUES (13764,1552782153,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-5833.20724746,5833.20724746,0.00000000,);
INSERT INTO `clt_log` VALUES (13765,1552782197,2,,1394,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13766,1552782373,6,,1147,0.00000000,1,0.00000000,0.00000000,84.26400000,领取红包,84.26400000,-84.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13767,1552782373,7,,1147,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.13200000,42.13200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13768,1552782648,6,,1139,0.00000000,1,0.00000000,484.12560000,84.26400000,领取红包,568.38960000,-568.38960000,0.00000000,);
INSERT INTO `clt_log` VALUES (13769,1552782648,7,,1139,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-284.19480000,284.19480000,0.00000000,);
INSERT INTO `clt_log` VALUES (13770,1552782770,6,,1022,0.00000000,1,0.00000000,13.12800000,533.25667784,领取红包,546.38467784,-546.38467784,0.00000000,);
INSERT INTO `clt_log` VALUES (13771,1552782770,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-273.19233892,273.19233892,0.00000000,);
INSERT INTO `clt_log` VALUES (13772,1552782808,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-273.00000000,1638.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13773,1552782826,6,,1181,0.00000000,1,0.00000000,13.12800000,37.01400000,领取红包,50.14200000,-50.14200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13774,1552782826,7,,1181,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-25.07100000,25.07100000,0.00000000,);
INSERT INTO `clt_log` VALUES (13775,1552783199,6,,1329,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13776,1552783199,7,,1329,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13777,1552783310,6,,1359,0.00000000,1,0.00000000,0.00000000,37.01400000,领取红包,37.01400000,-37.01400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13778,1552783310,7,,1359,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.50700000,18.50700000,0.00000000,);
INSERT INTO `clt_log` VALUES (13779,1552783352,7,,1139,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-284.00000000,1704.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13780,1552783504,6,,1142,0.00000000,1,0.00000000,37.01400000,37.01400000,领取红包,74.02800000,-74.02800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13781,1552783504,7,,1142,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-37.01400000,37.01400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13782,1552783652,6,,1026,0.00000000,1,0.00000000,2086.03640510,561.16259275,领取红包,2647.19899785,-2647.19899785,0.00000000,);
INSERT INTO `clt_log` VALUES (13783,1552783652,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1323.59949893,1323.59949893,0.00000000,);
INSERT INTO `clt_log` VALUES (13784,1552783768,6,,1021,0.00000000,1,0.00000000,4822.28429317,547.66172088,领取红包,5369.94601405,-5369.94601405,0.00000000,);
INSERT INTO `clt_log` VALUES (13785,1552783768,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-2684.97300703,2684.97300703,0.00000000,);
INSERT INTO `clt_log` VALUES (13786,1552783798,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-2700.00000000,16200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13787,1552784312,6,,1112,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13788,1552784312,7,,1112,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13789,1552784456,6,,1113,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13790,1552784456,7,,1113,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13791,1552784494,6,,1114,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13792,1552784494,7,,1114,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13793,1552784543,6,,1206,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13794,1552784543,7,,1206,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13795,1552784790,6,,1108,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13796,1552784790,7,,1108,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13797,1552784830,6,,1017,0.00000000,1,0.00000000,5311.83635963,558.78694138,领取红包,5870.62330101,-5870.62330101,0.00000000,);
INSERT INTO `clt_log` VALUES (13798,1552784830,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-2935.31165051,2935.31165051,0.00000000,);
INSERT INTO `clt_log` VALUES (13799,1552784844,6,,1111,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13800,1552784844,7,,1111,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13801,1552784852,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-2935.00000000,17610.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13802,1552784879,6,,1110,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13803,1552784879,7,,1110,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13804,1552784938,6,,1115,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13805,1552784938,7,,1115,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13806,1552785018,6,,1085,0.00000000,1,0.00000000,323.90518680,531.58625880,领取红包,855.49144560,-855.49144560,0.00000000,);
INSERT INTO `clt_log` VALUES (13807,1552785018,7,,1085,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-427.74572280,427.74572280,0.00000000,);
INSERT INTO `clt_log` VALUES (13808,1552785045,7,,1085,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-427.82000000,2566.92000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13809,1552785109,6,,1390,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13810,1552785109,7,,1390,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13811,1552785141,7,,1390,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-260.00000000,1560.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13812,1552785278,6,,1084,0.00000000,1,0.00000000,0.00000000,529.20344400,领取红包,529.20344400,-529.20344400,0.00000000,);
INSERT INTO `clt_log` VALUES (13813,1552785278,7,,1084,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.60172200,264.60172200,0.00000000,);
INSERT INTO `clt_log` VALUES (13814,1552785295,6,,1250,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13815,1552785295,7,,1250,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13816,1552785300,7,,1084,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-264.60000000,1587.60000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13817,1552785304,7,,1059,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-300.00000000,1800.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13818,1552785322,6,,1061,0.00000000,1,0.00000000,6.54430800,6.54430800,领取红包,13.08861600,-13.08861600,0.00000000,);
INSERT INTO `clt_log` VALUES (13819,1552785322,7,,1061,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-6.54430800,6.54430800,0.00000000,);
INSERT INTO `clt_log` VALUES (13820,1552785644,6,,1172,0.00000000,1,0.00000000,19.67230800,90.52461600,领取红包,110.19692400,-110.19692400,0.00000000,);
INSERT INTO `clt_log` VALUES (13821,1552785644,7,,1172,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-55.09846200,55.09846200,0.00000000,);
INSERT INTO `clt_log` VALUES (13822,1552785866,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1300.00000000,7800.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13823,1552786236,2,,1395,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13824,1552786354,6,,1187,0.00000000,1,0.00000000,6.56400000,84.26400000,领取红包,90.82800000,-90.82800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13825,1552786354,7,,1187,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-45.41400000,45.41400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13826,1552786447,6,,1292,0.00000000,1,0.00000000,6.56400000,6.56400000,领取红包,13.12800000,-13.12800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13827,1552786447,7,,1292,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-6.56400000,6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13828,1552786797,6,,1325,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13829,1552786797,7,,1325,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13830,1552787047,6,,1326,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13831,1552787047,7,,1326,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13832,1552787309,1,,1396,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13833,1552787309,2,,1396,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13834,1552787309,5,,1396,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13835,1552787383,1,,1066,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13836,1552787403,1,,1065,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13837,1552787423,1,,1074,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13838,1552787608,10,,1074,-100.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码10个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13839,1552787677,6,,1384,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13840,1552787677,7,,1384,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13841,1552787826,5,,1074,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：YHKA1B激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13842,1552787850,6,,1383,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13843,1552787850,7,,1383,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13844,1552787872,5,,1066,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：AEHA3S激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13845,1552787886,5,,1066,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13846,1552787901,6,,1314,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13847,1552787901,7,,1314,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13848,1552787944,5,,1065,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：39DUM1激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13849,1552787949,5,,1065,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13850,1552788202,7,,1383,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-500.00000000,3000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14143,1552836729,2,,1421,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13852,1552788636,5,,1340,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：FAH05D激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13853,1552788643,5,,1340,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13854,1552788647,5,,1340,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13855,1552788655,7,,1384,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-500.00000000,3000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13856,1552788661,6,,1030,0.00000000,1,0.00000000,0.00000000,533.17247478,领取红包,533.17247478,-533.17247478,0.00000000,);
INSERT INTO `clt_log` VALUES (13857,1552788661,7,,1030,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-266.58623739,266.58623739,0.00000000,);
INSERT INTO `clt_log` VALUES (13858,1552788686,7,,1030,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-266.50000000,1599.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13859,1552788862,5,,1280,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：L3CR0O激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13860,1552788869,5,,1280,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13861,1552788875,5,,1280,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13862,1552788927,2,,1398,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13863,1552789189,5,,1301,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：QPD1QY激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13864,1552789195,5,,1301,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13865,1552789199,5,,1301,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13866,1552789297,5,,1283,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：8RWNXO激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13867,1552789305,5,,1283,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13868,1552789309,5,,1283,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13869,1552789363,5,,1272,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：P8UOLM激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13870,1552789368,5,,1272,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13871,1552789372,5,,1272,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13872,1552789434,5,,1273,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：CK7QVX激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13873,1552789440,5,,1273,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13874,1552789443,5,,1273,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13875,1552789492,5,,1274,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：JTL1AS激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13876,1552789497,5,,1274,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13877,1552789670,5,,1264,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：INW79K激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13878,1552789675,5,,1264,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13879,1552789680,5,,1264,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13880,1552789842,5,,1265,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：O1HJVN激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13881,1552789846,5,,1265,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13882,1552789850,7,,1018,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-3180.00000000,19080.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13883,1552789850,5,,1265,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13884,1552789912,5,,1258,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：WBANMC激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13885,1552789916,5,,1258,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13886,1552789920,5,,1258,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13887,1552789989,5,,1259,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：1ETTIQ激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13888,1552789993,5,,1259,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13889,1552789997,5,,1259,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13890,1552790062,5,,1266,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：GRJCAK激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13891,1552790067,5,,1266,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13892,1552790070,5,,1266,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13893,1552790256,5,,1230,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：D48DNQ激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13894,1552790260,5,,1230,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13895,1552790264,5,,1230,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13896,1552790379,5,,1225,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：9YJ7RO激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13897,1552790379,6,,1041,0.00000000,1,0.00000000,1149.29299597,534.62146560,领取红包,1683.91446157,-1683.91446157,0.00000000,);
INSERT INTO `clt_log` VALUES (13898,1552790379,7,,1041,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-841.95723079,841.95723079,0.00000000,);
INSERT INTO `clt_log` VALUES (13899,1552790383,5,,1225,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13900,1552790387,5,,1225,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13901,1552790443,5,,1226,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：IK97NO激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13902,1552790447,5,,1226,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13903,1552790453,5,,1226,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13904,1552790523,5,,1227,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：UB5JH6激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13905,1552790528,5,,1227,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13906,1552790531,5,,1227,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13907,1552790583,5,,1228,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：CAT41K激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13908,1552790588,5,,1228,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13909,1552790592,5,,1228,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13910,1552790640,2,,1399,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13911,1552790720,5,,1231,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：7YLFKU激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13912,1552790724,6,,1027,0.00000000,1,0.00000000,2402.93742631,554.92091984,领取红包,2957.85834615,-2957.85834615,0.00000000,);
INSERT INTO `clt_log` VALUES (13913,1552790724,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1478.92917308,1478.92917308,0.00000000,);
INSERT INTO `clt_log` VALUES (13914,1552790732,5,,1231,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13915,1552790736,5,,1231,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13916,1552790789,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1400.00000000,8400.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13917,1552790834,5,,1232,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：LKEWXV激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13918,1552790840,5,,1232,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13919,1552790844,5,,1232,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13920,1552790868,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-190.00000000,1140.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13921,1552790916,6,,1083,0.00000000,1,0.00000000,1729.50107280,542.04808560,领取红包,2271.54915840,-2271.54915840,0.00000000,);
INSERT INTO `clt_log` VALUES (13922,1552790916,7,,1083,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1135.77457920,1135.77457920,0.00000000,);
INSERT INTO `clt_log` VALUES (13923,1552790916,5,,1214,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：ANJMOG激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13924,1552790920,5,,1214,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13925,1552790924,5,,1214,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13926,1552790950,7,,1083,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1135.77000000,6814.62000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13927,1552791025,5,,1186,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：GOP1PL激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13928,1552791030,5,,1186,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13929,1552791033,5,,1186,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13930,1552791256,5,,1267,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：W54OU0激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13931,1552791261,5,,1267,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13932,1552791264,5,,1267,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13933,1552791316,5,,1268,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：CQ58O3激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13934,1552791319,6,,1391,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13935,1552791319,7,,1391,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13936,1552791329,5,,1268,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13937,1552791333,5,,1268,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13938,1552791442,5,,1160,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：P0SLJC激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13939,1552791446,5,,1160,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13940,1552791450,5,,1160,-1000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V3,0.00000000,28000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13941,1552791623,6,,1000,0.00000000,1,0.00000000,15.62627213,6.51094672,领取红包,22.13721885,-22.13721885,0.00000000,);
INSERT INTO `clt_log` VALUES (13942,1552791623,7,,1000,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-11.06860943,11.06860943,0.00000000,);
INSERT INTO `clt_log` VALUES (13943,1552791932,6,,1140,0.00000000,1,0.00000000,52.50215400,529.54809000,领取红包,582.05024400,-582.05024400,0.00000000,);
INSERT INTO `clt_log` VALUES (13944,1552791932,7,,1140,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-291.02512200,291.02512200,0.00000000,);
INSERT INTO `clt_log` VALUES (13945,1552792041,6,,1150,0.00000000,1,0.00000000,192.84120000,84.26400000,领取红包,277.10520000,-277.10520000,0.00000000,);
INSERT INTO `clt_log` VALUES (13946,1552792041,7,,1150,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-138.55260000,138.55260000,0.00000000,);
INSERT INTO `clt_log` VALUES (13947,1552792052,6,,1182,0.00000000,1,0.00000000,1608.61200000,525.26400000,领取红包,2133.87600000,-2133.87600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13948,1552792052,7,,1182,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1066.93800000,1066.93800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13949,1552792192,7,,1140,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-291.02512200,1746.15073200,0.00000000,);
INSERT INTO `clt_log` VALUES (13950,1552792218,6,,1184,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13951,1552792218,7,,1184,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13952,1552792221,6,,1196,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (13953,1552792221,7,,1196,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (13954,1552792269,1,,1074,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13955,1552792329,5,,1074,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13956,1552792526,6,,1183,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13957,1552792526,7,,1183,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13958,1552792607,5,,1370,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：S8NR1B激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13959,1552792744,6,,1306,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13960,1552792744,7,,1306,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13961,1552792883,6,,1287,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13962,1552792883,7,,1287,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13963,1552792929,6,,1016,0.00000000,1,0.00000000,2597.77125900,515.80924800,领取红包,3113.58050700,-3113.58050700,0.00000000,);
INSERT INTO `clt_log` VALUES (13964,1552792929,7,,1016,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1556.79025350,1556.79025350,0.00000000,);
INSERT INTO `clt_log` VALUES (13965,1552792985,6,,1305,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13966,1552792985,7,,1305,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13967,1552793017,1,,1370,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13968,1552793042,5,,1370,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13969,1552793137,6,,1324,0.00000000,1,0.00000000,0.00000000,283.76400000,领取红包,283.76400000,-283.76400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13970,1552793137,7,,1324,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-141.88200000,141.88200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13971,1552793199,6,,1185,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13972,1552793199,7,,1185,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13973,1552793448,6,,1307,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13974,1552793448,7,,1307,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13975,1552793473,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-350.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13976,1552793613,6,,1308,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13977,1552793613,7,,1308,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13978,1552793680,6,,1309,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13979,1552793680,7,,1309,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13980,1552793964,6,,1244,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13981,1552793964,7,,1244,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13982,1552794424,2,,1400,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13983,1552794461,6,,1365,0.00000000,1,0.00000000,0.00000000,37.01400000,领取红包,37.01400000,-37.01400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13984,1552794461,7,,1365,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.50700000,18.50700000,0.00000000,);
INSERT INTO `clt_log` VALUES (13985,1552795314,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-5833.00000000,34998.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13986,1552798389,6,,1149,0.00000000,1,0.00000000,39.38400000,6.56400000,领取红包,45.94800000,-45.94800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13987,1552798389,7,,1149,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-22.97400000,22.97400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13988,1552798488,6,,1217,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13989,1552798488,7,,1217,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13990,1552798493,2,,1401,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (13991,1552798773,6,,1178,0.00000000,1,0.00000000,6.56400000,37.01400000,领取红包,43.57800000,-43.57800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13992,1552798773,7,,1178,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-21.78900000,21.78900000,0.00000000,);
INSERT INTO `clt_log` VALUES (13993,1552798957,6,,1171,0.00000000,1,0.00000000,19.69200000,84.26400000,领取红包,103.95600000,-103.95600000,0.00000000,);
INSERT INTO `clt_log` VALUES (13994,1552798957,7,,1171,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-51.97800000,51.97800000,0.00000000,);
INSERT INTO `clt_log` VALUES (13995,1552799598,6,,1245,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (13996,1552799598,7,,1245,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (13997,1552799767,6,,1033,0.00000000,1,0.00000000,1810.05989735,553.61114880,领取红包,2363.67104615,-2363.67104615,0.00000000,);
INSERT INTO `clt_log` VALUES (13998,1552799767,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1181.83552308,1181.83552308,0.00000000,);
INSERT INTO `clt_log` VALUES (13999,1552799771,6,,1271,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14000,1552799771,7,,1271,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14001,1552799796,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1180.00000000,7080.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14002,1552799903,5,,1401,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：SGHOB2激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14003,1552799928,6,,1042,0.00000000,1,0.00000000,3046.53120000,541.01241600,领取红包,3587.54361600,-3587.54361600,0.00000000,);
INSERT INTO `clt_log` VALUES (14004,1552799928,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1793.77180800,1793.77180800,0.00000000,);
INSERT INTO `clt_log` VALUES (14209,1552842033,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-2651.48960603,2651.48960603,0.00000000,);
INSERT INTO `clt_log` VALUES (14006,1552799958,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1793.00000000,10758.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14007,1552800184,5,,1400,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：3CLARD激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14008,1552800399,1,,1400,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14009,1552800792,5,,1400,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14010,1552801296,6,,1263,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14011,1552801296,7,,1263,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14012,1552801915,1,,1401,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14013,1552802499,6,,1375,0.00000000,1,0.00000000,0.00000000,84.26400000,领取红包,84.26400000,-84.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14014,1552802499,7,,1375,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.13200000,42.13200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14015,1552802903,2,,1403,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14016,1552803073,2,,1404,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14017,1552803401,5,,1401,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14018,1552803604,1,,1067,110.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14019,1552803639,2,,1405,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14020,1552804263,2,,1406,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14021,1552804363,2,,1407,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14022,1552805455,2,,1408,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14023,1552805609,6,,1315,0.00000000,1,0.00000000,2101.05600000,525.26400000,领取红包,2626.32000000,-2626.32000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14024,1552805609,7,,1315,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1313.16000000,1313.16000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14025,1552805682,7,,1315,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1300.00000000,7800.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14026,1552806120,2,,1409,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14027,1552806377,1,,1380,110.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14028,1552806390,6,,1389,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14029,1552806390,7,,1389,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14030,1552806463,2,,1410,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14031,1552807393,6,,1207,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14032,1552807393,7,,1207,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14033,1552807490,6,,1177,0.00000000,1,0.00000000,6.56400000,84.26400000,领取红包,90.82800000,-90.82800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14034,1552807490,7,,1177,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-45.41400000,45.41400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14035,1552807815,6,,1124,0.00000000,1,0.00000000,13.06892400,6.53446200,领取红包,19.60338600,-19.60338600,0.00000000,);
INSERT INTO `clt_log` VALUES (14036,1552807815,7,,1124,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-9.80169300,9.80169300,0.00000000,);
INSERT INTO `clt_log` VALUES (14037,1552808003,6,,1224,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14038,1552808003,7,,1224,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14039,1552808208,6,,1311,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14040,1552808208,7,,1311,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14041,1552808458,6,,1180,0.00000000,1,0.00000000,170.90040000,367.76400000,领取红包,538.66440000,-538.66440000,0.00000000,);
INSERT INTO `clt_log` VALUES (14042,1552808458,7,,1180,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-269.33220000,269.33220000,0.00000000,);
INSERT INTO `clt_log` VALUES (14043,1552808576,6,,1222,0.00000000,1,0.00000000,6.56400000,43.31400000,领取红包,49.87800000,-49.87800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14044,1552808576,7,,1222,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-24.93900000,24.93900000,0.00000000,);
INSERT INTO `clt_log` VALUES (14045,1552809601,2,,1411,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14046,1552809887,6,,1223,0.00000000,1,0.00000000,0.00000000,84.26400000,领取红包,84.26400000,-84.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14047,1552809887,7,,1223,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.13200000,42.13200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14048,1552810263,6,,1166,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14049,1552810263,7,,1166,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14050,1552810310,6,,1109,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14051,1552810310,7,,1109,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14052,1552810376,7,,1081,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-588.53334490,3531.20006940,0.00000000,);
INSERT INTO `clt_log` VALUES (14053,1552810523,10,,1380,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14054,1552810534,5,,1380,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：UO3AKC激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14055,1552810539,5,,1380,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14056,1552811375,6,,1269,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14057,1552811375,7,,1269,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14058,1552812357,6,,1276,0.00000000,1,0.00000000,6.56400000,6.56400000,领取红包,13.12800000,-13.12800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14059,1552812357,7,,1276,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-6.56400000,6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14060,1552812811,6,,1251,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14061,1552812811,7,,1251,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14062,1552815556,6,,1277,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14063,1552815556,7,,1277,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14064,1552815649,6,,1312,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14065,1552815649,7,,1312,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14066,1552815828,6,,1382,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14067,1552815828,7,,1382,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14068,1552815866,7,,1382,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.00000000,1572.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14069,1552816152,1,,1406,110.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14070,1552816945,2,,1412,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14071,1552819049,6,,1248,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14072,1552819049,7,,1248,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14073,1552819652,10,,1406,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14074,1552819664,5,,1406,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：U1WXG4激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14075,1552819668,5,,1406,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14076,1552820384,2,,1413,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14077,1552820622,6,,1028,0.00000000,1,0.00000000,0.00000000,533.16831584,领取红包,533.16831584,-533.16831584,0.00000000,);
INSERT INTO `clt_log` VALUES (14078,1552820622,7,,1028,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-266.58415792,266.58415792,0.00000000,);
INSERT INTO `clt_log` VALUES (14079,1552820674,7,,1028,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-266.00000000,1596.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14080,1552820787,2,,1414,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14081,1552820984,2,,1415,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14082,1552821838,6,,1047,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14083,1552821838,7,,1047,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14084,1552821893,6,,1045,0.00000000,1,0.00000000,2069.65834440,517.41458610,领取红包,2587.07293050,-2587.07293050,0.00000000,);
INSERT INTO `clt_log` VALUES (14085,1552821893,7,,1045,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1293.53646525,1293.53646525,0.00000000,);
INSERT INTO `clt_log` VALUES (14086,1552821952,6,,1043,0.00000000,1,0.00000000,517.41458610,522.12068891,领取红包,1039.53527501,-1039.53527501,0.00000000,);
INSERT INTO `clt_log` VALUES (14087,1552821952,7,,1043,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-519.76763751,519.76763751,0.00000000,);
INSERT INTO `clt_log` VALUES (14088,1552822066,6,,1319,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14089,1552822066,7,,1319,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14090,1552822129,7,,1319,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-200.00000000,1200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14091,1552822583,6,,1156,0.00000000,1,0.00000000,0.00000000,37.01400000,领取红包,37.01400000,-37.01400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14092,1552822583,7,,1156,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.50700000,18.50700000,0.00000000,);
INSERT INTO `clt_log` VALUES (14093,1552823225,1,,1416,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14094,1552823225,2,,1416,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14095,1552823225,5,,1416,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14096,1552823262,1,,1417,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14097,1552823262,2,,1417,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14098,1552823262,5,,1417,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14208,1552842033,6,,1017,0.00000000,1,0.00000000,4700.16820563,602.81100643,领取红包,5302.97921206,-5302.97921206,0.00000000,);
INSERT INTO `clt_log` VALUES (14207,1552842032,5,,1425,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14206,1552842032,2,,1425,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14205,1552842032,1,,1425,5000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14103,1552824238,6,,1279,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14104,1552824238,7,,1279,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14105,1552824711,1,,1403,110.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14106,1552825614,6,,1235,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14107,1552825614,7,,1235,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14108,1552828263,6,,1345,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14109,1552828263,7,,1345,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14110,1552828920,2,,1418,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14111,1552829396,10,,1403,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14112,1552829411,5,,1403,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：P25BAT激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14113,1552829416,5,,1403,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14114,1552829485,6,,1020,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14115,1552829485,7,,1020,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14116,1552829505,7,,1020,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-500.00000000,3000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14117,1552829887,6,,1318,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14118,1552829887,7,,1318,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14119,1552830043,7,,1318,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-200.00000000,1200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14120,1552831014,6,,1175,0.00000000,1,0.00000000,1575.79200000,525.26400000,领取红包,2101.05600000,-2101.05600000,0.00000000,);
INSERT INTO `clt_log` VALUES (14121,1552831014,7,,1175,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1050.52800000,1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14122,1552831140,6,,1379,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14123,1552831140,7,,1379,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14124,1552831209,6,,1377,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14125,1552831209,7,,1377,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14126,1552831254,6,,1378,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14127,1552831254,7,,1378,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14128,1552831324,2,,1419,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14129,1552831815,6,,1023,0.00000000,1,0.00000000,1176.53258869,550.64297657,领取红包,1727.17556526,-1727.17556526,0.00000000,);
INSERT INTO `clt_log` VALUES (14130,1552831815,7,,1023,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-863.58778263,863.58778263,0.00000000,);
INSERT INTO `clt_log` VALUES (14131,1552831875,7,,1023,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-863.00000000,5178.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14132,1552832268,6,,1024,0.00000000,1,0.00000000,541.13999338,541.13999338,领取红包,1082.27998676,-1082.27998676,0.00000000,);
INSERT INTO `clt_log` VALUES (14133,1552832268,7,,1024,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-541.13999338,541.13999338,0.00000000,);
INSERT INTO `clt_log` VALUES (14134,1552832291,7,,1024,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-541.00000000,3246.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14135,1552833772,1,,1420,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14136,1552833772,2,,1420,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14137,1552833772,5,,1420,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14138,1552834403,7,,1324,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-140.00000000,840.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14139,1552835955,1,,1398,5010.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14140,1552836156,10,,1398,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14141,1552836168,5,,1398,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：IWFOV2激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14142,1552836174,5,,1398,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14144,1552836825,1,,1421,5010.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14145,1552837334,10,,1421,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14146,1552837365,10,,1421,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14147,1552837529,10,,1421,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14148,1552837546,10,,1421,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14149,1552838061,1,,1421,30.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14150,1552838102,5,,1421,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：CEJKB0激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14151,1552838109,5,,1421,-5000.00000000,1,0.00000000,0.00000000,0.00000000,升级至V5,0.00000000,175000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14152,1552838439,6,,1035,0.00000000,1,0.00000000,43.51263300,530.20420800,领取红包,573.71684100,-573.71684100,0.00000000,);
INSERT INTO `clt_log` VALUES (14153,1552838439,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-286.85842050,286.85842050,0.00000000,);
INSERT INTO `clt_log` VALUES (14154,1552838447,6,,1013,0.00000000,1,0.00000000,11271.66436253,637.01307501,领取红包,11908.67743754,-11908.67743754,0.00000000,);
INSERT INTO `clt_log` VALUES (14155,1552838447,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-5954.33871877,5954.33871877,0.00000000,);
INSERT INTO `clt_log` VALUES (14156,1552838476,6,,1000,0.00000000,1,0.00000000,15.62627213,6.51094672,领取红包,22.13721885,-22.13721885,0.00000000,);
INSERT INTO `clt_log` VALUES (14157,1552838476,7,,1000,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-11.06860943,11.06860943,0.00000000,);
INSERT INTO `clt_log` VALUES (14158,1552838487,7,,1013,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-5954.00000000,35724.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14159,1552838538,6,,1261,0.00000000,1,0.00000000,84.01120800,84.01120800,领取红包,168.02241600,-168.02241600,0.00000000,);
INSERT INTO `clt_log` VALUES (14160,1552838538,7,,1261,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-84.01120800,84.01120800,0.00000000,);
INSERT INTO `clt_log` VALUES (14161,1552838546,6,,1021,0.00000000,1,0.00000000,4822.28429317,547.66172088,领取红包,5369.94601405,-5369.94601405,0.00000000,);
INSERT INTO `clt_log` VALUES (14162,1552838546,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-2684.97300703,2684.97300703,0.00000000,);
INSERT INTO `clt_log` VALUES (14163,1552838571,7,,1021,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-2700.00000000,16200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14218,1552842475,2,,1428,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14217,1552842475,1,,1428,1000.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14166,1552838645,6,,1390,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14167,1552838645,7,,1390,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14168,1552838664,7,,1390,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-260.00000000,1560.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14169,1552838664,6,,1320,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14170,1552838664,7,,1320,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14171,1552838762,6,,1020,0.00000000,1,0.00000000,525.26400000,525.26400000,领取红包,1050.52800000,-1050.52800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14172,1552838762,7,,1020,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-525.26400000,525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14173,1552838794,7,,1020,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-550.00000000,3300.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14174,1552838942,6,,1391,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14175,1552838942,7,,1391,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14176,1552839027,7,,1391,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-525.00000000,3150.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14177,1552839083,2,,1422,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14178,1552839128,6,,1040,0.00000000,1,0.00000000,1746.71314080,529.67945760,领取红包,2276.39259840,-2276.39259840,0.00000000,);
INSERT INTO `clt_log` VALUES (14179,1552839128,7,,1040,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1138.19629920,1138.19629920,0.00000000,);
INSERT INTO `clt_log` VALUES (14180,1552839137,7,,1040,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1144.00000000,6864.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14181,1552839524,6,,1059,0.00000000,1,0.00000000,0.00000000,528.07610400,领取红包,528.07610400,-528.07610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14182,1552839524,7,,1059,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.03805200,264.03805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14183,1552839593,6,,1211,0.00000000,1,0.00000000,132.62400000,90.56400000,领取红包,223.18800000,-223.18800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14184,1552839593,7,,1211,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-111.59400000,111.59400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14185,1552839713,6,,1255,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14186,1552839713,7,,1255,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14187,1552839749,6,,1015,0.00000000,1,0.00000000,3131.52006594,553.54412715,领取红包,3685.06419309,-3685.06419309,0.00000000,);
INSERT INTO `clt_log` VALUES (14188,1552839749,7,,1015,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1842.53209655,1842.53209655,0.00000000,);
INSERT INTO `clt_log` VALUES (14189,1552840100,7,,1015,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-3700.00000000,22200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14190,1552840360,6,,1370,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14191,1552840360,7,,1370,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14192,1552840368,6,,1280,0.00000000,1,0.00000000,13.12800000,121.01400000,领取红包,134.14200000,-134.14200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14193,1552840368,7,,1280,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-67.07100000,67.07100000,0.00000000,);
INSERT INTO `clt_log` VALUES (14194,1552840595,6,,1315,0.00000000,1,0.00000000,2114.53641600,544.72452000,领取红包,2659.26093600,-2659.26093600,0.00000000,);
INSERT INTO `clt_log` VALUES (14195,1552840595,7,,1315,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1329.63046800,1329.63046800,0.00000000,);
INSERT INTO `clt_log` VALUES (14196,1552840643,7,,1315,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1200.00000000,7200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14197,1552840740,6,,1274,0.00000000,1,0.00000000,94.74670800,84.26400000,领取红包,179.01070800,-179.01070800,0.00000000,);
INSERT INTO `clt_log` VALUES (14198,1552840740,7,,1274,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-89.50535400,89.50535400,0.00000000,);
INSERT INTO `clt_log` VALUES (14210,1552842054,7,,1017,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-2652.00000000,15912.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14235,1552845722,7,,1279,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14236,1552847056,6,,1081,0.00000000,1,0.00000000,643.18318380,542.78955502,领取红包,1185.97273882,-1185.97273882,0.00000000,);
INSERT INTO `clt_log` VALUES (14237,1552847056,7,,1081,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-592.98636941,592.98636941,0.00000000,);
INSERT INTO `clt_log` VALUES (14238,1552848689,6,,1326,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14239,1552848689,7,,1326,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14240,1552849396,6,,1124,0.00000000,1,0.00000000,13.01011384,6.50505692,领取红包,19.51517076,-19.51517076,0.00000000,);
INSERT INTO `clt_log` VALUES (14241,1552849396,7,,1124,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-9.75758538,9.75758538,0.00000000,);
INSERT INTO `clt_log` VALUES (14242,1552853715,6,,1055,0.00000000,1,0.00000000,0.00000000,36.90304128,领取红包,36.90304128,-36.90304128,0.00000000,);
INSERT INTO `clt_log` VALUES (14243,1552853715,7,,1055,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.45152064,18.45152064,0.00000000,);
INSERT INTO `clt_log` VALUES (14244,1552854417,6,,1066,0.00000000,1,0.00000000,7.87680000,6.56400000,领取红包,14.44080000,-14.44080000,0.00000000,);
INSERT INTO `clt_log` VALUES (14245,1552854417,7,,1066,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-7.22040000,7.22040000,0.00000000,);
INSERT INTO `clt_log` VALUES (14246,1552854487,6,,1074,0.00000000,1,0.00000000,9.18960000,6.56400000,领取红包,15.75360000,-15.75360000,0.00000000,);
INSERT INTO `clt_log` VALUES (14247,1552854487,7,,1074,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-7.87680000,7.87680000,0.00000000,);
INSERT INTO `clt_log` VALUES (14248,1552856038,6,,1065,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14249,1552856038,7,,1065,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14250,1552856792,7,,1059,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-290.00000000,1740.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14251,1552857517,6,,1262,0.00000000,1,0.00000000,0.00000000,84.01120800,领取红包,84.01120800,-84.01120800,0.00000000,);
INSERT INTO `clt_log` VALUES (14252,1552857517,7,,1262,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.00560400,42.00560400,0.00000000,);
INSERT INTO `clt_log` VALUES (14253,1552857549,7,,1262,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-126.00000000,756.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14254,1552858931,6,,1206,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14255,1552858931,7,,1206,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14256,1552859012,6,,1340,0.00000000,1,0.00000000,13.12800000,90.56400000,领取红包,103.69200000,-103.69200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14257,1552859012,7,,1340,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-51.84600000,51.84600000,0.00000000,);
INSERT INTO `clt_log` VALUES (14258,1552859231,6,,1148,0.00000000,1,0.00000000,184.15728672,83.70785760,领取红包,267.86514432,-267.86514432,0.00000000,);
INSERT INTO `clt_log` VALUES (14259,1552859231,7,,1148,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-133.93257216,133.93257216,0.00000000,);
INSERT INTO `clt_log` VALUES (14260,1552859394,6,,1292,0.00000000,1,0.00000000,6.54430800,6.54430800,领取红包,13.08861600,-13.08861600,0.00000000,);
INSERT INTO `clt_log` VALUES (14261,1552859394,7,,1292,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-6.54430800,6.54430800,0.00000000,);
INSERT INTO `clt_log` VALUES (14262,1552859759,6,,1177,0.00000000,1,0.00000000,6.56400000,84.12775800,领取红包,90.69175800,-90.69175800,0.00000000,);
INSERT INTO `clt_log` VALUES (14263,1552859759,7,,1177,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-45.34587900,45.34587900,0.00000000,);
INSERT INTO `clt_log` VALUES (14264,1552859824,6,,1182,0.00000000,1,0.00000000,1598.96032800,522.06318600,领取红包,2121.02351400,-2121.02351400,0.00000000,);
INSERT INTO `clt_log` VALUES (14265,1552859824,7,,1182,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1060.51175700,1060.51175700,0.00000000,);
INSERT INTO `clt_log` VALUES (14266,1552859901,6,,1139,0.00000000,1,0.00000000,639.32955480,88.52341560,领取红包,727.85297040,-727.85297040,0.00000000,);
INSERT INTO `clt_log` VALUES (14267,1552859901,7,,1139,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-363.92648520,363.92648520,0.00000000,);
INSERT INTO `clt_log` VALUES (14268,1552859918,7,,1139,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-364.00000000,2184.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14269,1552859969,6,,1184,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14270,1552859969,7,,1184,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14271,1552860026,6,,1306,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14272,1552860026,7,,1306,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14273,1552860034,6,,1178,0.00000000,1,0.00000000,6.55415400,36.94863300,领取红包,43.50278700,-43.50278700,0.00000000,);
INSERT INTO `clt_log` VALUES (14274,1552860034,7,,1178,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-21.75139350,21.75139350,0.00000000,);
INSERT INTO `clt_log` VALUES (14275,1552860075,6,,1183,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14276,1552860075,7,,1183,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14277,1552860541,6,,1308,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14278,1552860541,7,,1308,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14279,1552860668,6,,1263,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14280,1552860668,7,,1263,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14281,1552861211,6,,1375,0.00000000,1,0.00000000,0.00000000,84.13760400,领取红包,84.13760400,-84.13760400,0.00000000,);
INSERT INTO `clt_log` VALUES (14282,1552861211,7,,1375,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-42.06880200,42.06880200,0.00000000,);
INSERT INTO `clt_log` VALUES (14283,1552861675,6,,1400,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14284,1552861675,7,,1400,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14285,1552861731,6,,1172,0.00000000,1,0.00000000,19.64279954,90.35932061,领取红包,110.00212015,-110.00212015,0.00000000,);
INSERT INTO `clt_log` VALUES (14286,1552861731,7,,1172,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-55.00106008,55.00106008,0.00000000,);
INSERT INTO `clt_log` VALUES (14287,1552862548,6,,1327,0.00000000,1,0.00000000,0.00000000,529.19210400,领取红包,529.19210400,-529.19210400,0.00000000,);
INSERT INTO `clt_log` VALUES (14288,1552862548,7,,1327,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.59605200,264.59605200,0.00000000,);
INSERT INTO `clt_log` VALUES (14289,1552862738,6,,1406,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14290,1552862738,7,,1406,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14291,1552862741,6,,1019,0.00000000,1,0.00000000,309.74119689,524.01074695,领取红包,833.75194384,-833.75194384,0.00000000,);
INSERT INTO `clt_log` VALUES (14292,1552862741,7,,1019,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-416.87597192,416.87597192,0.00000000,);
INSERT INTO `clt_log` VALUES (14293,1552862828,6,,1185,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14294,1552862828,7,,1185,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14295,1552863040,6,,1269,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14296,1552863040,7,,1269,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14297,1552863114,6,,1120,0.00000000,1,0.00000000,6.56400000,6.56400000,领取红包,13.12800000,-13.12800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14298,1552863114,7,,1120,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-6.56400000,6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14299,1552863703,6,,1309,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14300,1552863703,7,,1309,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14301,1552863804,6,,1305,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14302,1552863804,7,,1305,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14303,1552863883,2,,1431,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14304,1552863925,6,,1307,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14305,1552863925,7,,1307,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14306,1552863927,6,,1036,0.00000000,1,0.00000000,0.00000000,522.90385576,领取红包,522.90385576,-522.90385576,0.00000000,);
INSERT INTO `clt_log` VALUES (14307,1552863927,7,,1036,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-261.45192788,261.45192788,0.00000000,);
INSERT INTO `clt_log` VALUES (14308,1552864608,6,,1225,0.00000000,1,0.00000000,43.31400000,43.31400000,领取红包,86.62800000,-86.62800000,0.00000000,);
INSERT INTO `clt_log` VALUES (14309,1552864608,7,,1225,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-43.31400000,43.31400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14310,1552864702,6,,1022,0.00000000,1,0.00000000,13.12800000,537.35110083,领取红包,550.47910083,-550.47910083,0.00000000,);
INSERT INTO `clt_log` VALUES (14311,1552864702,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-275.23955042,275.23955042,0.00000000,);
INSERT INTO `clt_log` VALUES (14312,1552864723,7,,1022,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-276.00000000,1656.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14313,1552865214,6,,1213,0.00000000,1,0.00000000,0.00000000,43.31400000,领取红包,43.31400000,-43.31400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14314,1552865214,7,,1213,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-21.65700000,21.65700000,0.00000000,);
INSERT INTO `clt_log` VALUES (14315,1552865485,6,,1018,0.00000000,1,0.00000000,3193.99079293,572.95256177,领取红包,3766.94335470,-3766.94335470,0.00000000,);
INSERT INTO `clt_log` VALUES (14316,1552865485,7,,1018,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1883.47167735,1883.47167735,0.00000000,);
INSERT INTO `clt_log` VALUES (14317,1552865543,6,,1325,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14318,1552865543,7,,1325,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14319,1552865720,6,,1227,0.00000000,1,0.00000000,0.00000000,43.31400000,领取红包,43.31400000,-43.31400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14320,1552865720,7,,1227,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-21.65700000,21.65700000,0.00000000,);
INSERT INTO `clt_log` VALUES (14321,1552866016,6,,1188,0.00000000,1,0.00000000,14.42701560,83.98973639,领取红包,98.41675199,-98.41675199,0.00000000,);
INSERT INTO `clt_log` VALUES (14322,1552866016,7,,1188,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-49.20837600,49.20837600,0.00000000,);
INSERT INTO `clt_log` VALUES (14323,1552866095,6,,1160,0.00000000,1,0.00000000,0.00000000,90.56400000,领取红包,90.56400000,-90.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14324,1552866095,7,,1160,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-45.28200000,45.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14325,1552866099,6,,1166,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14326,1552866099,7,,1166,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14327,1552866101,7,,1188,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-100.00000000,600.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14328,1552866150,6,,1290,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14329,1552866150,7,,1290,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14330,1552866299,6,,1174,0.00000000,1,0.00000000,259.60603620,523.36318852,领取红包,782.96922472,-782.96922472,0.00000000,);
INSERT INTO `clt_log` VALUES (14331,1552866299,7,,1174,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-391.48461236,391.48461236,0.00000000,);
INSERT INTO `clt_log` VALUES (14332,1552866478,6,,1140,0.00000000,1,0.00000000,52.45293877,533.91346683,领取红包,586.36640560,-586.36640560,0.00000000,);
INSERT INTO `clt_log` VALUES (14333,1552866478,7,,1140,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-293.18320280,293.18320280,0.00000000,);
INSERT INTO `clt_log` VALUES (14334,1552867159,7,,1081,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-529.98640000,3179.91840000,0.00000000,);
INSERT INTO `clt_log` VALUES (14335,1552867261,6,,1109,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14336,1552867261,7,,1109,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14337,1552867381,6,,1217,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14338,1552867381,7,,1217,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14339,1552867425,6,,1149,0.00000000,1,0.00000000,46.76456160,6.49507800,领取红包,53.25963960,-53.25963960,0.00000000,);
INSERT INTO `clt_log` VALUES (14340,1552867425,7,,1149,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-26.62981980,26.62981980,0.00000000,);
INSERT INTO `clt_log` VALUES (14341,1552867544,6,,1384,0.00000000,1,0.00000000,525.26400000,532.68820800,领取红包,1057.95220800,-1057.95220800,0.00000000,);
INSERT INTO `clt_log` VALUES (14342,1552867544,7,,1384,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-528.97610400,528.97610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14343,1552867661,6,,1223,0.00000000,1,0.00000000,43.31400000,84.13760400,领取红包,127.45160400,-127.45160400,0.00000000,);
INSERT INTO `clt_log` VALUES (14344,1552867661,7,,1223,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-63.72580200,63.72580200,0.00000000,);
INSERT INTO `clt_log` VALUES (14345,1552867661,6,,1208,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14346,1552867661,7,,1208,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14347,1552867990,6,,1196,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14348,1552867990,7,,1196,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14349,1552868101,6,,1287,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14350,1552868101,7,,1287,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14351,1552868161,6,,1341,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14352,1552868161,7,,1341,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14353,1552868193,7,,1140,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-293.18320280,1759.09921680,0.00000000,);
INSERT INTO `clt_log` VALUES (14354,1552868230,6,,1342,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14355,1552868230,7,,1342,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14356,1552868567,7,,1327,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-265.22805200,1591.36831200,0.00000000,);
INSERT INTO `clt_log` VALUES (14357,1552869096,6,,1236,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14358,1552869096,7,,1236,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14359,1552869574,6,,1077,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14360,1552869574,7,,1077,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14361,1552869807,6,,1329,0.00000000,1,0.00000000,0.00000000,524.47610400,领取红包,524.47610400,-524.47610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14362,1552869807,7,,1329,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.23805200,262.23805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14363,1552870011,6,,1150,0.00000000,1,0.00000000,192.09108852,83.84834220,领取红包,275.93943072,-275.93943072,0.00000000,);
INSERT INTO `clt_log` VALUES (14364,1552870011,7,,1150,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-137.96971536,137.96971536,0.00000000,);
INSERT INTO `clt_log` VALUES (14365,1552870197,6,,1359,0.00000000,1,0.00000000,0.00000000,36.95847900,领取红包,36.95847900,-36.95847900,0.00000000,);
INSERT INTO `clt_log` VALUES (14366,1552870197,7,,1359,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.47923950,18.47923950,0.00000000,);
INSERT INTO `clt_log` VALUES (14367,1552870207,6,,1380,0.00000000,1,0.00000000,13.12800000,6.56400000,领取红包,19.69200000,-19.69200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14368,1552870207,7,,1380,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-9.84600000,9.84600000,0.00000000,);
INSERT INTO `clt_log` VALUES (14369,1552870281,6,,1324,0.00000000,1,0.00000000,0.00000000,285.85835400,领取红包,285.85835400,-285.85835400,0.00000000,);
INSERT INTO `clt_log` VALUES (14370,1552870281,7,,1324,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-142.92917700,142.92917700,0.00000000,);
INSERT INTO `clt_log` VALUES (14371,1552870341,7,,1324,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-144.00000000,864.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14372,1552870353,6,,1027,0.00000000,1,0.00000000,2413.01726913,579.10413232,领取红包,2992.12140145,-2992.12140145,0.00000000,);
INSERT INTO `clt_log` VALUES (14373,1552870353,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1496.06070073,1496.06070073,0.00000000,);
INSERT INTO `clt_log` VALUES (14374,1552870398,6,,1171,0.00000000,1,0.00000000,19.69200000,84.10806600,领取红包,103.80006600,-103.80006600,0.00000000,);
INSERT INTO `clt_log` VALUES (14375,1552870398,7,,1171,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-51.90003300,51.90003300,0.00000000,);
INSERT INTO `clt_log` VALUES (14376,1552870554,6,,1034,0.00000000,1,0.00000000,46.10481863,522.82475457,领取红包,568.92957320,-568.92957320,0.00000000,);
INSERT INTO `clt_log` VALUES (14377,1552870554,7,,1034,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-284.46478660,284.46478660,0.00000000,);
INSERT INTO `clt_log` VALUES (14378,1552870666,7,,1027,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1440.00000000,8640.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14379,1552870709,6,,1061,0.00000000,1,0.00000000,13.04935016,6.52467508,领取红包,19.57402524,-19.57402524,0.00000000,);
INSERT INTO `clt_log` VALUES (14380,1552870709,7,,1061,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-9.78701262,9.78701262,0.00000000,);
INSERT INTO `clt_log` VALUES (14381,1552870883,2,,1432,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14382,1552871300,6,,1244,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14383,1552871300,7,,1244,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14384,1552871361,6,,1110,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14385,1552871361,7,,1110,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14386,1552871434,6,,1401,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14387,1552871434,7,,1401,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14388,1552871621,6,,1112,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14389,1552871621,7,,1112,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14390,1552871658,6,,1113,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14391,1552871658,7,,1113,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14392,1552871691,6,,1115,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14393,1552871691,7,,1115,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14394,1552871759,6,,1108,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14395,1552871759,7,,1108,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14396,1552871787,6,,1114,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14397,1552871787,7,,1114,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14398,1552871792,6,,1026,0.00000000,1,0.00000000,2112.23558615,580.59179426,领取红包,2692.82738041,-2692.82738041,0.00000000,);
INSERT INTO `clt_log` VALUES (14399,1552871792,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1346.41369021,1346.41369021,0.00000000,);
INSERT INTO `clt_log` VALUES (14400,1552871793,6,,1209,0.00000000,1,0.00000000,19.67230800,84.10806600,领取红包,103.78037400,-103.78037400,0.00000000,);
INSERT INTO `clt_log` VALUES (14401,1552871793,7,,1209,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-51.89018700,51.89018700,0.00000000,);
INSERT INTO `clt_log` VALUES (14402,1552871816,6,,1373,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14403,1552871816,7,,1373,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14404,1552871822,1,,1433,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14405,1552871822,2,,1433,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14406,1552871822,5,,1433,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14407,1552871857,7,,1026,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-140.00000000,840.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14408,1552871883,6,,1111,0.00000000,1,0.00000000,0.00000000,6.54432277,领取红包,6.54432277,-6.54432277,0.00000000,);
INSERT INTO `clt_log` VALUES (14409,1552871883,7,,1111,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27216139,3.27216139,0.00000000,);
INSERT INTO `clt_log` VALUES (14410,1552871972,6,,1181,0.00000000,1,0.00000000,13.12800000,36.93878700,领取红包,50.06678700,-50.06678700,0.00000000,);
INSERT INTO `clt_log` VALUES (14411,1552871972,7,,1181,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-25.03339350,25.03339350,0.00000000,);
INSERT INTO `clt_log` VALUES (14412,1552872031,6,,1086,0.00000000,1,0.00000000,36.69551852,533.71574436,领取红包,570.41126288,-570.41126288,0.00000000,);
INSERT INTO `clt_log` VALUES (14413,1552872031,7,,1086,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-285.20563144,285.20563144,0.00000000,);
INSERT INTO `clt_log` VALUES (14414,1552872056,7,,1086,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-285.20000000,1711.20000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14415,1552872384,6,,1382,0.00000000,1,0.00000000,1050.52800000,529.19210400,领取红包,1579.72010400,-1579.72010400,0.00000000,);
INSERT INTO `clt_log` VALUES (14416,1552872384,7,,1382,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-789.86005200,789.86005200,0.00000000,);
INSERT INTO `clt_log` VALUES (14417,1552872472,6,,1403,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14418,1552872472,7,,1403,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14419,1552872478,1,,1434,100.00000000,1,0.00000000,0.00000000,0.00000000,充值USDT,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14420,1552872478,2,,1434,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14421,1552872478,5,,1434,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14422,1552872775,2,,1435,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14423,1552872931,2,,1436,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14424,1552873710,6,,1277,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14425,1552873710,7,,1277,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14426,1552873887,5,,1216,-500.00000000,1,0.00000000,0.00000000,0.00000000,升级至V2,0.00000000,12250.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14427,1552874680,6,,1318,0.00000000,1,0.00000000,0.00000000,528.07610400,领取红包,528.07610400,-528.07610400,0.00000000,);
INSERT INTO `clt_log` VALUES (14428,1552874680,7,,1318,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-264.03805200,264.03805200,0.00000000,);
INSERT INTO `clt_log` VALUES (14429,1552874711,7,,1318,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-320.00000000,1920.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14430,1552874867,2,,1437,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14431,1552875104,6,,1299,0.00000000,1,0.00000000,0.00000000,6.56400000,领取红包,6.56400000,-6.56400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14432,1552875104,7,,1299,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.28200000,3.28200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14433,1552875447,6,,1210,0.00000000,1,0.00000000,19.69200000,36.92894100,领取红包,56.62094100,-56.62094100,0.00000000,);
INSERT INTO `clt_log` VALUES (14434,1552875447,7,,1210,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-28.31047050,28.31047050,0.00000000,);
INSERT INTO `clt_log` VALUES (14435,1552876493,2,,1438,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14436,1552876637,2,,1439,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14437,1552876754,6,,1383,0.00000000,1,0.00000000,532.68820800,532.68820800,领取红包,1065.37641600,-1065.37641600,0.00000000,);
INSERT INTO `clt_log` VALUES (14438,1552876754,7,,1383,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-532.68820800,532.68820800,0.00000000,);
INSERT INTO `clt_log` VALUES (14439,1552876833,7,,1383,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-500.00000000,3000.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14440,1552877331,6,,1082,0.00000000,1,0.00000000,65.63015400,534.11128800,领取红包,599.74144200,-599.74144200,0.00000000,);
INSERT INTO `clt_log` VALUES (14441,1552877331,7,,1082,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-299.87072100,299.87072100,0.00000000,);
INSERT INTO `clt_log` VALUES (14442,1552877379,7,,1082,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-300.00000000,1800.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14443,1552877965,10,,1067,-10.00000000,1,0.00000000,0.00000000,0.00000000,购买激活码1个,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14444,1552877971,6,,1085,0.00000000,1,0.00000000,323.89534080,538.00378163,领取红包,861.89912243,-861.89912243,0.00000000,);
INSERT INTO `clt_log` VALUES (14445,1552877971,7,,1085,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-430.94956122,430.94956122,0.00000000,);
INSERT INTO `clt_log` VALUES (14446,1552877989,5,,1067,0.00000000,1,0.00000000,0.00000000,0.00000000,使用激活码：RDJMYE激活帐号,0.00000000,0.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14447,1552877990,7,,1085,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-430.95500000,2585.73000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14448,1552878018,5,,1067,-100.00000000,1,0.00000000,0.00000000,0.00000000,升级至V1,0.00000000,2100.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14449,1552878071,6,,1083,0.00000000,1,0.00000000,1744.04759916,559.08462186,领取红包,2303.13222102,-2303.13222102,0.00000000,);
INSERT INTO `clt_log` VALUES (14450,1552878071,7,,1083,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1151.56611051,1151.56611051,0.00000000,);
INSERT INTO `clt_log` VALUES (14451,1552878130,7,,1083,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1151.57500000,6909.45000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14452,1552878286,6,,1212,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14453,1552878286,7,,1212,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14454,1552878336,7,,1035,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-286.00000000,1716.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14455,1552878358,6,,1084,0.00000000,1,0.00000000,0.00000000,533.17243883,领取红包,533.17243883,-533.17243883,0.00000000,);
INSERT INTO `clt_log` VALUES (14456,1552878358,7,,1084,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-266.58621942,266.58621942,0.00000000,);
INSERT INTO `clt_log` VALUES (14457,1552878395,7,,1084,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-266.58990000,1599.53940000,0.00000000,);
INSERT INTO `clt_log` VALUES (14458,1552878409,6,,1276,0.00000000,1,0.00000000,13.08861600,6.54430800,领取红包,19.63292400,-19.63292400,0.00000000,);
INSERT INTO `clt_log` VALUES (14459,1552878409,7,,1276,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-9.81646200,9.81646200,0.00000000,);
INSERT INTO `clt_log` VALUES (14460,1552878507,6,,1345,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14461,1552878507,7,,1345,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14462,1552878981,2,,1440,0.00000000,1,0.00000000,0.00000000,0.00000000,注册赠送NMCT资产,0.00000000,88.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14463,1552879536,6,,1125,0.00000000,1,0.00000000,0.00000000,6.55415400,领取红包,6.55415400,-6.55415400,0.00000000,);
INSERT INTO `clt_log` VALUES (14464,1552879536,7,,1125,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-3.27707700,3.27707700,0.00000000,);
INSERT INTO `clt_log` VALUES (14465,1552879537,6,,1042,0.00000000,1,0.00000000,3281.14571520,567.90510058,领取红包,3849.05081578,-3849.05081578,0.00000000,);
INSERT INTO `clt_log` VALUES (14466,1552879537,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1924.52540789,1924.52540789,0.00000000,);
INSERT INTO `clt_log` VALUES (14467,1552879555,6,,1416,0.00000000,1,0.00000000,0.00000000,525.26400000,领取红包,525.26400000,-525.26400000,0.00000000,);
INSERT INTO `clt_log` VALUES (14468,1552879555,7,,1416,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-262.63200000,262.63200000,0.00000000,);
INSERT INTO `clt_log` VALUES (14469,1552879573,7,,1042,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1920.00000000,11520.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14470,1552879648,6,,1033,0.00000000,1,0.00000000,1838.47741606,571.30564223,领取红包,2409.78305829,-2409.78305829,0.00000000,);
INSERT INTO `clt_log` VALUES (14471,1552879648,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-1204.89152915,1204.89152915,0.00000000,);
INSERT INTO `clt_log` VALUES (14472,1552879670,7,,1416,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-262.00000000,1572.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14473,1552879673,7,,1033,0.00000000,1,0.00000000,0.00000000,0.00000000,NMCT通证复投NMCT资产,-1200.00000000,7200.00000000,0.00000000,);
INSERT INTO `clt_log` VALUES (14474,1552879741,6,,1156,0.00000000,1,0.00000000,0.00000000,36.95847900,领取红包,36.95847900,-36.95847900,0.00000000,);
INSERT INTO `clt_log` VALUES (14475,1552879741,7,,1156,0.00000000,1,0.00000000,0.00000000,0.00000000,红包复投,-18.47923950,18.47923950,0.00000000,);
--
-- 表的结构 `clt_module`
-- 
DROP TABLE IF EXISTS `clt_module`;
CREATE TABLE `clt_module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listfields` varchar(255) NOT NULL DEFAULT '',
  `setup` text NOT NULL,
  `listorder` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_module`表中的数据 `clt_module`
--
INSERT INTO `clt_module` VALUES (1,单页模型,page,单页面,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (2,文章模型,article,新闻文章,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (3,图片模型,picture,图片展示,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (4,产品模型,product,产品展示,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (5,下载模型,download,文件下载,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (6,团队模型,team,员工展示,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (7,购买的产品,my_buy,,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (8,返还计划,restoration_log,,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (9,产品,goods,,1,0,*,,0,1);
INSERT INTO `clt_module` VALUES (10,加速宝,jsb,,1,0,*,,0,1);
--
-- 表的结构 `clt_posid`
-- 
DROP TABLE IF EXISTS `clt_posid`;
CREATE TABLE `clt_posid` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `listorder` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_posid`表中的数据 `clt_posid`
--
INSERT INTO `clt_posid` VALUES (1,首页推荐,0);
INSERT INTO `clt_posid` VALUES (2,当前分类推荐,0);
--
-- 表的结构 `clt_price`
-- 
DROP TABLE IF EXISTS `clt_price`;
CREATE TABLE `clt_price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` varchar(20) DEFAULT NULL,
  `rq` varchar(50) DEFAULT NULL,
  `price` decimal(20,8) DEFAULT NULL,
  `zf` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
--
-- 表的结构 `clt_qkl`
-- 
DROP TABLE IF EXISTS `clt_qkl`;
CREATE TABLE `clt_qkl` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `type_id` tinyint(5) NOT NULL DEFAULT '0' COMMENT '所属位置',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=审核  0=未审核',
  `content` text COMMENT '广告内容',
  `time` int(22) NOT NULL,
  `dm` varchar(20) DEFAULT NULL,
  `zf1` decimal(10,2) DEFAULT NULL,
  `zf2` decimal(10,2) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `zf` decimal(10,2) DEFAULT '0.00',
  `jyl` varchar(10) DEFAULT NULL,
  `jrjyl` varchar(10) DEFAULT NULL,
  `sjk_zd` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `plug_ad_adtypeid` (`type_id`),
  KEY `open` (`open`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_qkl`表中的数据 `clt_qkl`
--
INSERT INTO `clt_qkl` VALUES (49,XMT,0,/uploads/20180710/5d297922e5d9ab6eab1a82f7888ae13b.png,1531213248,50,1,11,1535443488,XMT,0.01,0.02,1.37,0.01,10000,1868,XMT);
--
-- 表的结构 `clt_role`
-- 
DROP TABLE IF EXISTS `clt_role`;
CREATE TABLE `clt_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_role`表中的数据 `clt_role`
--
INSERT INTO `clt_role` VALUES (1,超级管理员,1,超级管理,0,0);
INSERT INTO `clt_role` VALUES (2,普通管理员,1,普通管理员,0,0);
INSERT INTO `clt_role` VALUES (3,注册用户,1,注册用户,0,0);
INSERT INTO `clt_role` VALUES (4,游客,1,游客,0,0);
--
-- 表的结构 `clt_system`
-- 
DROP TABLE IF EXISTS `clt_system`;
CREATE TABLE `clt_system` (
  `id` int(36) unsigned NOT NULL,
  `name` char(36) NOT NULL DEFAULT '',
  `url` varchar(36) NOT NULL DEFAULT '',
  `title` varchar(200) NOT NULL,
  `key` varchar(200) NOT NULL,
  `des` varchar(200) NOT NULL,
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo',
  `jf` int(10) DEFAULT NULL,
  `dj` decimal(10,3) DEFAULT NULL,
  `jg` decimal(20,2) DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `zf` decimal(20,2) DEFAULT NULL,
  `z_reward` decimal(10,2) DEFAULT '0.00',
  `g_reward` varchar(10) DEFAULT '0',
  `number` int(10) DEFAULT '0',
  `money_xmt` varchar(10) DEFAULT NULL,
  `mod1_jd` int(10) DEFAULT '0',
  `mod2` int(10) DEFAULT '0' COMMENT '六六无尽激活',
  `mod2_jd` int(10) DEFAULT '0',
  `mod3` int(10) DEFAULT '0' COMMENT '九九归一激活',
  `mod3_gx` decimal(10,2) DEFAULT '0.00',
  `dj_sf` varchar(255) DEFAULT NULL,
  `zf1` varchar(20) NOT NULL DEFAULT '0',
  `zf2` varchar(20) NOT NULL DEFAULT '0',
  `money_nmct` varchar(20) DEFAULT '0.1429',
  `usdt_addres` varchar(50) DEFAULT NULL,
  `jy` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_system`表中的数据 `clt_system`
--
INSERT INTO `clt_system` VALUES (1,XMT,http://xmt.yp173.com,XMT,XMT,XMT,XMT,2015-2020,111111111,18792402229333,111111111111111@qq.com,/uploads/20181203/1b78169a4958ec497371d357e7aba358.jpg,19,0.010,0.00,1531213616,0.00,0.12,0.035,100,0.4287,6,1200,60,2000,0.09,0.06,0.06,0.06,0.10,0.10,0.10,0.12,0.12,0.12,0.16,0,0,0.1429,1nFVLbfpjBES19qHr6uxC4EXjMgEFQfsK,0);
--
-- 表的结构 `clt_user_g`
-- 
DROP TABLE IF EXISTS `clt_user_g`;
CREATE TABLE `clt_user_g` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `money` int(10) NOT NULL,
  `type` int(10) DEFAULT '1',
  `multiple` varchar(10) DEFAULT NULL,
  `num` int(3) DEFAULT '1',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_user_g`表中的数据 `clt_user_g`
--
INSERT INTO `clt_user_g` VALUES (1,G1初级合伙人,1,500000,1,0.05,3);
INSERT INTO `clt_user_g` VALUES (2,G2中级合伙人,2,500000,1,0.1,3);
INSERT INTO `clt_user_g` VALUES (3,G3高级合伙人,3,500000,1,0.15,3);
INSERT INTO `clt_user_g` VALUES (4,超级合伙人,4,500000,1,0.2,3);
--
-- 表的结构 `clt_user_level`
-- 
DROP TABLE IF EXISTS `clt_user_level`;
CREATE TABLE `clt_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `money` int(10) NOT NULL,
  `type` int(10) DEFAULT '1',
  `multiple` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_user_level`表中的数据 `clt_user_level`
--
INSERT INTO `clt_user_level` VALUES (1,V0,1,0,1,0);
INSERT INTO `clt_user_level` VALUES (2,V1,2,100,1,3);
INSERT INTO `clt_user_level` VALUES (3,V2,3,500,1,3.5);
INSERT INTO `clt_user_level` VALUES (4,V3,4,1000,1,4);
INSERT INTO `clt_user_level` VALUES (5,V4,5,3000,1,4.5);
INSERT INTO `clt_user_level` VALUES (6,V5,6,5000,1,5);
--
-- 表的结构 `clt_users`
-- 
DROP TABLE IF EXISTS `clt_users`;
CREATE TABLE `clt_users` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `password` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) CHARACTER SET utf8 DEFAULT '' COMMENT '最后登录ip',
  `mobile` char(11) CHARACTER SET utf8 DEFAULT '' COMMENT '手机号码',
  `nickname` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '第三方返回昵称',
  `level` int(1) DEFAULT '1' COMMENT '会员等级',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `token` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `xm` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `rq` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `aqmm` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `sfz` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `fxid` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '上级ID',
  `all_fxid` varchar(225) CHARACTER SET utf8 DEFAULT '',
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `money_usdt` decimal(20,8) DEFAULT '0.00000000',
  `money_cz` decimal(20,8) DEFAULT '0.00000000' COMMENT '充值usdt总数',
  `xmt` decimal(20,8) DEFAULT '0.00000000',
  `nmct_dj` decimal(20,8) DEFAULT '0.00000000' COMMENT '冻结资产',
  `pw_time` int(20) DEFAULT '0',
  `nmct` decimal(20,8) DEFAULT '0.00000000' COMMENT '可用资产',
  `head_pic` varchar(225) DEFAULT NULL,
  `pass` int(1) DEFAULT '0' COMMENT '是否激活账户',
  `isonline` int(1) NOT NULL DEFAULT '0' COMMENT '登入状态',
  `g` int(1) DEFAULT '0',
  `hongbao` decimal(20,8) DEFAULT '0.00000000' COMMENT '静态红包',
  `token_address` varchar(225) DEFAULT NULL,
  `zs` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`) ,
  KEY `mobile` (`mobile`) ,
  KEY `level` (`level`) 
) ENGINE=InnoDB AUTO_INCREMENT=1441 DEFAULT CHARSET=latin1;

-- 
-- 导出`clt_users`表中的数据 `clt_users`
--
INSERT INTO `clt_users` VALUES (1000,7e12bd3344f78e795abea0835c530331,1552120768,1552838247,111.221.144.57,110,哈哈,2,0,b05ddb8ab4c1ba73b77d3e3e071bdf31,系统,2019-03-09,,,,,919320213@qq.com,100000.00000000,100100.00000000,0.00000000,2148.17835545,0,39.82164457,,1,1,0,6.44453507,,0);
INSERT INTO `clt_users` VALUES (1013,59007aab1430f1067055f54387ab261c,1552562031,1552782140,111.221.144.57,18354804888,叶子,6,0,6ab8695776199ab93120195049aebfa6,宋伟,2019-03-14,,,1000,1000,604680736@qq.com,0.00000000,5000.00000000,0.00000000,271272.14570354,0,0.85429647,/uploads/20190314/17767edad61d5cec343875a61fcc4502.jpeg,1,1,0,813.81643711,,0);
INSERT INTO `clt_users` VALUES (1014,0fff9803ca89a58ecce6304306047592,1552562108,1552871040,47.34.233.218,17840999696,张磊,6,0,915ddcfb3a0716f5a5042c4da7f1fc2c,张磊,2019-03-14,5660f950c95f3bed8334ef392724511d,,1013,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1015,6803b9e52e8ce8933c80e5bbbf190fb6,1552562148,1552573741,223.104.63.178,13790582368,周海容,6,0,7abf9bca1047261713105fd1a9e537a8,周海容,2019-03-14,,,1013,1013,1000,,0.00000000,5000.00000000,0.00000000,203029.64485812,0,58.35514190,,1,1,0,609.08893457,,0);
INSERT INTO `clt_users` VALUES (1016,4607c4aa4882b114935cc4b4fd73ff8d,1552562190,1552666475,223.104.246.91,13736233236,何辉,6,0,09f9e3e2019b83e32bc9f537625e5e58,何辉,2019-03-14,,,1013,1013,1000,,0.00000000,5000.00000000,0.00000000,170379.62574650,0,4708.37425350,,1,1,0,511.13887724,,1);
INSERT INTO `clt_users` VALUES (1017,8b086dcd5082af3df57f67f9c72b02e4,1552562223,1552716891,14.30.36.205,18924100006,mike,6,0,0bea39bef67833b1f15d33708263906d,mike,2019-03-14,8513425211ba3ffe5ff619aec3dbfc76,,1013,1013,1000,,0.00000000,5000.00000000,0.00000000,214197.51253835,0,0.48746166,,1,1,0,602.81100643,,1);
INSERT INTO `clt_users` VALUES (1018,1ea9a312a2fe418a2d498cfe3c744613,1552562259,1552836713,223.16.17.79,13714322383,周千雅,6,0,e50aaa243df15626b85a86a67530a3df,周千雅,2019-03-14,,,1015,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,189100.71558017,0,1887.28441984,,1,1,0,572.95256177,,0);
INSERT INTO `clt_users` VALUES (1019,50864c46efd19b9351443050d8193198,1552562322,1552712183,117.136.79.160,13587810485,陈福灶,6,0,bb61cd10dba02c7304b6a90c7616b61a,陈福灶,2019-03-14,,,1014,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,174253.37301228,0,834.62698772,,1,1,0,524.01074695,,1);
INSERT INTO `clt_users` VALUES (1020,5f84c326c8db23ff85502d8cd995088b,1552562352,1552838749,111.221.144.57,17665487856,开心哥哥,6,0,33be495ca1ff36f490ad8bc2af566470,尹长江,2019-03-14,,,1014,1014,1013,1000,364820462@qq.com,0.00000000,5000.00000000,0.00000000,180337.47200000,0,0.52800000,,1,1,0,541.01241600,,1);
INSERT INTO `clt_users` VALUES (1021,18c4c2afd12eb7bbf138642536836c35,1552562387,1552842801,111.221.144.57,13356878921,开心哥,6,0,9a3b2fb72825164abe43e3d32f5e5155,尹双江,2019-03-14,,,1020,1020,1014,1013,1000,529111478@qq.com,0.00000000,5000.00000000,0.00000000,209583.96094676,0,4.03905326,,1,1,0,628.75188284,,1);
INSERT INTO `clt_users` VALUES (1022,4939af97049f9ab1ab2c2c151ad64f67,1552562532,1552567471,111.221.144.57,18565559961,梁钇淞,6,0,8e451e5b9aee5be0b351d50c5ca594db,梁剑平,2019-03-14,788d2f91ccda3d9b06437dfd3ad06357,,1013,1013,1000,18565559961@163.com,0.00000000,5000.00000000,0.00000000,180497.79405867,0,0.20594134,,1,1,0,537.35110083,0x51637635435931fADBBae8fD3D16CC993AC61Cb6,0);
INSERT INTO `clt_users` VALUES (1023,548bc4b1e7cd4ae5b98b30e34009922c,1552562623,1552831741,223.12.175.177,13393436316,曹国素,6,0,d409a5f6491ebb9f197a883473e5c75c,曹国素,2019-03-14,,,1021,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,187862.07107369,0,0.92892631,,1,1,0,563.58621322,,1);
INSERT INTO `clt_users` VALUES (1024,4329e801221590967a4b92bf791e9259,1552562710,1552832258,223.12.175.177,15935139712,曹珊珊,6,0,6897fc95859d0d205196f580034bacdc,曹珊珊,2019-03-14,,,1023,1023,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,183084.85779862,0,0.14220138,,1,1,0,549.25457340,,1);
INSERT INTO `clt_users` VALUES (1025,7f6e55432c8d82d848fb39ede60dab4a,1552562769,1552637515,223.12.172.236,15235833350,李国康,6,0,882999bfd153c470d1f3bb546d83404c,李国康,2019-03-14,,,1023,1023,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1026,e5c75e779187dd183adf4b2bdc6ba3b2,1552562819,1552871778,113.118.215.27,15525038338,世缘,6,0,d41b2cd48ccdea5f178ca11aa17badd7,世缘,2019-03-14,,,1024,1024,1023,1021,1020,1014,1013,1000,daiqiliang@163.com,0.00000000,5000.00000000,0.00000000,193024.18439488,0,1263.81560514,,1,1,0,580.59179426,,1);
INSERT INTO `clt_users` VALUES (1027,d3ea8fe0b19b69d8c8230d6f68c5d9cc,1552562859,1552790687,113.118.215.27,18603467701,金錢豹,6,0,85ecb9ba69b9708e18de15accf919a30,代起亮,2019-03-14,,,1026,1026,1024,1023,1021,1020,1014,1013,1000,daiqiliang888@163.com,0.00000000,5000.00000000,0.00000000,200178.65007421,0,59.34992581,,1,1,0,579.10413232,,1);
INSERT INTO `clt_users` VALUES (1028,5d3e577766b95a1c5d89f77ba2463652,1552562907,1552639952,220.158.151.24,15694329931,老二爷,6,0,7fc7d498b9aa9b69dd0f2ad45a1651e7,jy2277,2019-03-14,7ba90cb4722f26cbfb44dd423593f52e,,1027,1027,1026,1024,1023,1021,1020,1014,1013,1000,jingyao888@126.com,0.00000000,5000.00000000,0.00000000,179052.18779008,0,0.81220992,,1,1,0,537.15656337,,1);
INSERT INTO `clt_users` VALUES (1029,2c35d307a15d51b31aabd72666bd3ee2,1552562964,1552654025,183.13.205.79,18513595501,孟华英,6,0,363e91e110ee76352dc218f3ce178209,孟华英,2019-03-14,,,1027,1027,1026,1024,1023,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,175592.42757816,0,795.57242185,,1,1,0,527.56863569,,1);
INSERT INTO `clt_users` VALUES (1030,11d5530c73cd398359e025cf8fe92bcf,1552563051,1552624362,223.104.3.181,13581963292,钱淇,6,0,ba6f181d61446856778a86f48e49cd4b,钱淇,2019-03-14,,,1027,1027,1026,1024,1023,1021,1020,1014,1013,1000,125852008@qq.com,0.00000000,5000.00000000,0.00000000,179056.57202261,0,0.08797739,,1,1,0,537.16971607,,1);
INSERT INTO `clt_users` VALUES (1031,e453aa5911601282ed2abe3df7d4f8b9,1552563087,0,112.97.57.48,15318509168,王书云,6,0,0e4b7b173916e13d90060add354e0ae5,王书云,2019-03-14,,,1026,1026,1024,1023,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1032,48520a6d1bf41d32815e8a4f930140ba,1552563147,0,112.97.57.48,13631504259,刘璐,6,0,66fbde5a059b5eed6b880123ec4aa786,刘璐,2019-03-14,,,1026,1026,1024,1023,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1033,34c9f980f7ffdf66e212cb877bddb370,1552563188,1552879638,183.39.56.177,18025357676,肖剑,6,0,09774211eb65655e2566bafa8992f7c6,肖剑,2019-03-14,1e85f1a87e21f1b0b6dc1fccd87aef86,,1017,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,196430.32254779,0,7.67745223,,1,1,0,571.30564223,,1);
INSERT INTO `clt_users` VALUES (1034,a8e7189365f51810e9ef78256ed4245c,1552563272,1552876681,113.129.94.251,15314355988,王兴国,6,0,db3015b79d912a0a82d08024726bd064,王兴国,2019-03-14,,,1016,1016,1013,1000,,0.00000000,5000.00000000,0.00000000,173990.45340468,0,1097.54659532,/uploads/20190314/26ff0a0c03c18d62919af58ca01c2e3b.jpg,1,1,0,522.82475457,,1);
INSERT INTO `clt_users` VALUES (1035,1d0791e02d5860fc7cea2cfd0490385e,1552563320,1552879673,111.41.213.158,18746915474,小新,6,0,fcce116f20f0a854828447c949af9eb9,徐诗展,2019-03-14,13844d2f603ece4be7d6a95e8fbe95f4,,1016,1016,1013,1000,309788237@qq.com,0.00000000,5000.00000000,33.33333333,179977.01915900,0,0.98084100,,1,1,0,534.78305748,,1);
INSERT INTO `clt_users` VALUES (1036,9bbe9ab5ef281111f7533d1afad7fc78,1552563353,1552863894,58.222.50.196,13371599676,胡安明,6,0,e049b995bf8de9faded0d6bc9ad9436e,胡安明,2019-03-14,,,1016,1016,1013,1000,,0.00000000,5000.00000000,0.00000000,174039.83332520,0,1048.16667480,,1,1,0,522.90385576,,1);
INSERT INTO `clt_users` VALUES (1037,c1242bf06010c99b6e0b77fe577801be,1552563442,1552567489,112.227.157.241,13153356188,韩玉斐,6,0,2f5dc0c113d8c46a1b056db94423a5fe,韩玉斐,2019-03-14,,,1016,1016,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1038,72ff5b8d198dae88c3cc9240f2bf0c10,1552563488,0,112.97.57.48,13808946939,邱萍,6,0,fc5016755df950a6013bf6e325901a5b,邱萍,2019-03-14,,,1016,1016,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1039,d424e0d6636653d003b2c0dc96261781,1552563556,0,112.97.57.48,13922525853,张杨,6,0,0fba122a746c4b2fd1fac352d1bcf850,张杨,2019-03-14,,,1013,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1040,d77a7f76cf5106644fc08143e594c4fe,1552563638,1552840011,111.221.144.57,13267118521,小雨,6,0,bd1ae32365bb784221a51ad4c1345372,小雨,2019-03-14,dd6e5e5918e94d997c686fcebc56922f,,1013,1013,1000,,0.00000000,5000.00000000,0.00000000,188107.42660160,0,0.57339840,,1,1,0,564.32227980,,1);
INSERT INTO `clt_users` VALUES (1041,becb8e8b2becebaff086576980638a02,1552563754,1552640059,183.39.11.106,18929324311,宋勇,6,0,ebe270d1b07a95c7b98d95567fb043ae,宋勇,2019-03-14,,,1033,1033,1017,1013,1000,18929324311@163.com,0.00000000,5000.00000000,0.00000000,177365.19796922,0,1722.80203079,,1,1,0,532.09559391,,1);
INSERT INTO `clt_users` VALUES (1042,31d8208a2a1b739a6e66470bbbea232f,1552563785,1552879517,183.39.56.177,18175132817,李芬,6,0,4e012615fdcf88017015fd3f7315b298,李芬,2019-03-14,,,1033,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,198897.17478411,0,5.82521589,,1,1,0,567.90510058,,1);
INSERT INTO `clt_users` VALUES (1043,0e15b3705f928c5b9d09df3b43ce5e17,1552563829,1552821937,117.188.10.5,18798873985,吕萍,6,0,f101a522773f4ce1a90a768597a5c88e,吕萍,2019-03-14,,,1041,1041,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,173520.46199850,0,1567.53800151,,1,1,0,520.56138600,,1);
INSERT INTO `clt_users` VALUES (1044,799e61c78b7f6ecdb11cfd32860a8de5,1552563863,1552641015,123.147.250.63,13060225510,张林,6,0,a641d07be9064d2cbb855082841a9bd0,张林,2019-03-14,,,1041,1041,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,523.68938984,,1);
INSERT INTO `clt_users` VALUES (1045,f1bf2cb5b87b73ca1fb5f4757c06dffa,1552563912,1552821882,117.188.10.5,13511951437,杨通洲,6,0,b57c70bad026167c8387a1a45202dbcb,杨通洲,2019-03-14,,,1043,1043,1041,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,171177.99223475,0,3910.00776525,,1,1,0,513.53397670,,1);
INSERT INTO `clt_users` VALUES (1046,6ffb8e7cdb57c0f3fa7089e3eaac6796,1552564032,1552740440,117.188.10.5,13595512540,魏起猛,6,0,fbc309d013f3dd944c9019b5e757b661,魏起猛,2019-03-14,,,1045,1045,1043,1041,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,523.68938984,,1);
INSERT INTO `clt_users` VALUES (1047,48426166b576a22a2a9fa5bbb5d3384b,1552564070,1552740612,117.188.10.5,18581533953,李丽芳,6,0,dd93ddd453e6db6c5697b3d91145e399,李丽芳,2019-03-14,,,1045,1045,1043,1041,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,523.68938984,,1);
INSERT INTO `clt_users` VALUES (1048,364cbcd7882efcf9700cab7714be2b93,1552564160,1552740109,117.188.10.5,13760385675,尹艳文,6,0,c3f171af5cf4a8ebc555e3af2ad7b6b6,尹艳文,2019-03-14,,,1045,1045,1043,1041,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,174825.36800000,0,262.63200000,,1,1,0,524.47610400,,1);
INSERT INTO `clt_users` VALUES (1049,79d8c02d95be51a7d900b63340096d5e,1552564208,1552740287,117.188.10.5,13885772070,陈麒任,6,0,35537f9083077ad8367912e351151604,陈麒任,2019-03-14,,,1045,1045,1043,1041,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,523.68938984,,1);
INSERT INTO `clt_users` VALUES (1050,3e0f93151538dde5ea3ac8e04acc172d,1552564434,1552727890,117.136.40.181,13925246748,汪秋胜,6,0,ba6c25f2e59300cb5d8e69d9ff1d2b27,汪秋胜,2019-03-14,,,1042,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1052,b3b8faa5445e0403be87b035e10406a6,1552569761,1552873795,111.221.144.57,15194168949,abbar,1,0,b2d5abcf098adc5ba2397e0535b96c9c,abbar,2019-03-14,,,1000,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1053,1dd151465f7c3bcbf113a55f5868fd48,1552613142,1552613525,171.12.98.245,18937226377,乐乐,1,0,6e3e8ec58bd8f8a5da2977e58b80b375,,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,/uploads/20190315/39ce281e76c8083b6b3b567583c723a1.jpg,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1054,9a797a186f8650f11e76078d91aa3598,1552613334,1552613334,221.192.180.112,15612385165,迪8喝9玩10尚,1,0,6ee60b999e9aab2fc16ba87978759b37,,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,/uploads/20190315/e395510982135a35359c6e6bb52aecda.jpg,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1055,f602d6ee3f32787c0c1d5809c86f32d5,1552613695,1552878937,1.27.45.60,13722142118,海阔天高,3,0,3566f546acbcc6545c8eb4767d348815,海阔天高,2019-03-15,db38c583886ee9346d1f4a5ab171cb27,,1035,1035,1016,1013,1000,,0.00000000,500.00000000,0.00000000,12282.56223986,0,55.43776014,,1,1,0,36.90304128,,0);
INSERT INTO `clt_users` VALUES (1056,c5e7ac22d50d40e2389219c9a38a322c,1552613904,1552660145,118.144.141.150,17710341124,蜡笔小新,1,0,774241a21f22ad154e81a7df543fb167,,2019-03-15,,,1054,1054,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1057,9bb8bebc017e1e864b211131fe479baa,1552615301,1552723428,117.136.7.249,15846229267,稳稳的幸福,1,0,170b67a9db419f0ec97a6cd991cc32c5,,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1058,17f856b7fae881c176fe13d44d83c70d,1552622330,1552647571,27.225.102.240,13853381745,冯英,1,0,d0e4586b0344881ab976696fbad619ac,,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1059,874d8d27d748c108b1f7c19174bcc098,1552626946,1552873484,223.104.109.128,18895703000,高景芹,6,0,14de9010de003f2a81932edbefee5dfe,高景芹,2019-03-15,,,1017,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,179037.29189600,0,0.70810400,,1,1,0,531.89187569,,1);
INSERT INTO `clt_users` VALUES (1060,aad834802e3f7e104610457a661356e6,1552627032,1552643281,223.104.56.95,15214177778,牧马人,1,0,63e6a070cc65126089d6b00003e22c68,,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1061,bce5c489d0eab05338f738049c0ba34a,1552627059,1552803456,113.123.103.130,15254340356,李小燕,2,0,675ffd66abb3cb6e1a003bce4406f590,,2019-03-15,,,1034,1034,1016,1013,1000,,0.00000000,100.00000000,0.00000000,2165.10467938,0,22.89532062,,1,1,0,6.52467508,,0);
INSERT INTO `clt_users` VALUES (1062,15cac47043588a1c881f086505b1c5c2,1552627116,1552778171,112.36.11.66,18763080078,王新华,1,0,aeb75726c84158e2f7b8974eff66d2cb,,2019-03-15,,,1034,1034,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1063,6aeea9929bfac3940162f549a9643bc0,1552630327,1552719248,117.181.225.44,18507793005,那被甩了一耳光的梦,2,0,bcc7aa01bd30e040cd7ece79cc4134ba,那被甩了一耳光的梦,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1064,2b2bff4b5ed7eb2497676aef639ab344,1552630346,1552631584,117.136.37.3,13562330041,王凤华,1,0,5a528512edc19e284a4f44e1d892cb8b,,2019-03-15,,,1062,1062,1034,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1065,2606e9cd3c044bb0f0682b668f16a968,1552630499,1552860646,219.150.131.100,13605573553,王斌,2,0,7aa682bfc1b618bbf7595192521b4f5b,王斌,2019-03-15,,,1059,1059,1017,1013,1000,12521932577@qq.com,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1066,c6644959c924ea763eb1d6dcfa9cfc4d,1552631524,1552875876,117.136.22.57,15055818533,韩祥芝,2,0,6a96abed6c5e00414480bbbeaccd78fa,,2019-03-15,,,1059,1059,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2180.77960000,0,7.22040000,/uploads/20190318/cb2f2e990118f4b612fbd51894d5065c.jpg,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1067,d4828d75e68d2639d09c8d6a88d6e142,1552632012,1552876766,219.150.131.100,13655671655,施影,2,0,e2ac98b73c39f36fc87c9e6093dc639b,,2019-03-15,,,1066,1066,1059,1017,1013,1000,,0.00000000,110.00000000,0.00000000,2188.00000000,0,0.00000000,,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1068,e1637ebb3fecfa6ca24a3c066ee5ad8f,1552632186,1552632186,223.104.33.181,18726788155,施颖,1,0,074f7b86cde66bdc93314143fec99e36,,2019-03-15,,,1067,1067,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1069,0775d922b93db459f9d067f7d1d9a654,1552632349,1552632349,223.104.33.181,15240109779,房庆,1,0,bb1ae63e1d358026df80ce55fee03b32,,2019-03-15,,,1068,1068,1067,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1070,f6acdf8dffd3a214cf5afd9bf847103c,1552632522,1552633088,101.70.128.39,15556956658,梅芳,1,0,fce8307d40fb109c10a176661cb2628e,,2019-03-15,,,1069,1069,1068,1067,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1071,c4296fad68f999ed31cc4f430060943a,1552632730,1552634438,223.104.35.142,13655681975,李玲,1,0,e36e3acaa157dee634d9875db396ce85,,2019-03-15,,,1068,1068,1067,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1072,4b3e81e0c9c7e1aec01e8aac62628a1e,1552633271,1552633271,223.104.33.181,15955671688,孙影,1,0,ccf90b6703ccae1fd5d12e019f73f681,,2019-03-15,,,1068,1068,1067,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1073,ec3b712dcde9f9df2e37a4fa64366ccc,1552633383,1552633383,223.104.33.181,13956827984,牛家朋,1,0,2780f059ffe103e72f53e413a6274dc5,,2019-03-15,,,1068,1068,1067,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1074,e2c68c19b8bd34b6bd65dae6f9835657,1552634798,1552874893,117.136.106.135,15805676967,孙再飞,2,0,2beee06e1de89cf65befe96dd11bd5d7,,2019-03-15,,,1066,1066,1059,1017,1013,1000,,0.00000000,200.00000000,0.00000000,2180.12320000,0,7.87680000,/uploads/20190318/2b31005bafd817bcc529289bda6b7d14.jpg,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1075,71662a12b7109e9bded434eb9f432195,1552635034,1552635034,117.136.117.34,13956826489,刘允华,1,0,4c0e16c3d5f727521d1302e8294b9283,,2019-03-15,,,1069,1069,1068,1067,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1076,0a4de663307ad8e1557574129cfb2b88,1552635819,1552636110,117.181.229.95,18277930573,赵云成,1,0,5172ecfa8b6d44c2921018c2207a7315,,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1077,29269185324758d4ed9e73adaf0e2b8e,1552638202,1552638836,112.36.8.93,13561522613,陈莎莎,2,0,8498f670bf042818d51215cc5927bc11,,2019-03-15,,,1061,1061,1034,1016,1013,1000,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1078,5adaa663226ff2d7210744ee2f431729,1552641007,1552641007,112.60.1.124,13926194272,范珈闻,1,0,7681460f0cd4711965d6e3088848b0c1,,2019-03-15,,,1022,1022,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1079,cbbc2fc9eeed25afb03b57efa99ed578,1552643623,1552643623,223.104.56.95,13993570822,mumaren,1,0,1b6343e687532a985a9a95bb65a1ae82,,2019-03-15,,,1060,1060,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1080,ce6db9ee0baefd010c5c405d616fc556,1552647291,1552647291,220.194.107.221,15269477766,娟,1,0,ffd65fabf22ae236311f1e5eb7ba3d2f,,2019-03-15,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1081,4a1f40de88cc7e0c075282aef250b7c0,1552649870,1552751399,223.104.6.50,13959280970,葛智勇,6,0,54fed283cd4bbcdcffc19f1db24d22c9,葛智勇,2019-03-15,,,1018,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,183516.78370509,0,63.00001941,,1,1,0,542.78955502,,0);
INSERT INTO `clt_users` VALUES (1082,7d71c8b32cfbf3dd43239019f9302ab3,1552650001,1552752304,223.104.6.50,13806071502,胡龙华,6,0,2aace9b7f08e91fa6ec7ed8abf54276c,胡龙华,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,179537.22527900,0,0.77472100,,1,1,0,534.11128800,,1);
INSERT INTO `clt_users` VALUES (1083,37253a2eb933c65d07fc8900f82ca890,1552650069,1552880181,140.243.122.177,13666038719,钱叶九,6,0,24c5f9d8c5f8129115bd382f41e56906,钱叶九,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,,,,100.00000000,5100.00000000,0.00000000,192119.42451029,0,0.00048971,,1,1,0,559.08462186,,0);
INSERT INTO `clt_users` VALUES (1084,ed5e10674d08fd87da31cc83cae5bd41,1552650115,1552878317,140.243.122.177,13063956283,钱望保,6,0,9a724977bf3b8399330c046947878ed5,钱望保,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,1083,1083,,0.00000000,5000.00000000,0.00000000,179057.09945859,0,0.00004142,,1,1,0,533.17243883,,0);
INSERT INTO `clt_users` VALUES (1085,8d7c3ca315a084a88265b2945c01b5dc,1552650168,1552878475,140.243.122.177,13328788880,钱叶芝,6,0,35234ef8452b1b95d26a070df25bd42f,钱叶芝,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,1083,1083,,0.00000000,5000.00000000,0.00000000,181489.37431599,0,0.00068402,,1,1,0,538.00378163,,0);
INSERT INTO `clt_users` VALUES (1086,226433f9b5dfc76d44c1806b214c0a76,1552650214,1552872026,117.28.149.40,13270391550,钱玉红,6,0,6773573d8be43108a194f2de79bd6acc,钱玉红,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,1083,1083,,0.00000000,5000.00000000,0.00000000,179331.24248896,0,0.00751104,,1,1,0,533.71574436,,0);
INSERT INTO `clt_users` VALUES (1087,bb9bb0280a39f4c554c694735dfc17a8,1552650300,1552745963,140.243.119.240,15160008830,郭飞,5,0,1ab33d2216e5d634ed459dad88e470cf,郭飞,2019-03-15,,,1085,1085,1083,,0.00000000,3000.00000000,0.00000000,94410.01600000,0,177.98400000,,1,1,0,283.23004800,,0);
INSERT INTO `clt_users` VALUES (1088,c7ab615eb5cfb588ef842e16f257bb62,1552650820,1552743797,140.243.119.240,18060996157,魏家添,2,0,5743a4c2d9fa27383d607b71f7cfe8fb,魏家添,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1089,c3516a4c8cfd31d33ee5eb62b44d2336,1552650861,1552745324,140.243.119.240,13599549714,陈捷,2,0,435beb2e32ee84e37c6f480c858b807a,陈捷,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1090,30ba2ff5a15c0dfc325db408d5eca4c9,1552650903,1552745662,140.243.119.240,17350863810,刘颖,2,0,10f84e774a9a763c6a860cc670ad081e,刘颖,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1091,d8e49c42537a93e6b5ca269cad83686c,1552650941,1552745530,140.243.119.240,13950139200,陈晨,2,0,2755052a213068b8de18702397c8c3b3,陈晨,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1092,a7664559fa89a72fefffaaf0fa2ffbd3,1552650975,1552745722,140.243.119.240,18659298082,陈敏,2,0,15775621bf81bb34eeed90263e1bb78d,陈敏,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1093,36300c8dccdc42486a9d93f714712c0d,1552651024,1552745767,140.243.119.240,13950000834,林慈君,2,0,03c3dc380c7a10b0affceaee5e13fedf,林慈君,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1094,c010f1e596642982369846dd5e65eba9,1552651071,1552745811,140.243.119.240,18250867687,余秋香,2,0,fe1c4377baf16c9cac11b214c089b41c,余秋香,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1095,ec5a075489ef890a58c87cde071f98bf,1552651127,1552745864,140.243.119.240,15080603535,曾赞,2,0,62b4db48aee89ee67067dab90dca78b4,曾赞,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1096,9e91037ba31d809a4012e5ad456f8777,1552651169,1552740025,112.5.203.131,13950055205,陈斌,3,0,9958fcccd5b36c1f39a187c9ca34f888,陈斌,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,500.00000000,0.00000000,12319.49300000,0,18.50700000,,1,1,0,36.95847900,,0);
INSERT INTO `clt_users` VALUES (1097,ab8cad1aafbd0a944830bb813b5171cd,1552651215,1552745907,140.243.119.240,13799251898,蔡丽玲,2,0,db7ecfb5f5c28e832bd3d74e32ee3b3e,蔡丽玲,2019-03-15,,,1081,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1098,ad9f913488911748cb7e8112ab43bbdc,1552651334,1552751262,223.104.6.50,13806008783,胡烨,2,0,bf07110e301289821ebc6620f0ff95c2,胡烨,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1099,67db1d688b4245887b1c15a9afe38de6,1552651369,0,111.221.144.57,13959217124,吴春玲,2,0,76ad0e117226843336c38f55e7b6e86b,吴春玲,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1100,a0f21bb4796d7eb82801431ae2847448,1552651420,0,111.221.144.57,15880299898,张少龍,2,0,20f85e7bf20e5a7c2c2f3ce972e7e848,张少龍,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1101,f9b4fdcbe7c0da6938e2846d977e34d0,1552651468,0,111.221.144.57,19803371773,赵文生,2,0,864b2953d576a73266f3ef0f618a1544,赵文生,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1102,12460cba0fb83ce8a0ea58b292f4bbe0,1552651510,0,111.221.144.57,13870629019,聂旭海,2,0,c9118f5f21b266e9ee2ebd64b10848dd,聂旭海,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1103,f18712807a8a3df60b310e4cee047cf0,1552651561,0,111.221.144.57,15659824952,周霜,2,0,4336781a464562d63c51e86a867b33a8,周霜,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1104,40846ef57e573992a8b834e575e82a72,1552651599,0,111.221.144.57,13666092722,谢卫民,2,0,df8167f8c89b241d1de2325ab7db9cbd,谢卫民,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1105,f2e2cbdf707ad8012f6b8ac9a354abce,1552651641,0,111.221.144.57,18559680909,欧华仲,2,0,5220836575f7d48c3fa517a1216472f3,欧华仲,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1106,ae60ad1ceb9c743b6d4182703ca25186,1552651676,0,111.221.144.57,15979150906,菜秋平,2,0,ab5398cdd9420faaa12490ba672658eb,菜秋平,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1107,d102ebed82c0d2a768579aaeaa30b83a,1552651703,0,111.221.144.57,13860148431,张海峰,2,0,afcb76d25c6c2bfe8efd34fa1f8adbc1,张海峰,2019-03-15,,,1082,1082,1081,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1108,7d74dfbac9276abfc14a735cc0005b2a,1552651782,1552871754,117.28.149.40,13194099491,张建军,2,0,d6382c91cdb655663bdad2b094c8be98,张建军,2019-03-15,,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1109,4be735b8b9222d48836e70afc7345e8c,1552651821,1552821705,58.22.28.21,13950089476,黄应飞,2,0,12171f177f06a1a4b49299e84852e643,黄应飞,2019-03-15,,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1110,e7e958703778096cdf45b0e4343856ef,1552651858,1552871353,140.243.232.19,13055502398,林清香,2,0,305a45cab9e19ea8299be6cd352e3b53,林清香,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1111,fd69258d0156c0618dcd125a2d7e83f5,1552651912,1552871878,117.28.149.40,15759292280,林治晨,2,0,dcdba91d932b7331eba1223458735a7c,林治晨,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1112,0dfb470934016be789e2d88db61e7f2f,1552652011,1552871615,117.28.149.40,15396239808,浩鸿程,2,0,5f36c2ccd2ce071a225936849c0d8400,浩鸿程,2019-03-15,,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1113,e65009217d56b1ec7aacf900157a2013,1552652056,1552871652,117.28.149.40,18020717139,浩鸿璐,2,0,b468e435af5f577f042ae520f8eb5ed1,浩鸿璐,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1114,db12e7bc4f3838f22d8f23db8f2eaa87,1552652098,1552871782,117.28.149.40,13666088805,炜煌,2,0,c19d9418fb5647dfafcdea5f0c0f76a1,炜煌,2019-03-15,3f04ffc0e46e0b3616b7cffd21a73f25,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1115,bd9d248193f129b09072a3d8a5d6fddc,1552652137,1552871683,117.28.149.40,13328788882,林水源,2,0,5357836fdc127ad33901f2a1fabd4af2,林水源,2019-03-15,8e117ffb56be4013b1aa1208f261fc32,,1083,1083,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1116,31578ee36883dbdfab0d8aacedd0ab38,1552655231,1552655231,140.255.247.110,13589422680,金信,1,0,dc5ba9382ed3bd190091fd1e649b3d56,,2019-03-15,,,1062,1062,1034,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1117,ec1e5c3716753c28413a42c6fa77834c,1552656070,0,111.221.144.57,18922547569,杨光荣,2,0,89e53d874d46a5963ad93a162f0be23a,杨光荣,2019-03-15,,,1085,1085,1083,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1118,4a41b1867c325d0fa2121d0d46192046,1552656111,0,111.221.144.57,13950098157,大龙,2,0,f940263e8170f6eca7b64cbadb5aee8a,大龙,2019-03-15,,,1085,1085,1083,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1119,d7dee3b17c73b3a86b551f597b67ef9b,1552656148,0,111.221.144.57,18616141937,朱舒淇,2,0,73349daafeccaec135a4a09f142b8802,朱舒淇,2019-03-15,,,1085,1085,1083,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1120,65ab551372b7e48b3cd58247a782fd66,1552656196,1552863657,112.42.77.166,13942647899,皮建慧,2,0,8bbab7ff56467d82ba607b9f5cf5792c,皮建慧,2019-03-15,,,1086,1086,1083,,0.00000000,100.00000000,0.00000000,2181.43600000,0,6.56400000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1121,ad3858c4b3d83af9b8a18c013f4ecd3e,1552656243,0,111.221.144.57,15711567050,袁水峰,2,0,e68c897afae19365e765640b4690b0f1,袁水峰,2019-03-15,,,1086,1086,1083,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1122,e75885f9d5e9e86e3cf8a86324031eea,1552656329,0,111.221.144.57,13616060318,王瑛,2,0,a1611bd299a3bafbe99d96d7ef52e5f8,王瑛,2019-03-15,,,1086,1086,1083,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1123,a913847a0fa43337cd22a2a45e8c724f,1552656384,0,111.221.144.57,18559230103,黄风华,2,0,d9672270871975527660ddd2dbb15e5e,黄风华,2019-03-15,,,1086,1086,1083,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1124,1fa37f1f279d22ca626a983ddb142f7b,1552656446,1552807784,211.97.131.84,13950763932,龙哥,2,0,454f438f813bd2c22ec1906047607734,龙哥,2019-03-15,,,1086,1086,1083,,0.00000000,100.00000000,0.00000000,2158.59472162,0,29.40527838,,1,1,0,6.50505692,,0);
INSERT INTO `clt_users` VALUES (1125,dbfd5378f707bab319524cf34b8be708,1552656501,1552879631,140.243.200.17,13395023687,高总,2,0,7d70d9f8c4bcbcb54d8e7ac645c3b4d2,高总,2019-03-15,,,1124,1124,1086,1083,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1126,ad60421fde5908b6c7d93f42fffa3ed0,1552656548,1552746689,140.243.119.240,17891839986,林秀清,2,0,ba188268372a8e89c2e631c6370602d5,林秀清,2019-03-15,,,1124,1124,1086,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1127,fc0367f173776e1a082c628a36a8b308,1552656647,1552746045,140.243.119.240,18359727134,向海平,2,0,e43808b45a0bd14e355ba397eed018fb,向海平,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1128,13f56e7a58d8ddd02eec12b3cbf2510f,1552656698,1552746089,140.243.119.240,13164707716,张泽润,2,0,d803f1800dfd88795220d196a3240d1b,张泽润,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1129,ed53b050781ba2a18a188e324c5edd9d,1552656751,1552746128,140.243.119.240,13806094931,黄艺慧,2,0,0194dd18f516fc6ce20f14480663b411,黄艺慧,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1130,ca7da8542af8e84a160fe93013c609a4,1552656807,1552746172,140.243.119.240,15012675047,周江蓉,2,0,defc10ec5e353e1e6249334353b12a8d,周江蓉,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1131,ad9751d994b06e53e3c7008aebebaa1d,1552656843,1552746229,140.243.119.240,17761281329,曾亮,2,0,56c9f9eefc946298b235fdc9f51eaaed,曾亮,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1132,c2f06171cdc8f39b1c26e7ab0f7a6bd8,1552656887,1552746293,140.243.119.240,15860747795,李桂英,2,0,578ee13ffcbcbb291e1c8e6e3a844601,李桂英,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1133,cd08b205209a2f1223a3f6cee71150bd,1552656925,1552746346,140.243.119.240,18965117662,冯海宁,2,0,28fc8a915834265453c0f1b64822f9b1,冯海宁,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1134,18b74412b86343c4e005cc7243e8f0af,1552656954,1552746396,140.243.119.240,18750903279,方清俊,2,0,cec60d032843c5b3030dac73b9f01ab0,方清俊,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1135,840b1ab5b4fdd114be4e240d60d07337,1552656988,1552746445,140.243.119.240,13906015067,姜竹峰,2,0,e918728922df018dc0801a941660c601,姜竹峰,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1136,24adbf885165418c2e56f893cfe53074,1552657022,1552746482,140.243.119.240,13480105898,邓子萍,2,0,120ded4b609f4e64cf28969971e1c5ce,邓子萍,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1137,d094078f75f638dfe67355f4f5005619,1552657052,1552746522,140.243.119.240,13599180868,胡超,2,0,2b154c439556623145f3d5959353ea60,胡超,2019-03-15,,,1087,1087,1085,1083,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1138,3dab9eea4acc565970f1976061355af3,1552657397,0,111.221.144.57,13963463119,李振,2,0,cf43bd084047c6207486ba6dc255aaec,李振,2019-03-15,,,1022,1022,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1139,852c51b45270f1ecd308693fd1bbfda2,1552657450,1552751002,113.73.139.133,13924506815,马玉华,4,0,83ba48f115c4c466ba958b711feb31c8,马玉华,2019-03-15,,,1015,1015,1013,1000,,1047.14285714,2057.14285714,0.00000000,31327.87871480,0,0.12128520,,1,1,0,88.52341560,,0);
INSERT INTO `clt_users` VALUES (1140,5382b3e8bb4ea3990dc6b50a52d7d8cd,1552657489,1552799837,61.145.90.250,13710638118,蔡克运,6,0,e259af6b9923494ddbc04d0b896f12cf,蔡克运,2019-03-15,cc517d687b7608188d482a2683c4d80b,,1015,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,179437.07162400,0,0.00000000,,1,1,0,533.91346683,,0);
INSERT INTO `clt_users` VALUES (1141,4642b05f089525ee4689af413bfd78a7,1552657537,0,111.221.144.57,17313918173,蒲万进,2,0,1ca690ea001a448886d5235244f9420b,蒲万进,2019-03-15,,,1040,1040,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1142,a20cea959feebc6111ac7d6bcd6ef4cb,1552657629,1552719955,111.221.144.57,18175530202,邝郴华,3,0,9476a1c2f279fe10d9cd55341a89f17e,邝郴华,2019-03-15,,,1040,1040,1013,1000,,357.14285714,857.14285714,0.00000000,12300.98600000,0,37.01400000,,1,1,0,36.90295800,,0);
INSERT INTO `clt_users` VALUES (1144,eabc9fb8eae5a3edcf414fa0b9998728,1552657729,0,111.221.144.57,18518793397,刘霞,2,0,9060437ffe90aa1d348d513871332ceb,刘霞,2019-03-15,,,1138,1138,1022,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1145,cab33eb3eb113b7487f01b733faba269,1552657754,0,111.221.144.57,13306340755,马敬,2,0,5de1d16a80471f5be04262d519258269,马敬,2019-03-15,,,1138,1138,1022,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1146,67441c42e4f57f044b600d22f8228854,1552657781,0,111.221.144.57,18146764321,方世林,2,0,07ba7ffe600c079e929dd67b462c8c09,方世林,2019-03-15,,,1014,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1147,dcbb54bf36cac906a85355e1041dc92f,1552657838,1552712041,171.210.237.28,18982963631,范才金,4,0,7202f62d7d50c5238ae4f7759cb6e581,范才金,2019-03-15,,,1040,1040,1013,1000,,694.28571428,1714.28571428,0.00000000,28003.79919800,0,84.20080200,,1,1,0,84.13760400,,0);
INSERT INTO `clt_users` VALUES (1148,3a46d21c95206457d4b16c4b2e632b04,1552657891,1552808345,113.121.160.27,15163412968,黄振香,4,0,682ba93f2856495794af66a35dda5891,黄振香,2019-03-15,,,1040,1040,1013,1000,,0.00000000,1000.00000000,0.00000000,27768.68662784,0,319.31337216,,1,1,0,83.70785760,,0);
INSERT INTO `clt_users` VALUES (1149,8113fb5e3dd7734697565c9805cade1d,1552657997,1552867416,223.104.64.166,15219778629,陈小娟,2,0,a8a9cb3371e9fb77698cfb87311b5f02,陈小娟,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2138.39618020,0,49.60381980,,1,1,0,6.49507800,,0);
INSERT INTO `clt_users` VALUES (1150,9e7f4b203f5e417f9546f15d625ccfa4,1552658066,1552869969,120.231.95.67,18825391835,蒲孝桂,4,0,3f5255e5a0ae4eabe61cd9d76fbc77a7,蒲孝桂,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,27811.47768464,0,276.52231536,,1,1,0,83.84834220,,0);
INSERT INTO `clt_users` VALUES (1151,c297b1ef45f9d05abb1e4877ea0823db,1552658124,0,111.221.144.57,13823336898,辜少成,6,0,a71d568562611493ecc744ca95c94ad9,辜少成,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,0);
INSERT INTO `clt_users` VALUES (1152,8ec8fef2fa5c0ff9363f116623aa0474,1552658209,0,111.221.144.57,18664566826,辜森林,4,0,49506299494a169dba6e2b14a44916f0,辜森林,2019-03-15,,,1151,1151,1139,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,0,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1153,be3136ecb7eb24fdef01c70d3b99f5a2,1552658283,1552720152,111.221.144.57,13923883913,莫步忠,3,0,d0ca2af04b1887a181c7a3b06cbfed4c,莫步忠,2019-03-15,,,1015,1015,1013,1000,,357.14285714,857.14285714,0.00000000,12338.00000000,0,0.00000000,,1,1,0,37.01400000,,0);
INSERT INTO `clt_users` VALUES (1155,d788e2f18b329146f11f941b236ed77a,1552658396,1552720238,111.221.144.57,13549295322,罗直明,3,0,caa1c6cb0769a85b1b6dcc25dc081596,罗直明,2019-03-15,,,1015,1015,1013,1000,,357.14285714,857.14285714,0.00000000,12338.00000000,0,0.00000000,,1,1,0,37.01400000,,0);
INSERT INTO `clt_users` VALUES (1156,191795170c0378ce6038000bd5cd64e6,1552658433,1552879729,223.152.97.51,17373515121,刘承芝,3,0,df31aca28388cb516564448209f50136,刘承芝,2019-03-15,,,1142,1142,1040,1013,1000,,357.14285714,857.14285714,0.00000000,12301.01376050,0,36.98623950,,1,1,0,36.95847900,,0);
INSERT INTO `clt_users` VALUES (1157,4256d4207cdbb0575134911bb0e22f02,1552658455,0,111.221.144.57,17383216271,张贤芬,2,0,079398a07d6e522f7644cadbe3bf94b7,张贤芬,2019-03-15,,,1141,1141,1040,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1158,6d3ebf38e657c0716d11c9b4bb9deaed,1552658474,0,111.221.144.57,13425116788,张洪,2,0,8379f4479b2a5b8be4c72e1839162768,张洪,2019-03-15,,,1141,1141,1040,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1159,04db4eb3587db74b32969eba6f1de9ff,1552658493,0,111.221.144.57,17528286819,张前先,2,0,f2a6787251e47a139ceb40b0c586aedc,张前先,2019-03-15,,,1141,1141,1040,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1160,a9c7bed409cfc54c8bad97d6b3306288,1552658601,1552827951,120.242.103.178,13705536220,杜蓉,4,0,2b2200c4b5d2ac43fa47b5307e316fb3,杜蓉,2019-03-15,,,1017,1017,1013,1000,,300.00000000,1400.00000000,0.00000000,30142.71800000,0,45.28200000,,1,1,0,90.56400000,,0);
INSERT INTO `clt_users` VALUES (1162,611e79a6a6d51601cb2096ecd6c0fdac,1552658738,0,111.221.144.57,13505594550,任清,2,0,3f7fafa954968d70d8df07213324e8bb,任清,2019-03-15,,,1017,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1165,8225ff18d2e5250eee4ccd3c34c088ca,1552658913,0,111.221.144.57,18055308884,孙慰慈,2,0,40b995f350e55c8a2f500dc6663d5e10,孙慰慈,2019-03-15,,,1162,1162,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1166,b32a4d05ac95a9c5ecc6269d9385707b,1552658935,1552810377,117.136.41.24,15913241193,邱文,2,0,ed77f6268bba5346a92ff510286af112,邱文,2019-03-15,,,1017,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1167,18581c7ff2598a3c785b5f52f2a29584,1552659003,1552720748,111.221.144.57,15277016269,廖云妙,4,0,eecc1a33e5bb9258132ff74a297535fc,廖云妙,2019-03-15,,,1017,1017,1013,1000,,300.00000000,1300.00000000,0.00000000,28088.00000000,0,0.00000000,,1,1,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1168,300a38f6fed152ab93c89f9c21db1a14,1552659036,0,111.221.144.57,15537073878,李海珍,2,0,395c30f7ac64706c8b65333e0db60a51,李海珍,2019-03-15,,,1138,1138,1022,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1169,df44df56f645ca9003f95f222f8cd22d,1552659054,0,111.221.144.57,13703426393,陈中山,2,0,b3f458ac0cc13a4f8f194974bfd44e9f,陈中山,2019-03-15,,,1138,1138,1022,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1170,b2c3eac6b9d7664d0ab25debd2a1ad78,1552659073,0,111.221.144.57,18937078271,高敏,2,0,e7011a844c4174bc5260bfb4bbd5a9b6,高敏,2019-03-15,,,1138,1138,1022,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1171,0dbb64824a440bb0f7e9824aaef2b260,1552659106,1552741047,49.94.26.48,18021270430,蒋栋义,4,0,d936ef0d902541d8a7d9ee605ec15beb,蒋栋义,2019-03-15,,,1019,1019,1014,1013,1000,,270.00000000,1310.00000000,0.00000000,27984.12196700,0,103.87803300,,1,1,0,84.10806600,,0);
INSERT INTO `clt_users` VALUES (1172,bd5205c774b731b3d20e36011213e5b6,1552659128,1552721165,221.178.182.29,13771290611,孙海华,4,0,9ea85fc0c47f5f3f9fda9347054c5b66,孙海华,2019-03-15,,,1019,1019,1014,1013,1000,,200.00000000,1300.00000000,0.00000000,30064.77247793,0,123.22752208,,1,1,0,90.35932061,,0);
INSERT INTO `clt_users` VALUES (1173,693bbaf0792692b6f82302a5b3aee1fd,1552659146,0,111.221.144.57,13802411354,胡转爱,2,0,bfafb6290c7712f28a3d90b4b1a6ee28,胡转爱,2019-03-15,,,1019,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1174,ab75eea6d41bb7165497e4f386145918,1552659188,1552712475,120.229.43.230,18820196813,范中华,6,0,f8c73b5098550325af44ee87a1939c0e,范中华,2019-03-15,,,1018,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174062.91155964,0,1025.08844036,,1,1,0,523.36318852,,1);
INSERT INTO `clt_users` VALUES (1175,35656a07fecb67683e3c447a77903dfd,1552659334,1552830974,223.16.17.79,13316802626,叶爱阳,6,0,38366c462a72eb3db94267fd10780d2b,叶爱阳,2019-03-15,,,1018,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174037.47200000,0,1050.52800000,,1,1,0,522.11241600,,0);
INSERT INTO `clt_users` VALUES (1176,fe2236c412eedad2b11d1f195803eb0f,1552659386,1552723169,14.25.52.67,18938063576,余冲,3,0,26f77de9e174fdf29c8fab9248dbe7f1,余冲,2019-03-15,,,1018,1018,1015,1013,1000,,357.14285714,857.14285714,0.00000000,12338.00000000,0,0.00000000,,1,1,0,37.01400000,,0);
INSERT INTO `clt_users` VALUES (1177,2d7ef8b5a5d73c7132ef0a9940f602eb,1552659552,1552865454,112.123.33.29,18663497411,刘方建,4,0,61e44d90b703fe5e29c2093fedab7cc7,刘方建,2019-03-15,,,,,,600.00000000,1600.00000000,0.00000000,27997.24012100,0,90.75987900,,1,1,0,84.12775800,,0);
INSERT INTO `clt_users` VALUES (1178,8f24db2f5ddfcf369fa9023abf4fe341,1552659592,1552878073,223.198.50.106,13379903027,云少强,3,0,cdfef4d1092e9b43b708067d02a42d0d,云少强,2019-03-15,99edb6077827d91ef3d4622f3160e0c0,,1149,1149,1139,1015,1013,1000,,357.14285714,857.14285714,0.00000000,12294.45960650,0,43.54039350,,1,1,0,36.94863300,,0);
INSERT INTO `clt_users` VALUES (1179,454665a31c8f24539542a8030b233777,1552659612,0,111.221.144.57,13922923889,黄文杜,2,0,fe27537ab8dc09cc478a0d604f15a9ba,黄文杜,2019-03-15,,,1149,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1180,d88735cda59c47f48b9d5a0d05a2af10,1552659740,1552808419,120.231.109.253,18938704118,张燕,5,0,674db2504c9e86e2f9bad35d25f5472b,张燕,2019-03-15,,,1149,1149,1139,1015,1013,1000,,157.14285714,4157.14285714,0.00000000,122318.66780000,0,269.33220000,,1,1,0,366.95600340,,0);
INSERT INTO `clt_users` VALUES (1181,d9b3210cb0c1cd9f1df44156d9a824c1,1552659787,1552782818,117.136.31.208,13925349832,梁铭航,3,0,8e3f827d13514ac3031084b993f584a5,梁铭航,2019-03-15,,,1150,1150,1139,1015,1013,1000,,347.14285714,857.14285714,0.00000000,12287.89560650,0,50.10439350,,1,1,0,36.93878700,,0);
INSERT INTO `clt_users` VALUES (1182,37dfcfe7643b450577b3ab206467f1d5,1552659841,1552865346,183.2.198.42,18676159239,颜梓玲,6,0,c1d292e5b2cda15a8011adde3287a464,颜梓玲,2019-03-15,,,1150,1150,1139,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,172960.55024300,0,2127.44975700,,1,1,0,522.06318600,,0);
INSERT INTO `clt_users` VALUES (1183,53c2bbd1beb8761c5d5b48542633a54f,1552659923,1552860068,112.96.112.164,13346499719,闫保忠,6,0,3b2421ed4a5741542f39212b079e2366,闫保忠,2019-03-15,,,1182,1182,1150,1139,1015,1013,1000,,100.00000000,5100.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,524.47610400,,0);
INSERT INTO `clt_users` VALUES (1184,a0b2edb53cf20bdc1e60abcc4eac1a5e,1552659980,1552859961,112.96.112.164,18676108801,闫莹莹,6,0,5b6adb476307d3071a6ac418698371a0,闫莹莹,2019-03-15,,,1182,1182,1150,1139,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,524.47610400,,0);
INSERT INTO `clt_users` VALUES (1185,3341425115aa0f80d4b1066a4d23e74b,1552660013,1552862821,183.2.198.54,15576296323,颜丽玲,6,0,e58a98e38a139e227bb5c561ab254ac0,颜丽玲,2019-03-15,,,1182,1182,1150,1139,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,524.47610400,,0);
INSERT INTO `clt_users` VALUES (1186,3102bf3e045982f16077d1673cf0e3e8,1552660118,1552790988,111.221.144.57,18575591380,金燕丽,3,0,8b06413e3f93bc7f98e0bdfd042eebc4,金燕丽,2019-03-15,,,1018,1018,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1187,45f730d55b58f8437ddeaa323b083d35,1552660169,1552790034,120.229.37.134,13425131595,钟家余,4,0,bed641b4c6a8ffd5c133192378607e31,钟家余,2019-03-15,,,1018,1018,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,27997.24504400,0,90.75495600,,1,1,0,84.12775800,,0);
INSERT INTO `clt_users` VALUES (1188,2ea5c20118c68bfa928b562a861cc8cf,1552662757,1552724928,119.137.1.248,13926535636,杨紫铃,4,0,546146f659fa7289d7cb4d561c1e9998,杨紫铃,2019-03-15,aa2dde304cbbc9539358f492b54b8628,,1018,1018,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,28547.37042201,0,40.62957800,,1,1,0,83.98973639,,0);
INSERT INTO `clt_users` VALUES (1189,c63376eb2b1a6241f6db9ea03aa66b39,1552662952,0,112.97.57.31,13299413134,彭文珍,2,0,22f5954e7c55f4a8a9a13db968fa84e0,彭文珍,2019-03-15,,,1150,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1190,9a0a44bc930408ccc8da343e8a6305ea,1552662980,0,112.97.57.31,13580992501,李沣霖,2,0,428595787ee2bbad2a433ee78438bab4,李沣霖,2019-03-15,,,1153,1153,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1191,bf6ef87f24a88d64ada72d7ed98f7086,1552663012,1552720956,111.221.144.57,13686069177,余小玲,3,0,9d85ab60b5d1e3bb9a1e090257d89b0c,余小玲,2019-03-15,,,1015,1015,1013,1000,,357.14285714,857.14285714,0.00000000,12338.00000000,0,0.00000000,,1,1,0,37.01400000,,0);
INSERT INTO `clt_users` VALUES (1192,8471457d6be7cf691ee92d4da871458b,1552663049,0,112.97.57.31,13728661027,张曼,4,0,76685e05121a8827d22f984ec76f70fd,张曼,2019-03-15,,,1015,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,0,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1193,bc892c09b4958fdc345ad23c3fbad0fc,1552663076,0,112.97.57.31,13580916687,匡雄平,2,0,ba23c87339adf32a5ed7148f9ed4452e,匡雄平,2019-03-15,,,1015,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1194,1930db47c7080f3d2cf7cfcb1da44f8e,1552663121,0,112.97.57.31,13318341499,潘向阳,2,0,80cc31a1993962efc1ad456d8cdc5090,潘向阳,2019-03-15,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1195,0e339636d2349af26c6ed9af72af8fee,1552663219,0,112.97.57.31,13711772799,刘婵贤,2,0,61552639defa332077ac785fce9787c2,刘婵贤,2019-03-15,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1196,5b7239b415560b5189e571c32ca86dd0,1552663278,1552746572,113.70.120.255,13650802522,许彩纯,2,0,de07eba495aa00b6e18a49ec398aebd0,许彩纯,2019-03-15,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1197,b287e7a9de43f1292797ff2282c837a6,1552663342,0,112.97.57.31,15601592255,蒲俊成,2,0,5e8e0e6d05278329404defbff3c389a6,蒲俊成,2019-03-15,,,1159,1159,1141,1040,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1201,6982cff860af04b7805239370b49070b,1552663528,0,112.97.57.31,13825028134,庄菲菲,2,0,5879cc23ab8912555bd50896652067f7,庄菲菲,2019-03-15,,,1017,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1202,d6aa3905a86d3f3fbb4a17e144ed42f2,1552663553,0,112.97.57.31,13427043595,赵伟宏,2,0,2267a17528566e2b9a94b6b2e8432cfd,赵伟宏,2019-03-15,,,1019,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1203,890af52337adcca4ac0232e9659e35da,1552663659,1552664726,115.171.112.54,13810678451,Lyj,1,0,0abeba228153b21e9310b49a28fcb96c,,2019-03-15,,,1056,1056,1054,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1204,6ae2d290d241785e47064d7cbc913aa8,1552663684,0,112.97.57.31,18914908132,苏玉飞,2,0,0a9b6a35c894d33dc19319f401bf5620,苏玉飞,2019-03-15,,,1171,1171,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1205,7d4931ce9ad17d53180e420d7c818c11,1552663708,0,112.97.57.31,13685309036,张新国,2,0,591cda2701dc864045a1405d3936803a,张新国,2019-03-15,,,1171,1171,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1206,7f02752deb7a62c6f62839644223bca6,1552663727,1552740726,112.17.247.219,13712208887,章勇,2,0,d3d86e97bb14f9c4cc41eeadd98bd8f6,章勇,2019-03-15,,,1019,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1207,9a6c8b006599d216ccf53043425e0c9d,1552663775,1552807362,112.224.74.47,13695357546,刘严冬,2,0,b0ce2479615ea575235dba073f760e3d,刘严冬,2019-03-15,,,1172,1172,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1208,b801c0e53060b84c7eafe055f3b6219e,1552663792,1552727688,112.17.247.186,13915300201,庄叶,2,0,3edb3a4a53d0c4c7612dc2dc3fe044f8,庄叶,2019-03-15,7f3e4e67e24b1f844054298e7fddab08,,1172,1172,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2178.16876162,0,9.83123839,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1209,675d9b9c61d1cb351440003c74b263dd,1552663817,1552743602,183.199.169.97,18232965319,杨磊,4,0,50902f3758b604f57f4d07878edd1dde,杨磊,2019-03-15,,,1019,1019,1014,1013,1000,1475997763@qq.com,300.00000000,1300.00000000,0.00000000,27984.13181300,0,103.86818700,/uploads/20190318/925267e34d9d63d22d88f6fcddd20f68.jpeg,1,1,0,84.10806600,,0);
INSERT INTO `clt_users` VALUES (1210,32e0debc9b7f071d07507fdc48c8dbb3,1552663873,1552752565,14.153.76.79,15914187065,唐凤英,3,0,1b26347cf448282e21a81b3dee531515,唐凤英,2019-03-15,,,1174,1174,1018,1015,1013,1000,,57.14285714,557.14285714,0.00000000,12281.33652950,0,56.66347050,,1,1,0,36.92894100,,0);
INSERT INTO `clt_users` VALUES (1211,a7d697a99d37e47eb8d8331defaf2094,1552663901,1552839545,120.85.101.5,13825007046,陈志菊,4,0,33a5619652d88fb55e8cf2e4bfb0fdb4,陈志菊,2019-03-15,,,1174,1174,1018,1015,1013,1000,,200.00000000,1300.00000000,0.00000000,30076.40600000,0,111.59400000,,1,1,0,90.22921800,,0);
INSERT INTO `clt_users` VALUES (1212,ba2054b938902a34528839438e26ed73,1552663935,1552878214,119.123.121.2,13632803352,林火用,2,0,7457782e67420592e8a89cf97e1a68ec,林火用,2019-03-15,,,1174,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1213,48fc38f239161009fadb9e3f50dcd52a,1552663960,1552865160,117.136.79.159,13692267114,李满圆,3,0,c05ca7fe96b15635fb142851d6850d31,李满圆,2019-03-15,,,1176,1176,1018,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14416.34300000,0,21.65700000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1214,cb8c140371edc049c9816fcdbffd8ecc,1552663987,1552790900,111.221.144.57,13902431326,杨建章,3,0,0e23c46d9ba42110f878f8a89a5291ec,杨建章,2019-03-15,,,1176,1176,1018,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1215,b77ef8f375d44cce16ea3dd21cc602e1,1552664016,0,112.97.57.31,18899778228,黄俊轩,2,0,28426867856382c142dd5de323c1db23,黄俊轩,2019-03-15,,,1018,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1216,91a89454dcf7b57549a6757d2eb16108,1552664060,1552873827,111.221.144.57,18976871571,王电,3,0,644d8a5c0c958045acf67f78e6730b67,王电,2019-03-15,,,1178,1178,1149,1139,1015,1013,1000,,357.14285714,857.14285714,0.00000000,12338.00000000,0,0.00000000,,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1217,a029f33b3037ea1180c59a8082fb884d,1552664100,1552798474,120.231.95.32,18680151594,陈金新,2,0,e4055e49617efe5ba5de87e4969f6724,陈金新,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1218,65b8963f9e520c32b6bd8591286b89ab,1552664135,0,112.97.57.31,13676187957,刘婷,2,0,fecba8e8bda667fcf366d0b18f0a1b3c,刘婷,2019-03-15,,,1181,1181,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1219,ddbdf899a1b53eeaf5a726d4b4aafc8e,1552664158,0,112.97.57.31,13580817195,伍添平,4,0,d417a8f03a25d1cd51070c11a0835282,伍添平,2019-03-15,,,1179,1179,1149,1139,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,0,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1220,7ddfbf62693bbdc459556d6882da76e2,1552664197,1552721230,111.221.144.57,13790333731,刘晓燕,3,0,9939449c5a497f0c265247036175dc5a,刘晓燕,2019-03-15,,,1179,1179,1149,1139,1015,1013,1000,,357.14285714,857.14285714,0.00000000,12338.00000000,0,0.00000000,,1,1,0,37.01400000,,0);
INSERT INTO `clt_users` VALUES (1221,341b51100b364bfac757c0f3516858d3,1552664228,0,112.97.57.31,18679199778,谢玉琳,2,0,afdf34827ce539cd0ed3f1ed4861de66,谢玉琳,2019-03-15,,,1179,1179,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1222,a93ea7992d2e5aaee3b98a51c047066a,1552664290,1552822224,116.28.158.205,13902824374,赖华艳,3,0,185c8197dcafafcf7f85af40db589e7e,赖华艳,2019-03-15,,,1180,1180,1149,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14413.06100000,0,24.93900000,,1,1,0,43.23918300,,0);
INSERT INTO `clt_users` VALUES (1223,85baea90417500f8f6025aca46061e6d,1552664311,1552867643,14.27.0.221,18583108795,黄利,4,0,f85b38fdc8510690eb07d1252fc2e269,黄利,2019-03-15,,,1180,1180,1149,1139,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,27982.14219800,0,105.85780200,,1,1,0,84.13760400,,0);
INSERT INTO `clt_users` VALUES (1224,832c2a257d8a88f1355792e1cc563eb0,1552664364,1552815640,120.231.109.253,13528113086,章利,2,0,0236d28b2cf337968581cf00e2e2ea15,章利,2019-03-15,,,1180,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1225,acf170a48fac47cb95e5bd9bc0b5fa69,1552664513,1552816984,112.5.248.156,18629334331,戴吉富,3,0,734aa54e4373ee4d4f605ce71e02bbb2,戴吉富,2019-03-15,,,1151,1151,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14394.68600000,0,43.31400000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1226,4923e45067f9f5f7c873143f18bacd64,1552664559,1552790417,111.221.144.57,18172681943,蔡兴华,3,0,218d7b9067662922d0ca3ee6272056c0,蔡兴华,2019-03-15,,,1151,1151,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1227,73c8d29b7bea87f53d7961b44453b010,1552664595,1552865713,223.166.151.234,13191984119,王辉,3,0,7fab7cdd2a2586476f8146f05c66d021,王辉,2019-03-15,,,1225,1225,1151,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14416.34300000,0,21.65700000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1228,740cf60564c6e9878e55689f8554f123,1552664617,1552880786,183.2.198.107,13321506066,夏刚,3,0,67c148e2c443174665aef655bf46b4a0,夏刚,2019-03-15,,,1139,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14416.34300000,0,21.65700000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1229,37c8312f69fe19e0ef6be0cef1a4ed3a,1552664642,0,112.97.57.31,13508212295,王雪梅,2,0,7305cce82bb73937f81c2a0838998730,王雪梅,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1230,1f2ae2a4986a5a2cde26286f9e5a9d47,1552664669,1552790237,111.221.144.57,15811818188,肖顺芳,3,0,2b814f6469e12c1263946177e5a1fa63,肖顺芳,2019-03-15,,,1152,1152,1151,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1231,2cd2377a62bf60452f5fd3029fc31d86,1552664708,1552790689,111.221.144.57,15019232551,李莹,3,0,e93e559bd5826c13387411de050defed,李莹,2019-03-15,,,1152,1152,1151,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1232,e749dfcd67e0477eee86c38ea4b18feb,1552664749,1552790770,111.221.144.57,13324173987,王娟芳,3,0,007c69d6d23944ba491f4f0b2389888d,王娟芳,2019-03-15,,,1226,1226,1151,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1233,bc3032a8f294e9077f4e52deabfaf759,1552664783,0,112.97.57.31,13432174147,黄素芳,2,0,fce9a6e375d29394ed51fcdbb841db0f,黄素芳,2019-03-15,,,1181,1181,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1234,0ce206939c2c9974c194dbfbaa648b8b,1552664800,0,112.97.57.31,18529588711,罗依,2,0,e9528eee7ac460b44483e41c1e30e38d,罗依,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1235,2fc07994dad1cde1675828020207a7b3,1552664828,1552825515,14.25.169.189,15502063500,郭迪伟,2,0,2afbdbe80a0b655a11dbb08f4cc1c945,郭迪伟,2019-03-15,,,,,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1236,196f1c93509ff0f5f39ad6c77705dcba,1552664898,1552869073,59.33.50.157,17688133441,戴春梅,2,0,c790113d1165912157a7dfdec37bec00,戴春梅,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1237,5c91f25455038a638971ba1437ed07e3,1552664932,1552878402,183.32.211.11,13318257926,唐春兰,4,0,9f3b809645edea47d5aa042f68cefd99,唐春兰,2019-03-15,,,1139,1139,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,1,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1238,bfbf020c7f997eca2585f6d082f3242d,1552664988,0,112.97.57.31,13299413119,李萃裕,2,0,64fe81377c02e1bc7adf9e29e5436f4c,李萃裕,2019-03-15,,,1189,1189,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1239,a3e924d52dd8f814536ec3cad6c39161,1552665008,0,112.97.57.31,13978812402,吴凤清,2,0,200ccd5942293a8e36897c28b70b7850,吴凤清,2019-03-15,,,1189,1189,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1240,3cdcaf902fa32caeb08a95894e16d277,1552665026,0,112.97.57.31,13457630962,卢秋妮,2,0,506bec10c7b8a429fd15d3ce2ac8af8f,卢秋妮,2019-03-15,,,1189,1189,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1243,bac85b567c20e94f53dd4a48a31cda61,1552665244,0,112.97.57.31,13631524855,陈干华,2,0,1b1e5aa5898e374572426a8695c6d622,陈干华,2019-03-15,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1244,576a375884aa48a049d287dee193cd5c,1552665265,1552793945,61.145.90.250,13726374243,蔡少君,2,0,55521124e54d9777dfe9f4d3cbd26c14,蔡少君,2019-03-15,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1245,ab582432796d3107248a23cae2011cb2,1552665291,1552799575,61.145.90.250,18988519298,蔡树鑫,2,0,955a260fe619b3cb457ca22f2586b232,蔡树鑫,2019-03-15,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1246,df650abb8143900ad54466fdf93427c9,1552665318,0,112.97.57.31,13880078591,黎紫宣,2,0,7a093e9e87a71093f59da1c9c3880aef,黎紫宣,2019-03-15,,,1197,1197,1159,1141,1040,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1247,1107e680dcb7a1b5371c284b105da6d9,1552665343,0,112.97.57.31,13912790430,浦震东,2,0,26aebbf555b8fc5859ab0fad9b1e5114,浦震东,2019-03-15,,,1171,1171,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1248,1aabd3f84fbb689f5083d190d23572c4,1552665362,1552727965,117.136.66.42,13515198565,卢娣,2,0,e5964b1af8c10a74d7121fc0dad2d624,卢娣,2019-03-15,,,1172,1172,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.54432277,,0);
INSERT INTO `clt_users` VALUES (1249,e4dc4ac3c5201ae1999e2509d2249f3d,1552665378,0,112.97.57.31,18688819433,罗明,2,0,5bc43b2ba020b694a7bc2ad0f74b8eed,罗明,2019-03-15,,,1019,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1250,9ce5c31f25ff070a2699ae84d593c430,1552665398,1552785211,1.190.187.101,13304840168,刘芬,2,0,0c31ac36f6628b28abaf44d805667ac1,刘芬,2019-03-15,,,1209,1209,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1251,829f0f4b9047be16959ddefa83b250a0,1552665417,1552744132,183.199.168.254,15131846556,李世强,2,0,8a72d7ecf105d0e366154f3d4f4d9735,李世强,2019-03-15,,,1209,1209,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1252,46f319d9782d47109a5d96ef3e0be7b9,1552665443,0,112.97.57.31,13702896489,吴秀凤,2,0,22d5184d4ef2099868fe7b50eb14aec0,吴秀凤,2019-03-15,,,1210,1210,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1253,01ef5c757ddf6f1eff927d9e636ffac4,1552665462,0,112.97.57.31,13794492022,周妙玲,2,0,bc6aed3490eafcfd2bfd6e0928abac3a,周妙玲,2019-03-15,,,1210,1210,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1254,97f3be61cecf1067977d4c262dbc5db8,1552665503,0,112.97.57.31,13640939805,欧菲菲,2,0,59edc04d63fe4c2d6e28bf06699f3412,欧菲菲,2019-03-15,,,1210,1210,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1255,cbbc5693051c39bb0872f5b791ad068b,1552665824,1552839698,120.85.101.5,18518157046,李伟才,2,0,5952d2778e4ddfa0b11af847ae315411,李伟才,2019-03-16,,,1211,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1256,3af4ecca38823fece52f31593a935b16,1552665947,0,112.97.57.31,18938334863,林仰玲,4,0,27bb380a9c44c8580f95638b265aed2c,林仰玲,2019-03-16,,,1211,1211,1174,1018,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,0,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1258,0acce8f82efb028ac3a4815f20d0ce11,1552666076,1552789882,111.221.144.57,13143809519,李方荣,4,0,6c15f592000855526989a17a16a0ca59,李方荣,2019-03-16,,,1211,1211,1174,1018,1015,1013,1000,,200.00000000,1300.00000000,0.00000000,30188.00000000,0,0.00000000,,1,1,0,90.56400000,,0);
INSERT INTO `clt_users` VALUES (1259,af4695318532b65c7c44be69a87d4466,1552666111,1552789967,111.221.144.57,13602580178,蔡卓雄,3,0,e0bfbd65952eb6c3cf63accb0827e450,蔡卓雄,2019-03-16,,,1214,1214,1176,1018,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1260,ed68a4c6e3fec7000e1dbb1e0960fb23,1552666273,0,112.97.57.31,15163499553,张士齐,2,0,99675a808b8d84aee1e9109dbc1bee9d,张士齐,2019-03-16,,,1177,1177,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1261,b9790ee2ac255dbfdb98b98467f4de54,1552666302,1552722228,117.136.79.163,18816762696,李然然,4,0,a1599edda4b133e1d0b0359646d2d177,李然然,2019-03-16,,,1148,1148,1040,1013,1000,,0.00000000,1000.00000000,0.00000000,28843.71358400,0,84.28641600,/uploads/20190316/535e8e13ec0d797e11449aad0640bd9b.jpg,1,1,0,86.53114075,,0);
INSERT INTO `clt_users` VALUES (1262,561df1d6f1f0b045ad3e5dcf341eef1b,1552666342,1552739748,117.136.79.163,15703939528,杨庆雪,4,0,3404830a863b61ce67c54a75c447776a,杨庆雪,2019-03-16,,,1261,1261,1148,1040,1013,1000,,0.00000000,1000.00000000,0.00000000,28717.73039600,0,0.26960400,,1,1,0,84.01120800,,0);
INSERT INTO `clt_users` VALUES (1263,4c522778aef2267b8853741259d1d38b,1552666385,1552860653,223.198.50.106,13976564152,符兰荣,2,0,6ea46954ac9a43b65ca4ba9958f3e3ec,符兰荣,2019-03-16,cd3693d0508ae7b4b275fb3562dc90c2,,1178,1178,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1264,9b8cf37a33d1eca730f5289bae9f3e9c,1552666425,1552789648,111.221.144.57,13556965253,关翠平,3,0,085bba607500add83c3a4ef635afb259,关翠平,2019-03-16,,,1179,1179,1149,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1265,dac76ed8f1f03f9670cbb309fa2e73d1,1552666485,1552789816,111.221.144.57,15322825219,杨华,3,0,4dc5a3169e2003b5066a84cff3252237,杨华,2019-03-16,,,1220,1220,1179,1149,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1266,31d0bdc5d18ffbaadab97eaa067a7cf2,1552666540,1552790040,111.221.144.57,13790568711,许广妹,3,0,25f14036d4b98bd57dd7b857dbb23fce,许广妹,2019-03-16,,,1220,1220,1179,1149,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1267,f4a1adac8525b830549134ff1f8f2e87,1552666566,1552791206,111.221.144.57,13509837839,黄海坚,3,0,405ca5cefd684212a349c531e9713fd9,黄海坚,2019-03-16,,,1220,1220,1179,1149,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1268,9eeccb0dbfa398a8a0e89e35dac1e33a,1552666598,1552817002,120.231.109.253,13923339171,张洁,3,0,60fd1f23ef83f4bb4897186fa3f2c768,张洁,2019-03-16,,,1223,1223,1180,1149,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1269,d13124d8379e632446765900d4dbee87,1552666642,1552863032,223.73.149.74,13025527893,唐琼方,2,0,971e958b7788f614e540753d09bbd13e,唐琼方,2019-03-16,,,1180,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1270,d8b44ebf024885c2b11037ac8880d5d8,1552666667,0,112.97.57.31,15877098183,石慧清,2,0,ebef6eb2afdb49a5e1eef8e9777a4bf0,石慧清,2019-03-16,,,1240,1240,1189,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1271,50e70aceb589aa44c58fa19c8f0bc34b,1552666728,1552799755,61.145.90.250,17507576029,曾韶文,2,0,32ff18148bda46b3a93d6b1079d1c48d,曾韶文,2019-03-16,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1272,fea0f933862b5295e5c006f3564b4638,1552666957,1552789340,111.221.144.57,13713869918,苏光星,4,0,1911bad2a7e9014c0f82ffc6501b1e0d,苏光星,2019-03-16,,,1211,1211,1174,1018,1015,1013,1000,,200.00000000,1300.00000000,0.00000000,30188.00000000,0,0.00000000,,1,1,0,90.56400000,,0);
INSERT INTO `clt_users` VALUES (1273,15236c858e5f47f657345826e2e1f0bb,1552667044,1552789411,111.221.144.57,15889663689,刘瑞兴,4,0,25577c330f62f8b4fada5f5247dfdb62,刘瑞兴,2019-03-16,,,1211,1211,1174,1018,1015,1013,1000,,200.00000000,1300.00000000,0.00000000,30188.00000000,0,0.00000000,,1,1,0,90.56400000,,0);
INSERT INTO `clt_users` VALUES (1274,3187c37962b7b5fd74e9df08ccb10dee,1552667147,1552839008,113.92.129.84,13049397211,林慧红,4,0,b3ea026cd573eda48e3744cf9ca78ee2,林慧红,2019-03-16,,,1256,1256,1211,1174,1018,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,27998.49464600,0,89.50535400,,1,1,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1275,69730d17804c5a485bf1abcfa86d9bab,1552667416,0,112.97.57.31,13902920881,曹晓青,4,0,e66866897fdfbe0ac6ffa5c2a0f9ac3c,曹晓青,2019-03-16,,,1256,1256,1211,1174,1018,1015,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,0,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1276,f6890b3e6b0249c018d198cf15baa55c,1552667485,1552878400,203.145.94.153,13680077639,罗运彩,2,0,18d189371654c9345a10e8bd40659b1c,罗运彩,2019-03-16,,,1258,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2171.61953800,0,16.38046200,,1,1,0,6.54430800,,0);
INSERT INTO `clt_users` VALUES (1277,91de024e397393d4a5753a82f26bc1e7,1552667547,1552815518,112.120.28.143,13043413832,庄明懳,2,0,c61a7daef3674f1a204c22357fca2711,庄明懳,2019-03-16,,,1258,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1278,ee63d721e5247ca0ec8d96d83c1cf54c,1552667567,0,112.97.57.31,13068744738,刘慧珠,2,0,b209e92e313f01f2f3e2aee8da84a435,刘慧珠,2019-03-16,,,1258,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1279,5ea79bbbdc1ad354caf9903ccfb9e356,1552667587,1552845703,120.229.37.134,13728717389,张光文,2,0,edf6518421b26952c9c39f82d203db4c,张光文,2019-03-16,,,1187,1187,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1280,12d4d6f5b12ae8defebbf7224fa7da54,1552667670,1552792273,117.136.89.60,18320838129,莫翠萍,4,0,65970f9fe6bade099a7a931432308b58,莫翠萍,2019-03-16,,,1018,1018,1015,1013,1000,,214.28571428,1714.28571428,0.00000000,40270.92900000,0,67.07100000,,1,1,0,121.01400000,,0);
INSERT INTO `clt_users` VALUES (1281,9d46d3bb5c3fd817169f70b51b3b2015,1552667808,1552731424,117.136.79.108,13423832320,郑本,2,0,764ac353dfb591a9b2263b9d0b003f41,郑本,2019-03-16,,,1188,1188,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1282,261bd2a64a12cd197c5c60a62e17822b,1552667892,1552755193,113.218.14.242,17378262949,谢芳,2,0,ae8a28e7581fd95323da7a2313995a7e,谢芳,2019-03-16,,,1281,1281,1188,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.43600000,0,6.56400000,,1,1,0,6.54430800,,0);
INSERT INTO `clt_users` VALUES (1283,3baf33f90673e09296eb23fe3784ae17,1552667968,1552789532,111.221.144.57,15899686998,吴开学,3,0,28da3b980f808a7d1b7a9fbf5a71cb9e,吴开学,2019-03-16,,,1220,1220,1179,1149,1139,1015,1013,1000,,257.14285714,857.14285714,0.00000000,14438.00000000,0,0.00000000,,1,1,0,43.31400000,,0);
INSERT INTO `clt_users` VALUES (1284,3b0631ee7b848648e6c818027f29bf57,1552668078,0,112.97.57.31,15777170866,廖云德,2,0,f77656f7663e2fdfbfa50590316ffb48,廖云德,2019-03-16,,,1167,1167,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1285,9ab53955a5ce124ce0952df0d6a32f71,1552668099,0,112.97.57.31,13539936110,廖云律,2,0,69b2dfd155ceed2709114a7d690017d7,廖云律,2019-03-16,,,1167,1167,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1286,b290b9b8180bf82ba737d3e817fa7ace,1552668153,0,112.97.57.31,13978804308,黎信成,2,0,b0041eb09aaf67d3aacbfd0106107570,黎信成,2019-03-16,,,1167,1167,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1287,de77d05c31739ed0e724e27aab5c4c10,1552668201,1552747735,113.70.120.255,15989333726,蔡红,2,0,55036631b713c1712744f71042913528,蔡红,2019-03-16,,,1140,1140,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1288,e7f5e04d89347a56cefb82e6f4b09d52,1552668541,0,112.97.57.31,15889705663,吴宗保,2,0,530566fc92f09fd0eb84c6651926a11a,吴宗保,2019-03-16,,,1280,1280,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1289,9857ba724bab718f17f14ab52aef8c31,1552668566,1552746659,175.5.195.161,17806713496,杨勇,2,0,692896a4c2ccfd7100b552d678646aa4,杨勇,2019-03-16,,,1280,1280,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1290,07f95eca79ae0beff5fe5e48a3146650,1552668585,1552724802,119.137.1.248,13243789313,陈玉欢,2,0,e69a7c1f8839964def4372bd37426415,陈玉欢,2019-03-16,aa2dde304cbbc9539358f492b54b8628,,1188,1188,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1291,613d5f2ddb2817e11c96c72d73b035ff,1552668609,1552724544,106.18.147.173,15574013334,阮双,2,0,68fd038732b84bddcc81a12c818cea86,阮双,2019-03-16,,,1282,1282,1281,1188,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1292,8b660d7a18ccad3761f7c1461b8700d5,1552668630,1552859517,14.28.9.127,15012789178,黄瑞宽,2,0,de47f0b6c3195344f7c65a5b90e6d770,黄瑞宽,2019-03-16,f7fbe926cf879175eaa12c52e7d30fc8,,1274,1274,1256,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2174.89169200,0,13.10830800,,1,1,0,6.54430800,,0);
INSERT INTO `clt_users` VALUES (1293,d4067cee56de3fe5778e44cda218bca8,1552668689,0,112.97.57.31,15986610082,卢柳艳,2,0,0810872a329d34578fd1ab4251bcfee7,卢柳艳,2019-03-16,,,1272,1272,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1294,095f4f93c7c7f53088b30b8186e45e81,1552668728,0,112.97.57.31,15296361977,苏倩倩,2,0,85126ac74a43f86ae7cbf53644f379fd,苏倩倩,2019-03-16,,,1272,1272,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1295,85868a69729f84f6f828e64ccbccf5e5,1552668757,0,112.97.57.31,13725594596,刘彩旗,2,0,0e8f9054a93c40bfed1a2481bb5880bd,刘彩旗,2019-03-16,,,1272,1272,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1297,a090983d2cee042e1c19271541b49881,1552668835,0,112.97.57.31,13705538415,胡成秀,6,0,9624cbcdee02a74c7af051e55fe5cd9d,胡成秀,2019-03-16,,,1017,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,0);
INSERT INTO `clt_users` VALUES (1298,7013a34d2ce33030da14eb0934194943,1552668882,0,112.97.57.31,13829198858,赵子洪,2,0,edc1b20399ddbbacad67d719a7b49e20,赵子洪,2019-03-16,,,1019,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1299,836807da218d61f2242190c3706e8b30,1552668924,1552875495,221.192.178.169,15614857996,杨炜炜,2,0,3a069ddc56e6c4df0de26f0b92be8b3b,杨炜炜,2019-03-16,,,1209,1209,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1300,abade5ebe94ef6e4e0c81d9292a32d9a,1552668950,0,112.97.57.31,18676122677,刘光会,2,0,1c90f62f304452c292714fa0f8d86307,刘光会,2019-03-16,,,1237,1237,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1301,4e709215117b59e7459c4ec6b410f5d9,1552669007,1552789157,111.221.144.57,13510595280,田永涛,4,0,a0d03fc4162cc43166d4fd337c5199e6,田永涛,2019-03-16,,,1017,1017,1013,1000,,200.00000000,1300.00000000,0.00000000,30188.00000000,0,0.00000000,,1,1,0,90.56400000,,0);
INSERT INTO `clt_users` VALUES (1302,8d40ecde47ce34996895f92cab36caa1,1552669035,0,112.97.57.31,13661299114,王丹瑜,2,0,52542706664b5bfceb67d8d1308147e3,王丹瑜,2019-03-16,,,1301,1301,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1303,6d2a5af4f91d5df1a3bb5482ca8f57d5,1552669070,0,112.97.57.31,13835112146,程军艳,2,0,6d172ad8059ce1e214cd5505a4c6a1df,程军艳,2019-03-16,,,1301,1301,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1304,95a2c526db5ecb284c54592ffd573f9b,1552669093,0,112.97.57.31,13925817767,刘敏,2,0,7ab19fcdb4d71c0341e74e1ec9d17826,刘敏,2019-03-16,,,1301,1301,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1305,264932b8671994951135569e709e54a0,1552669131,1552863796,183.2.198.54,13574730678,周朝,2,0,b397892f20cd522437bb0f30c1990ea7,周朝,2019-03-16,,,1182,1182,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1306,c5bf84155a79764454405553841eb9bc,1552669152,1552860017,112.96.112.164,18676108869,张鹏,2,0,96870e43ceed7079e4f08f6ecfd89280,张鹏,2019-03-16,,,1182,1182,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1307,02666942e5de93227eb96c56ce9d976f,1552669176,1552863914,183.2.198.50,15919277371,彭辉,2,0,5d0220fd0db3f04f1c796797fd71dbfe,彭辉,2019-03-16,,,1182,1182,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1308,9305a63a1183ab33119f317672a913fc,1552669211,1552863589,183.2.198.42,15115814197,颜波,2,0,7a0517b0d7ca7185cec933b85eb61b70,颜波,2019-03-16,,,1182,1182,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1309,40cac3dc940b01545aae6feffc6700e8,1552669234,1552863696,183.2.198.54,13873864673,颜敏,2,0,e098c9b1b629d8316eb87fccfc41842f,颜敏,2019-03-16,,,1182,1182,1150,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1310,c9c5727d34928b058399b8dccc779186,1552669270,0,112.97.57.31,13928167249,李湘辉,2,0,44e1fb66f729249f9ca4c6e5fbb65681,李湘辉,2019-03-16,,,1180,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1311,a26b4bf0a60bf954d10d3667febc4bdd,1552669293,1552808197,120.231.109.253,13500369597,章勇,2,0,a2bd54cec29433f7408d304dbb05dd55,章勇,2019-03-16,,,1180,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1312,f191176944528cbeb7afbc794cb111cf,1552669319,1552815634,116.28.156.141,18676183352,王冰艳,2,0,f61605e34d61be01d992f978c33889ee,王冰艳,2019-03-16,,,1180,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1313,d5233d7579b2946f6d18369de19c6be9,1552669356,0,112.97.57.31,15775370019,徐子介,2,0,fd35d206edec8a694b2df01bb4c2a131,徐子介,2019-03-16,,,1180,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1314,a5b37421a6a7bf08ded95e257ac3781f,1552669451,1552714503,112.97.57.93,18664921872,蓝方,6,0,9f3ea2d90438ab83fb86fd1a63c5e379,蓝方,2019-03-16,,,1042,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,174825.36800000,0,262.63200000,,1,1,0,524.47610400,,1);
INSERT INTO `clt_users` VALUES (1315,1d03452e893181fe0c7a2810909fbbe2,1552669488,1552707503,119.39.248.109,18673226777,张彪,6,0,bc9859ae850d3ddc679631f701ca05d1,张彪,2019-03-16,,,1042,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,187445.20953200,0,142.79046800,,1,1,0,544.72452000,,1);
INSERT INTO `clt_users` VALUES (1316,ffb472b3694acf7a5de169cea2eb9eff,1552669523,1552760746,113.245.13.202,18707328381,何顺,6,0,44ae9a7d94d984bc5336da0a9586616b,何顺,2019-03-16,,,1315,1315,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,176397.36800000,0,0.63200000,,1,1,0,529.19210400,,1);
INSERT INTO `clt_users` VALUES (1317,28182f464a75aad399e6f6d82882a4dd,1552669568,1552716614,113.245.13.202,19873218888,李闶,6,0,8b4c351ed5278337e44baaa907606ad9,李闶,2019-03-16,,,1315,1315,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,176397.36800000,0,0.63200000,,1,1,0,529.19210400,,1);
INSERT INTO `clt_users` VALUES (1318,5bb704b94388eddd305d93e34e94a80d,1552669621,1552829865,117.136.89.69,13875228788,周文祥,6,0,9dd3ec17aaa1b22fe52cea76be105114,周文祥,2019-03-16,,,1315,1315,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,177681.32994800,0,6.67005200,,1,1,0,528.07610400,,1);
INSERT INTO `clt_users` VALUES (1319,0f1280b1911526289123184e7024e6b1,1552669656,1552750858,117.136.79.109,13117525032,唐一浩,6,0,acecf867c5f4c8406d56c41851f3e1bf,唐一浩,2019-03-16,,,1315,1315,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,176025.36800000,0,62.63200000,,1,1,0,528.07610400,,1);
INSERT INTO `clt_users` VALUES (1320,8e14604ca1bc0cad1e551a9190f6da8a,1552669700,1552838594,39.12.139.94,13910487317,吴秉叡,6,0,582c02550da34e72ecf276fbf248ef57,吴秉叡,2019-03-16,,,1042,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,174825.36800000,0,262.63200000,,1,1,0,524.47610400,,1);
INSERT INTO `clt_users` VALUES (1323,e7e5b5556e0c128f5741234e1aca5088,1552669885,0,112.97.57.31,13118783962,张飞,6,0,1ad62e703604b99002366a16feb19807,张飞,2019-03-16,,,1027,1027,1026,1024,1023,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1324,c4dc9220722ccfc335719e1c8fc3ad85,1552669915,1552878122,223.104.63.178,13554791323,luisa,5,0,92bdca5206552aa4805576e5f92ffdd3,luisa,2019-03-16,1f81775872099ded00b17568c984fa0b,,1027,1027,1026,1024,1023,1021,1020,1014,1013,1000,307461153@qq.com,0.00000000,3000.00000000,0.00000000,96007.18882300,0,0.81117700,,1,1,0,285.85835400,,1);
INSERT INTO `clt_users` VALUES (1325,aeda470a650658fc331e33fca8d1e192,1552670090,1552865536,223.16.17.79,18664399434,周东东,6,0,660009a0f9a0aaa93fe07725bd09f840,周东东,2019-03-16,,,1018,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,524.47610400,,0);
INSERT INTO `clt_users` VALUES (1326,0f28e4e76847612ddc26bb32f5af24a0,1552670193,1552743053,221.0.241.238,13365323271,姜国平,6,0,7b45bf55a6ce7f2ddedd8ab3fe24c6f4,姜国平,2019-03-16,,,1021,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,524.47610400,,1);
INSERT INTO `clt_users` VALUES (1327,7b2ad14770736f89737616a1654ac327,1552670224,1552785215,112.97.54.15,15098903747,陈鹏,6,0,7ce5430af6a05750b16c98947520482d,陈鹏,2019-03-16,,,1021,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,177724.14026000,0,0.00000000,,1,1,0,529.19210400,,1);
INSERT INTO `clt_users` VALUES (1328,04c77e41713aad662d54a8b69f8d66d6,1552670253,1552745875,112.97.54.15,13693459345,李治国,6,0,80501cf92804344351df372674e180b9,李治国,2019-03-16,,,1021,1021,1020,1014,1013,1000,lzg178@163.com,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1329,1cb6be8b81120b244360f03246e64bca,1552670279,1552695139,117.136.72.247,18314499865,周俊明,6,0,80254ad05d5105b9ab953e816706640c,周俊明,2019-03-16,,,1021,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,174563.12994800,0,524.87005200,,1,1,0,524.47610400,,1);
INSERT INTO `clt_users` VALUES (1330,75e521669b6510c661368d5e3188f21c,1552672311,0,112.97.57.31,18819717953,向建龙,2,0,72e8abc38f4bfe53288f848f61e8f7c9,向建龙,2019-03-16,,,1019,1019,1014,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1331,90797fc3da84bd680486e0af5c9268a3,1552672389,0,112.97.57.31,13008828173,朱谦信,2,0,89a13453b40cd5a67f4c5a27d93bb889,朱谦信,2019-03-16,,,1273,1273,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1332,4a9068b7bf6637ee7a5769bcb7a8d56c,1552672426,0,112.97.57.31,13590335852,朱翼昌,2,0,ea53df6f5ff9116ddfacf8acc5f32b43,朱翼昌,2019-03-16,,,1273,1273,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1333,170e56ffe49deffa155eb43484e4d306,1552672465,0,112.97.57.31,67695967,李抒欣,2,0,83fe83dc70bdfc8e765fe9ab00d7730b,李抒欣,2019-03-16,,,1273,1273,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1334,698088b349a0e64dc336bd3207643c3a,1552672511,0,112.97.57.31,15040567103,韩金,2,0,de1b2111e76cbfdb3647f0dc6b85e24c,韩金,2019-03-16,,,1120,1120,1086,1083,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1335,c335c3573fc8bb0396d25fc1b824233e,1552672537,0,112.97.57.31,13457073261,宁海波,4,0,ff50befce10fe724513da11d085493eb,宁海波,2019-03-16,,,1167,1167,1017,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,0,0,84.26400000,,0);
INSERT INTO `clt_users` VALUES (1336,bbe7ebab55ae9a8056744bbe32056a84,1552672571,0,112.97.57.31,13410591492,廖家信,2,0,96844f3da589670fda906c2f69f23e88,廖家信,2019-03-16,,,1335,1335,1167,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1337,d9702c07c7a9e69eff9860037afaba4e,1552672598,0,112.97.57.31,13652373136,唐永东,2,0,f90a307e1df9869dff1f6f111c0ec945,唐永东,2019-03-16,,,1335,1335,1167,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1338,ab4b1584c60ca26cc7150d51798c97cb,1552672627,0,112.97.57.31,15120746755,廖燕萍,2,0,d5c55bdb9d37205c7f3d35ad34a035ae,廖燕萍,2019-03-16,,,1335,1335,1167,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1339,3ba8ae41aff94b2c3c7b98e90dcf7869,1552672657,0,112.97.57.31,18820118979,姚淑娜,2,0,ac6a60976da6e7b84ff57f5b88c1cd88,姚淑娜,2019-03-16,,,1167,1167,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1340,89b075dfe4455936e77f0793cb52f58c,1552672714,1552859631,14.28.9.127,13066853838,骆招娣,4,0,dd7b1f02114f55f989408606bef48a6e,骆招娣,2019-03-16,f7fbe926cf879175eaa12c52e7d30fc8,,1274,1274,1256,1211,1174,1018,1015,1013,1000,,200.00000000,1300.00000000,0.00000000,30136.15400000,0,51.84600000,,1,1,0,90.56400000,,0);
INSERT INTO `clt_users` VALUES (1341,f8ff8bd761c32382b4bdc718a86523c8,1552672746,1552868155,183.42.2.145,18617130697,骆毅,2,0,ad9a2e7ea91a054e9af1e3db4905bf57,骆毅,2019-03-16,,,1340,1340,1274,1256,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1342,ed07f8a9541bbd802af32e7008d4edde,1552672773,1552868223,183.42.2.145,13316839373,骆斌,2,0,f6f4f6b912f30b0f012eb8ad253d12c4,骆斌,2019-03-16,,,1340,1340,1274,1256,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1343,2cd464f97ec5830e2714c1427ed270d7,1552672796,0,112.97.57.31,13392840234,潘磊,2,0,6a9ee10b6f65d1277e23761ec6afcd26,潘磊,2019-03-16,,,1275,1275,1256,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1344,6ae1bed87bbe7595182c91f0abc7f974,1552672824,0,112.97.57.31,13713677811,百灵鸟,2,0,ab4032a9f3ace31af62c90b7b05e9477,百灵鸟,2019-03-16,,,1256,1256,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1345,7e2e3bbb2d4796af92bce51ed2f092c8,1552672849,1552878495,203.145.94.153,18219081658,曾秋芳,2,0,8608d73b1cec14c92af9b96628a87f09,曾秋芳,2019-03-16,,,1276,1276,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1346,f8188c75426f74eabc88f2026ffc9cc4,1552672877,0,112.97.57.31,18038091629,林富强,2,0,f24f9d5f89689bc87d1c6f7a7517341e,林富强,2019-03-16,,,1292,1292,1274,1256,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1347,e5003e3b55d3996e502d572145662fc4,1552672942,0,112.97.57.31,15020858886,景新焕,6,0,2a3c2a607495e2412c9cf3895d5f59d2,景新焕,2019-03-16,,,1040,1040,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,0);
INSERT INTO `clt_users` VALUES (1348,5e7082dd8c175ca595e3d174611ef85b,1552672977,0,112.97.57.31,13963457133,景新梅,6,0,25d94eebe4c5f09274843554ded30db1,景新梅,2019-03-16,,,1347,1347,1040,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,0);
INSERT INTO `clt_users` VALUES (1349,69f57c4a9e7e4bf3b5f86e20494ec4d0,1552673012,0,112.97.57.31,15563411118,大帅,6,0,a1745c1002c49ac724a6b032930598ea,大帅,2019-03-16,,,1348,1348,1347,1040,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,0);
INSERT INTO `clt_users` VALUES (1350,cdcf98be444fa81cabebf921cd622963,1552673045,0,112.97.57.31,13923433876,叶治专,2,0,cf645b92b620484087571dbc0b2d7015,叶治专,2019-03-16,,,1222,1222,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1351,c302f0aa1e2c62eb6cce282829d58d2c,1552673080,0,112.97.57.31,18173853881,曾常芳,2,0,39f5fc85c0b701b30147b34b651538c2,曾常芳,2019-03-16,,,1310,1310,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1352,8d2cb0df438d1f4fd21d90c46bdb154e,1552673115,0,112.97.57.31,13928116291,曾威湘,2,0,338286f7b53143477eeaa76382cc3fcf,曾威湘,2019-03-16,,,1310,1310,1180,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1353,d204c3625ad84ec9f8f1d9d2ed7bbdfc,1552673233,0,112.97.57.31,13794475929,李俊杰,2,0,74f4d421e3494c83856a84beba72926e,李俊杰,2019-03-16,,,1258,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1354,19ad76ec67dbc7f3763328d39af4fe66,1552673330,0,112.97.57.31,13418634220,邹卫红,2,0,763bbaa7be7bf2253817973b31256c1a,邹卫红,2019-03-16,,,1258,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1355,557c0cab1f721b4c872565c6ec9735d4,1552673354,0,112.97.57.31,18224229105,刘宗红,2,0,7efb54cabeecc52492484f75e885a397,刘宗红,2019-03-16,,,1354,1354,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1356,d345b686f70ee275329ba88348272384,1552704774,1552704774,223.104.191.11,13705431746,殷凤奎,1,0,cf501ec56d5af6a81f10de47e6d5b968,,2019-03-16,,,1062,1062,1034,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1357,04762632b13501f1dcc9cb3532c99e47,1552705228,1552705528,106.34.185.101,18939606350,赵凯,1,0,2fd199bbb94e0c740009450a08e6f625,,2019-03-16,,,1074,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1358,d5aeecdfc96cb4ff05a72256a1eec9df,1552705477,1552705477,106.34.185.101,15994170781,李菊,1,0,aca9ec9194b7ddfa79c74bfbb0eb6e57,,2019-03-16,,,1357,1357,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1359,eda467ad97e33f10fe6ea6e7048a89db,1552707637,1552819475,112.252.114.144,18678131636,何明斌,3,0,c5fd65ceeeb06d93d5708fb4189093de,,2019-03-16,,,1034,1034,1016,1013,1000,,0.00000000,500.00000000,0.00000000,12301.01376050,0,36.98623950,,1,1,0,36.95847900,,0);
INSERT INTO `clt_users` VALUES (1360,5577d63e452af5bfe136994de5184d70,1552708353,1552709749,223.67.141.100,17300656318,不忘初心,1,0,7eaeb9b2afaa9cfba8b2f502a32314ee,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1361,4f842d14579238d2d684eec03cc56db9,1552708864,1552708925,117.179.88.84,18945774006,姜聪成,1,0,c587c3561c21a95a1834feca8938263e,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1362,b2f6ace7da47e6db3f262d1aefecab17,1552709316,1552709416,121.234.20.115,18014667625,晨,1,0,2f8659d7e05dfa4278b303a42b1f0897,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1363,46aca5f9a46c8dad51013a343c3f6019,1552709572,1552709683,111.34.103.158,18766882255,麦兜,1,0,485dc05dea15ea5827fd342d8375b13b,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1365,95f15942e84ae96f7add74e34801f956,1552709867,1552746460,218.17.238.182,13266888767,梁乃丹,3,0,9a07353c1b2bee9b6c45044cb3211336,梁乃丹,2019-03-16,,,1018,1018,1015,1013,1000,,0.00000000,500.00000000,0.00000000,12319.49300000,0,18.50700000,,1,1,0,36.95847900,,0);
INSERT INTO `clt_users` VALUES (1366,8c8f24285c670e01493898f89439f85c,1552711007,1552715702,111.58.9.41,18107793777,信,1,0,2598565e73eb8b9f4f323bfc420229c7,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1367,8a66c100953e62d0f205d2b15f3d626a,1552711552,1552711552,112.17.243.112,13003657881,冰月,1,0,3644eb1393a785080dd30773aebe7f97,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1368,15c76261014c87f468b3daf1c7be579c,1552713926,1552715545,42.90.64.187,18153620297,东,1,0,e13fd70e48467315519bd737953a5f89,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1369,346df338c243a91f3243d92b2c6edd9e,1552715275,1552721835,223.104.16.204,15943811544,15943811544,1,0,614cb8f69ca94b00f74a400615b9599e,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1370,90db33412f3f1821eb58c4561c455a2b,1552715582,1552792350,117.141.15.32,15525774913,清华,2,0,6b89327ce906f809f0cad13e56d2aa28,,2019-03-16,e7279e9c96995e0d3e0cc933df28ef77,,1035,1035,1016,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1371,f0082ccf15faba039b25e8162270ce38,1552715592,1552717093,116.10.50.4,18377967780,仅此而已,1,0,4cbeda750b9356c005c2a5ba3f640fe1,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1372,c8c3cc0e72d08a8a6d98294d12274579,1552715798,1552715798,117.136.89.86,13711525340,xiaoluo5340,1,0,f0505f866fc85f5f2e7b535332878430,,2019-03-16,,,1368,1368,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1373,82d80728d06719ffdc70edcead72c608,1552715890,1552871810,117.28.149.40,13030873383,陈培英,2,0,84c136955b9f69dc0d54d5ab68607881,陈培英,2019-03-16,8e117ffb56be4013b1aa1208f261fc32,,1085,1085,1083,,0.00000000,100.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users` VALUES (1374,02ecd08adbddefe7cdc4d65a00def31d,1552716046,1552716395,106.17.194.5,18974686971,lwq李文强,1,0,b4b8be7cd82817cd878b0870e1c38dd1,李文强,2019-03-16,,,1035,1035,1016,1013,1000,18974686971@163.com,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1375,aeed707a60f80c43c6eab9ecbc9bf2b5,1552716075,1552808025,113.121.160.27,13963496679,赵守国,4,0,2df48ebd27091a01d7be9ee34201bc21,赵守国,2019-03-16,,,1148,1148,1040,1013,1000,,0.00000000,1000.00000000,0.00000000,28003.79919800,0,84.20080200,,1,1,0,84.13760400,,0);
INSERT INTO `clt_users` VALUES (1376,a5391cddfc9d0aa767a94daf95d044b5,1552719985,1552720058,117.136.79.153,13716710015,徐梦,1,0,6f7dfb97f54eb1d0c1ec32c81fa9f027,,2019-03-16,,,1028,1028,1027,1026,1024,1023,1021,1020,1014,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1377,6c6d0fa481a4495a11aedb9e83fe56fb,1552724487,1552831203,223.16.17.79,13922552418,吴楚珠,6,0,6a1f0ce5fcf6dad0854d9814dae6ee59,吴楚珠,2019-03-16,,,1175,1175,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174825.36800000,0,262.63200000,,1,1,0,524.47610400,,0);
INSERT INTO `clt_users` VALUES (1378,df8beec984892dd70372e4726c3aa816,1552724530,1552831249,223.16.17.79,13689533883,袁庭芳,6,0,67ae54a7599556cb47bfed56cdba87a4,袁庭芳,2019-03-16,,,1175,1175,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174825.36800000,0,262.63200000,,1,1,0,524.47610400,,0);
INSERT INTO `clt_users` VALUES (1379,dc529444689226844771bb55d3e6d163,1552724556,1552831126,223.16.17.79,17722831066,叶爱杨,6,0,81f7e4fbdaef3d209f64f02b40a65906,叶爱杨,2019-03-16,,,1175,1175,1018,1015,1013,1000,,0.00000000,5000.00000000,0.00000000,174825.36800000,0,262.63200000,,1,1,0,524.47610400,,0);
INSERT INTO `clt_users` VALUES (1380,e9bd70a6bc924b70538ea01ca9449728,1552725103,1552879050,61.158.147.54,18697721588,李辉,2,0,286d163eb3f8cd72f500d3013117192e,,2019-03-16,,,1074,1074,1066,1059,1017,1013,1000,,0.00000000,110.00000000,0.00000000,2178.15400000,0,9.84600000,/uploads/20190316/87e688fdefe9f47d4e4a75e51dcda347.jpg,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1381,c238047e39a1ed4f9961cab2d6c63238,1552726059,1552726059,117.136.36.94,13685570006,王斌,1,0,83f1cf6b9ef8cd24beb35d10fe9953b5,,2019-03-16,,,1065,1065,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1382,22bc8c84dda6ad21cbf34a147e3445ab,1552730875,1552813022,112.97.53.164,18682203998,何成,6,0,c2e47420430c9f9e4134e15acf00951a,何成,2019-03-16,,,1042,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,175607.50794800,0,790.49205200,,1,1,0,529.19210400,,1);
INSERT INTO `clt_users` VALUES (1383,03f9449d18bb5bdbfed9558df9353a9f,1552731079,1552826308,183.182.115.140,18219678333,孙海龙,6,0,76d5dd17575ef3541877899676bc34b3,孙海龙,2019-03-16,,,1040,1040,1013,1000,,0.00000000,5000.00000000,0.00000000,180030.04779200,0,57.95220800,,1,1,0,532.68820800,,1);
INSERT INTO `clt_users` VALUES (1384,0accdb039e2f850e280e915fec892581,1552731344,1552733239,183.182.115.140,15193744444,孙彦森,6,0,e4f4affe08dec308b1ec7f5ad79cb180,孙彦森,2019-03-16,,,1383,1383,1040,1013,1000,,0.00000000,5000.00000000,0.00000000,177033.75989600,0,554.24010400,,1,1,0,532.68820800,,1);
INSERT INTO `clt_users` VALUES (1385,c11b3aa5280964de13cc4d657b10c725,1552731435,0,111.221.144.57,18996416045,蒋景华,6,0,ab8fa240d87a5b03f75d0b2bbc90944d,蒋景华,2019-03-16,,,1384,1384,1383,1040,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1386,20e99ca67cc7748062e9c36ca90b28fa,1552733776,1552736513,183.37.133.225,18028039668,LIPING,1,0,a21975569c3462c9ac3bad46550d4dc8,,2019-03-16,,,1022,1022,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1387,2668959b57ec048d6cad05f2b530ac57,1552739557,1552739557,61.129.6.148,13895857611,夏日,1,0,a97a486b78346d334d118ede6ea39098,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1388,6704ae8517b523f14a31d08acc609b89,1552741436,1552741525,175.5.67.57,17774663052,玉,1,0,127e91f3d012e2d3a936c0a70276fe22,,2019-03-16,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1389,d8bb9ef70f222ea1cafa6060f5bd89c0,1552746378,1552748267,182.40.47.37,18787713638,刘世鹏,6,0,3b50f38fe8262673f746fd6b04bc6091,刘世鹏,2019-03-16,,,1021,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,174825.36800000,0,262.63200000,/uploads/20190316/1686d717eed8e2af3c0257ab8d1f3635.jpg,1,1,0,524.47610400,,1);
INSERT INTO `clt_users` VALUES (1390,77b12cc9d4d590b9342b8be674c23fe0,1552746405,1552838640,111.221.144.57,13149937856,刘若浩,6,0,f7f43f8abb0b6aa59d21eedfe84cff58,刘若浩,2019-03-16,,,1021,1021,1020,1014,1013,1000,,0.00000000,5000.00000000,0.00000000,177682.73600000,0,5.26400000,,1,1,0,533.04820800,,1);
INSERT INTO `clt_users` VALUES (1391,9d87140998bec06d44261d8402c9ca6e,1552747221,1552791292,58.243.254.245,13359086488,杜琼,6,0,ffa6e9eeb6bed21357d6197f34fe4444,杜琼,2019-03-16,,,1017,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,177712.73600000,0,0.26400000,,1,1,0,533.13820800,,0);
INSERT INTO `clt_users` VALUES (1392,8dee0ba95e8f5919abe3635f4ddbda3a,1552767174,1552767174,123.151.77.49,15845895719,军,1,0,dd1e0402124c168870c62620802bb552,,2019-03-17,,,1028,1028,1027,1026,1024,1023,1021,1020,1014,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1393,acaf797651d24da53723318fe29306a6,1552782028,1552782028,223.67.141.100,17851620080,不忘初心,1,0,a6d383950903a12df3597c61de6251f5,,2019-03-17,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1394,d3254152c79cdb0fcdc29a3949c0a3b4,1552782197,1552782197,223.104.6.43,15396275587,Carry,1,0,8ba8fbe17e793f9fbda4da77e6598ef6,,2019-03-17,,,1052,1052,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1395,6e4617a04c32a5e45593a6c3ac09b2c4,1552786236,1552786236,117.136.22.40,15236730323,王茂香,1,0,ce05392e161aa89f7945c289f5d13f74,,2019-03-17,,,1380,1380,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1396,fd3d1f1d8122a955895df29f6c66a528,1552787309,1552828161,112.97.53.109,18186472936,李思琴,2,0,2e925750ad97231ef3f735ba10a0043b,李思琴,2019-03-17,,,1192,1192,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1398,fb3801465c5cde48f16cadd2c368917a,1552788927,1552838554,223.104.191.22,18615134345,Boss88,6,0,f0a0a4435f93b1234cbad0b460483130,,2019-03-17,,,1021,1021,1020,1014,1013,1000,,0.00000000,5010.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1399,0af13aab10694cd0c02ddf111700e8c6,1552790640,1552790640,106.17.100.176,18173416793,励志,1,0,742b90790cbfb4f156ef2a4181087458,,2019-03-17,,,1021,1021,1020,1014,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1400,26949a321ecd7191d3e1357eca69dd84,1552794424,1552861655,117.136.90.32,13835283797,A-M,2,0,82ff0e34403c6c0bb5ab3cd5ad069277,,2019-03-17,,,1035,1035,1016,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1401,c7d19b007286947d76251c46c361b9c1,1552798493,1552871426,112.37.7.249,18265792187,添锦,2,0,527378da71db87e801b737895fb3ab82,,2019-03-17,,,1061,1061,1034,1016,1013,1000,,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1403,52d63a63559667b51de5bb37c567f134,1552802903,1552875750,61.158.146.158,15225336333,黄光辉,2,0,808e992d78ea87d0aad15d44e7c25221,,2019-03-17,,,1380,1380,1074,1066,1059,1017,1013,1000,,0.00000000,110.00000000,0.00000000,2184.71800000,0,3.28200000,/uploads/20190318/f531e4eb5f75f47289c5032761198114.jpg,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1404,77117b553cc60b12372cbf2abe842451,1552803073,1552862051,223.90.103.86,15737629559,陈艳玲,1,0,701880ab1e4984fd20171268df873b02,,2019-03-17,,,1403,1403,1380,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1405,0d55c3abadf728fa3bd82140cca3d175,1552803639,1552803949,117.136.44.90,15737690755,李坤照,1,0,97cde4ef63d30371b01359c5b6cd1a7d,,2019-03-17,,,1380,1380,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1406,638ecc2811b5ff1ea572d581b8982336,1552804263,1552833770,117.136.44.81,13523991142,刘文英,2,0,cff01813dc0b3bd48a2b156c98fe822f,,2019-03-17,,,1380,1380,1074,1066,1059,1017,1013,1000,,0.00000000,110.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1407,69e497ec5c2915bd7c75d926986db4e5,1552804363,1552804588,221.13.63.169,17785401107,雪晶995,1,0,63330125fcf12fb483b436b0e0fde6e1,,2019-03-17,,,1035,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1408,aef46e1a5473f9cd42e6653fd0d75e01,1552805455,1552805455,183.39.159.208,13378477336,Klng,1,0,a059deb31db585e27a1d31b71f0a6bb5,,2019-03-17,,,1022,1022,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1409,f47c1875b5162add379e6db1983b586e,1552806120,1552806120,223.104.19.128,18656799911,薛永贵,1,0,1b08906c567738c520ad57e866e4c270,,2019-03-17,,,1074,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1410,4d5d3e3d2699523500425e9e11a50dbc,1552806463,1552806463,117.136.36.43,13837666319,胡心群,1,0,5ea379fee17a38889a351c0c8fdaa209,,2019-03-17,,,1380,1380,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1411,95e42a806ba331b4bb094fb42886b582,1552809601,1552809601,61.151.179.27,15967463886,cun890314,1,0,07b0c6fc837c1e3629cd8fa60eddee24,,2019-03-17,,,1407,1407,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1412,64bf0fc8cfbfdc0de1a0f9f57cfbe1b9,1552816945,1552816945,61.151.178.176,15306813773,飞扬,1,0,0d4459f7a26a295554879c1a358730f7,俞祖锋,2019-03-17,f0f8f437939b9465cfa7aeb7bca6a200,,1013,1013,1000,2663035428@qq.com,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1413,3bd4f1aa939885b6d68b1218fb14febb,1552820384,1552820384,117.136.106.131,15037673213,石明伟,1,0,3e19ed117d45ce2e903efad68b7470e6,,2019-03-17,,,1403,1403,1380,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1414,64daf3a657e541789fe2b0ddf03eb0df,1552820787,1552820787,117.136.106.131,18537619988,王先成,1,0,86ffb770e7b65e0ab05b356f0839356f,,2019-03-17,,,1074,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1415,7385723b049822713cdee76fa5b0c87e,1552820984,1552820984,117.136.106.131,15237602576,刘长安,1,0,857d89ff15147f451b651ed54ae54334,,2019-03-17,,,1403,1403,1380,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1416,c01b34705fd1ed57883537fb6af42b2e,1552823225,1552879163,111.222.94.139,13886588828,刘亚蓉,6,0,d21823f89f42184728e822de2399f761,刘亚蓉,2019-03-17,,,1382,1382,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,176397.36800000,0,0.63200000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1417,6b4fb8234255d8e701aee3e771cbba16,1552823262,1552828620,111.222.94.139,13802508441,王艺,6,0,5cd9c7d982fcbfa5dbf41028724bcaa9,王艺,2019-03-17,,,1382,1382,1042,1033,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1418,c5ba50070dc1f25f36845d6fdde2dd51,1552828920,1552829126,117.136.79.151,13603058990,静静,1,0,91f463ccc034a7675b328b2b47534502,,2019-03-17,,,1416,1416,1382,1042,1033,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1419,e9e5de6d8012e1ff8c0f912a5c5755de,1552831324,1552831324,61.151.178.168,17123247637,相国,1,0,60268edf1b6140b8ac3be808175542be,,2019-03-17,,,1370,1370,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1420,8bdc7f990148d6ed5ae33e86fb1cedb2,1552833772,1552872909,223.16.17.79,13143885470,区玉爱,2,0,bf41e3b0ebef20fbcc9ecfb21a406286,区玉爱,2019-03-17,,,1276,1276,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,1,0,6.56400000,,0);
INSERT INTO `clt_users` VALUES (1421,366c233949590abc9f44b3311259c104,1552836729,1552839048,223.104.191.22,18823745807,Boss99,6,0,21b314e20cdf8fc82ffb32a9395a1c95,,2019-03-17,,,1398,1398,1021,1020,1014,1013,1000,,0.00000000,5040.00000000,0.00000000,175088.00000000,0,0.00000000,,1,1,0,525.26400000,,1);
INSERT INTO `clt_users` VALUES (1422,8fd976b6041361f8fcd83c9877285ab1,1552839083,1552839201,113.26.38.212,18334852745,商城,1,0,1ae20ce4e2b0237cbf28cccca1332816,,2019-03-18,,,1370,1370,1035,1016,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1423,a339fd64323c135b570104f241fb2e9e,1552841821,0,111.221.144.57,18655539912,曹俊,6,0,8331d80354876924658fa8b662eada1d,曹俊,2019-03-18,,,1391,1391,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1424,31cb82666fbad0c6b60eeefe954863a2,1552841916,0,111.221.144.57,13305538567,张皎,6,0,b767fa308197116578c4e15413ae02f7,张皎,2019-03-18,,,1391,1391,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1425,1c84a8d432a33ad424c30b0a8268d693,1552842032,0,111.221.144.57,13825762148,余帼梅,6,0,c68e10260db6f089bf402856e22ad41c,余帼梅,2019-03-18,,,1391,1391,1017,1013,1000,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,0.00000000,,1);
INSERT INTO `clt_users` VALUES (1426,6071b4c77dde46ab7972406002ae26a6,1552842194,0,111.221.144.57,13705533666,陶文峰,2,0,d988d5150be857e8f58f0b401428a031,陶文峰,2019-03-18,,,1160,1160,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1427,5f85b0dd51cafbf1689e41a035339b0d,1552842253,0,111.221.144.57,18755374228,杨保秀,2,0,d82fe465c8701a1a2f1908e0084ff7a6,杨保秀,2019-03-18,,,1160,1160,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1428,c2ce75aa3bf21fbca4f97e47181ef14b,1552842475,0,111.221.144.57,13866352200,汪一平,4,0,5581e7835e7116670bebbe9ff77310da,汪一平,2019-03-18,,,1160,1160,1017,1013,1000,,0.00000000,1000.00000000,0.00000000,28088.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1429,f0ade37ac14b03bf5b35e656b31ce7b9,1552842722,0,111.221.144.57,15385532319,张沐洋,2,0,90e5f8afed80c0b66bcdc95e3f781266,张沐洋,2019-03-18,,,1428,1428,1160,1017,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1430,ac7a3ceae1e5ebebaad70aa561b93d96,1552842757,0,111.221.144.57,13004048697,张玲,3,0,3fb05c3b2edd823c55ff3621296a3c6a,张玲,2019-03-18,,,1428,1428,1160,1017,1013,1000,,0.00000000,500.00000000,0.00000000,12338.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1431,e19be7626db9cb5b7351ac0a01029e21,1552863883,1552863883,123.151.76.158,15140650893,寞寞,1,0,e5be51d4c06a4d1ffaaa574124d7f93e,,2019-03-18,,,1120,1120,1086,1083,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1432,7138728b15c38f9a218d49c32b4c8c88,1552870883,1552872812,117.136.93.194,15854668499,由守都,1,0,357526742a140e4c76628a89462c98fb,由守都,2019-03-18,a1c1c532f58a7045bd388cc143b5d4b7,,1359,1359,1034,1016,1013,1000,317715930@qq.com,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1433,614969b427be00491ce5ef84909750c3,1552871822,0,111.221.144.57,91208689,曾艳芳,2,0,ae1583be5cd64f1ee3e86f29b3f38081,曾艳芳,2019-03-18,,,1276,1276,1258,1211,1174,1018,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1434,8c1da83e7ac9d1f0f4906089be46b5fd,1552872478,1552874871,223.198.50.106,13976362019,王少云,2,0,42a0e0151caf820ee42e192cf90b4398,王少云,2019-03-18,9652aa5fb10a7c3afda0e9564c596a64,,1178,1178,1149,1139,1015,1013,1000,,0.00000000,100.00000000,0.00000000,2188.00000000,0,0.00000000,,1,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1435,90b5bcb628169eb615f4786cad29e246,1552872775,1552872775,106.33.6.77,15978557299,吕顺平,1,0,25ad4cb894d8c0c41610d1c2fbb86d67,吕顺平,2019-03-18,,,1406,1406,1380,1074,1066,1059,1017,1013,1000,2542429691@qq.com,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,/uploads/20190318/3a9049571be67de840e93a1362a79379.jpg,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1436,6946d0d6d31044fe197e036590bdaa63,1552872931,1552878480,223.104.109.218,13723105891,闫志广,1,0,3185bcb1c7aebecf0fcfae8255809eba,,2019-03-18,,,1380,1380,1074,1066,1059,1017,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,/uploads/20190318/064c1e37c2a434fa03e44f43f18e87d6.jpg,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1437,f1462aaaf0b568aa03070e8a28aec26b,1552874867,1552874867,123.151.77.48,18241120500,华宇,1,0,af323ea4f591b23e9e6729b3f9206656,,2019-03-18,,,1120,1120,1086,1083,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1438,4bebfb8a151c43095344871557ea67ca,1552876493,1552876493,47.34.233.218,15313132393,资源王子,1,0,75b9025b579022c9e399e771a583028b,,2019-03-18,,,1014,1014,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1439,d5c60a3b71e55a42b678889c958cea4f,1552876637,1552876705,47.34.233.218,17080371888,能量王子,1,0,22a812601a7ff10f6aa25f8ddffbd51c,,2019-03-18,,,1438,1438,1014,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
INSERT INTO `clt_users` VALUES (1440,1ab35f4733f08d6ef4a1dae665ad9696,1552878981,1552879330,27.204.40.55,15528812506,哈哈,1,0,480a3d41f710326da9edcae33b34fec4,,2019-03-18,,,1013,1013,1000,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,1,0,0.00000000,,0);
--
-- 表的结构 `clt_users1`
-- 
DROP TABLE IF EXISTS `clt_users1`;
CREATE TABLE `clt_users1` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `password` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) CHARACTER SET utf8 DEFAULT '' COMMENT '最后登录ip',
  `mobile` char(11) CHARACTER SET utf8 DEFAULT '' COMMENT '手机号码',
  `nickname` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '第三方返回昵称',
  `level` int(1) DEFAULT '1' COMMENT '会员等级',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `token` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `xm` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `rq` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `aqmm` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `sfz` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `fxid` int(10) unsigned zerofill DEFAULT '0000000000' COMMENT '上级ID',
  `all_fxid` varchar(225) CHARACTER SET utf8 DEFAULT '',
  `email` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `money_usdt` decimal(20,8) DEFAULT '0.00000000',
  `money_cz` decimal(20,8) DEFAULT '0.00000000' COMMENT '充值usdt总数',
  `xmt` decimal(20,8) DEFAULT '0.00000000',
  `nmct_dj` decimal(20,8) DEFAULT '0.00000000' COMMENT '冻结资产',
  `pw_time` int(20) DEFAULT '0',
  `nmct` decimal(20,8) DEFAULT '0.00000000' COMMENT '可用资产',
  `head_pic` varchar(225) DEFAULT NULL,
  `pass` int(1) DEFAULT '0' COMMENT '是否激活账户',
  `isonline` int(1) NOT NULL DEFAULT '0' COMMENT '登入状态',
  `g` int(1) DEFAULT '0',
  `hongbao` decimal(20,8) DEFAULT '0.00000000' COMMENT '静态红包',
  `token_address` varchar(225) DEFAULT NULL,
  `zs` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`) ,
  KEY `mobile` (`mobile`) ,
  KEY `level` (`level`) 
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=latin1;

-- 
-- 导出`clt_users1`表中的数据 `clt_users1`
--
INSERT INTO `clt_users1` VALUES (1000,6e271f2474ba071765ad0f4ade070460,1552120768,1552124865,58.255.94.97,123456,系统,2,0,b05ddb8ab4c1ba73b77d3e3e071bdf31,系统,2019-03-09,,,,,919320213@qq.com,0.00000000,100.00000000,0.00000000,2184.71800000,0,3.28200000,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users1` VALUES (1001,1ec746502ea6e57d72c1bc1b57208227,1552147807,1552531100,111.221.144.57,13267118521,超人,4,0,fb5d8c0e9ad70953c6b1b835174e3fa8,超人,2019-03-10,dd6e5e5918e94d997c686fcebc56922f,,,,919320213@qq.com,1900.00000000,1000.00000000,0.00000000,28467.24471736,0,120.75528265,,1,1,0,85.53987520,0x32b5751369aa1234EC475d03dC5A3196a073296f,0);
INSERT INTO `clt_users1` VALUES (1002,0a2d77ffd282fda663e55c3856630c0e,1552184762,0,116.77.73.252,13266666666,系统,6,0,bbc615e1b1b37038df58156700530b50,币须火,2019-03-10,,,,,,0.00000000,5000.00000000,0.00000000,175088.00000000,0,0.00000000,,1,0,0,525.26400000,,0);
INSERT INTO `clt_users1` VALUES (1003,bbda13b5b8a552e9923210b155b3ce38,1552187001,1552187001,112.97.60.80,13356878921,9999,1,0,b3ff2cbaadacbe491f8d2f7c752002cf,,2019-03-10,,,1001,1001,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users1` VALUES (1004,4605e1dfa14096f99ef62ad7bda37820,1552187959,1552187959,123.151.77.49,15101519372,大眼猫,1,0,b1a538ae1df50ff48ee10c2363341c66,,2019-03-10,,,1001,1001,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users1` VALUES (1005,1bfc86d3c9b92a0d38bdcb82e00800d5,1552188288,1552188288,125.44.89.193,17188369502,china,1,0,e559510ff249e443a11244994b447c71,,2019-03-10,,,1001,1001,,0.00000000,0.00000000,0.00000000,88.00000000,0,0.00000000,,0,0,0,0.00000000,,0);
INSERT INTO `clt_users1` VALUES (1006,c9a95aec91727920d2c69f6d376a36e4,1552281339,1552532484,111.221.144.57,1,1,2,0,b5048bcda4678ab1cf385abc2c4b6f8a,1,2019-03-11,,,1001,1001,,9900.00000000,10000.00000000,0.00000000,2181.44092300,0,6.55907700,,1,1,0,6.55415400,,0);
INSERT INTO `clt_users1` VALUES (1007,f3da7794032394748cc5728fa87808a6,1552281364,1552534249,111.221.144.57,2,2,6,0,940f16515cd433793c617efa191f2f5f,2,2019-03-11,,,,,,4880.00000000,10000.00000000,0.00000000,176918.94092300,0,269.05907700,,1,1,0,531.55415400,,0);
INSERT INTO `clt_users1` VALUES (1008,deac5fb7d239372d183f7a71c5e61565,1552281382,0,116.77.73.252,3,3,2,0,63525a7303ced85d2997e7c6d7abb295,3,2019-03-11,,,,,,9900.00000000,10000.00000000,0.00000000,2188.00000000,0,0.00000000,,1,0,0,6.56400000,,0);
INSERT INTO `clt_users1` VALUES (1009,5b42cc4637246acf8362b1380127f699,1552281401,0,116.77.73.252,4,4,1,0,fd9d225023d4545acf9ed87967018007,4,2019-03-11,,,1001,1001,,10000.00000000,10000.00000000,0.00000000,88.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users1` VALUES (1010,6d3df9e495baa29c17a216d3ed1aa70d,1552281429,0,116.77.73.252,5,5,1,0,8b4a7a6fc99f771de0ad6da71cdc9ae3,5,2019-03-11,,,1001,1001,,10000.00000000,10000.00000000,0.00000000,88.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users1` VALUES (1011,0ff553d8fc9d0e085bb765af8e72092a,1552281447,0,116.77.73.252,6,6,1,0,fae3b596191610a71b7766ffc286c79c,6,2019-03-11,,,1001,1001,,10000.00000000,10000.00000000,0.00000000,88.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
INSERT INTO `clt_users1` VALUES (1012,6045375a12e0d61bd4069526401a5ba2,1552281462,0,116.77.73.252,7,7,1,0,49c011b91740f02b9242d965c101ea80,7,2019-03-11,,,1001,1001,,10000.00000000,10000.00000000,0.00000000,88.00000000,0,0.00000000,,1,0,0,0.00000000,,0);
--
-- 表的结构 `clt_xw`
-- 
DROP TABLE IF EXISTS `clt_xw`;
CREATE TABLE `clt_xw` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `type_id` tinyint(5) NOT NULL COMMENT '所属位置',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `open` tinyint(2) NOT NULL COMMENT '1=审核  0=未审核',
  `content` text NOT NULL COMMENT '广告内容',
  `jj` varchar(225) DEFAULT NULL,
  `qkl_id` tinyint(10) NOT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `plug_ad_adtypeid` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_xw`表中的数据 `clt_xw`
--
INSERT INTO `clt_xw` VALUES (47,资产双通证上线运营时间,9,,,1552531638,20,1,<p>Distinguished members of the new media community:</p><p>After USA NMCT/XMT assets dual-pass platform is officially operational! Welcome to the Global Market Community Team! Enter digital asset management! Build your own team quickly!</p><p><br></p><p><br></p><p>ด้วยความเคารพสมาชิก : สื่อใหม่ในชุมชน</p><p>สหรัฐอเมริกา / สินทรัพย์ / NMCT XMT คู่ผ่านแพลตฟอร์มการดำเนินงานอย่างเป็นทางการแล้ว ! ! ! ! ! ! ! ยินดีต้อนรับสู่โลกของชุมชนตลาดเมื่อเข้าร่วมทีม ! ! ! ! ! ! ! ในการจัดการสินทรัพย์ดิจิตอล ! ! ! ! ! ! ! ได้อย่างรวดเร็วสร้างทีมของตนเอง ! ! ! ! ! ! !</p><p><br></p><p>尊敬的新媒体社区的成员：</p><p>USA NMCT/XMT资产双通证平台正式进行运营后！届时欢迎全球市场社区团队加入！进入数字资产管理！快速组建自己的团队！</p>,全球资产双通证平台于公历2019年3月16日正式上线运营！,49);
INSERT INTO `clt_xw` VALUES (51,资产双通证对接各大电商体系公告,9,,,1552573717,21,1,<p>Distinguished members of the new media community:</p><p>USA New Media Mall docking about the purchase of goods in Taobao, Jingdong and Pingduo Mall. Due to the API multi-interface link problem, the mall is in the first stage of debugging system. It is not open for members to purchase for the time being. The whole mall system will officially open the NMCT/XMT purchase function on May 1, 2019.</p><p><br></p><p>ด้วยความเคารพสมาชิกชุมชนใหม่ของสื่อ :</p><p>สหรัฐอเมริกาสื่อใหม่ที่ก้นของ Taobao มอลล์ , ตะวันออก , กันมากขึ้น ' ' สินค้าในร้านที่ซื้อเพราะ API หลายอินเตอร์เฟซการเชื่อมโยงปัญหาห้างนี้มีขั้นตอนการแก้จุดบกพร่องระบบที่หนึ่งชั่วคราวที่ไม่เปิดให้สมาชิกซื้อห้างทั้งระบบจะเปิดอย่างเป็นทางการในวันที่ 1 พฤษภาคมพ.ศ. 2562 XMT NMCT / การทำงานของการซื้อ ! ! ! ! ! ! !</p><p><br></p><p><br></p><p>尊敬的新媒体社区的成员们：</p><p>USA 新媒体商城对接的关于淘宝、’京东、拼多多商城内的商品购买，由于API多接口链接问题，该商城正属于调试系统第一阶段，暂时不开放会员购买，整个商城体系将于2019年5月1号正式开通NMCT/XMT购买功能！</p>,资产双通证对接各大电商体系公告,49);
--
-- 表的结构 `clt_yhk`
-- 
DROP TABLE IF EXISTS `clt_yhk`;
CREATE TABLE `clt_yhk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `yh` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `yhk` varchar(50) NOT NULL,
  `user_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`) 
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_yhk`表中的数据 `clt_yhk`
--
INSERT INTO `clt_yhk` VALUES (45,中国银行,梁剑平,6216667000001978725,1022);
INSERT INTO `clt_yhk` VALUES (46,建设银行,徐诗展,6217003410002823617,1035);
INSERT INTO `clt_yhk` VALUES (47,农业银行,李国花,6228481898204623272,1055);
INSERT INTO `clt_yhk` VALUES (48,建设银行,陈莎莎,6217002260013502218,1077);
INSERT INTO `clt_yhk` VALUES (49,建设银行,高景芹,6217001740007637600,1059);
INSERT INTO `clt_yhk` VALUES (50,农业银行,万桂梅,6228480120264481611,1324);
INSERT INTO `clt_yhk` VALUES (51,建设银行,钱叶九,6236681930005260011,1086);
INSERT INTO `clt_yhk` VALUES (52,农业银行,钱叶九,6228480078221968577,1083);
INSERT INTO `clt_yhk` VALUES (53,工商银行,钱叶九,6212264100007808615,1085);
INSERT INTO `clt_yhk` VALUES (54,工商银行,钱叶九,6212264100007808615,1110);
INSERT INTO `clt_yhk` VALUES (55,工商银行,钱叶九,6212264100007808615,1112);
INSERT INTO `clt_yhk` VALUES (56,农业银行,钱叶九,6228480078221968577,1113);
INSERT INTO `clt_yhk` VALUES (57,农业银行,钱叶九,6228480078221968577,1114);
INSERT INTO `clt_yhk` VALUES (58,农业银行,钱叶九,6228480078221968577,1111);
INSERT INTO `clt_yhk` VALUES (59,建设银行,蔡克运,6217003110011396734,1140);
INSERT INTO `clt_yhk` VALUES (60,农业银行,钱叶九,6228480078221968577,1373);
INSERT INTO `clt_yhk` VALUES (61,农业银行,王斌,6228483161247585018,1065);
INSERT INTO `clt_yhk` VALUES (62,农村商业,庄叶,6231157812897037,1208);
INSERT INTO `clt_yhk` VALUES (63,工商银行,李继红,6222020509001982123,1370);
INSERT INTO `clt_yhk` VALUES (64,工商银行,刘方建,6222001617100167133,1177);
INSERT INTO `clt_yhk` VALUES (65,农业银行,由守都,6228481849043060978,1432);
INSERT INTO `clt_yhk` VALUES (66,工商银行,杨磊,6212260407003430748,1209);
--
-- 表的结构 `clt_yy`
-- 
DROP TABLE IF EXISTS `clt_yy`;
CREATE TABLE `clt_yy` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `type_id` tinyint(5) DEFAULT NULL COMMENT '所属位置',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `open` tinyint(2) NOT NULL COMMENT '1=审核  0=未审核',
  `content` text COMMENT '广告内容',
  PRIMARY KEY (`ad_id`),
  KEY `plug_ad_adtypeid` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- 
-- 导出`clt_yy`表中的数据 `clt_yy`
--
INSERT INTO `clt_yy` VALUES (39,京东商城,,/uploads/20190309/6c853fb743367d2d1fad62e0a600e3f8.png,https://m.jd.com/,1512980906,42,0,<p>一、总则</p><p>1.1 OEC的所有权和运营权归东莞市OEC实业有限公司所有。&nbsp;</p><p><br></p><p>1.2 用户在注册之前，应当仔细阅读本协议，并同意遵守本协议后方可成为注册用户。一旦注册成功，则用户与OEC之间自动形成协议关系，用户应当受本协议的约束。用户在使用特殊的服务或产品时，应当同意接受相关协议后方能使用。</p><p><br></p><p>1.3 本协议则可由OEC随时更新，用户应当及时关注并同意本站不承担通知义务。本站的通知、公告、声明或其它类似内容是本协议的一部分。</p><p><br></p><p>二、服务内容</p><p>2.1 OEC的具体内容由本站根据实际情况提供。</p><p><br></p><p>2.2 本站仅提供相关的网络服务，除此之外与相关网络服务有关的设备(如个人电脑、手机、及其他与接入互联网或移动网有关的装置)及所需的费用(如为接入互联网而支付的电话费及上网费、为使用移动网而支付的手机费)均应由用户自行负担。</p><p>三、用户帐号</p><p>3.1 经本站注册系统完成注册程序并通过身份认证的用户即成为正式用户，可以获得本站规定用户所应享有的一切权限；未经认证仅享有本站规定的部分会员权限。OEC有权对会员的权限设计进行变更。</p><p><br></p><p>3.2 用户只能按照注册要求使用真实姓名，及身份证号注册。用户有义务保证密码和帐号的安全，用户利用该密码和帐号所进行的一切活动引起的任何损失或损害，由用户自行承担全部责任，本站不承担任何责任。如用户发现帐号遭到未授权的使用或发生其他任何安全问题，应立即修改帐号密码并妥善保管，如有必要，请通知本站。因黑客行为或用户的保管疏忽导致帐号非法使用，本站不承担任何责任。</p><p>四、使用规则</p><p>4.1 遵守中华人民共和国相关法律法规，包括但不限于《中华人民共和国计算机信息系统安全保护条例》、《计算机软件保护条例》、《最高人民法院关于审理涉及计算机网络著作权纠纷案件适用法律若干问题的解释(法释[2004]1号)》、《全国人大常委会关于维护互联网安全的决定》、《互联网电子公告服务管理规定》、《互联网新闻信息服务管理规定》、《互联网著作权行政保护办法》和《信息网络传播权保护条例》等有关计算机互联网规定和知识产权的法律和法规、实施办法。&nbsp;</p><p>4.2 用户对其自行发表、上传或传送的内容负全部责任，所有用户不得在本站任何页面发布、转载、传送含有下列内容之一的信息，否则本站有权自行处理并不通知用户：</p><p>(1)违反宪法确定的基本原则的；&nbsp;</p><p>(2)危害国家安全，泄漏国家机密，颠覆国家政权，破坏国家统一的；&nbsp;</p><p>(3)损害国家荣誉和利益的；&nbsp;</p><p>(4)煽动民族仇恨、民族歧视，破坏民族团结的；&nbsp;</p><p>(5)破坏国家宗教政策，宣扬邪教和封建迷信的；&nbsp;</p><p>(6)散布谣言，扰乱社会秩序，破坏社会稳定的；</p><p>(7)散布淫秽、色情、赌博、暴力、恐怖或者教唆犯罪的；&nbsp;</p><p>(8)侮辱或者诽谤他人，侵害他人合法权益的；&nbsp;</p><p>(9)煽动非法集会、结社、游行、示威、聚众扰乱社会秩序的；&nbsp;</p><p>(10)以非法民间组织名义活动的；</p><p><br></p><p>(11)含有法律、行政法规禁止的其他内容的。</p><p><br></p><p>4.3 用户承诺对其发表或者上传于本站的所有信息(即属于《中华人民共和国著作权法》规定的作品，包括但不限于文字、图片、音乐、电影、表演和录音录像制品和电脑程序等)均享有完整的知识产权，或者已经得到相关权利人的合法授权；如用户违反本条规定造成本站被第三人索赔的，用户应全额补偿本站一切费用(包括但不限于各种赔偿费、诉讼代理费及为此支出的其它合理费用)；</p><p><br></p><p>4.4 当第三方认为用户发表或者上传于本站的信息侵犯其权利，并根据《信息网络传播权保护条例》或者相关法律规定向本站发送权利通知书时，用户同意本站可以自行判断决定删除涉嫌侵权信息，除非用户提交书面证据材料排除侵权的可能性，本站将不会自动恢复上述删除的信息；</p><p><br></p><p>(1)不得为任何非法目的而使用网络服务系统；&nbsp;</p><p><br></p><p>(2)遵守所有与网络服务有关的网络协议、规定和程序；</p><p><br></p><p>(3)不得利用本站进行任何可能对互联网的正常运转造成不利影响的行为；</p><p><br></p><p>(4)不得利用本站进行任何不利于本站的行为。</p><p>五、隐私保护</p><p>5.1 本站不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在本站的非公开内容，但下列情况除外：</p><p><br></p><p>(1)事先获得用户的明确授权；&nbsp;</p><p>(2)根据有关的法律法规要求；</p><p><br></p><p>(3)按照相关政府主管部门的要求；</p><p><br></p><p>5.2 本站可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与本站同等的保护用户隐私的责任，则本站有权将用户的注册资料等提供给该第三方。</p><p><br></p><p>5.3 在不透露单个用户隐私资料的前提下，本站有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。</p><p>六、版权声明</p><p>6.1 本站的文字、图片、音频、视频等版权均归东莞市OEC实业有限公司享有，未经本站许可，不得任意转载。&nbsp;</p><p><br></p><p>6.2 本站特有的标识、版面设计、编排方式等版权均属东莞市OEC实业有限公司享有，未经本站许可，不得任意复制或转载。</p><p><br></p><p>七、责任声明</p><p>7.1 用户明确同意其使用本站网络服务所存在的风险及一切后果将完全由用户本人承担，OEC对此不承担任何责任。&nbsp;</p><p>7.2 本站无法保证网络服务一定能满足用户的要求，也不保证网络服务的及时性、安全性、准确性。&nbsp;</p><p>7.3 本站不保证为方便用户而设置的外部链接的准确性和完整性，同时，对于该等外部链接指向的不由本站实际控制的任何网页上的内容，本站不承担任何责任。</p><p>7.4 对于因不可抗力或本站不能控制的原因造成的网络服务中断或其它缺陷，本站不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。</p><p><br></p><p>7.5 对于站向用户提供的下列产品或者服务的质量缺陷本身及其引发的任何损失，本站无需承担任何责任：</p><p><br></p><p>(1)本站向用户免费提供的各项网络服务；&nbsp;</p><p>(2)本站向用户赠送的任何产品或者服务。</p><p><br></p><p>(2)本站向用户赠送的任何产品或者服务。</p><p><br></p><p>7.6 本站有权于任何时间暂时或永久修改或终止本服务(或其任何部分)，而无论其通知与否，本站对用户和任何第三人均无需承担任何责任。</p><p><br></p><p>八、附则</p><p>8.1 本协议的订立、执行和解释及争议的解决均应适用中华人民共和国法律。&nbsp;</p><p>8.2 如本协议中的任何条款无论因何种原因完全或部分无效或不具有执行力，本协议的其余条款仍应有效并且有约束力。</p><p><br></p><p>8.3 本协议解释权及修订权归东莞市OEC实业有限公司所有。司所有。</p><p></p>);
INSERT INTO `clt_yy` VALUES (49,拼多多,,/uploads/20190309/7caa76ea8ecf390863c236ee97efbb7d.png,https://m.pinduoduo.com/,1552121862,43,0,);
INSERT INTO `clt_yy` VALUES (48,淘宝网,,/uploads/20190309/150ef1cfac5c5f5b990285b62c155305.png,https://h5.m.taobao.com/,1552027303,41,0,);
INSERT INTO `clt_yy` VALUES (50,优酷网,,/uploads/20190309/ddf8e862115b99a00c07f3e4ee1b1bd2.png,https://www.youku.com/,1552121952,50,0,);
INSERT INTO `clt_yy` VALUES (52,百度网,,/uploads/20190309/3dddb35744e009936f5dd5033164e10f.png,https://m.baidu.com/,1552122518,44,0,);
INSERT INTO `clt_yy` VALUES (53,餐饮外卖,,/uploads/20190309/d6a10464cfd9c704f80f0883deb1ad4b.png,http://h5.waimai.meituan.com/waimai/mindex/home,1552122603,50,0,);
INSERT INTO `clt_yy` VALUES (54,当当网,,/uploads/20190309/81f86fa210351522401349aa441d0e26.png,http://m.dangdang.com/,1552122700,50,0,);
INSERT INTO `clt_yy` VALUES (63,亚马逊,,/uploads/20190314/4433a82e558650e9537f8299f2bdd332.jpg,,1552529755,40,0,);
INSERT INTO `clt_yy` VALUES (56,58同城,,/uploads/20190314/bd990b14ad14e7a0706f4b1e0f67c548.jpg,https://m.58.com,1552122835,50,0,);
INSERT INTO `clt_yy` VALUES (58,租房,,/uploads/20190309/ee8267963e1636a1322537dfd9186a76.png,https://m.58.com,1552122894,50,0,);
INSERT INTO `clt_yy` VALUES (59,搜狐网,,/uploads/20190309/4a8c1b36d8592c42462e346313c4ba63.png,https://m.sohu.com/,1552123150,50,0,);
INSERT INTO `clt_yy` VALUES (60,腾讯网,,/uploads/20190309/e958a57defdd04dbe16aa92b2254288d.png,https://xw.qq.com/?f=c_news,1552123201,45,0,);
INSERT INTO `clt_yy` VALUES (65,火币交易所,,/uploads/20190314/c2e210ee88ed874bacbbffff7618361c.jpg,,1552534616,50,0,);
INSERT INTO `clt_yy` VALUES (62,网易,,/uploads/20190309/6ff429d1fd21df6a437fe21b60387bcf.png,https://3g.163.com/touch/#/,1552123340,46,0,);
INSERT INTO `clt_yy` VALUES (66,新浪网,,/uploads/20190316/272d4e43a341d737ee5d0fecef18c58a.png,https://sina.cn/,1552729924,50,0,);
INSERT INTO `clt_yy` VALUES (67,谷歌,,/uploads/20190316/34b59fe1c4133a25936666755bf9ef77.png,http://www.google.cn/hp?sp=china,1552730421,50,0,);