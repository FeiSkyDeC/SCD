drop table if exists tm_tea;
drop table if exists tm_stu;
drop table if exists tm_mess;
drop table if exists tm_wk;
drop table if exists tm_tea_ma_stu;
drop table if exists stu_wk;
drop procedure if exists dropforeignkey;

# drop 所有外键 if exists;
DELIMITER //
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
DELIMITER ;
call dropforeignkey();

# 创建数据库 ry_db
create database if not exists ry_db;
use ry_db;

# 如果想单独修改表，可以执行以下语句删除表外键
#alter table stu_wk drop foreign key cstu_tea;
#alter table stu_wk drop foreign key cstu_stu;
#alter table stu_wk drop foreign key cstu_wk;

/* ************ 外部表 ************ */
create table tm_tea(
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
);
/* ************ 外部表创建 ************ */

/* ************ 创建学生-任务表 ************ */
create table stu_wk(
    stu_id mediumint not null comment "学生唯一标识符",
    tea_id mediumint not null comment "教师唯一标识符",
    wk_id mediumint not null comment "任务唯一标识符",
    wk_name nvarchar(12) not null comment "任务名称",
    wk_start datetime not null comment "任务发布日期",
    wk_end datetime not null comment "任务截至日期",
    wk_stau nvarchar(12) not null comment "任务状态",
    wk_up text not null comment "任务上传地址",
    wk_add text not null comment "任务下载地址",
    wk_des text not null comment "任务描述",
    primary key (stu_id)
);
/* ************ 创建学生-任务表 ************ */

/* ************ 定义外键约束 ************ */
# 学生-任务表 与 教师表
alter table stu_wk add constraint cstu_tea
    foreign key (tea_id) REFERENCES tm_tea(tea_id);
# 学生-任务表 与 学生表
alter table stu_wk add constraint cstu_stu
    foreign key (stu_id) REFERENCES tm_stu(stu_id);
# 学生-任务表 与 任务表
alter table stu_wk add constraint cstu_wk
    foreign key (wk_id) REFERENCES tm_wk(wk_id);
/* ************ 定义外键约束 ************ */

/* ************ 插入数据 ************ */
insert into tm_tea(tea_id, tea_name)
    values ('30001', '教师A');
insert into tm_stu(stu_id, stu_name)
    values ('60001', '学生A');
insert into tm_mess(ms_id, wk_name, wk_status)
    values ('00001', '完成前端设计', '正常');
insert into tm_wk(wk_id, wk_name, wk_start, wk_end, wk_stau, wk_des)
    values ('90001', '完成前端设计','2023-07-04 20:13:19',
            '2023-07-09 20:13:19', '正常', '正常完成任务');
insert into tm_tea_ma_stu (tea_id, stu_id)
    values ('30001', '60001');
insert into stu_wk(stu_id, tea_id, wk_id, wk_name, wk_start, wk_end,
                  wk_stau, wk_up, wk_add, wk_des)
    values ('60001', '30001', '90001', '完成前端设计', '2023-07-04 20:13:19',
           '2023-07-09 20:13:19', '正常', 'www.baidu.com', 'www.baidu.com', '正常完成任务');
/* ************ 插入数据 ************ */
