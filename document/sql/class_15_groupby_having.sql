-- GROUP BY 

-- 시나리오 1. 우리 쇼핑몰에서 사용자별 몇 건의 구매를 했는지 확인하고 싶다. 

USE sqldb;
SELECT userID, amount FROM buytbl ORDER BY userID;

-- 그룹을 만들어서 결과를 낸다. 

-- 틀린 결과 
SELECT userID, amount
FROM buytbl
GROUP BY userID;

-- 집계 함수 
SELECT userID, sum(amount) 
FROM buytbl
GROUP BY userID;

-- 별칭 사용하기 
SELECT userID as '사용자 아아디', sum(amount) as '총 구매 개수'
FROM buytbl
GROUP BY userID;

-- 시나리오 2. 사용자별 총 구매액의 총합을 출력하자. 
select userID as '사용자 아이디' , sum(price * amount) as '총구매액'
FROM buytbl
GROUP BY userID; 

select userID as '사용자 아이디' , sum(price * amount) as '총구매액'
FROM buytbl
GROUP BY userID;
-- 집계함수 sum과 group by는 함께 자주 사용된다. !!! 
-- AVG(), MIN(), MAX(), COUNT()


-- 시나리오 3. 전체 구매자가 구매한 물품 구개 개수에 평균을 구해보자. 
SELECT AVG(amount) as '평균 구매 개수'
FROM buytbl;

-- 시나리오 4. 사용자 별로 한 번 구매시 평균 몇 개의 구매를 했는지 평균을 내보자. 
SELECT userID,  AVG(amount) as '평균 구매 개수'
FROM buytbl
GROUP BY userID;

-- 시나리오 5. 가장 큰 키와 가장 작은 키의 회원 이름과 키를 출력해 보자. 

-- 주의1 
SELECT name, MAX(height), MIN(height) FROM usertbl;
-- 결과 186, 166 결과는 맞지만 이름은 한명만 나온다. 

-- 주의2  
SELECT name, MAX(height), MIN(height) 
FROM usertbl
GROUP BY name;

-- 서브쿼리로 조합하는 것에 제일 수월하다. 
SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) from usertbl) 
	OR height = (SELECT MIN(height) FROM usertbl);


-- 시나리오6. 휴대폰이 있는 사용자 수를 카운터하자. 
SELECT count(*) FROM usertbl; -- 전체 회원 수 

SELECT count(mobile1) AS '휴대폰이 있는 사용자' FROM usertbl;




-- !! Having 절 
-- 앞에 했던부분 확인 
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
GROUP BY userID;

-- 시나리오 1. 천원 이상 구매한 회원에게 사은품을 증정하고 싶다

-- 실행 안되는 쿼리 : GROUP function 과 관련된 조건식을 똑같이 사용하되 Having 절에 사용해야 한다. 
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
WHERE SUM(price * amount) > 1000 
GROUP BY userID; 


-- 정답 쿼리 
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
GROUP BY userID
HAVING  SUM(price * amount) > 1000; 

-- 필요하다면 order by 추가 가능하다. 
SELECT userID AS '사용자', SUM(price * amount) AS '총구매액'
FROM buytbl
GROUP BY userID
HAVING  SUM(price * amount) > 1000
ORDER BY SUM(price * amount) ASC;


-- ROLLUP 
-- 총합 또는 중간 합계가 필요하다면 GROUP BY절과 함께 WITH ROLLUP문을 사용하면 된다. 
SELECT num, groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName, num 
WITH ROLLUP;


SELECT groupName, SUM(price * amount) AS '비용'
FROM buytbl
GROUP BY groupName
WITH ROLLUP;

/*
SELECT
FROM 
WHERE 
GROUP BY 
HAVING
ORDER BY 

SQL(Structured Query Language) 분류 (면접용대비) 

DML - Data Manipulation Language (데이터 조작 언어)
      데이터를 조작(선택, 삽입, 수정, 삭제)하는 데 사용되는 언어이다. 
      
DDL - Data Definition Language (데어터 정의 언어) 
      데이터베시으, 테이블, 뷰, 인덱스 등의 데이터베이스 개체를 생성/삭제/변경 
    
    CREATE - 새로운 데이터베이스 관계 (테이블) View, 인덱스 , 저장 프로시저 만들기.
	DROP - 이미 존재하는 데이터베이스 관계 ( 테이블 ) , 뷰 , 인덱스 , 저장 프로시저를 삭제한다.
    ALTER - 이미 존재하는 데이터베이스 개체에 대한 변경 , RENAME의 역할을 한다.
    TRUNCATE - 관계 ( 테이블 )에서 데이터를 제거한다. ( 한번 삭제시 돌이킬 수 없음.)

DCL - Data Control Language (데이터 제어 언어) 
  
	GRANT - 특정 데이터베이스 사용자에게 특정 작업에 대한 수행 권한을 부여한다.
    REVOKE - 특정 데이터베이스 사용자에게 특정 작업에 대한 수행 권한을 박탈 or 회수 한다.

*/























