/*
  insert 문 
  테이블에 데이터를 삽입하는 명령어다. 
  INSERT INTO 테이블명(열1, 열2, ...) VALUES (값1, 값2, ...) 
*/

USE SQLDB;

CREATE TABLE testtbl (id int, userName char(3), age int); 

INSERT INTO testtbl VALUES (1, '홍길동', 25);

-- 생략한 값은 null이 들어간다. 
INSERT INTO testtbl(id, userName) VALUES (2, '이순신');

-- 순서를 변경할 수 도 있다. 
INSERT INTO testtbl(userName, id) VALUES ('야스오', 3);

SELECT * FROM testtbl;


-- 자동으로 증가하는 AUTO_INCREMENT 
-- 자동으로 1부터 증가하는 값을 입력해 준다. 
-- 테이블 속성이 AUTO_INCREMENT 로 지정되어 있다면 INSERT 에서는 해당 열이 없다고 
-- 생각하고 입력하면 된다. 

CREATE TABLE testtbl2 
(id int AUTO_INCREMENT PRIMARY KEY, 
userName char(3), 
age int); 


INSERT INTO testtbl2 VALUE(null, '지민', 25);
INSERT INTO testtbl2 VALUE(null, '유나', 22);
INSERT INTO testtbl2 VALUE(null, '유경', 21);

INSERT into testTBL2(userName, age) VALUES('티모', 900);

-- 시나리오 1
-- AUTO_INCREMENT 값을 100 부터 입력하게 변경하고 싶다면 

ALTER TABLE testTBL2 AUTO_INCREMENT = 100; 

INSERT into testTBL2(userName, age) VALUES('한나', 20);

SELECT * FROM testtbl2;

-- 시나리오 2 auto_increment = 1000 
CREATE TABLE testTbl3 
( id int AUTO_INCREMENT PRIMARY KEY, 
  userName char(3), 
  age int); 

ALTER TABLE testTbl3 AUTO_INCREMENT = 1000;
SET @@auto_increment_increment = 3;   

INSERT into testTBL3(userName, age) VALUES('한나', 20);
INSERT into testTBL3(userName, age) VALUES('철수', 22);

SELECT * FROM testtbl3;

-- 3건에 데이터를 한 문장에서 다음과 같이 입력할 수도 있다. 
INSERT INTO testTbl3(userName, age) VALUES ('철민', 33), ('공길', 28), ('민수', 29);

/*
	대량의 샘플 데이터 생성 !!! 
*/
CREATE TABLE testTbl4(id int, Fname varchar(50), Lname varchar(50));

INSERT INTO testTbl4 
	SELECT emp_no, first_name, last_name
    FROM employees.employees;

SELECT * from testTbl4;

-- 테이블 생성과 동시에 값 입력 
CREATE TABLE tesetTbl5 
( SELECT emp_no, first_name, last_name, gender FROM employees.employees);


select * from employees.employees;
select * from tesetTbl5;







