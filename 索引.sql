#在创建表时建立索引
CREATE TABLE t_test(
	id INT ,
	userName VARCHAR(20),
	PASSWORD VARCHAR(20),
	PRIMARY KEY(id)
	);
CREATE TABLE t_test2(
	id INT ,
	userName VARCHAR(20),
	PASSWORD VARCHAR(20),
	INDEX(id)
	);
CREATE TABLE t_test3(
	id INT ,
	userName VARCHAR(20),
	PASSWORD VARCHAR(20),
	UNIQUE INDEX(id)
	);
	
#删除索引
DROP INDEX id ON t_test2;

#创建索引
CREATE UNIQUE INDEX id ON t_test2(id);
ALTER TABLE t_test2 ADD INDEX id(id);	

#查看索引
SHOW INDEX FROM t_test2;

