/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : lrms

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-01 22:32:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `announcement`
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `Publish_id` int(10) NOT NULL AUTO_INCREMENT,
  `Title` varchar(500) DEFAULT NULL COMMENT '主题',
  `Content` varchar(500) DEFAULT NULL COMMENT '公告内容',
  `Create_time` datetime DEFAULT NULL COMMENT '创建公告时的时间',
  PRIMARY KEY (`Publish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES ('2', '公告1', '公告1 helloworld ', '2017-03-16 21:21:13');
INSERT INTO `announcement` VALUES ('3', '2017/3/23公告', null, '2017-03-23 16:16:32');
INSERT INTO `announcement` VALUES ('4', '2017/2/23 公告2', '2017/2/23 公告2', '2017-03-23 16:17:52');

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `Class_id` int(11) NOT NULL AUTO_INCREMENT,
  `Class_name` varchar(50) DEFAULT NULL COMMENT '班级名称',
  `Class_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '信管1301', null);
INSERT INTO `class` VALUES ('2', '信管1302', null);
INSERT INTO `class` VALUES ('3', '信管1303', null);
INSERT INTO `class` VALUES ('4', '信管1304', null);
INSERT INTO `class` VALUES ('5', '电商1301', null);
INSERT INTO `class` VALUES ('6', '安全1301', null);

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `Course_id` int(10) NOT NULL AUTO_INCREMENT,
  `CourseNumber` varchar(10) DEFAULT NULL COMMENT '课程号',
  `CourseName` varchar(50) DEFAULT NULL COMMENT '课程名',
  `CourseDescription` varchar(500) DEFAULT NULL,
  `Js_id` int(10) DEFAULT NULL COMMENT '外键  此处指教师id',
  `Person_number` int(10) DEFAULT NULL,
  PRIMARY KEY (`Course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', 'C001', 'java编程2', 'java编程', '35', '20');
INSERT INTO `course` VALUES ('2', 'C002', '实用信息技术', '123', '35', '50');
INSERT INTO `course` VALUES ('3', 'C001', 'java编程', '123', null, '1');
INSERT INTO `course` VALUES ('6', '343', '数据结构', '信管专业课程。', '35', '36');
INSERT INTO `course` VALUES ('7', '34', '计算机网络', '选修课，主要讲授了IP地址，网关。。。。需要做实验。。。', '35', '30');
INSERT INTO `course` VALUES ('9', 'sjk111', '数据库事务', '数据库事务', '35', '20');

-- ----------------------------
-- Table structure for `course_user`
-- ----------------------------
DROP TABLE IF EXISTS `course_user`;
CREATE TABLE `course_user` (
  `Id` int(10) NOT NULL AUTO_INCREMENT COMMENT '班级学生表对应的id',
  `Course_id` int(10) DEFAULT NULL,
  `Course_name` varchar(50) DEFAULT NULL,
  `User_id` int(10) DEFAULT NULL,
  `User_name` varchar(50) DEFAULT NULL,
  `Sumscore` int(10) DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_user
-- ----------------------------
INSERT INTO `course_user` VALUES ('1', '1', 'java编程', '3', '陈红', '0');
INSERT INTO `course_user` VALUES ('2', '1', 'java编程', '5', '孙慧', '0');
INSERT INTO `course_user` VALUES ('3', '2', '实用信息技术', '3', '陈红', '0');
INSERT INTO `course_user` VALUES ('4', '3', 'java编程', '3', '陈红', '0');

-- ----------------------------
-- Table structure for `laboratory`
-- ----------------------------
DROP TABLE IF EXISTS `laboratory`;
CREATE TABLE `laboratory` (
  `Lab_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键，唯一标识一个实验室',
  `Building_name` varchar(50) DEFAULT NULL COMMENT '教学楼名字',
  `Room_number` int(50) DEFAULT NULL COMMENT '房间号',
  `Person_number` int(10) DEFAULT NULL COMMENT '可容纳人数',
  `Is_free` int(10) DEFAULT NULL COMMENT '0-空闲，1-已被预约（暂时不需要）',
  `Description` varchar(500) DEFAULT NULL COMMENT '实验室信息描述',
  PRIMARY KEY (`Lab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laboratory
-- ----------------------------
INSERT INTO `laboratory` VALUES ('1', '文波', '101', '50', '0', '文波实验室，现有计算机50台，全部正常运行。');
INSERT INTO `laboratory` VALUES ('17', '文波', '102', '50', '0', '文波102，共50个位置。');
INSERT INTO `laboratory` VALUES ('18', '文波', '103', '30', '0', '文波103');
INSERT INTO `laboratory` VALUES ('19', '文波', '217', '70', '0', '文波217，共70个位置，可供大课堂使用。');
INSERT INTO `laboratory` VALUES ('20', '文波', '219', '70', '0', '');

-- ----------------------------
-- Table structure for `reservation`
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation` (
  `Reserve_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '实验室预约表的主键',
  `Lab_id` int(10) DEFAULT NULL COMMENT '实验室id',
  `User_id` int(10) DEFAULT NULL COMMENT '预约人id',
  `Reserve_type` int(10) DEFAULT NULL COMMENT '预约类型 1—个人预约;2—为指定课堂预约',
  `Course_id` int(10) DEFAULT NULL COMMENT '0代表没有选择课堂',
  `CourseName` varchar(50) DEFAULT NULL,
  `Reserve_date` date DEFAULT NULL COMMENT '预约日期',
  `Time_interval` int(10) DEFAULT NULL COMMENT '预约时间段\r\n1--8:00~10:00\r\n2—10:00~12:00\r\n3—14:00~16:00\r\n4—16:00~18:00\r\n5—19:00~21:00',
  `Weekday` int(10) DEFAULT NULL COMMENT '表示星期几，取值为1,2,3,4,5,6,7\r\n1--周一、2—周二\r\n3--周三、4—周四\r\n5--周五、6—周六\r\n7--周日',
  `Person_number` int(10) DEFAULT NULL COMMENT '预约人数，1-学生预约，n-教师预约或者教师指定;预约人数应该小于实验室当前可容纳人数',
  `Description` varchar(500) DEFAULT NULL COMMENT '预约描述',
  `Create_time` datetime DEFAULT NULL COMMENT '创建预约表单的时间',
  `Modify_time` datetime DEFAULT NULL COMMENT '修改预约表单信息后的时间',
  PRIMARY KEY (`Reserve_id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES ('31', '19', '3', '1', '0', null, '2017-03-16', '1', '0', '1', null, '2017-03-16 10:07:14', null);
INSERT INTO `reservation` VALUES ('32', '19', '3', '1', '0', null, '2017-03-17', '1', '0', '1', null, '2017-03-16 10:08:37', null);
INSERT INTO `reservation` VALUES ('33', '19', '3', '1', '0', null, '2017-03-16', '2', '0', '1', null, '2017-03-16 10:09:07', null);
INSERT INTO `reservation` VALUES ('34', '19', '35', '2', '0', null, '2017-03-16', '3', '0', '1', '数据库课程使用实验课。', '2017-03-16 10:40:16', null);
INSERT INTO `reservation` VALUES ('35', '1', '35', '2', '0', null, '2017-03-16', '1', '0', '20', '实验课', '2017-03-16 10:40:45', null);
INSERT INTO `reservation` VALUES ('36', '1', '35', '2', '0', null, '2017-03-16', '2', '0', '49', null, '2017-03-16 10:41:06', null);
INSERT INTO `reservation` VALUES ('40', '1', '35', '1', '0', null, '2017-03-22', '1', '0', '1', null, '2017-03-20 19:46:41', null);
INSERT INTO `reservation` VALUES ('41', '1', '35', '1', '0', null, '2017-03-26', '1', '0', '4', null, '2017-03-23 19:54:54', null);
INSERT INTO `reservation` VALUES ('74', '1', '35', '1', '0', null, '2017-03-26', '1', '0', '1', null, '2017-03-24 16:48:21', null);
INSERT INTO `reservation` VALUES ('75', '1', '35', '2', '1', 'java编程', '2017-04-22', '1', '6', '2', '2017-4-21  2017-4-24  六 2人', '2017-03-24 00:00:00', null);
INSERT INTO `reservation` VALUES ('77', null, null, null, null, null, null, null, null, null, null, '2017-03-24 17:09:08', null);
INSERT INTO `reservation` VALUES ('78', '20', '35', '2', '1', 'java编程', '2017-03-27', '1', '1', '2', null, '2017-03-24 17:10:03', null);
INSERT INTO `reservation` VALUES ('80', '20', '35', '2', '1', 'java编程', '2017-04-10', '1', '1', '2', null, '2017-03-24 17:10:03', null);
INSERT INTO `reservation` VALUES ('81', '20', '35', '2', '1', 'java编程', '2017-04-17', '1', '1', '2', null, '2017-03-24 17:10:03', null);
INSERT INTO `reservation` VALUES ('82', '1', '35', '1', '0', null, '2017-04-18', '1', '0', '5', '4-18  5人', '2017-04-17 20:42:10', null);
INSERT INTO `reservation` VALUES ('83', '1', '35', '2', '1', 'java编程2', '2017-04-17', '1', '1', '20', '20人， 4/17', '2017-04-17 20:49:01', null);
INSERT INTO `reservation` VALUES ('85', '18', '35', '2', '1', 'java编程2', '2017-04-19', '2', '3', '20', '课堂预约，每周三  20人', '2017-04-24 11:08:30', null);
INSERT INTO `reservation` VALUES ('86', '18', '35', '2', '1', 'java编程2', '2017-04-26', '2', '3', '20', '课堂预约，每周三  20人', '2017-04-24 11:08:30', null);
INSERT INTO `reservation` VALUES ('87', '1', '35', '1', '0', null, '2017-04-25', '4', '0', '1', '234335t553gtt', '2017-04-24 14:44:44', null);
INSERT INTO `reservation` VALUES ('88', '19', '35', '1', '0', null, '2017-04-26', '3', '0', '5', '5', '2017-04-24 15:13:35', null);
INSERT INTO `reservation` VALUES ('89', '19', '35', '2', '7', '计算机网络', '2017-04-18', '1', '2', '30', '自行车', '2017-04-24 15:14:43', null);
INSERT INTO `reservation` VALUES ('91', '1', '35', '1', '0', null, '2017-04-27', '5', '0', '10', null, '2017-04-24 15:20:25', null);
INSERT INTO `reservation` VALUES ('92', '1', '35', '2', '1', 'java编程2', '2017-04-28', '3', '5', '20', 'java编程', '2017-04-26 20:17:23', null);
INSERT INTO `reservation` VALUES ('94', '18', '35', '1', '0', null, '2017-04-27', '1', '0', '1', null, '2017-04-26 20:20:48', null);

-- ----------------------------
-- Table structure for `schedule`
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `Schedule_id` int(10) NOT NULL AUTO_INCREMENT,
  `Lab_id` int(10) DEFAULT NULL COMMENT '实验室id',
  `Schedule_date` date DEFAULT NULL COMMENT '排期表中的某个日期',
  `T1` int(10) DEFAULT '0' COMMENT '时间段1的人数即8:00~10:00该实验室被预约的人数',
  `T2` int(10) DEFAULT '0' COMMENT '时间段2的人数即10:00~12:00该实验室被预约的人数',
  `T3` int(10) DEFAULT '0' COMMENT '时间段3的人数即14:00~16:00该实验室被预约的人数',
  `T4` int(10) DEFAULT '0' COMMENT '时间段4的人数即16:00~18:00该实验室被预约的人数',
  `T5` int(10) DEFAULT '0' COMMENT '时间段5的人数即\r\n19:00~21:00该实验室被预约的人数',
  PRIMARY KEY (`Schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schedule
-- ----------------------------
INSERT INTO `schedule` VALUES ('10', '19', '2017-03-16', '1', '1', '1', '0', '0');
INSERT INTO `schedule` VALUES ('11', '19', '2017-03-17', '1', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('13', '1', '2017-03-16', '50', '49', '0', '0', '0');
INSERT INTO `schedule` VALUES ('14', '19', '2017-03-23', '1', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('16', '1', '2017-03-18', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('17', '1', '2017-03-22', '7', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('18', '1', '2017-03-23', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('19', '1', '2017-03-26', '5', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('20', '1', '2017-03-27', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('50', '1', '2017-04-22', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('51', '20', '2017-04-22', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('52', '20', '2017-03-27', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('53', '20', '2017-04-03', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('54', '20', '2017-04-10', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('55', '20', '2017-04-17', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('56', '20', '2017-03-25', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('57', '1', '2017-04-18', '5', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('58', '1', '2017-04-17', '50', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('59', '18', '2017-04-27', '1', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('60', '18', '2017-04-19', '0', '30', '0', '0', '0');
INSERT INTO `schedule` VALUES ('61', '18', '2017-04-26', '0', '30', '0', '0', '0');
INSERT INTO `schedule` VALUES ('62', '1', '2017-04-25', '0', '0', '0', '1', '0');
INSERT INTO `schedule` VALUES ('63', '19', '2017-04-26', '0', '0', '5', '0', '0');
INSERT INTO `schedule` VALUES ('64', '19', '2017-04-18', '70', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('65', '19', '2017-04-25', '0', '0', '0', '0', '0');
INSERT INTO `schedule` VALUES ('66', '1', '2017-04-27', '0', '0', '0', '0', '10');
INSERT INTO `schedule` VALUES ('67', '1', '2017-04-28', '0', '0', '50', '0', '0');
INSERT INTO `schedule` VALUES ('68', '1', '2017-04-29', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `term`
-- ----------------------------
DROP TABLE IF EXISTS `term`;
CREATE TABLE `term` (
  `Term_id` int(11) NOT NULL AUTO_INCREMENT,
  `Term_name` varchar(50) DEFAULT NULL,
  `From_date` varchar(50) DEFAULT NULL,
  `End_date` varchar(50) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Term_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of term
-- ----------------------------
INSERT INTO `term` VALUES ('1', '2017', '2017-03-01', '2017-06-22', '123收到v');
INSERT INTO `term` VALUES ('2', '2018上学期', '2017-03-01', '2017-06-23', '2018上学期');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_id` int(10) NOT NULL AUTO_INCREMENT,
  `User_type` int(10) NOT NULL COMMENT '用户类型0-管理员，1-教师，2-学生',
  `Login_name` varchar(10) DEFAULT NULL COMMENT '学生学号、教师职工号或者管理员工号作为登录时的用户名\r\n初始密码：\r\n管理员- gly123\r\n教师- js123456\r\n学生- xs123456',
  `Password` varchar(10) DEFAULT NULL COMMENT '密码，长度6~8位，字母+数字，不能取汉字或者特殊字符',
  `User_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `Sex` int(10) DEFAULT NULL COMMENT '性别,1-男，2-女',
  `Age` int(10) DEFAULT NULL,
  `Institute` varchar(50) DEFAULT NULL,
  `Major` varchar(50) DEFAULT NULL,
  `Is_firstlogin` int(2) DEFAULT NULL COMMENT '是否是第一次登陆0-是  1-不是',
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '0', 'admin', '123456', '管理员', '1', '25', null, null, '1');
INSERT INTO `user` VALUES ('2', '1', 'Z0000001', 'js123456', '李教师', '1', '34', '工程学院', '信管', '1');
INSERT INTO `user` VALUES ('3', '2', '1309030212', '123456', '陈红', '2', '22', '工程学院', '信管', '1');
INSERT INTO `user` VALUES ('5', '2', '1309030223', 'xs123456', '孙慧', '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user` VALUES ('6', '2', '1309030224', 'xs123456', null, '2', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user` VALUES ('7', '2', '1309030123', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user` VALUES ('34', '0', '1309030111', 'xs123456', null, '2', '21', '会计学院', null, '0');
INSERT INTO `user` VALUES ('35', '1', 'js', '123456', '教师', '2', '54', '信息与安全工程学院', '信管', '1');

-- ----------------------------
-- Table structure for `user1`
-- ----------------------------
DROP TABLE IF EXISTS `user1`;
CREATE TABLE `user1` (
  `User_id` int(10) NOT NULL AUTO_INCREMENT,
  `User_type` int(10) NOT NULL COMMENT '用户类型0-管理员，1-教师，2-学生',
  `Login_name` varchar(10) DEFAULT NULL COMMENT '学生学号、教师职工号或者管理员工号作为登录时的用户名\r\n初始密码：\r\n管理员- gly123\r\n教师- js123456\r\n学生- xs123456',
  `Password` varchar(10) DEFAULT NULL COMMENT '密码，长度6~8位，字母+数字，不能取汉字或者特殊字符',
  `User_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `Sex` int(10) DEFAULT NULL COMMENT '性别,1-男，2-女',
  `Age` int(10) DEFAULT NULL,
  `Institute` varchar(50) DEFAULT NULL,
  `Major` varchar(50) DEFAULT NULL,
  `Is_firstlogin` int(2) DEFAULT NULL COMMENT '是否是第一次登陆0-是  1-不是',
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user1
-- ----------------------------
INSERT INTO `user1` VALUES ('1', '0', 'admin', '123456', '管理员', '1', '25', null, null, '1');
INSERT INTO `user1` VALUES ('2', '1', 'Z0000001', 'js123456', '李教师', '1', '34', '工程学院', '信管', '1');
INSERT INTO `user1` VALUES ('3', '2', '1309030212', '1234567', '陈红', '2', '22', '工程学院', '信管', '1');
INSERT INTO `user1` VALUES ('4', '2', '1309030222', 'xs123456', '孙慧', '2', '23', '信息与安全工程学院', '信息管理与信息系统', '1');
INSERT INTO `user1` VALUES ('5', '2', '1309030223', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('6', '2', '1309030224', 'xs123456', null, '2', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('7', '2', '1309030123', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('8', '2', '1309030323', 'xs123456', null, '2', '22', '统计数学学院', null, '0');
INSERT INTO `user1` VALUES ('9', '2', '1309030232', 'xs123456', null, '2', '22', '统计数学学院', null, '0');
INSERT INTO `user1` VALUES ('10', '2', '1309030233', 'xs123456', null, '1', '22', '统计数学学院', null, '0');
INSERT INTO `user1` VALUES ('11', '2', '1309030234', 'xs123456', null, '2', '22', '统计数学学院', null, '0');
INSERT INTO `user1` VALUES ('12', '2', '1309030201', 'xs123456', null, '2', '23', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('13', '2', '1309030202', 'xs123456', null, '2', '23', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('14', '2', '1309030203', 'xs123456', null, '2', '21', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('15', '2', '1309030204', 'xs123456', null, '2', '20', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('16', '2', '1309030205', 'xs123456', null, '2', '21', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('17', '2', '1309030205', 'xs123456', null, '2', '23', '金融学院', null, '0');
INSERT INTO `user1` VALUES ('18', '2', '1309030206', 'xs123456', null, '2', '24', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('19', '2', '1309030207', 'xs123456', null, '2', '23', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('20', '2', '1309030208', 'xs123456', null, '1', '22', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('21', '2', '1309030209', 'xs123456', null, '2', '21', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('22', '2', '1309030210', 'xs123456', null, '2', '23', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('23', '2', '1309030211', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('24', '2', '1309030101', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('25', '2', '1309030102', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('26', '2', '1309030103', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('27', '2', '1309030104', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('28', '2', '1309030105', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('29', '2', '1309030106', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('30', '2', '1309030107', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('31', '2', '1309030108', 'xs123456', null, '1', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('32', '0', '1309030109', 'xs123456', null, '2', '22', '信息与安全工程学院', null, '0');
INSERT INTO `user1` VALUES ('33', '0', '1309030110', 'xs123456', null, '2', '21', '会计学院', null, '0');
INSERT INTO `user1` VALUES ('34', '0', '1309030111', 'xs123456', null, '2', '21', '会计学院', null, '0');
