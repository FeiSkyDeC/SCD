drop table if exists tm_te;
drop table if exists tm_stu;
drop table if exists tm_mess;
drop table if exists tm_wk;
drop table if exists tm_te_ma_stu;
drop table if exists st_wk;

create database if not exists tm;

use tm;

/* ************ 外部表 ************ */
create table tm_te(
    te_uid mediumint not null comment "教师唯一标识符",
    te_name nvarchar(4) not null comment "教师姓名",
    primary key (te_uid)
);

create table tm_stu(
    st_uid mediumint not null comment "学生唯一标识符",
    st_name nvarchar(4) not null comment "学生姓名",
    primary key (st_uid)
);

create table tm_mess(
      ms_uid mediumint not null comment "信息唯一标识符",
      wk_name nvarchar(12) not null comment "任务名称",
      wk_status nvarchar(10) not null comment "任务状态",
      primary key (ms_uid)
);

create table tm_wk(
    wk_uid mediumint not null comment "任务唯一标识符",
    wk_name nvarchar(12) not null comment "任务名称",
    wk_start datetime not null comment "任务发布日期",
    wk_end datetime not null comment "任务截至日期",
    wk_stau nvarchar(12) not null comment "任务状态",
    wk_des text not null comment "任务描述",
    primary key (wk_start)
);

create table tm_te_ma_stu(
    te_uid mediumint not null comment "教师唯一标识符",
    st_uid mediumint not null comment "教师唯一标识符",
    primary key (te_uid)
);
/* ************ 外部表创建 ************ */

/* 创建学生-任务表 */
create table st_wk(
    st_uid mediumint not null comment "教师唯一标识符",
    te_uid mediumint not null comment "教师唯一标识符",
    wk_uid mediumint not null comment "任务唯一标识符",
    wk_name nvarchar(12) not null comment "任务名称",
    wk_start datetime not null comment "任务发布日期",
    wk_end datetime not null comment "任务截至日期",
    wk_stau nvarchar(12) not null comment "任务状态",
    wk_up text not null comment "任务上传地址",
    wk_add text not null comment "任务下载地址",
    wk_des text not null comment "任务描述",
    primary key (st_uid)
);

insert into st_wk(st_uid, te_uid, wk_uid, wk_name, wk_start, wk_end,
                  wk_stau, wk_up, wk_add, wk_des)
    values('60001', '30001', '90001', '完成前端设计', '2023-07-04 20:13:19',
           '2023-07-09 20:13:19', '正常', 'www.baidu.com', 'www.baidu.com', '正常完成任务');


