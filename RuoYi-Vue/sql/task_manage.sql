drop table if exists tm_tech;

create database task_manage;

use task_manage;

create table tm_tech(
    tm_te_uid smallint not null comment '教师唯一标识号',
    tm_te_name nvarchar(4) not null comment '教师姓名',
    tm_te_password varchar(12) not null comment '教师登录密码',
    tm_te_room nvarchar(10) not null comment '教师所属教研室',
    primary key (tm_te_uid)
);
