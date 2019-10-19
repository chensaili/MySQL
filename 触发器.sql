#创建只有一个语句的触发器
CREATE TRIGGER trig_book AFTER INSERT
	ON t_book FOR EACH ROW 
	UPDATE t_bookType SET bookNum=bookNum+1 WHERE new.bookTypeId=t_bookType.id;

INSERT INTO t_book VALUES(NULL,'java好',100,'哈哈',1);


#创建含有多个语句的触发器
DELIMITER |
CREATE TRIGGER trig_book2 AFTER DELETE ON t_book 
    FOR EACH ROW
    BEGIN
       UPDATE t_bookType SET bookNum=bookNum-1 WHERE old.bookTypeId=t_booktype.id;
       INSERT INTO t_log VALUES(NULL,NOW(),'在book表里删除了一条数据');
    END 
    |
DELIMITER ;

DELETE FROM t_book WHERE id=5;

#查看所有的触发器
SHOW TRIGGERS;

#删除触发器
DROP TRIGGER trig_book2 ;