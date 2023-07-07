-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ryvue
-- ------------------------------------------------------
-- Server version	5.7.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--


--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--


--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--


--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--


--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--


--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--


--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--


--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--


--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--


--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--


--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--


--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--


--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--


--
-- Table structure for table `scd_task`
--

DROP TABLE IF EXISTS `scd_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scd_task` (
  `task_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '任务序号',
  `tea_id` mediumint(9) NOT NULL COMMENT '教师用户ID',
  `name` varchar(12) NOT NULL COMMENT '任务名称',
  `start` datetime NOT NULL COMMENT '任务发布日期',
  `end` datetime NOT NULL COMMENT '任务截至日期',
  `asset` text NOT NULL COMMENT '任务附件下载地址',
  `description` text NOT NULL COMMENT '任务描述',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scd_task`
--


--
-- Table structure for table `stu_wk`
--

DROP TABLE IF EXISTS `stu_wk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu_wk` (
  `wk_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '任务序号',
  `stu_id` mediumint(9) NOT NULL COMMENT '学生唯一标识符',
  `stu_name` varchar(12) NOT NULL COMMENT '学生姓名',
  `tea_id` mediumint(9) NOT NULL COMMENT '教师唯一标识符',
  `tea_name` varchar(12) NOT NULL COMMENT '教师姓名',
  `wk_name` varchar(12) NOT NULL COMMENT '任务名称',
  `wk_start` datetime NOT NULL COMMENT '任务发布日期',
  `wk_end` datetime NOT NULL COMMENT '任务截至日期',
  `wk_stau` varchar(12) NOT NULL COMMENT '任务状态',
  `wk_ex_stau` varchar(12) NOT NULL COMMENT '审核状态',
  `wk_addr` text NOT NULL COMMENT '任务下载地址',
  `wk_comm` text,
  `wk_des` text NOT NULL COMMENT '任务描述',
  PRIMARY KEY (`wk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_wk`
--

INSERT INTO `stu_wk` VALUES (1,30001,'学生A',60001,'教师A','完成前端设计','2023-07-04 00:00:00','2023-07-09 00:00:00','分配','未通过','./',NULL,'正常完成前端任务'),(2,30001,'学生A',60001,'教师A','完成后端设计','2023-07-04 00:00:00','2023-07-09 00:00:00','未分配','通过','./',NULL,'正常完成后端任务'),(3,30001,'学生A',60001,'教师A','完成大文档编写','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','未通过','./',NULL,'正常完成文档任务'),(4,30002,'学生B',60001,'教师A','完成小文档设计','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','通过','./',NULL,'正常完成任务'),(5,30002,'学生B',60001,'教师A','完成项目计划设计','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','通过','./',NULL,'正常完成项目计划任务'),(6,30003,'学生C',60001,'教师A','完成后端详细分析','2023-07-04 20:13:19','2023-07-09 20:13:19','未分配','未通过','./',NULL,'正常完成后端详细分析'),(7,30004,'学生D',60001,'教师A','制定任务计划','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','未通过','./',NULL,'正常完成计划指定'),(8,30005,'学生E',60001,'教师A','完成任务计划','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','通过','./',NULL,'正常完完成计划指定'),(9,30005,'学生E',60001,'教师A','完成前端设计','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','通过','./',NULL,'正常完成前端任务'),(10,30005,'学生E',60001,'教师A','完成后端设计','2023-07-04 20:13:19','2023-07-09 20:13:19','未分配','未通过','./',NULL,'正常完成后端任务'),(11,30005,'学生E',60001,'教师A','完成大文档编写','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','未通过','./',NULL,'正常完成文档任务'),(12,30006,'学生F',60001,'教师A','完成前端设计','2023-07-04 20:13:19','2023-07-09 20:13:19','分配','通过','./',NULL,'正常完成前端设计'),(13,30007,'学生G',60007,'教师G','完成UI设计','2023-07-16 00:00:00','2023-07-21 00:00:00','未分配','未通过','/profile/upload/2023/07/07/组号4组长2019246需求分析_20230707224336A001.docx','/profile/upload/2023/07/08/user_1688729496074_20230708000205A001.xlsx','未完成UI设计任务'),(14,30007,'学生G',60007,'教师G','完成系统集成','2023-07-17 16:45:00','2023-07-22 16:45:00','分配','未通过','./',NULL,'正常完成系统集成任务'),(15,30007,'学生G',60007,'教师G','完成性能优化','2023-07-18 11:20:00','2023-07-23 11:20:00','分配','通过','./',NULL,'正常完成性能优化任务'),(16,30007,'学生G',60007,'教师G','完成用户反馈收集','2023-07-19 19:10:00','2023-07-24 19:10:00','未分配','未通过','./',NULL,'未完成用户反馈收集任务'),(17,30007,'学生G',60007,'教师G','完成安全测试','2023-07-20 10:30:00','2023-07-25 10:30:00','分配','通过','./',NULL,'正常完成安全测试任务'),(21,30007,'学生G',60007,'教师G','完成系统评估','2023-07-24 13:10:00','2023-07-29 13:10:00','分配','通过','./',NULL,'正常完成系统评估任务'),(22,30007,'学生G',60007,'教师G','完成用户验收','2023-07-25 18:25:00','2023-07-30 18:25:00','未分配','未通过','./',NULL,'未完成用户验收任务'),(23,30007,'学生G',60007,'教师G','完成项目总结','2023-07-26 12:40:00','2023-07-31 12:40:00','分配','通过','./',NULL,'正常完成项目总结任务'),(24,30007,'学生G',60007,'教师G','完成部署与上线','2023-07-27 14:55:00','2023-08-01 14:55:00','分配','通过','./',NULL,'正常完成部署与上线任务'),(25,30007,'学生G',60007,'教师G','完成需求变更','2023-07-28 10:10:00','2023-08-02 10:10:00','未分配','未通过','./',NULL,'未完成需求变更任务'),(26,30007,'学生G',60007,'教师G','完成数据备份','2023-07-29 18:35:00','2023-08-03 18:35:00','分配','通过','./',NULL,'正常完成数据备份任务');

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-red','Y','admin','2023-06-30 11:55:17','admin','2023-07-01 10:57:25','蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2023-06-30 11:55:17','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-light','Y','admin','2023-06-30 11:55:17','admin','2023-07-01 10:57:10','深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2023-06-30 11:55:17','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2023-06-30 11:55:17','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2023-06-30 11:55:17','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

INSERT INTO `sys_dept` VALUES (100,0,'0','同济大学浙江学院',0,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','admin','2023-07-07 13:33:30'),(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2023-06-30 11:55:16','',NULL),(200,100,'0,100','教师部',1,NULL,NULL,NULL,'0','2','admin','2023-07-07 13:33:49','',NULL),(201,100,'0,100','学生部',2,NULL,NULL,NULL,'0','2','admin','2023-07-07 13:34:04','',NULL);

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2023-06-30 11:55:17','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2023-06-30 11:55:17','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2023-06-30 11:55:17','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2023-06-30 11:55:17','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2023-06-30 11:55:17','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2023-06-30 11:55:17','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2023-06-30 11:55:17','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2023-06-30 11:55:17','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2023-06-30 11:55:17','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2023-06-30 11:55:17','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2023-06-30 11:55:17','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2023-06-30 11:55:17','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2023-06-30 11:55:17','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2023-06-30 11:55:17','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2023-06-30 11:55:17','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2023-06-30 11:55:17','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2023-06-30 11:55:17','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2023-06-30 11:55:17','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2023-06-30 11:55:17','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2023-06-30 11:55:17','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2023-06-30 11:55:17','',NULL,'停用状态'),(106,0,'未分配','未分配','sys_stuwk_status',NULL,'default','N','0','admin','2023-07-07 21:38:16','',NULL,NULL),(107,1,'分配','分配','sys_stuwk_status',NULL,'default','N','0','admin','2023-07-07 21:38:20','',NULL,NULL);

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2023-06-30 11:55:17','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2023-06-30 11:55:17','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2023-06-30 11:55:17','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2023-06-30 11:55:17','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2023-06-30 11:55:17','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2023-06-30 11:55:17','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2023-06-30 11:55:17','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2023-06-30 11:55:17','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2023-06-30 11:55:17','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2023-06-30 11:55:17','',NULL,'登录状态列表'),(102,'分配状态','sys_stuwk_status','0','admin','2023-07-07 21:37:56','',NULL,NULL);

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2023-06-30 11:55:17','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2023-06-30 11:55:17','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2023-06-30 11:55:17','',NULL,'');

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--


--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 12:09:34'),(101,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 14:15:43'),(102,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 15:28:03'),(103,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','密码输入错误1次','2023-06-30 15:33:47'),(104,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2023-06-30 15:33:47'),(105,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','验证码已失效','2023-06-30 15:34:00'),(106,'ruoyi','127.0.0.1','内网IP','Unknown','Unknown','1','登录用户：ruoyi 不存在','2023-06-30 15:34:23'),(107,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-06-30 15:34:34'),(108,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','密码输入错误2次','2023-06-30 15:35:07'),(109,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2023-06-30 15:35:07'),(110,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 15:35:15'),(111,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-06-30 15:36:04'),(112,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 20:50:42'),(113,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 21:22:39'),(114,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-06-30 23:46:21'),(115,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 10:51:57'),(116,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 10:51:57'),(117,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 10:51:57'),(118,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 10:52:01'),(119,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 14:00:49'),(120,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 14:00:52'),(121,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 15:13:06'),(122,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:16:38'),(123,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:47:54'),(124,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:47:54'),(125,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-01 17:47:56'),(126,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:47:56'),(127,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:47:58'),(128,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:47:58'),(129,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:48:00'),(130,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:48:01'),(131,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:48:04'),(132,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:48:04'),(133,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:48:07'),(134,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:48:07'),(135,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:48:09'),(136,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:48:10'),(137,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:48:55'),(138,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:48:55'),(139,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:49:42'),(140,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:42'),(141,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:49:44'),(142,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:44'),(143,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:49:46'),(144,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:47'),(145,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-01 17:49:47'),(146,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:47'),(147,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-01 17:49:48'),(148,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:48'),(149,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-01 17:49:48'),(150,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:48'),(151,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-01 17:49:49'),(152,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:49'),(153,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:49:50'),(154,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:49:50'),(155,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:50:12'),(156,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:50:12'),(157,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:51:31'),(158,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:51:31'),(159,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:51:35'),(160,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:51:35'),(161,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:51:51'),(162,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:51:51'),(163,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','退出成功','2023-07-01 17:55:33'),(164,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:55:36'),(165,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:55:36'),(166,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 17:58:03'),(167,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-01 17:58:03'),(168,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-01 18:00:57'),(169,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-02 16:59:15'),(170,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 14:29:51'),(171,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-03 16:15:35'),(172,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 16:59:21'),(173,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码已失效','2023-07-05 17:52:05'),(174,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-05 17:52:08'),(175,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-06 17:48:03'),(176,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-07-07 12:01:06'),(177,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-07 12:38:55'),(178,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-07 13:32:50'),(179,'maobo','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2023-07-07 14:23:38'),(180,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-07 15:42:35'),(181,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','1','验证码错误','2023-07-07 17:38:28'),(182,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-07 17:38:31'),(183,'admin','127.0.0.1','内网IP','Chrome 11','Windows 10','0','登录成功','2023-07-07 21:31:55');

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2011 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2023-06-30 11:55:17','',NULL,'系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2023-06-30 11:55:17','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2023-06-30 11:55:17','',NULL,'系统工具目录'),(4,'若依官网',0,5,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2023-06-30 11:55:17','admin','2023-07-07 15:46:28','若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2023-06-30 11:55:17','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2023-06-30 11:55:17','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2023-06-30 11:55:17','',NULL,'菜单管理菜单'),(103,'部门管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2023-06-30 11:55:17','',NULL,'部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2023-06-30 11:55:17','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2023-06-30 11:55:17','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2023-06-30 11:55:17','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2023-06-30 11:55:17','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2023-06-30 11:55:17','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2023-06-30 11:55:17','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2023-06-30 11:55:17','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2023-06-30 11:55:17','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2023-06-30 11:55:17','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2023-06-30 11:55:17','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2023-06-30 11:55:17','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2023-06-30 11:55:17','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2023-06-30 11:55:17','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2023-06-30 11:55:17','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2023-06-30 11:55:17','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2023-06-30 11:55:17','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2023-06-30 11:55:17','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2023-06-30 11:55:17','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2023-06-30 11:55:17','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2023-06-30 11:55:17','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2023-06-30 11:55:17','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2023-06-30 11:55:17','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2023-06-30 11:55:17','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2023-06-30 11:55:17','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2023-06-30 11:55:17','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2023-06-30 11:55:17','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2023-06-30 11:55:17','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2023-06-30 11:55:17','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2023-06-30 11:55:17','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2023-06-30 11:55:17','',NULL,''),(2001,'Demo',1,10,'demo','system/demo/index',NULL,1,0,'M','0','0',NULL,'404','admin','2023-07-05 17:55:14','',NULL,''),(2002,'教师界面',3,1,'stu_wk','ruoyi-stu_wk/stu_wk/index',NULL,1,0,'C','0','0','ruoyi-stu_wk:stu_wk:list','#','admin','2023-07-07 12:39:40','',NULL,'教师界面菜单'),(2003,'教师界面查询',2002,1,'#','',NULL,1,0,'F','0','0','ruoyi-stu_wk:stu_wk:query','#','admin','2023-07-07 12:39:40','',NULL,''),(2004,'教师界面新增',2002,2,'#','',NULL,1,0,'F','0','0','ruoyi-stu_wk:stu_wk:add','#','admin','2023-07-07 12:39:40','',NULL,''),(2005,'教师界面修改',2002,3,'#','',NULL,1,0,'F','0','0','ruoyi-stu_wk:stu_wk:edit','#','admin','2023-07-07 12:39:40','',NULL,''),(2006,'教师界面删除',2002,4,'#','',NULL,1,0,'F','0','0','ruoyi-stu_wk:stu_wk:remove','#','admin','2023-07-07 12:39:40','',NULL,''),(2007,'教师界面导出',2002,5,'#','',NULL,1,0,'F','0','0','ruoyi-stu_wk:stu_wk:export','#','admin','2023-07-07 12:39:40','',NULL,''),(2008,'任务管理',0,4,'scd',NULL,NULL,1,0,'M','0','0','','dict','admin','2023-07-07 15:43:09','admin','2023-07-07 15:46:03',''),(2009,'教师任务管理',2008,1,'teacher','scd/teacher/index',NULL,1,0,'C','0','0','scd:task:list','education','admin','2023-07-07 15:44:28','admin','2023-07-07 15:46:09',''),(2010,'我的任务',2008,2,'student','scd/student/index',NULL,1,0,'C','0','0','scd:task:list','excel','admin','2023-07-07 19:20:33','',NULL,'');

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '新版本内容','0','admin','2023-06-30 11:55:17','',NULL,'管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2023-06-30 11:55:17','',NULL,'管理员');

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

INSERT INTO `sys_oper_log` VALUES (100,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":3,\"configKey\":\"sys.index.sideTheme\",\"configName\":\"主框架页-侧边栏主题\",\"configType\":\"Y\",\"configValue\":\"theme-light\",\"createBy\":\"admin\",\"createTime\":\"2023-06-30 11:55:17\",\"params\":{},\"remark\":\"深色主题theme-dark，浅色主题theme-light\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-01 10:57:10',0),(101,'参数管理',2,'com.ruoyi.web.controller.system.SysConfigController.edit()','PUT',1,'admin',NULL,'/system/config','127.0.0.1','内网IP','{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-red\",\"createBy\":\"admin\",\"createTime\":\"2023-06-30 11:55:17\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-01 10:57:25',0),(102,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-01 11:13:43',0),(103,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"新增角色\'教师\'失败，角色名称已存在\",\"code\":500}',0,NULL,'2023-07-01 11:13:44',0),(104,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"新增角色\'教师\'失败，角色名称已存在\",\"code\":500}',0,NULL,'2023-07-01 11:13:51',0),(105,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"新增角色\'教师\'失败，角色名称已存在\",\"code\":500}',0,NULL,'2023-07-01 11:13:51',0),(106,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-07-01 11:13:43\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-01 11:14:32',0),(107,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-07-01 11:13:43\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-01 11:14:38',0),(108,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2023-07-01 11:13:43\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2,109,1046,110,1049,1050,1051,1052,1053,1054,111,112,113,114,4],\"params\":{},\"roleId\":100,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-01 11:14:43',0),(109,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"roleId\":101,\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-01 11:15:06',0),(110,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"新增角色\'学生\'失败，角色名称已存在\",\"code\":500}',0,NULL,'2023-07-01 11:15:06',0),(111,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"新增角色\'学生\'失败，角色名称已存在\",\"code\":500}',0,NULL,'2023-07-01 11:16:00',0),(112,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[4],\"params\":{},\"roleKey\":\"student\",\"roleName\":\"学生\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"新增角色\'学生\'失败，角色名称已存在\",\"code\":500}',0,NULL,'2023-07-01 11:16:00',0),(113,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"code\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Demo\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"/demo\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 17:52:37',0),(114,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin',NULL,'/system/menu/2000','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 17:54:49',0),(115,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"Demo\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"/system/demo\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 17:55:14',0),(116,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"任务状态\",\"dictType\":\"scd_task_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:30:50',0),(117,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未完成\",\"dictSort\":1,\"dictType\":\"scd_task_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:31:44',0),(118,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"待审核\",\"dictSort\":2,\"dictType\":\"scd_task_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:33:05',0),(119,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已通过\",\"dictSort\":3,\"dictType\":\"scd_task_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:33:17',0),(120,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未通过\",\"dictSort\":4,\"dictType\":\"scd_task_status\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-05 18:33:24',0),(121,'任务一览',2,'com.ruoyi.web.controller.StuWkController.edit()','PUT',1,'admin',NULL,'/taskmgr/wk','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30001,\"stuName\":\"学生A\",\"teaId\":60001,\"teaName\":\"toki\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 20:13:19\",\"wkExStau\":\"通过\",\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 20:13:19\",\"wkStau\":\"分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 12:16:36',0),(122,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"同济大学浙江学院\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:33:30',0),(123,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"教师部\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:33:49',0),(124,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"学生部\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:34:04',0),(125,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/200','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:34:55',0),(126,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin',NULL,'/system/dept/201','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:34:57',0),(127,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"张三\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":100,\"userName\":\"zhangsan\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:36:31',0),(128,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"李四\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":101,\"userName\":\"lisi\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:36:46',0),(129,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"王五\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":102,\"userName\":\"wangwu\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:37:01',0),(130,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"王涛\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":103,\"userName\":\"wangtao\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:37:37',0),(131,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"毛博\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"0\",\"userId\":104,\"userName\":\"maobo\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 13:38:23',0),(132,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'maobo',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":101,\"teaId\":104,\"wkAdd\":\"/extra.pdf\",\"wkDes\":\"前端真tm难\",\"wkEnd\":\"2024-07-07 00:00:00\",\"wkExStau\":false,\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-07 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 14:42:26',0),(133,'学生任务',1,'com.ruoyi.web.controller.scd.StuWkController.add()','POST',1,'maobo',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":102,\"teaId\":104,\"wkAdd\":\"/extra.pdf\",\"wkDes\":\"后端真tm难\",\"wkEnd\":\"2024-07-07 00:00:00\",\"wkExStau\":false,\"wkId\":1,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-07 00:00:00\",\"wkStau\":true}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'wk_ex_stau\' doesn\'t have a default value\r\n### The error may exist in file [D:\\code test field\\Github\\SCD\\out\\production\\ruoyi-student\\mapper\\StuWkMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.StuWkMapper.insertStuWk-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_wk          ( stu_id,             tea_id,             wk_name,             wk_start,             wk_end,             wk_stau,                          wk_addr,             wk_des )           values ( ?,                          ?,                          ?,             ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'wk_ex_stau\' doesn\'t have a default value\n; Field \'wk_ex_stau\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'wk_ex_stau\' doesn\'t have a default value','2023-07-07 14:59:47',0),(134,'学生任务',1,'com.ruoyi.web.controller.scd.StuWkController.add()','POST',1,'maobo',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":102,\"teaId\":104,\"wkAdd\":\"/extra.pdf\",\"wkDes\":\"后端真tm难\",\"wkEnd\":\"2024-07-07 00:00:00\",\"wkExStau\":false,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-07 00:00:00\",\"wkStau\":true}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'wk_ex_stau\' doesn\'t have a default value\r\n### The error may exist in file [D:\\code test field\\Github\\SCD\\out\\production\\ruoyi-student\\mapper\\StuWkMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.StuWkMapper.insertStuWk-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_wk          ( stu_id,             tea_id,             wk_name,             wk_start,             wk_end,             wk_stau,                          wk_addr,             wk_des )           values ( ?,                          ?,                          ?,             ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'wk_ex_stau\' doesn\'t have a default value\n; Field \'wk_ex_stau\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'wk_ex_stau\' doesn\'t have a default value','2023-07-07 15:00:28',0),(135,'学生任务',1,'com.ruoyi.web.controller.scd.StuWkController.add()','POST',1,'maobo',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":102,\"teaId\":104,\"wkAdd\":\"/extra.pdf\",\"wkDes\":\"后端真tm难\",\"wkEnd\":\"2024-07-07 00:00:00\",\"wkExStau\":false,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-07 00:00:00\",\"wkStau\":true}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\code test field\\Github\\SCD\\out\\production\\ruoyi-student\\mapper\\StuWkMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.StuWkMapper.insertStuWk-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_wk          ( stu_id,             tea_id,             wk_name,             wk_start,             wk_end,             wk_stau,                          wk_addr,             wk_des )           values ( ?,                          ?,                          ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1','2023-07-07 15:02:03',0),(136,'学生任务',1,'com.ruoyi.web.controller.scd.StuWkController.add()','POST',1,'maobo',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":102,\"teaId\":104,\"wkAdd\":\"/extra.pdf\",\"wkDes\":\"后端真tm难\",\"wkEnd\":\"2024-07-07 00:00:00\",\"wkExStau\":false,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-07 00:00:00\",\"wkStau\":true}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\r\n### The error may exist in file [D:\\code test field\\Github\\SCD\\out\\production\\ruoyi-student\\mapper\\StuWkMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.StuWkMapper.insertStuWk-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into stu_wk          ( stu_id,             tea_id,             wk_name,             wk_start,             wk_end,             wk_stau,                          wk_addr,             wk_des )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Column count doesn\'t match value count at row 1\n; bad SQL grammar []; nested exception is java.sql.SQLException: Column count doesn\'t match value count at row 1','2023-07-07 15:02:53',0),(137,'学生任务',1,'com.ruoyi.web.controller.scd.StuWkController.add()','POST',1,'maobo',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":102,\"teaId\":104,\"wkAdd\":\"/extra.pdf\",\"wkDes\":\"后端真tm难\",\"wkEnd\":\"2024-07-07 00:00:00\",\"wkExStau\":false,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-07 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:04:53',0),(138,'学生任务',1,'com.ruoyi.web.controller.scd.StuWkController.add()','POST',1,'maobo',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"teaId\":104,\"wkAdd\":\"/extra.pdf\",\"wkDes\":\"ruoyi真看不懂啊\",\"wkEnd\":\"2024-07-07 00:00:00\",\"wkExStau\":false,\"wkId\":3,\"wkName\":\"完成测试报告\",\"wkStart\":\"2023-07-07 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:08:53',0),(139,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"/scd\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:43:10',0),(140,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-07-07 15:43:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"任务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"scd\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:43:18',0),(141,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-07-07 15:43:09\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"教师任务管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"scd/teacher\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"修改菜单\'教师任务管理\'失败，上级菜单不能选择自己\",\"code\":500}',0,NULL,'2023-07-07 15:44:06',0),(142,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教师任务管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"/scd/teacher\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:44:28',0),(143,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-07-07 15:44:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"教师任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"/scd/teacher\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:44:51',0),(144,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-07-07 15:44:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"教师任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"teacher\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:45:13',0),(145,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"scd/teacher/index\",\"createTime\":\"2023-07-07 15:44:28\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"教师任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"teacher\",\"perms\":\"scd:task:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:45:30',0),(146,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-07-07 15:43:09\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"任务管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"scd\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:46:03',0),(147,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"scd/teacher/index\",\"createTime\":\"2023-07-07 15:44:28\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"教师任务管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"teacher\",\"perms\":\"scd:task:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:46:09',0),(148,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2023-06-30 11:55:17\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 15:46:28',0),(149,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"学生A\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":105,\"userName\":\"stu_a\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 17:39:09',0),(150,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"学生B\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":106,\"userName\":\"stu_b\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 17:39:31',0),(151,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"学生C\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":107,\"userName\":\"stu_c\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 17:39:41',0),(152,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"nickName\":\"学生D\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":108,\"userName\":\"stu_d\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 17:39:58',0),(153,'字典类型',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin',NULL,'/system/dict/data/101','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:22:24',0),(154,'字典类型',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin',NULL,'/system/dict/data/100','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:22:26',0),(155,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-07-05 18:33:24\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"未通过\",\"dictSort\":0,\"dictType\":\"scd_task_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:22:35',0),(156,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-07-05 18:33:17\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"已通过\",\"dictSort\":1,\"dictType\":\"scd_task_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:22:41',0),(157,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-07-05 18:33:24\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"未通过\",\"dictSort\":0,\"dictType\":\"scd_task_status\",\"dictValue\":\"false\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:33:13',0),(158,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-07-05 18:33:17\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"已通过\",\"dictSort\":1,\"dictType\":\"scd_task_status\",\"dictValue\":\"true\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:33:19',0),(159,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'commitAdd\' in \'class com.ruoyi.student.domain.StuWk\'','2023-07-07 18:36:59',0),(160,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}',NULL,1,'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'commitAdd\' in \'class com.ruoyi.student.domain.StuWk\'','2023-07-07 18:38:09',0),(161,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:38:51',0),(162,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":101,\"stuName\":\"李四\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端详细分析\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":6,\"wkName\":\"完成后端详细分析\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:38:55',0),(163,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":102,\"stuName\":\"王五\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":10,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:39:00',0),(164,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-07-05 18:33:24\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"未通过\",\"dictSort\":0,\"dictType\":\"scd_task_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:42:35',0),(165,'字典数据',2,'com.ruoyi.web.controller.system.SysDictDataController.edit()','PUT',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2023-07-05 18:33:17\",\"default\":false,\"dictCode\":102,\"dictLabel\":\"已通过\",\"dictSort\":1,\"dictType\":\"scd_task_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:42:38',0),(166,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":false,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:54:38',0),(167,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:54:40',0),(168,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":false,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 18:54:42',0),(169,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":101,\"stuName\":\"李四\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端详细分析\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":false,\"wkId\":6,\"wkName\":\"完成后端详细分析\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:05:16',0),(170,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成文档任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":3,\"wkName\":\"完成大文档编写\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:05:18',0),(171,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"/profile/upload/2023/07/07/组号4组长2019246需求分析_20230707190720A001.docx\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":false,\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:07:25',0),(172,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"scd/student/index\",\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"student\",\"perms\":\"scd:task:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:20:33',0),(173,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"scd/student/index\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"我的任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"student\",\"perms\":\"scd:task:list\",\"status\":\"0\",\"visible\":\"0\"}','{\"msg\":\"新增菜单\'我的任务\'失败，菜单名称已存在\",\"code\":500}',0,NULL,'2023-07-07 19:20:33',0),(174,'学生任务',5,'com.ruoyi.web.controller.scd.StuWkController.export()','POST',1,'admin',NULL,'/scd/task/export','127.0.0.1','内网IP','{\"params\":{}}',NULL,0,NULL,'2023-07-07 19:31:36',0),(175,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":105,\"stuName\":\"学生A\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端设计\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":false,\"wkId\":12,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:36:00',0),(176,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":105,\"stuName\":\"学生A\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端设计\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":12,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:36:02',0),(177,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":false,\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:36:59',0),(178,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":true,\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:37:01',0),(179,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":100,\"stuName\":\"张三\",\"teaId\":103,\"teaName\":\"王涛\",\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":false,\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":true}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 19:46:18',0),(180,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"任务分配状态\",\"dictType\":\"scd_assign_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 20:42:50',0),(181,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未分配\",\"dictSort\":0,\"dictType\":\"scd_assign_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 20:43:04',0),(182,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已分配\",\"dictSort\":1,\"dictType\":\"scd_assign_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 20:43:14',0),(183,'字典类型',3,'com.ruoyi.web.controller.system.SysDictTypeController.remove()','DELETE',1,'admin',NULL,'/system/dict/type/100','127.0.0.1','内网IP','{}',NULL,1,'任务状态已分配,不能删除','2023-07-07 21:34:20',0),(184,'字典类型',3,'com.ruoyi.web.controller.system.SysDictTypeController.remove()','DELETE',1,'admin',NULL,'/system/dict/type/101','127.0.0.1','内网IP','{}',NULL,1,'任务分配状态已分配,不能删除','2023-07-07 21:34:26',0),(185,'字典类型',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin',NULL,'/system/dict/data/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:34:38',0),(186,'字典类型',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin',NULL,'/system/dict/data/105','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:34:40',0),(187,'字典类型',3,'com.ruoyi.web.controller.system.SysDictTypeController.remove()','DELETE',1,'admin',NULL,'/system/dict/type/101','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:34:43',0),(188,'字典类型',3,'com.ruoyi.web.controller.system.SysDictDataController.remove()','DELETE',1,'admin',NULL,'/system/dict/data/103,102','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:34:49',0),(189,'字典类型',3,'com.ruoyi.web.controller.system.SysDictTypeController.remove()','DELETE',1,'admin',NULL,'/system/dict/type/100','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:34:52',0),(190,'字典类型',1,'com.ruoyi.web.controller.system.SysDictTypeController.add()','POST',1,'admin',NULL,'/system/dict/type','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"dictName\":\"分配状态\",\"dictType\":\"sys_stuwk_status\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:37:56',0),(191,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未分配\",\"dictSort\":0,\"dictType\":\"sys_stuwk_status\",\"dictValue\":\"未分配\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:38:16',0),(192,'字典数据',1,'com.ruoyi.web.controller.system.SysDictDataController.add()','POST',1,'admin',NULL,'/system/dict/data','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"分配\",\"dictSort\":1,\"dictType\":\"sys_stuwk_status\",\"dictValue\":\"分配\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:38:20',0),(193,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30001,\"stuName\":\"学生A\",\"teaId\":60001,\"teaName\":\"教师A\",\"tmStuList\":[{\"params\":{},\"stuId\":1,\"stuName\":\"锦欢\"}],\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":\"通过\",\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":\"分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:39:04',0),(194,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30001,\"stuName\":\"学生A\",\"teaId\":60001,\"teaName\":\"教师A\",\"tmStuList\":[{\"params\":{},\"stuId\":1,\"stuName\":\"brz\"}],\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":\"通过\",\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":\"分配\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\r\n### The error may exist in file [D:\\code test field\\Github\\SCD\\out\\production\\ruoyi-student\\mapper\\StuWkMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tm_stu( user_id, stu_name) values                  ( ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\n; Column \'user_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null','2023-07-07 21:47:26',0),(195,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30001,\"stuName\":\"学生A\",\"teaId\":60001,\"teaName\":\"教师A\",\"tmStuList\":[{\"params\":{},\"stuId\":1,\"stuName\":\"brz\"}],\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":\"通过\",\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":\"分配\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\r\n### The error may exist in file [D:\\code test field\\Github\\SCD\\out\\production\\ruoyi-student\\mapper\\StuWkMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into tm_stu( user_id, stu_name) values                  ( ?, ?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\n; Column \'user_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null','2023-07-07 21:47:39',0),(196,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30001,\"stuName\":\"学生A\",\"teaId\":60001,\"teaName\":\"教师A\",\"tmStuList\":[{\"params\":{},\"stuName\":\"brz\",\"userId\":30001}],\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":\"通过\",\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":\"分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 21:53:30',0),(197,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30001,\"stuName\":\"学生A\",\"teaId\":60001,\"teaName\":\"教师A\",\"tmStuList\":[{\"params\":{},\"stuId\":2,\"stuName\":\"brz\",\"userId\":30001}],\"wkAdd\":\"./\",\"wkDes\":\"正常完成前端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":\"未通过\",\"wkId\":1,\"wkName\":\"完成前端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":\"分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 22:34:01',0),(198,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30001,\"stuName\":\"学生A\",\"teaId\":60001,\"teaName\":\"教师A\",\"tmStuList\":[{\"params\":{},\"stuId\":2,\"stuName\":\"brz\",\"userId\":30001},{\"params\":{},\"stuId\":3,\"stuName\":\"brz\",\"userId\":30001}],\"wkAdd\":\"./\",\"wkDes\":\"正常完成后端任务\",\"wkEnd\":\"2023-07-09 00:00:00\",\"wkExStau\":\"通过\",\"wkId\":2,\"wkName\":\"完成后端设计\",\"wkStart\":\"2023-07-04 00:00:00\",\"wkStau\":\"未分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 22:34:04',0),(199,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30007,\"stuName\":\"学生G\",\"teaId\":60007,\"teaName\":\"教师G\",\"tmStuList\":[],\"wkAdd\":\"/profile/upload/2023/07/07/组号4组长2019246需求分析_20230707224336A001.docx\",\"wkDes\":\"未完成UI设计任务\",\"wkEnd\":\"2023-07-21 00:00:00\",\"wkExStau\":\"未通过\",\"wkId\":13,\"wkName\":\"完成UI设计\",\"wkStart\":\"2023-07-16 00:00:00\",\"wkStau\":\"未分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 22:43:37',0),(200,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{}}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where wk_id = null\' at line 3\r\n### The error may exist in file [D:\\code test field\\Github\\SCD\\out\\production\\ruoyi-student\\mapper\\StuWkMapper.xml]\r\n### The error may involve com.ruoyi.student.mapper.StuWkMapper.updateStuWk-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update stu_wk                    where wk_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where wk_id = null\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where wk_id = null\' at line 3','2023-07-07 23:47:31',0),(201,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30007,\"stuName\":\"学生G\",\"teaId\":60007,\"teaName\":\"教师G\",\"tmStuList\":[],\"wkAdd\":\"/profile/upload/2023/07/07/组号4组长2019246需求分析_20230707224336A001.docx\",\"wkDes\":\"未完成UI设计任务\",\"wkEnd\":\"2023-07-21 00:00:00\",\"wkExStau\":\"未通过\",\"wkId\":13,\"wkName\":\"完成UI设计\",\"wkStart\":\"2023-07-16 00:00:00\",\"wkStau\":\"未分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 23:56:33',0),(202,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30007,\"stuName\":\"学生G\",\"teaId\":60007,\"teaName\":\"教师G\",\"tmStuList\":[],\"wkAdd\":\"/profile/upload/2023/07/07/组号4组长2019246需求分析_20230707224336A001.docx\",\"wkDes\":\"未完成UI设计任务\",\"wkEnd\":\"2023-07-21 00:00:00\",\"wkExStau\":\"未通过\",\"wkId\":13,\"wkName\":\"完成UI设计\",\"wkStart\":\"2023-07-16 00:00:00\",\"wkStau\":\"未分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-07 23:57:54',0),(203,'学生任务',2,'com.ruoyi.web.controller.scd.StuWkController.edit()','PUT',1,'admin',NULL,'/scd/task','127.0.0.1','内网IP','{\"params\":{},\"stuId\":30007,\"stuName\":\"学生G\",\"teaId\":60007,\"teaName\":\"教师G\",\"tmStuList\":[],\"wkAdd\":\"/profile/upload/2023/07/07/组号4组长2019246需求分析_20230707224336A001.docx\",\"wkComm\":\"/profile/upload/2023/07/08/user_1688729496074_20230708000205A001.xlsx\",\"wkDes\":\"未完成UI设计任务\",\"wkEnd\":\"2023-07-21 00:00:00\",\"wkExStau\":\"未通过\",\"wkId\":13,\"wkName\":\"完成UI设计\",\"wkStart\":\"2023-07-16 00:00:00\",\"wkStau\":\"未分配\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2023-07-08 00:02:06',0);

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2023-06-30 11:55:16','',NULL,''),(2,'se','项目经理',2,'0','admin','2023-06-30 11:55:16','',NULL,''),(3,'hr','人力资源',3,'0','admin','2023-06-30 11:55:16','',NULL,''),(4,'user','普通员工',4,'0','admin','2023-06-30 11:55:16','',NULL,'');

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2023-06-30 11:55:17','',NULL,'超级管理员'),(2,'普通角色','common',2,'2',1,1,'0','0','admin','2023-06-30 11:55:17','',NULL,'普通角色'),(100,'教师','teacher',3,'1',1,1,'0','0','admin','2023-07-01 11:13:43','admin','2023-07-01 11:14:43',NULL),(101,'学生','student',4,'1',1,1,'0','0','admin','2023-07-01 11:15:06','',NULL,NULL);

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105);

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,3),(2,4),(2,100),(2,101),(2,102),(2,103),(2,104),(2,105),(2,106),(2,107),(2,108),(2,109),(2,110),(2,111),(2,112),(2,113),(2,114),(2,115),(2,116),(2,117),(2,500),(2,501),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1007),(2,1008),(2,1009),(2,1010),(2,1011),(2,1012),(2,1013),(2,1014),(2,1015),(2,1016),(2,1017),(2,1018),(2,1019),(2,1020),(2,1021),(2,1022),(2,1023),(2,1024),(2,1025),(2,1026),(2,1027),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1039),(2,1040),(2,1041),(2,1042),(2,1043),(2,1044),(2,1045),(2,1046),(2,1047),(2,1048),(2,1049),(2,1050),(2,1051),(2,1052),(2,1053),(2,1054),(2,1055),(2,1056),(2,1057),(2,1058),(2,1059),(2,1060),(100,2),(100,4),(100,109),(100,110),(100,111),(100,112),(100,113),(100,114),(100,1046),(100,1049),(100,1050),(100,1051),(100,1052),(100,1053),(100,1054),(101,4);

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

INSERT INTO `sys_user` VALUES (1,103,'admin','若依','00','ry@163.com','15888888888','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-07-07 21:31:56','admin','2023-06-30 11:55:16','','2023-07-07 21:31:55','管理员'),(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2023-06-30 11:55:16','admin','2023-06-30 11:55:16','',NULL,'测试员'),(100,100,'zhangsan','张三','00','','','0','','$2a$10$V3OeQtoTiRF/jrO7zXJtTOJavYpA3Jg4/rcqVNvklczzEeBPGj1NS','0','0','',NULL,'admin','2023-07-07 13:36:31','',NULL,NULL),(101,100,'lisi','李四','00','','','0','','$2a$10$prIOi8Ia7OgR6etJi2924.WSQrlYyBxha8S9u31sHgDANECYIa/FC','0','0','',NULL,'admin','2023-07-07 13:36:46','',NULL,NULL),(102,100,'wangwu','王五','00','','','0','','$2a$10$h5/R8BxPdOlVQD73HHQyTeZI9TXB0n04MJd4XWmTXTSvC/3bu6oIu','0','0','',NULL,'admin','2023-07-07 13:37:01','',NULL,NULL),(103,100,'wangtao','王涛','00','','','0','','$2a$10$QWrHp9s3BB.fdFayo3mx5OVqlEjRmLgFx/xWfmEzcJbY1JV0cVWI.','0','0','',NULL,'admin','2023-07-07 13:37:37','',NULL,NULL),(104,100,'maobo','毛博','00','','','0','','$2a$10$XKAtdGzSOV3tjuKsbxah3u99AFuHJtIb2/BDR60UKB2G9XpXNT.wa','0','0','127.0.0.1','2023-07-07 14:23:38','admin','2023-07-07 13:38:23','','2023-07-07 14:23:38',NULL),(105,100,'stu_a','学生A','00','','','0','','$2a$10$JiV0uiF7QvELjfBbGw/Dw.pygNJoWj6bCVtAnqyvZjZEoyQ4E2w8e','0','0','',NULL,'admin','2023-07-07 17:39:09','',NULL,NULL),(106,100,'stu_b','学生B','00','','','0','','$2a$10$MLoZXet7KAoj.uOHhybZaOzNxIX7gHlIG4AasSTLsz.ndhImanBrO','0','0','',NULL,'admin','2023-07-07 17:39:31','',NULL,NULL),(107,100,'stu_c','学生C','00','','','0','','$2a$10$UQJwXfGaGM0eOKBW/Uh/1eG7emhP/qBpAw/rH0u.yeaqHYx4c14Qm','0','0','',NULL,'admin','2023-07-07 17:39:41','',NULL,NULL),(108,100,'stu_d','学生D','00','','','0','','$2a$10$hzR5Hd5QcDjAm/FBtOC1oevLO6fK4rX4jFlMkOoaJz/F9ceLwL2QG','0','0','',NULL,'admin','2023-07-07 17:39:58','',NULL,NULL);

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

INSERT INTO `sys_user_post` VALUES (1,1),(2,2);

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(100,101),(101,101),(102,101),(103,100),(104,100),(105,101),(106,101),(107,101),(108,101);

--
-- Table structure for table `tm_stu`
--

DROP TABLE IF EXISTS `tm_stu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tm_stu` (
  `stu_id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '学生唯一标识符',
  `user_id` mediumint(9) NOT NULL COMMENT '学生用户ID',
  `stu_name` varchar(4) NOT NULL COMMENT '学生姓名',
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tm_stu`
--

INSERT INTO `tm_stu` VALUES (2,30001,'brz'),(3,30001,'brz'),(4,30001,'brz'),(5,30001,'brz');
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08  0:16:54
