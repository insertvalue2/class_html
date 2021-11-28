-- director (팀장님) 
-- db 생성 
CREATE DATABASE sampleDB;
-- db 삭제 
DROP DATABASE sampledb;



-- ceo (사장님) 
CREATE DATABASE sampleDB; -- 권한 없음
DROP DATABASE sampledb; -- 권한 없음

USE shopDB; 
SELECT * FROM membertbl;
DELETE FROM membertbl;  -- 권한 없음 


-- staff (일반직원) 
USE shopDb;
SELECT * FROM membertbl; 
DELETE FROM membertbl WHERE memberID ='jee';

use employees; 
SELECT * FROM employees;
DELETE FROM employees where emp_no = 10001;



-- 쿼리문으로 사용자 계정 생성 
-- root 권한으로 다시 접속하기 
-- create user 계정아이디@localhost IDENTIFIED by 비밀번호
CREATE USER staff2@localhost IDENTIFIED BY '1234';
CREATE USER staff3 IDENTIFIED BY '1234';
-- 외부에서 접속을 허용하는 아이디 생성 방법 
-- create user '계정아이디'@'%' identified by '비밀번호'; 
-- 만약 특정 IP 대역에서만 접속하게 설정하려면 'IP대역.%'  로 주면 됩니다.
-- 예) '172.168.%'  -> IP 가 172.168.xxx.xxx  에서만 접속 가능


-- 사용자 확인 쿼리 
use mysql;
select user, host from user;

-- localhost 유저 구문 추가 
DROP USER staff2@localhost;
DROP USER ceo;
DROP USER staff3;


