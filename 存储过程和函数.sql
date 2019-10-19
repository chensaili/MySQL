#创建存储过程
DELIMITER &&
CREATE PROCEDURE pro_book (IN bT INT ,OUT count_num INT)
	READS SQL DATA
	BEGIN 
          SELECT COUNT(*)FROM t_book WHERE bookTypeId=bT;
        END
        &&
DELIMITER ;

#创建存储函数
DELIMITER &&
CREATE FUNCTION func_book(bookId INT)
	RETURNS VARCHAR(20)
	BEGIN
	  RETURN (SELECT bookName FROM t_book WHERE id=bookId);
	END
	&&
DELIMITER ;

#调用存储过程
CALL pro_book(1,@total);

#调用存储函数	
SELECT func_book(2);


#查看存储过程和存储函数的状态
SHOW PROCEDURE STATUS LIKE 'pro_book'
SHOW FUNCTION STATUS LIKE 'func_book'

#查看存储过程和存储函数的定义
SHOW CREATE PROCEDURE pro_book;
SHOW CREATE FUNCTION  func_book;


#使用set进行变量赋值
DELIMITER &&
CREATE PROCEDURE pro_user()
	BEGIN
	 DECLARE a,b VARCHAR(20) ;#定义两个varchar型变量
	 SET a='java',b='123456';#给两个变量赋值
	 INSERT INTO t_user VALUES(NULL,a,b);
	END 
&&
DELIMITER ;

CALL pro_user();

#使用select语句进行变量赋值
DELIMITER &&
CREATE PROCEDURE pro_user3()
	BEGIN
	 DECLARE a,b VARCHAR(20) ;
	 SELECT userName,PASSWORD INTO a,b FROM t_user2 WHERE id=1;
	 INSERT INTO t_user VALUES(NULL,a,b);
	END 
&&
DELIMITER ;

CALL pro_user3();

#游标的使用
DELIMITER &&
CREATE PROCEDURE pro_user4()
	BEGIN
	 DECLARE a,b VARCHAR(20) ;
	 DECLARE cur_t_user2 CURSOR FOR SELECT userName,PASSWORD FROM t_user2;#声明游标
	 OPEN cur_t_user2;#打开游标
	 FETCH cur_t_user2 INTO a,b;#使用游标
	 INSERT INTO t_user VALUES(NULL,a,b);
	 CLOSE cur_t_user2;#关闭游标
	END 
&&
DELIMITER ;

CALL pro_user4();

#流程控制if语句
DELIMITER &&
CREATE PROCEDURE pro_user5(IN bookId INT)
	BEGIN
	 SELECT COUNT(*) INTO @num FROM t_user WHERE id=bookId;
	 IF @num>0 THEN UPDATE t_user SET username='java1' WHERE id=bookId;
	 ELSE
	   INSERT INTO t_user VALUES(NULL,'2312312','2321312');
	 END IF;
	END
	&&
DELIMITER ;

CALL pro_user5(1);


#case语句的使用
DELIMITER &&
CREATE PROCEDURE pro_user8()
	BEGIN
	 DECLARE a,b VARCHAR(20) ;
	 DECLARE done INT DEFAULT FALSE; #定义遍历数据结束标志
	 DECLARE cur_t_user2 CURSOR FOR SELECT userName,PASSWORD FROM t_user2;#声明游标 
         DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;#将结束标志绑定到游标
     
	 OPEN cur_t_user2;#打开游标
	     read_loop:LOOP#开始循环
			FETCH cur_t_user2 INTO a,b;#使用游标
			IF done THEN LEAVE read_loop;
			END IF;
			INSERT INTO t_user VALUES(NULL,a,b);
             END LOOP;	 
	 CLOSE cur_t_user2;#关闭游标
	END 
	&&
DELIMITER ;

CALL pro_user8();


#repeat语句
DELIMITER &&
CREATE PROCEDURE pro_user9(IN totalNum INT)
	BEGIN
	  REPEAT
	     SET totalNum=totalNum-1;
	     INSERT INTO t_user VALUES(totalNum,'2312312','2321312');
	     UNTIL totalNum=1 
	  END REPEAT;
	END 
&&
DELIMITER ;

CALL pro_user9(10);

#while语句
DELIMITER &&
CREATE PROCEDURE pro_user10(IN totalNum INT)
	BEGIN
	 WHILE totalNum>0 DO
	  INSERT INTO t_user VALUES(totalNum,'2312312','2321312');
	  SET totalNum=totalNum-1;
	 END WHILE ;
	END 
&&
DELIMITER ;

CALL pro_user10(10);




