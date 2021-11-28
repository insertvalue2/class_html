-- 전체 쿼리 실행 ctrl + shift + enter 
SHOW TABLES;

-- employees 추가 

USE employees;
-- varchar이라는 것은 가변길이 문자열을 의미하며 varchar(50)은 50byte까지
-- 넣을 수 있는 가변길이 문자열을 말합니다
-- 최대 길이 255바이트 


-- CHAR 
-- 고정길이 문자열 
-- 최대 길이 255바이트 
-- 크기보다 작은 문자열 저장시 뒷부분은 공백으로 채워진다. 
-- (데이터를 가지고 올때는 공백을 재거하고 가져옴) 

-- 색상 (예약어) 대소문자 구별이 없다. 
-- 쿼리 편집창에서 전체 예약어를 대문자로 변경 방법 
-- Edit -> Format --> UPCASE Keywords 선택 
SELECT * FROM departments; 
SELECT * FROM membertbl; 


-- employess db에서 쿼리문으로 shopdb 선택해보기 
USE shopdb; 

SELECT * FROM membertbl;

SELECT 
    membername
FROM
    membertbl;


-- employess 다시 사용 
USE employees;

-- 기본값 1000개로 설정 되어 있음 : 상단 Limit 선택 (dont't limit) 
SELECT * FROM titles;

-- 예약어를 자동완선 구문 기본값 대문자로 설정하기 
-- edit -->  preferences --> Query Editor --> Use UPPERCASE keywords on .. 선택 
-- Ctrl + Space 자동완성 


SELECT * FROM employees; 







