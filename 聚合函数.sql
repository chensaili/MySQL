SELECT COUNT(*) FROM t_grade;

SELECT COUNT(*) AS total FROM t_grade;

SELECT stuName,COUNT(*) FROM t_grade GROUP BY stuName;

SELECT stuName,SUM(score) FROM t_grade WHERE stuName="����";

SELECT stuName,SUM(score) FROM t_grade GROUP BY stuName;

SELECT stuName,AVG(score) FROM t_grade WHERE stuName="����";

SELECT stuName,AVG(score) FROM t_grade GROUP BY stuName;

SELECT stuName,MAX(score) FROM t_grade GROUP BY stuName;

SELECT stuName,MIN(score) FROM t_grade GROUP BY stuName;