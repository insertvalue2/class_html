/*
	SELECT 기본 구조 
    
    SELECT select_expr 
    FROM table_name
    WHERE where_condition
    GROUP BY (col_name | exr | position)
    HAVING where_condition
    ORDER BY (col_name | expr | position)
    
    : 차례는 변경이 되면 안된다, 필요하면 생략은 가능하다. 
    
    
    가장 많이 사용하는 기본 구조 
    SELECT 열 이름 
    FROM 테이블 이름
    WHERE 조건 
*/


-- USE 데이터베이스_이름; 
-- 다른 데이터 베이스를 선택하고 엉뚱한 테이블을 조회 하지 말기! 
use employees; 
SELECT * FROM employees;
SELECT * FROM titles; -- Don't Limit 


-- use 를 사용하지 않고 조회 
SELECT * FROM employees.titles;

SELECT emp_no, titles FROM titles;  -- json 형식으로 export 해서 확인해보기 
-- 문제 1 : titles 테이블에서 emp_no, title, from_date 결과 뽑아보기  LIMIT 3
SELECT emp_no,title, from_date FROM titles LIMIT 3;
-- desc titles;




-- 실습 1 
SHOW DATABASES; -- 현재 DBMS에 있는 데이터 베이스 확인 
USE employees; -- 데이터 베이스 선택 
SHOW TABLE STATUS;  -- 테이블 목록과 개괄적인 정보 
SHOW TABLES;        -- 테이블 목록 이름만 확인 

DESCRIBE titles; -- 테이블에 대한 정보 조회 
DESC titles;
DESC employees;

SELECT emp_no, first_name, gender FROM employees;



















