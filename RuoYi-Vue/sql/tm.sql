drop table if exists tm_tea;
drop table if exists tm_stu;
drop table if exists tm_mess;
drop table if exists tm_wk;
drop table if exists tm_tea_ma_stu;
drop table if exists stu_wk;
drop procedure if exists dropforeignkey;

# drop 所有外键 if exists;;
/*DELIMITER //
create procedure dropforeignkey()
BEGIN
    # 获取与外键名相同的外键的数量，例：CONSTRAINT_NAME = 'cstu_tea'的数量
    set @fk_tea_Count = (
        select count(*) from information_schema.KEY_COLUMN_USAGE
        where TABLE_NAME = 'stu_wk'
          and CONSTRAINT_SCHEMA = 'ry_db'
          and CONSTRAINT_NAME = 'cstu_tea'
    );
    set @fk_stu_Count = (
        select count(*) from information_schema.KEY_COLUMN_USAGE
        where TABLE_NAME = 'stu_wk'
          and CONSTRAINT_SCHEMA = 'ry_db'
          and CONSTRAINT_NAME = 'cstu_stu'
    );
    set @fk_wk_Count = (
        select count(*) from information_schema.KEY_COLUMN_USAGE
        where TABLE_NAME = 'stu_wk'
          and CONSTRAINT_SCHEMA = 'ry_db'
          and CONSTRAINT_NAME = 'cstu_wk'
    );
    # 如果存在相同外键名的外键，就将其删除
    IF @fk_tea_Count>0 THEN
        alter table stu_wk
            drop foreign key cstu_tea;
    END IF;
    IF @fk_stu_Count>0 THEN
        alter table stu_wk
            drop foreign key cstu_stu;
    END IF;
    IF @fk_wk_Count>0 THEN
        alter table stu_wk
            drop foreign key cstu_wk;
    END IF;
END //
DELIMITER ;*/

#如果想删除外键，就执行下面的语句
#call dropforeignkey();

/* 测试推送 */

# 创建数据库 ry_db
create database if not exists ry_db;
use ry_db;

# 如果想单独修改表，可以执行以下语句删除表外键
#alter table stu_wk drop foreign key cstu_tea;
#alter table stu_wk drop foreign key cstu_stu;
#alter table stu_wk drop foreign key cstu_wk;

/* ************ 外部表 ************ */
/*create table tm_tea(
    tea_id mediumint not null comment "教师唯一标识符",
    tea_name nvarchar(4) not null comment "教师姓名",
    primary key (tea_id)
);

create table tm_stu(
    stu_id mediumint not null comment "学生唯一标识符",
    stu_name nvarchar(4) not null comment "学生姓名",
    primary key (stu_id)
);

create table tm_mess(
      ms_id mediumint not null comment "信息唯一标识符",
      wk_name nvarchar(12) not null comment "任务名称",
      wk_status nvarchar(10) not null comment "任务状态",
      primary key (ms_id)
);

create table tm_wk(
    wk_id mediumint not null comment "任务唯一标识符",
    wk_name nvarchar(12) not null comment "任务名称",
    wk_start datetime not null comment "任务发布日期",
    wk_end datetime not null comment "任务截至日期",
    wk_stau nvarchar(12) not null comment "任务状态",
    wk_des text not null comment "任务描述",
    primary key (wk_id)
);

# 教师所带学生
create table tm_tea_ma_stu(
    tea_id mediumint not null comment "教师唯一标识符",
    stu_id mediumint not null comment "学生唯一标识符",
    primary key (tea_id)
);*/
/* ************ 外部表创建 ************ */

/* ************ 创建学生-任务表 ************ */
create table stu_wk(
    wk_id mediumint not null AUTO_INCREMENT comment "任务序号",
    stu_id mediumint not null comment "学生唯一标识符",
    stu_name nvarchar(12) not null comment "学生姓名",
    tea_id mediumint not null comment "教师唯一标识符",
    tea_name nvarchar(12) not null comment "教师姓名",
    wk_name nvarchar(12) not null comment "任务名称",
    wk_start datetime not null comment "任务发布日期",
    wk_end datetime not null comment "任务截至日期",
    wk_stau nvarchar(12) not null comment "任务状态",
    wk_ex_stau nvarchar(12) not null comment "审核状态",
    #wk_up text not null comment "任务上传地址",
    wk_addr text not null comment "任务下载地址",
    wk_des text not null comment "任务描述",
    primary key (wk_id)
);
/* ************ 创建学生-任务表 ************ */

/* ************ 定义外键约束 ************ */
/*# 学生-任务表 与 教师表
alter table stu_wk add constraint cstu_tea
    foreign key (tea_id) REFERENCES tm_tea(tea_id);
# 学生-任务表 与 学生表
alter table stu_wk add constraint cstu_stu
    foreign key (stu_id) REFERENCES tm_stu(stu_id);
# 学生-任务表 与 任务表
alter table stu_wk add constraint cstu_wk
    foreign key (wk_id) REFERENCES tm_wk(wk_id);
alter table tm_tea add constraint ctea_tea
    foreign key (tea_id) REFERENCES tm_tea_ma_stu(tea_id);*/
/* ************ 定义外键约束 ************ */

/* ************ 插入数据 ************ */
/*insert into tm_tea(tea_id, tea_name)
    values ('30001', '教师A');
insert into tm_stu(stu_id, stu_name)
    values ('60001', '学生A');
insert into tm_mess(ms_id, wk_name, wk_status)
    values ('00001', '完成前端设计', '正常');
insert into tm_wk(wk_id, wk_name, wk_start, wk_end, wk_stau, wk_des)
    values ('90001', '完成前端设计','2023-07-04 20:13:19',
            '2023-07-09 20:13:19', '正常', '正常完成任务');
insert into tm_tea_ma_stu (tea_id, stu_id)
    values ('30001', '60001');*/

# 以下向数据库 stu_wk 中插入语句
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('1', '30001', '学生A','60001', '教师A','完成前端设计', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '通过', './' , '正常完成前端任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('2', '30001', '学生A','60001', '教师A', '完成后端设计', '2023-07-04 20:13:19','2023-07-09 20:13:19', '未分配', '未通过', './' , '正常完成后端任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('3', '30001', '学生A','60001', '教师A', '完成大文档编写', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '未通过', './' , '正常完成文档任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('4', '30002', '学生B','60001', '教师A', '完成小文档设计', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '通过', './' , '正常完成任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('5', '30002', '学生B','60001', '教师A','完成项目计划设计', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '通过', './' , '正常完成项目计划任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('6', '30003', '学生C','60001', '教师A', '完成后端详细分析', '2023-07-04 20:13:19','2023-07-09 20:13:19', '未分配', '未通过', './' , '正常完成后端详细分析');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('7', '30004', '学生D','60001', '教师A', '制定任务计划', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '未通过', './' , '正常完成计划指定');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('8', '30005', '学生E','60001', '教师A', '完成任务计划', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '通过', './' , '正常完完成计划指定');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('9', '30005', '学生E','60001', '教师A','完成前端设计', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '通过', './' , '正常完成前端任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('10', '30005', '学生E','60001', '教师A', '完成后端设计', '2023-07-04 20:13:19','2023-07-09 20:13:19', '未分配', '未通过', './' , '正常完成后端任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('11', '30005', '学生E','60001', '教师A', '完成大文档编写', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '未通过', './' , '正常完成文档任务');
insert into stu_wk(wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
values ('12', '30006', '学生F','60001', '教师A', '完成前端设计', '2023-07-04 20:13:19','2023-07-09 20:13:19', '分配', '通过', './' , '正常完成前端设计');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('13', '30007', '学生G', '60007', '教师G', '完成UI设计', '2023-07-16 14:15:00', '2023-07-21 14:15:00', '未分配', '未通过', './' , '未完成UI设计任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('14', '30007', '学生G', '60007', '教师G', '完成系统集成', '2023-07-17 16:45:00', '2023-07-22 16:45:00', '分配', '未通过', './' , '正常完成系统集成任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('15', '30007', '学生G', '60007', '教师G', '完成性能优化', '2023-07-18 11:20:00', '2023-07-23 11:20:00', '分配', '通过', './' , '正常完成性能优化任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('16', '30007', '学生G', '60007', '教师G', '完成用户反馈收集', '2023-07-19 19:10:00', '2023-07-24 19:10:00', '未分配', '未通过', './' , '未完成用户反馈收集任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('17', '30007', '学生G', '60007', '教师G', '完成安全测试', '2023-07-20 10:30:00', '2023-07-25 10:30:00', '分配', '通过', './' , '正常完成安全测试任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('21', '30007', '学生G', '60007', '教师G', '完成系统评估', '2023-07-24 13:10:00', '2023-07-29 13:10:00', '分配', '通过', './' , '正常完成系统评估任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('22', '30007', '学生G', '60007', '教师G', '完成用户验收', '2023-07-25 18:25:00', '2023-07-30 18:25:00', '未分配', '未通过', './' , '未完成用户验收任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('23', '30007', '学生G', '60007', '教师G', '完成项目总结', '2023-07-26 12:40:00', '2023-07-31 12:40:00', '分配', '通过', './' , '正常完成项目总结任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('24', '30007', '学生G', '60007', '教师G', '完成部署与上线', '2023-07-27 14:55:00', '2023-08-01 14:55:00', '分配', '通过', './' , '正常完成部署与上线任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('25', '30007', '学生G', '60007', '教师G', '完成需求变更', '2023-07-28 10:10:00', '2023-08-02 10:10:00', '未分配', '未通过', './' , '未完成需求变更任务');
insert into stu_wk (wk_id, stu_id, stu_name, tea_id, tea_name, wk_name, wk_start, wk_end, wk_stau, wk_ex_stau, wk_addr, wk_des)
VALUES ('26', '30007', '学生G', '60007', '教师G', '完成数据备份', '2023-07-29 18:35:00', '2023-08-03 18:35:00', '分配', '通过', './' , '正常完成数据备份任务');
/* ************ 插入数据 ************ */

/* ************ 任务状态 ************ */
/*insert into sys_dict_type(dict_id, dict_name, dict_type, status, create_by,
                          create_time, update_by, update_time, remark)
    values ('4', '任务状态', 'sys_job_status', '0', 'admin', '2023-06-30 12:35:40',
            'admin', '2023-07-05 19:49:44', '任务状态列表');
insert into sys_dict_data(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class,
                          is_default, status, create_by, create_time, update_by, update_time, remark)
    values ()*/
/* ************ 任务状态 ************ */

