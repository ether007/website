CREATE DATABASE ace CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';
use ace;

DROP TABLE IF EXISTS  SYS_AUTHORITIES ;
DROP TABLE IF EXISTS  SYS_RESOURCES;
DROP TABLE IF EXISTS SYS_ROLES ;
DROP TABLE IF EXISTS SYS_MENU ;
DROP TABLE IF EXISTS SYS_USERS ;
DROP TABLE IF EXISTS SYS_AUTHORITIES_RESOURCES ;
DROP TABLE IF EXISTS SYS_ROLES_AUTHORITIES ;
DROP TABLE IF EXISTS SYS_USERS_ROLES ;

-- 1.权限表
CREATE TABLE SYS_AUTHORITIES (
AUTHORITY_ID INTEGER NOT NULL AUTO_INCREMENT,
AUTHORITY_NAME VARCHAR(40) NULL,
AUTHORITY_DESC VARCHAR(100) NULL,
ENABLED INTEGER NULL,
PRIMARY KEY (AUTHORITY_ID) 
);

-- 2.资源（链接,按钮：数据curd对应url）
CREATE TABLE SYS_RESOURCES (
RESOURCE_ID INTEGER NOT NULL AUTO_INCREMENT,
RESOURCE_NAME VARCHAR(100) NULL,
RESOURCE_DESC VARCHAR(100) NULL,
RESOURCE_TYPE VARCHAR(40) NULL,
RESOURCE_STRING VARCHAR(255) NULL,
ENABLED INT NULL,
PRIMARY KEY (RESOURCE_ID) 
);

-- 3.角色
CREATE TABLE SYS_ROLES (
ROLE_ID INTEGER NOT NULL AUTO_INCREMENT,
ROLE_NAME VARCHAR(100) NULL,
ROLE_DESC VARCHAR(100) NULL,
ENABLED INT NULL,
PRIMARY KEY (ROLE_ID) 
);

-- 4.菜单
CREATE TABLE SYS_MENU (
MENU_ID INTEGER NOT NULL AUTO_INCREMENT,
MENU_NAME VARCHAR(100) NULL,
PARENT_MENU_ID INTEGER NULL,
MENU_SEQ INT NULL,
MENU_LEVEL INT NULL,
RESOURCE_ID INTEGER NULL,
PRIMARY KEY (MENU_ID) 
);

-- 5.用户
CREATE TABLE SYS_USERS (
USER_ID INTEGER NOT NULL AUTO_INCREMENT,
USER_ACCOUNT VARCHAR(100) NULL,
USER_NAME VARCHAR(100) NULL,
USER_PASSWORD VARCHAR(255) NULL,
USER_DESC VARCHAR(255) NULL,
ENABLE INT NULL,
ISSYS INT NULL,
PRIMARY KEY (USER_ID) 
);

-- 6.权限和资源关联
CREATE TABLE SYS_AUTHORITIES_RESOURCES (
ID INTEGER NOT NULL AUTO_INCREMENT,
AUTHORITY_ID INTEGER NULL,
RESOURCE_ID INTEGER NULL,
ENABLED INTEGER NULL,
PRIMARY KEY (ID) 
);

-- 7.角色和权限关联
CREATE TABLE SYS_ROLES_AUTHORITIES (
ID INTEGER NOT NULL AUTO_INCREMENT,
ROLE_ID INTEGER NULL,
AUTHORITY_ID INTEGER NULL,
ENABLED INTEGER NULL,
PRIMARY KEY (ID) 
);

-- 8.用户和角色关联
CREATE TABLE SYS_USERS_ROLES (
ID INTEGER NOT NULL AUTO_INCREMENT,
USER_ID INTEGER NULL,
ROLE_ID INTEGER NULL,
ENABLED INTEGER NULL,
PRIMARY KEY (ID) 
);



insert into SYS_AUTHORITIES(AUTHORITY_ID,AUTHORITY_NAME,AUTHORITY_DESC,ENABLED)values(1,'AUTHORITIES_MANAGER','权限管理',1);
insert into SYS_AUTHORITIES(AUTHORITY_ID,AUTHORITY_NAME,AUTHORITY_DESC,ENABLED)values(2,'USER_MANAGER','用户管理',1);
insert into SYS_AUTHORITIES(AUTHORITY_ID,AUTHORITY_NAME,AUTHORITY_DESC,ENABLED)values(3,'MENU_MANAGER','菜单管理',1);
insert into SYS_AUTHORITIES(AUTHORITY_ID,AUTHORITY_NAME,AUTHORITY_DESC,ENABLED)values(4,'BLOG_EDIT','文章编辑',1);
insert into SYS_AUTHORITIES(AUTHORITY_ID,AUTHORITY_NAME,AUTHORITY_DESC,ENABLED)values(5,'BLOG_CHECK','文章审核',1);


insert into SYS_RESOURCES(RESOURCE_ID,RESOURCE_NAME,RESOURCE_DESC,RESOURCE_TYPE,RESOURCE_STRING,ENABLED)
values(1,'user','用户','url','/user',1);
insert into SYS_RESOURCES(RESOURCE_ID,RESOURCE_NAME,RESOURCE_DESC,RESOURCE_TYPE,RESOURCE_STRING,ENABLED)
values(2,'auth','权限','url','/user',1);
insert into SYS_RESOURCES(RESOURCE_ID,RESOURCE_NAME,RESOURCE_DESC,RESOURCE_TYPE,RESOURCE_STRING,ENABLED)
values(3,'menu','菜单','url','/user',1);
insert into SYS_RESOURCES(RESOURCE_ID,RESOURCE_NAME,RESOURCE_DESC,RESOURCE_TYPE,RESOURCE_STRING,ENABLED)
values(4,'blog','文章','url','/user',1);


insert into SYS_ROLES(ROLE_ID,ROLE_NAME,ROLE_DESC,ENABLED)values(1,'sys','超级用户',1);
insert into SYS_ROLES(ROLE_ID,ROLE_NAME,ROLE_DESC,ENABLED)values(2,'admin','管理员',1);
insert into SYS_ROLES(ROLE_ID,ROLE_NAME,ROLE_DESC,ENABLED)values(3,'editor','编辑',1);


insert into SYS_MENU(MENU_ID,MENU_NAME,PARENT_MENU_ID,MENU_SEQ,MENU_LEVEL,RESOURCE_ID)
values(1,'root',0,1,0,0);


insert into SYS_USERS(USER_ID,USER_ACCOUNT,USER_NAME,USER_PASSWORD,USER_DESC,ENABLED,ISSYS)
values(1,'root001','超级管理','$2a$10$i8ynGgVCPeFHMPaaq1GAyOnbLM/WSUAwyphFqgey1vkUAxa2.LfaO','sys',1,1);

insert into SYS_USERS(USER_ID,USER_ACCOUNT,USER_NAME,USER_PASSWORD,USER_DESC,ENABLED,ISSYS)
values(2,'user007','运营','$2a$10$i8ynGgVCPeFHMPaaq1GAyOnbLM/WSUAwyphFqgey1vkUAxa2.LfaO','user',1,0);


insert into SYS_AUTHORITIES_RESOURCES(ID,AUTHORITY_ID,RESOURCE_ID,ENABLED) values(1,1,1,1);
insert into SYS_AUTHORITIES_RESOURCES(ID,AUTHORITY_ID,RESOURCE_ID,ENABLED) values(2,2,3,1);
insert into SYS_AUTHORITIES_RESOURCES(ID,AUTHORITY_ID,RESOURCE_ID,ENABLED) values(3,3,3,1);
insert into SYS_AUTHORITIES_RESOURCES(ID,AUTHORITY_ID,RESOURCE_ID,ENABLED) values(4,4,4,1);
insert into SYS_AUTHORITIES_RESOURCES(ID,AUTHORITY_ID,RESOURCE_ID,ENABLED) values(5,5,4,1);



insert into SYS_ROLES_AUTHORITIES(ID,ROLE_ID,AUTHORITY_ID,ENABLED) values(1,1,1,1);
insert into SYS_ROLES_AUTHORITIES(ID,ROLE_ID,AUTHORITY_ID,ENABLED) values(2,1,2,1);
insert into SYS_ROLES_AUTHORITIES(ID,ROLE_ID,AUTHORITY_ID,ENABLED) values(3,1,3,1);

insert into SYS_ROLES_AUTHORITIES(ID,ROLE_ID,AUTHORITY_ID,ENABLED) values(4,2,2,1);
insert into SYS_ROLES_AUTHORITIES(ID,ROLE_ID,AUTHORITY_ID,ENABLED) values(5,2,3,1);

insert into SYS_ROLES_AUTHORITIES(ID,ROLE_ID,AUTHORITY_ID,ENABLED) values(6,3,4,1);
insert into SYS_ROLES_AUTHORITIES(ID,ROLE_ID,AUTHORITY_ID,ENABLED) values(7,3,5,1);



insert into SYS_USERS_ROLES(ID,USER_ID,ROLE_ID,ENABLED) values(1,1,1,1);
insert into SYS_USERS_ROLES(ID,USER_ID,ROLE_ID,ENABLED) values(2,1,2,1);
insert into SYS_USERS_ROLES(ID,USER_ID,ROLE_ID,ENABLED) values(3,1,3,1);

insert into SYS_USERS_ROLES(ID,USER_ID,ROLE_ID,ENABLED) values(4,2,2,1);
insert into SYS_USERS_ROLES(ID,USER_ID,ROLE_ID,ENABLED) values(5,3,3,1);



-- 用户查询角色
select t2.* from SYS_USERS_ROLES t1,SYS_ROLES t2
where  t1.ENABLED=1 and t2.ENABLED=1 and t1.ROLE_ID=t2.ROLE_ID and t1.USER_ID=1;

-- 用户查询权限
select t2.* from SYS_ROLES_AUTHORITIES t1,SYS_AUTHORITIES t2
where t1.ENABLED=1 and t2.ENABLED=1 and t1.AUTHORITY_ID=t2.AUTHORITY_ID and ROLE_ID in (1,2,3);

-- url查询可以访问的权限
select t2.AUTHORITY_ID from SYS_RESOURCES t1,SYS_AUTHORITIES_RESOURCES t2
where t1.ENABLED=1 and t2.ENABLED=1 and t1.RESOURCE_ID=t2.RESOURCE_ID and  t1.RESOURCE_STRING='/menu';



