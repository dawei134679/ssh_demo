/**
*Author: itcast
*Date:2015-08-14
*Desc:创建人员组织架构
*/
/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2015/8/14 15:29:27                           */
/*==============================================================*/


drop table if exists t_dept;

drop table if exists t_emp;

drop table if exists t_emp_role;

drop table if exists t_leader;

drop table if exists t_org;

drop table if exists t_privilege;

drop table if exists t_role;

drop table if exists t_role_pri;

/*==============================================================*/
/* Table: t_dept                                                */
/*==============================================================*/
create table t_dept
(
   dept_id              varchar(32) not null,
   org_id               varchar(32) not null,
   name                 varchar(50),
   primary key (dept_id)
);

/*==============================================================*/
/* Table: t_emp                                                 */
/*==============================================================*/
create table t_emp
(
   emp_id               varchar(32) not null,
   dept_id              varchar(32) not null,
   name                 varchar(50) not null,
   primary key (emp_id)
);

/*==============================================================*/
/* Table: t_emp_role                                            */
/*==============================================================*/
create table t_emp_role
(
   emp_id               varchar(32) not null,
   role_id              varchar(32) not null,
   state                int,
   primary key (emp_id, role_id)
);

/*==============================================================*/
/* Table: t_leader                                              */
/*==============================================================*/
create table t_leader
(
   emp_id               varchar(32) not null,
   dept_id              varchar(32),
   name                 varchar(50) not null,
   position             varchar(50),
   primary key (emp_id)
);

/*==============================================================*/
/* Table: t_org                                                 */
/*==============================================================*/
create table t_org
(
   org_id               varchar(32) not null,
   name                 varchar(50) not null,
   primary key (org_id)
);

/*==============================================================*/
/* Table: t_privilege                                           */
/*==============================================================*/
create table t_privilege
(
   pri_id               varchar(32) not null,
   name                 varchar(50) not null,
   primary key (pri_id)
);

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   role_id              varchar(32) not null,
   name                 varchar(50) not null,
   primary key (role_id)
);

/*==============================================================*/
/* Table: t_role_pri                                            */
/*==============================================================*/
create table t_role_pri
(
   role_id              varchar(32) not null,
   pri_id               varchar(32) not null,
   primary key (role_id, pri_id)
);

alter table t_dept add constraint FK_r_ord_dept foreign key (org_id)
      references t_org (org_id) on delete restrict on update restrict;

alter table t_emp add constraint FK_r_dept_emp foreign key (dept_id)
      references t_dept (dept_id) on delete restrict on update restrict;

alter table t_emp_role add constraint FK_t_emp_role foreign key (emp_id)
      references t_emp (emp_id) on delete restrict on update restrict;

alter table t_emp_role add constraint FK_t_emp_role2 foreign key (role_id)
      references t_role (role_id) on delete restrict on update restrict;

alter table t_leader add constraint FK_inheritance_1 foreign key (emp_id)
      references t_emp (emp_id) on delete restrict on update restrict;

alter table t_role_pri add constraint FK_belong foreign key (role_id)
      references t_role (role_id) on delete restrict on update restrict;

alter table t_role_pri add constraint FK_own foreign key (pri_id)
      references t_privilege (pri_id) on delete restrict on update restrict;




/**
*Author: itcast
*Date:2015-08-18
*Desc:创建投诉受理管理数据库表
*/

drop table if exists complain;

/*==============================================================*/
/* Table: complain                                              */
/*==============================================================*/
create table complain
(
   comp_id              varchar(32) not null,
   comp_company         varchar(100),
   comp_name            varchar(20),
   comp_mobile          varchar(20),
   comp_time            datetime,
   to_comp_dept         varchar(100),
   to_comp_name         varchar(20),
   comp_title           varchar(200),
   comp_content         text,
   is_NM                bool,
   state                varchar(1),
   primary key (comp_id)
);

drop table if exists complain_reply;

/*==============================================================*/
/* Table: complain_reply                                        */
/*==============================================================*/
create table complain_reply
(
   reply_id             varchar(32) not null,
   comp_id              varchar(32) not null,
   reply_time           datetime,
   reply_dept           varchar(100),
   replyer              varchar(20),
   content              varchar(300),
   primary key (reply_id)
);

alter table complain_reply add constraint FK_r_comp_reply foreign key (comp_id)
      references complain (comp_id) on delete restrict on update restrict;


/**
*Author: itcast
*Date:2015-08-21
*Desc:创建月份表
*/
CREATE TABLE `tmonth` (
  `imonth` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`imonth`)
)
