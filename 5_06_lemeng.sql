# Host: localhost  (Version: 5.5.53)
# Date: 2019-05-09 10:44:02
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "ddsc_admin"
#

DROP TABLE IF EXISTS `ddsc_admin`;
CREATE TABLE `ddsc_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `pretime` datetime DEFAULT NULL,
  `curtime` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT '登录IP',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '管理员类型 0超级管理员 1普通管理员',
  `control` text COMMENT '控制器权限',
  `way` text COMMENT '方法',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "ddsc_admin"
#

INSERT INTO `ddsc_admin` VALUES (1,'admin','8a30ec6807f71bc69d096d8e4d501ade','2019-05-08 09:02:35','2019-05-09 08:56:28','0.0.0.0',0,NULL,NULL);

#
# Structure for table "ddsc_assess"
#

DROP TABLE IF EXISTS `ddsc_assess`;
CREATE TABLE `ddsc_assess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL COMMENT '消息id',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `content` text COMMENT '内容',
  `addtime` varchar(255) DEFAULT NULL COMMENT '评论时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否审核 0否 1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='商品评价';

#
# Data for table "ddsc_assess"
#

INSERT INTO `ddsc_assess` VALUES (5,7,1,'123','1557301622',1),(7,7,1,'改装展示评价','1557299581',1),(8,7,1,'123','1557301622',1),(9,7,1,'456','1557301661',1),(10,7,1,'改装展示评价','1557299581',0),(12,7,1,'456','1557301661',0);

#
# Structure for table "ddsc_assist"
#

DROP TABLE IF EXISTS `ddsc_assist`;
CREATE TABLE `ddsc_assist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` int(11) DEFAULT NULL COMMENT '消息id',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `addtime` varchar(255) DEFAULT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='点赞列表';

#
# Data for table "ddsc_assist"
#


#
# Structure for table "ddsc_car_dd"
#

DROP TABLE IF EXISTS `ddsc_car_dd`;
CREATE TABLE `ddsc_car_dd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `time` varchar(255) DEFAULT NULL COMMENT '获取时间',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否使用 0否 1是',
  `times` varchar(255) DEFAULT NULL COMMENT '使用时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='洗车券';

#
# Data for table "ddsc_car_dd"
#

INSERT INTO `ddsc_car_dd` VALUES (4,3,'1557369675',1,'1557368755'),(5,3,'1557368204',0,'1557368755'),(6,3,'1557368204',0,'1557368755'),(7,3,'1557368204',1,'1557368755'),(8,3,'1557368204',1,'1557368755'),(9,3,'1557368204',1,'1557368755'),(10,3,'1557368204',1,'1557368755');

#
# Structure for table "ddsc_carte"
#

DROP TABLE IF EXISTS `ddsc_carte`;
CREATE TABLE `ddsc_carte` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL COMMENT '模块名称',
  `c_modul` varchar(255) DEFAULT NULL COMMENT '控制器',
  `c_icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `pid` int(11) DEFAULT NULL COMMENT '上级id',
  `c_sort` int(11) NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

#
# Data for table "ddsc_carte"
#

INSERT INTO `ddsc_carte` VALUES (1,'网站设置','Sys','fa-desktop',0,1),(2,'基本信息','seting','',1,1),(3,'网站优化','seo','',1,50),(4,'广告图管理','Lb','fa-picture-o',0,2),(5,'图片列表','lister','',4,50),(6,'广告位','place','',4,50),(13,'菜单管理','Carte','fa-reorder',0,3),(14,'后台模板','lister','',13,50),(16,'管理员管理','User','fa-user',0,4),(17,'管理员列表','lister','',16,50),(19,'会员管理','Member','fa-address-book-o',0,5),(20,'会员列表','lister','',19,50),(34,'日志管理','Log','fa-book',0,50),(36,'后台登录日志','index','',34,50),(81,'商户管理','Shop','fa-hotel',0,8),(87,'商户列表','lister','',81,1),(90,'支付配置','Payment','fa-paypal',0,49),(91,'微信支付','wxpay','',90,50),(99,'评论管理','Assess','fa-question-circle',0,13),(100,'未审核评论','lister','',99,50),(101,'已审核评论','index','',99,50),(102,'车友会管理','Riders','fa-truck',0,9),(103,'改装展示','lister','',102,50),(104,'配件展示','index','',102,50),(105,'意见反馈','Opinion','fa-question-circle',0,26),(106,'反馈列表','lister','',105,50),(107,'预约列表','Order','fa-cube',0,14),(108,'已预约列表','lister','',107,50),(109,'已完成列表','index','',107,50),(110,'洗车券管理','Car','fa-fax',0,25),(111,'未使用列表','lister','',110,50),(112,'已使用列表','index','',110,50);

#
# Structure for table "ddsc_lb"
#

DROP TABLE IF EXISTS `ddsc_lb`;
CREATE TABLE `ddsc_lb` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL COMMENT '父类id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态0关闭 1开启',
  `url` varchar(255) DEFAULT NULL,
  `desc` text COMMENT '简介',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告列表';

#
# Data for table "ddsc_lb"
#

INSERT INTO `ddsc_lb` VALUES (1,1,'banner',50,1,'','','/uploads/20190506/0fc443bcd2f7f7fa760c2c7e81befca7.png'),(2,1,'banner',50,1,'','','/uploads/20190506/de431844e0528765fe5512af447b5c97.png'),(3,2,'汽车预约',50,1,'','<p>安洁汽车美容 品质服务</p>',NULL),(4,3,'云车行',50,1,'','<p>关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们关于我们</p>',NULL),(5,4,'签到规则',50,1,'','<p>1.签到满30天可免费洗车一次</p>',NULL);

#
# Structure for table "ddsc_lb_place"
#

DROP TABLE IF EXISTS `ddsc_lb_place`;
CREATE TABLE `ddsc_lb_place` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '轮播id',
  `pl_name` varchar(255) DEFAULT NULL COMMENT '位置名称',
  PRIMARY KEY (`pl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='广告位';

#
# Data for table "ddsc_lb_place"
#

INSERT INTO `ddsc_lb_place` VALUES (1,'轮播图'),(2,'汽车预约广告'),(3,'关于我们'),(4,'签到规则');

#
# Structure for table "ddsc_opinion"
#

DROP TABLE IF EXISTS `ddsc_opinion`;
CREATE TABLE `ddsc_opinion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `content` text,
  `time` varchar(255) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='意见反馈';

#
# Data for table "ddsc_opinion"
#

INSERT INTO `ddsc_opinion` VALUES (2,1,'15939590207','意见反馈1','1557308875'),(3,1,'15939590207','意见反馈11','1557308877');

#
# Structure for table "ddsc_order"
#

DROP TABLE IF EXISTS `ddsc_order`;
CREATE TABLE `ddsc_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id 0为自营',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `code` varchar(255) DEFAULT NULL COMMENT '车牌',
  `car_type` varchar(255) DEFAULT NULL COMMENT '车型',
  `color` varchar(255) DEFAULT NULL COMMENT '颜色',
  `username` varchar(255) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `dates` varchar(255) DEFAULT NULL COMMENT '预约时间',
  `type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '预约类型 1保养 2救援 3洗车 4美容',
  `time` varchar(255) DEFAULT NULL COMMENT '发布时间',
  `content` text COMMENT '备注',
  `is_delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否删除 0否 -1是',
  `defualt` tinyint(3) NOT NULL DEFAULT '0' COMMENT '默认车辆 0否 1是',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '预约状态 0已预约 1已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='预约列表';

#
# Data for table "ddsc_order"
#

INSERT INTO `ddsc_order` VALUES (3,2,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312745','问题描述',-1,0,1),(4,0,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312827','问题描述',0,1,0),(5,2,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312745','问题描述',0,0,0),(6,0,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312827','问题描述',0,1,0),(7,2,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312745','问题描述',0,0,1),(8,0,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312827','问题描述',0,1,1),(9,2,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312745','问题描述',-1,0,0),(10,0,1,'豫A3QT30','帝豪gs','白色','王鹏飞','15939590207','2019-05-09',1,'1557312827','问题描述',-1,1,0);

#
# Structure for table "ddsc_payment"
#

DROP TABLE IF EXISTS `ddsc_payment`;
CREATE TABLE `ddsc_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) DEFAULT NULL,
  `mchid` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='支付配置';

#
# Data for table "ddsc_payment"
#

INSERT INTO `ddsc_payment` VALUES (1,'wx0946b44159152532','','','bd9038184e74916dde10cb6818b32933');

#
# Structure for table "ddsc_riders"
#

DROP TABLE IF EXISTS `ddsc_riders`;
CREATE TABLE `ddsc_riders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '商户id',
  `name` varchar(255) DEFAULT NULL COMMENT '作者',
  `content` text COMMENT '内容',
  `browse` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `assist` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '类型 0改装展示 1配件展示',
  `is_delete` tinyint(3) NOT NULL DEFAULT '0',
  `sort` varchar(255) NOT NULL DEFAULT '50',
  `time` varchar(255) DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='车友会';

#
# Data for table "ddsc_riders"
#

INSERT INTO `ddsc_riders` VALUES (2,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'50','1557220556'),(3,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'50','1557220556'),(4,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'50','1557220556'),(5,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'50','1557220556'),(6,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'2','1557220556'),(7,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',668,32,0,0,'1','1557220556'),(8,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'50','1557220556'),(9,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'50','1557220556'),(10,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,0,'50','1557220556'),(11,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,-1,'50','1557220556'),(12,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,-1,'50','1557220556'),(13,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,-1,'50','1557220556'),(14,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,-1,'50','1557220556'),(15,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,-1,'50','1557220556'),(16,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,-1,'50','1557220556'),(17,12,'echo','<p>&nbsp;UPPF终极漆面保护膜又一次保护了您的爱车<br/></p><p>发生剐蹭后 车漆完好无损[胜利][胜利][胜利]&nbsp;</p><p>感谢来自UPPF唐山滦南旗舰店---顺丽汽车生活馆的</p><p>分享[拥抱][拥抱][拥抱]</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p><p><br/></p>',666,32,0,-1,'50','1557220556'),(18,8,'企业资质','<p>带头人</p>',300,32,1,0,'1','1557222057'),(20,12,'测试','<p>撒大V</p>',666,32,1,-1,'50','1557222240'),(21,12,'测试','<p>撒大V</p>',666,32,1,-1,'50','1557222240'),(22,12,'测试','<p>撒大V</p>',666,32,1,0,'1','1557222240'),(23,12,'测试','<p>撒大V</p>',666,32,1,0,'2','1557222240'),(24,12,'测试','<p>撒大V</p>',666,32,1,0,'50','1557222240'),(25,12,'测试','<p>撒大V</p>',666,32,1,0,'50','1557222240'),(26,12,'测试','<p>撒大V</p>',666,32,1,-1,'50','1557222240');

#
# Structure for table "ddsc_riders_img"
#

DROP TABLE IF EXISTS `ddsc_riders_img`;
CREATE TABLE `ddsc_riders_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `rid` int(11) DEFAULT NULL COMMENT '改装id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品多图';

#
# Data for table "ddsc_riders_img"
#

INSERT INTO `ddsc_riders_img` VALUES (1,'/uploads/20190507/e8448c41aaf5193108a54e3121d33542.png',7,NULL,1),(3,'/uploads/20190507/acde974b10048a79bbc4b028c2414884.png',7,NULL,1),(4,'/uploads/20190507/6d86d4f8087582b8a87f09595c8f4a72.png',18,NULL,1);

#
# Structure for table "ddsc_seo"
#

DROP TABLE IF EXISTS `ddsc_seo`;
CREATE TABLE `ddsc_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '首页标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'seo关键词',
  `description` text COMMENT 'seo描述',
  `copy` text COMMENT '版权信息',
  `code` text COMMENT '统计代码',
  `support` varchar(255) DEFAULT NULL COMMENT '技术支持',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站优化';

#
# Data for table "ddsc_seo"
#

INSERT INTO `ddsc_seo` VALUES (1,'','','','','','');

#
# Structure for table "ddsc_shop"
#

DROP TABLE IF EXISTS `ddsc_shop`;
CREATE TABLE `ddsc_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '商户名称',
  `phone` varchar(200) DEFAULT NULL COMMENT '商户电话',
  `addr` varchar(255) DEFAULT NULL COMMENT '商户地址',
  `image` varchar(255) DEFAULT NULL COMMENT '图片',
  `up` tinyint(3) NOT NULL DEFAULT '1' COMMENT '上下架 0否 1是',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '热门推荐 0否 1是',
  `content` longtext COMMENT '商户详情',
  `is_delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否删除 0否 -1是',
  `sort` varchar(255) NOT NULL DEFAULT '50' COMMENT '排序',
  `longitude` varchar(255) DEFAULT NULL COMMENT '经度',
  `latitude` varchar(255) DEFAULT NULL COMMENT '纬度',
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='酒店列表';

#
# Data for table "ddsc_shop"
#

INSERT INTO `ddsc_shop` VALUES (2,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',0,'50','113.6532','34.753',NULL),(3,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',0,'50','113.6532','34.753',NULL),(4,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',0,'50','113.6532','34.753',NULL),(5,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',0,'50','113.6532','34.753',NULL),(6,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',0,'50','113.6532','34.753',NULL),(7,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,1,'<p>的割发代首<br/></p>',0,'1','113.6532','34.753',NULL),(8,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,1,'<p>的割发代首<br/></p>',0,'2','113.6532','34.753',NULL),(9,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',-1,'50','113.6532','34.753',NULL),(10,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',-1,'50','113.6532','34.753',NULL),(11,'测试','15093103977','河南','/uploads/20190507/a87004faab3977ec0fe196be93957561.png',1,0,'<p>的割发代首<br/></p>',-1,'50','113.6532','34.753',NULL),(12,'测试1','15093103977','河南','/uploads/20190507/fc8d8b78ee93a46d7e89359357ef4f46.png',1,0,'<p>电风扇</p>',0,'50','113.6532','34.753','/uploads/20190507/a8d991096693df71d29d9073b250ea20.png');

#
# Structure for table "ddsc_sign_in"
#

DROP TABLE IF EXISTS `ddsc_sign_in`;
CREATE TABLE `ddsc_sign_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `time` varchar(255) DEFAULT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='签到列表';

#
# Data for table "ddsc_sign_in"
#

INSERT INTO `ddsc_sign_in` VALUES (1,3,'1557244800'),(2,3,'1557366766');

#
# Structure for table "ddsc_sys"
#

DROP TABLE IF EXISTS `ddsc_sys`;
CREATE TABLE `ddsc_sys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `username` varchar(255) DEFAULT NULL COMMENT '负责人',
  `url` varchar(255) DEFAULT NULL COMMENT '网站域名',
  `qq` char(20) DEFAULT NULL COMMENT '客服QQ',
  `icp` varchar(255) DEFAULT NULL COMMENT 'icp备案号',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(255) DEFAULT NULL COMMENT '固定电话',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `longs` varchar(255) DEFAULT NULL COMMENT '经度',
  `lats` varchar(255) DEFAULT NULL COMMENT '纬度',
  `addr` varchar(255) DEFAULT NULL COMMENT '公司地址',
  `content` text COMMENT '公司简介',
  `pclogo` varchar(255) DEFAULT NULL COMMENT '电脑端logo',
  `waplogo` varchar(255) DEFAULT NULL COMMENT '手机端logo',
  `qrcode` varchar(255) DEFAULT NULL COMMENT '微信二维码',
  `wx` varchar(255) DEFAULT NULL COMMENT '微信公众号',
  `fax` varchar(255) DEFAULT NULL COMMENT '公司传真',
  `telphone` varchar(255) DEFAULT NULL COMMENT '400电话',
  `follow` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站基本信息';

#
# Data for table "ddsc_sys"
#

INSERT INTO `ddsc_sys` VALUES (1,'河南省乐梦电子商务有限公司','','','','','','','','','','','',NULL,NULL,NULL,NULL,'','',0);

#
# Structure for table "ddsc_sys_log"
#

DROP TABLE IF EXISTS `ddsc_sys_log`;
CREATE TABLE `ddsc_sys_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `time` datetime DEFAULT NULL COMMENT '操作时间',
  `admin` varchar(255) DEFAULT NULL COMMENT '操作账号',
  `ip` varchar(255) DEFAULT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统日志';

#
# Data for table "ddsc_sys_log"
#

INSERT INTO `ddsc_sys_log` VALUES (1,'后台登录','2019-05-06 09:45:28','admin','0.0.0.0'),(2,'后台登录','2019-05-07 08:57:16','admin','0.0.0.0'),(3,'后台登录','2019-05-08 09:02:35','admin','0.0.0.0'),(4,'后台登录','2019-05-09 08:56:28','admin','0.0.0.0');

#
# Structure for table "ddsc_user"
#

DROP TABLE IF EXISTS `ddsc_user`;
CREATE TABLE `ddsc_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '昵称',
  `time` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `image` text COMMENT '头像',
  `openid` varchar(255) DEFAULT NULL COMMENT '用户的openID',
  `card` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码',
  `fid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `is_delete` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `dates` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到天数',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户列表';

#
# Data for table "ddsc_user"
#

INSERT INTO `ddsc_user` VALUES (1,'dy','1553668986','https://wx.qlogo.cn/mmopen/vi_32/ibjp1icug4L4eNN8uuBt48b3C5cynibbPiaX6pNQLiaGj0jID8aYQEllCB1DI0iaqEJKJ4DCn6fUBTlvFnffZdc22a9g/132','oplp45DeRocpB35stufKnUgDoYSc','',0,0,0),(3,'dy','1553668986','https://wx.qlogo.cn/mmopen/vi_32/ibjp1icug4L4eNN8uuBt48b3C5cynibbPiaX6pNQLiaGj0jID8aYQEllCB1DI0iaqEJKJ4DCn6fUBTlvFnffZdc22a9g/132','oplp45DeRocpB35stufKnUgDoYSc','',0,0,0),(4,'dy','1553668986','https://wx.qlogo.cn/mmopen/vi_32/ibjp1icug4L4eNN8uuBt48b3C5cynibbPiaX6pNQLiaGj0jID8aYQEllCB1DI0iaqEJKJ4DCn6fUBTlvFnffZdc22a9g/132','oplp45DeRocpB35stufKnUgDoYSc','',0,-1,0),(5,'小丑','1557369061','https://wx.qlogo.cn/mmopen/vi_32/42I8jDiaXIls0ECOicOIjZ8DvKqZTMjouGJ7CPK2pMzOqSURkJaykXPP9TuTmNiaKCObFUTuZUraJ77nCAKkYzAQg/132','o-qeH5MLGpRfEzNHXrSJlQBtZJ60','',0,0,0);
