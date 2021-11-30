/*
	DELETE FROM 
    
    주의점 : 조건문을 함께 써야 한다. 
    DELETE FROM 테이블 이름 WHERE  조건; 
*/

SELECT * FROM testTbl4;
DELETE FROM testTbl4 WHERE Fname = 'Aammer';

-- 만약 100건이 있다고 가정하고 상위 5건만 삭제하라 
DELETE FROM testTbl4 WHERE Fname = 'Aammer' LIMIT 5;



SELECT *, count(Fname) FROM testTbl4
GROUP BY Fname
HAVING count(Fname) >= 2;
;

SELECT * FROM testTbl4 WHERE Fname = 'Aammer';

-- 문제 buytbl 에서 userID 별로, 구매한 수를 표현 하고 2회 이상 구매한 사람만 표시 하라. 
SELECT userID, count(userID) FROM buytbl
GROUP BY userId
-- HAVING count(userID) >= 2;
;

-- 대용량 테이블을 삭제해 보자. 

CREATE TABLE bigTbl1 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl2 (SELECT * FROM employees.employees);
CREATE TABLE bigTbl3 (SELECT * FROM employees.employees);

-- 느린 작업 
DELETE FROM bigTbl1; 

-- 한꺼번에 지움 
DROP TABLE bigTbl2; 
-- 한꺼번에 지움, 한번에 지워져서 DELETE 보다 빠르다  
TRUNCATE TABLE bigTbl3; 



