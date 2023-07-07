use ryvue;

set @schema = database();

drop table if exists stu_wk;

create table if not exists stu_wk
(
    wk_id      mediumint    not null AUTO_INCREMENT comment "任务序号",
    stu_id     mediumint    not null comment "学生用户ID",
    tea_id     mediumint    not null comment "教师用户ID",
    wk_name    nvarchar(12) not null comment "任务名称",
    wk_start   datetime     not null comment "任务发布日期",
    wk_end     datetime     not null comment "任务截至日期",
    wk_stau    boolean not null comment "任务状态",
    wk_ex_stau boolean not null comment "审核状态",
    wk_addr    text         not null comment "任务下载地址",
    wk_des     text         not null comment "任务描述",
    primary key (wk_id)
);
