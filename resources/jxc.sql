drop database if exists jxc;

create database jxc;

use jxc;

create table Role
(
	id				int		not null				auto_increment		comment '角色id',
	roleName		varchar(30)											comment '角色名称',
	
	constraint		pk_Role							primary key(id)
) comment '用户角色';

create table Resource
(
	id				int		not null				auto_increment		comment '资源id',
	parentId		int													comment '父资源id，null代表根节点',
	
	title			varchar(80)											comment '标题，菜单',
	url				varchar(80)											comment 'url',
	icon			varchar(80)											comment '图标',
	
	constraint		pk_Resource						primary key(id)
) comment '系统资源';



create table RoleResource
(
	id				int		not null				auto_increment,
	roleId			int,
	resourceId		int,
	
	constraint		pk_RoleResource					primary key(id),
	constraint		pk_RoleResource_Role			foreign key(roleId)
													references Role(id),
	constraint		pk_RoleResource_Resource		foreign key(resourceId)
													references Resource(id)
);

create table User
(
	id				int		not null				auto_increment,
	username		varchar(30),
	password		varchar(30),
	
	roleId			int,
	
	constraint		pk_User							primary key(id),
	constraint		pk_User_Role					foreign key(roleId)
													references Role(Id)
);


insert into Role(roleName) values ('管理员');
insert into Role(roleName) values ('普通用户');

insert into Resource(parentId, title, url, icon) values (null, '业务处理', '', 'fa-table');
insert into Resource(parentId, title, url, icon) values (null, '查询服务', '', 'fa-bar-chart-o');
insert into Resource(parentId, title, url, icon) values (null, '初始设置', '', 'fa-wrench');
insert into Resource(parentId, title, url, icon) values (null, '权限控制', '', 'fa-sitemap');
insert into Resource(parentId, title, url, icon) values (1, '入库单', 'admin/purchase/bill/index', '');
insert into Resource(parentId, title, url, icon) values (1, '出库单', 'admin/sell/bill/index', '');
insert into Resource(parentId, title, url, icon) values (1, '调拨单', 'admin/move/bill/index', '');
insert into Resource(parentId, title, url, icon) values (1, '盘点单', 'admin/adjust/bill/index', '');
insert into Resource(parentId, title, url, icon) values (2, '入库查询', 'admin/purchase/query/index', '');
insert into Resource(parentId, title, url, icon) values (2, '出库查询', 'admin/sell/query/index', '');
insert into Resource(parentId, title, url, icon) values (2, '销售日报', 'admin/sell/day/index', '');
insert into Resource(parentId, title, url, icon) values (2, '销售月报', 'admin/sell/month/index', '');
insert into Resource(parentId, title, url, icon) values (3, '商品分类', 'admin/category/index', '');
insert into Resource(parentId, title, url, icon) values (3, '商品目录', 'admin/product/index', '');
insert into Resource(parentId, title, url, icon) values (3, '初始库存', 'admin/shop/index', '');
insert into Resource(parentId, title, url, icon) values (4, '系统资源', 'admin/resource/index', '');
insert into Resource(parentId, title, url, icon) values (4, '角色设置', 'admin/role/index', '');
insert into Resource(parentId, title, url, icon) values (4, '用户设置', 'admin/user/index', '');

insert into RoleResource(roleId, resourceId) values (1, 1);
insert into RoleResource(roleId, resourceId) values (1, 2);
insert into RoleResource(roleId, resourceId) values (1, 3);
insert into RoleResource(roleId, resourceId) values (1, 4);
insert into RoleResource(roleId, resourceId) values (1, 5);
insert into RoleResource(roleId, resourceId) values (1, 6);
insert into RoleResource(roleId, resourceId) values (1, 7);
insert into RoleResource(roleId, resourceId) values (1, 8);
insert into RoleResource(roleId, resourceId) values (1, 9);
insert into RoleResource(roleId, resourceId) values (1, 10);
insert into RoleResource(roleId, resourceId) values (1, 11);
insert into RoleResource(roleId, resourceId) values (1, 12);
insert into RoleResource(roleId, resourceId) values (1, 13);
insert into RoleResource(roleId, resourceId) values (1, 14);
insert into RoleResource(roleId, resourceId) values (1, 15);
insert into RoleResource(roleId, resourceId) values (1, 16);
insert into RoleResource(roleId, resourceId) values (1, 17);
insert into RoleResource(roleId, resourceId) values (1, 18);


insert into User(username, password, roleId) values ('admin', '1', 1);
insert into User(username, password, roleId) values ('admin1', '123456', 1);
insert into User(username, password, roleId) values ('admin2', '123456', 1);
insert into User(username, password, roleId) values ('admin3', '123456', 1);
insert into User(username, password, roleId) values ('admin4', '123456', 1);
insert into User(username, password, roleId) values ('admin5', '123456', 1);
insert into User(username, password, roleId) values ('admin6', '123456', 1);
insert into User(username, password, roleId) values ('admin7', '123456', 1);
insert into User(username, password, roleId) values ('admin8', '123456', 1);
insert into User(username, password, roleId) values ('admin9', '123456', 1);
insert into User(username, password, roleId) values ('admin10', '123456', 1);
insert into User(username, password, roleId) values ('admin11', '123456', 1);
insert into User(username, password, roleId) values ('admin12', '123456', 1);
insert into User(username, password, roleId) values ('admin13', '123456', 1);
insert into User(username, password, roleId) values ('admin14', '123456', 1);
insert into User(username, password, roleId) values ('admin15', '123456', 1);
insert into User(username, password, roleId) values ('admin16', '123456', 1);
insert into User(username, password, roleId) values ('admin17', '123456', 1);
insert into User(username, password, roleId) values ('admin18', '123456', 1);
insert into User(username, password, roleId) values ('admin19', '123456', 1);
insert into User(username, password, roleId) values ('admin20', '123456', 1);
insert into User(username, password, roleId) values ('admin21', '123456', 1);
insert into User(username, password, roleId) values ('admin22', '123456', 1);
insert into User(username, password, roleId) values ('admin23', '123456', 1);
insert into User(username, password, roleId) values ('admin24', '123456', 1);
insert into User(username, password, roleId) values ('admin25', '123456', 1);
insert into User(username, password, roleId) values ('admin26', '123456', 1);
insert into User(username, password, roleId) values ('admin27', '123456', 1);
insert into User(username, password, roleId) values ('admin28', '123456', 1);
insert into User(username, password, roleId) values ('admin29', '123456', 1);
insert into User(username, password, roleId) values ('admin30', '123456', 1);
insert into User(username, password, roleId) values ('admin31', '123456', 1);
insert into User(username, password, roleId) values ('admin32', '123456', 1);
insert into User(username, password, roleId) values ('admin33', '123456', 1);
insert into User(username, password, roleId) values ('admin34', '123456', 1);
insert into User(username, password, roleId) values ('admin35', '123456', 1);
insert into User(username, password, roleId) values ('admin36', '123456', 1);
insert into User(username, password, roleId) values ('admin37', '123456', 1);
insert into User(username, password, roleId) values ('admin38', '123456', 1);
insert into User(username, password, roleId) values ('admin39', '123456', 1);
insert into User(username, password, roleId) values ('admin40', '123456', 1);
