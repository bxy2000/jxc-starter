#jxc-starter

进销存管理系统示例
-------------
1.项目使用的内容说明
	1.jpa
	2.spring
	3.spring-mvc
	4.freemarker
	5.bootstrap
	6.bootstrap table
	7.sb-admin（bootstrap模板）

2.项目创建
	1.建表文件	jxc.sql
	2.项目所需jar包
		1.spring，spring mvc
			依赖： commons-logging
				 commons-io
				 commons-fileupload
				 jackson	 
		2.jpa
			spring-data-commons
			spring-data-jpa
			依赖：hibernate
				依赖： slf4j
					 c3p0
		3.freemarker
		4.mysql-connector-java
		5.log4j
		6.junit
	3.领域模型（domain=entity+repository）
		1.@JsonIgnore	指示在转换成json数据时，需要忽略的属性，懒加载的数据需要加上该属性，否则，应使用早期加载。
		2.尽可能使用多对一映射，避免使用一对多映射。
	4.业务逻辑
		为了简化操作，这里只给出了业务逻辑类，正常情况下，应该是接口+实现类的形式。
	5.MVC 视图使用freemarker
-----------------------------	
更多内容参照  resources/项目说明.txt
