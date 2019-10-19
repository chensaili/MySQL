#在单表上创建视图
CREATE VIEW v1(id,bookName,price) AS SELECT id,bookName,price FROM t_book;

#在多表上创建视图
CREATE VIEW v2(bookName,price,bookTypeName) AS SELECT tb.bookName,tb.price,tby.bookTypeName FROM t_book tb INNER JOIN t_bookType tby WHERE tb.bookTypeId=tby.id;

#修改视图
CREATE OR REPLACE VIEW v1(bookName,price,author) AS SELECT bookName,price,author FROM t_book;
ALTER VIEW v1(bookName,price) AS SELECT bookName,price FROM t_book;

#更新视图
INSERT INTO v1 VALUES('java good',120);#往视图v1中插入一条数据，其实这条数据是插入在t_book数据表中
UPDATE v1 SET bookName='java very good',price=200 WHERE id=6;
DELETE FROM v1 WHERE id=6;

#删除视图
DROP VIEW IF EXISTS v4;

DESCRIBE v1#查看指定视图基本信息
SHOW TABLE STATUS #查看所有数据表和视图基本信息
SHOW CREATE VIEW v1#查看指定视图详细信息


