drop table if exists tm_tech;
drop table if exists tm_stu;
drop table if exists tm_work;
drop table if exists tm_workfeedback;

create database if not exists task_manage;
/* 项目内容更改后，推送到GitHub上 */
use task_manage;

create table tm_tech(
    /*
    * 名称：教师表
    *      键                    说明            类型
    *  tm_te_uid              唯一标识号        mediumint
    *  tm_te_name             教师姓名         可变字符串max(8*2B)
    *  tm_te_password        教师登录密码      可变字符串max(12)
    *  tm_te_room            教师所属教研室    可变字符串max(10*2B)
    */
    tm_te_uid mediumint not null comment '教师唯一标识号',
    tm_te_name nvarchar(4) not null comment '教师姓名',
    tm_te_password varchar(12) not null comment '教师登录密码',
    tm_te_room nvarchar(10) not null comment '教师所属教研室',
    primary key (tm_te_uid)
);

create table tm_stu(
    /*
    * 名称：学生表
    *      键                    说明            类型
    *  tm_st_uid              唯一标识号        mediumint
    *  tm_st_name             学生姓名         可变字符串max(4*2B)
    *  tm_st_class           学生所属班级       可变字符串max(10*2B)
    *  tm_st_te_name         学生所属教师的姓名 可变字符串max(4*2B)
    *  tm_st_wk_uid          学生所属任务组     可变字符串max(10*2B)
    */
   tm_st_uid mediumint not null comment '学生唯一标识号',
   tm_st_name nvarchar(4) not null comment '学生姓名',
   tm_st_class nvarchar(10) not null comment '学生所属班级',
   tm_st_te_name nvarchar(4) not null comment '学生所属教师的姓名',
   tm_st_wk_uid nvarchar(10) not null comment '学生所属任务组',
   primary key (tm_st_uid)
);

create table tm_work(
    /*
    * 名称：任务表
    *      键                    说明            类型
    *  tm_wk_uid              唯一标识号       mediumint
    *  tm_wk_name             任务名称        可变字符串max(12*2B)
    *  tm_wk_descr            任务描述         长文本
    *  tm_wk_sendt            任务发布日期     日期时间型
    *  tm_wk_endt             任务截至日期     日期时间型
    *  tm_wk_status           任务状态         可变字符串max(6*2B)
    *  tm_wk_te_name          任务发布者-教师的姓名  可变字符串max(4*2B)
    *  tm_wk_te_partner       任务参与者列表   长文本
    *  tm_wk_subaddr          任务提交地址     短文本
    */
    tm_wk_uid mediumint not null comment '任务唯一标识号',
    tm_wk_name nvarchar(12) not null comment '任务名称',
    tm_wk_descr text comment  '任务描述',
    tm_wk_sendt datetime comment '任务发布日期',
    tm_wk_endt datetime comment '任务截至日期',
    tm_wk_status nvarchar(6) comment '任务状态',
    tm_wk_te_name nvarchar(4) not null comment '任务发布者-教师的姓名',
    tm_wk_te_partner text comment '任务参与者列表',
    tm_wk_subaddr tinytext comment '任务提交地址',
    primary key (tm_wk_uid)
);

create table tm_workfeedback(
    /*
    * 名称：任务反馈表
    *      键                    说明            类型
    *  tm_wfb_uid              唯一标识号      smallint
    *  tm_wfb_wk_uid           所属任务表      可变字符串max(12*2B)
    *  tm_wfb_ctnt             反馈内容        长文本
    *  tm_wfb_sendt            任务反馈表发布日期  日期时间型
    *  tm_wfb_endt             任务反馈表截至日期  日期时间型
    *  tm_wfb_status           任务反馈表状态   可变字符串max(6*2B)
    */
    tm_wfb_uid mediumint not null comment '任务反馈表唯一标识符',
    tm_wfb_wk_uid nvarchar(12) comment '所属任务表',
    tm_wfb_ctnt text comment '反馈内容',
    tm_wfb_sendt datetime comment '任务反馈表发布日期',
    tm_wfb_endt datetime comment '任务反馈表截至日期',
    tm_wfb_status nvarchar(6) comment '任务反馈表状态',
    primary key (tm_wfb_wk_uid)
);

/*
* 名称：教师表
*      键                    值
*  tm_te_uid              300001
*  tm_te_name             李华
*  tm_te_password        abcd1234
*  tm_te_room            计算机科学与技术
*/
insert into tm_tech(tm_te_uid, tm_te_name, tm_te_password, tm_te_room)
values('300001', '李华', 'abcd1234', '计算机科学与技术');

/*
* 名称：学生表
*      键                    值
*  tm_st_uid              600001
*  tm_st_name             刘美丽
*  tm_st_class           计算机2002班
*  tm_st_te_name         李华
*  tm_st_wk_uid          900001
*/

insert into tm_stu(tm_st_uid, tm_st_name , tm_st_class, tm_st_te_name, tm_st_wk_uid)
values('600001', '刘美丽', '计算机2002班', '李华', '900001');

/*
* 名称：任务表
*      键                    值
*  tm_wk_uid              900001
*  tm_wk_name             任务管理项目
*  tm_wk_descr            页面开发，后台功能实现，文档撰写等
*  tm_wk_sendt            2023-07-02 19:55:00
*  tm_wk_endt             2023-07-06 20:00:00
*  tm_wk_status           未完成
*  tm_wk_te_name          李华
*  tm_wk_te_partner       刘美丽
*  tm_wk_subaddr          3*@qq.com
*/

insert into tm_work(tm_wk_uid, tm_wk_name, tm_wk_descr, tm_wk_sendt, tm_wk_endt, tm_wk_status,
                    tm_wk_te_name, tm_wk_te_partner, tm_wk_subaddr)
values('900001', '任务管理项目', '页面开发，后台功能实现，文档撰写等', '2023-07-02 19:55:00', '2023-07-06 20:00:00',
       '未完成', '李华', '刘美丽', '3*@qq.com');

/*
* 名称：任务反馈表
*      键                    值
*  tm_wfb_uid              1200001
*  tm_wfb_wk_uid           900001
*  tm_wfb_ctnt             此反馈表内容为：返回任务管理项目的完成情况。
*  tm_wfb_sendt            2023-07-03 19:55:00
*  tm_wfb_endt             2023-07-07 20:00:00
*  tm_wfb_status           已提交
*/

insert into tm_workfeedback(tm_wfb_uid, tm_wfb_wk_uid, tm_wfb_ctnt, tm_wfb_sendt, tm_wfb_endt, tm_wfb_status)
values('1200001', '900001', '此反馈表内容为：返回任务管理项目的完成情况。', '2023-07-03 19:55:00', '2023-07-07 20:00:00',
       '已提交');