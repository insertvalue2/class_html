
-- where 절 
use sqldb;
select * from usertbl where name = '김경호';

-- 관계 연산자 사용 
select * from usertbl;
-- and
select userID, name from usertbl where birthYear >= 1970 and height >= 182;
-- or 
select userID, name from usertbl where birthYear >= 1970 or height >= 182;


-- BETWEEN AND
-- 키가 180 ~ 183인 사림을 조회 
select userID, name from usertbl where height BETWEEN 180 AND 183;
select userID, name from usertbl where height >= 180 AND height  <= 183;


-- IN 
-- 지역이 경남, 전남, 경북인 사람의 정보를 확인 
select name, addr from usertbl where addr ='경남' or addr = '전남' or addr = '경북';
-- 이와 동일하게 연속적인 값이 아닌 이산적인 값을 위해 IN 을 사용할 수 있다. 
SELECT name, addr FROM usertbl WHERE addr IN('경남', '전남', '경북');

-- LIKE (주의점! = 사용시 검색이 안됨) 
SELECT name, height from usertbl where name LIKE '김%';
SELECT name, height from usertbl where name LIKE '_종신';
SELECT name, height from usertbl where name LIKE '_용%';
-- 사용해주셔서..., 조용필...., 이용해 주셔서 감사합니다.., 


-- ANY/ALL 그리고 서브쿼리(SubQuery,하위쿼리) 
-- 서브쿼리란 간단히 얘기하면 쿼리문 안에 또 쿼리문이 들어 있는 것을 애기한다. 
-- ex) 김경호보다 키가 크거나 같은 사람의 이름과 키를 출력하려면 WHERE 조건에 김경호의 키를 직접 
--     입력해야 한다. 

-- 1
SELECT name, height FROM usertbl WHERE name = '김경호';
-- 2
SELECT name, height FROM usertbl WHERE height > 177;
-- 3 
SELECT name, height FROM usertbl 
WHERE height > (SELECT height FROM usertbl WHERE name = '김경호');

-- 서브쿼리 오류 확인 2건이 나오는 상태이기 때문에 어떤값을 조건을 넣어야 할지 모른다. 
-- 문제 (지역인 경남에 사는 사람보다 키가 크거나 같은 사람을 추출해 보자) 
SELECT name, height from usertbl
WHERE height >= (select height from usertbl where addr = '경남');

-- ANY 구문 (둘다 해당되는 경우에 조건들을 출력) - 170도 좋고, 173도 좋다 
SELECT name, height from usertbl
WHERE height >= ANY (select height from usertbl where addr = '경남');

-- ALL 구문 (둘다 만족해야 되는 조건을 추출) --> 173 보다 큰 사람만 검색 
SELECT name, height from usertbl
WHERE height >= ALL (select height from usertbl where addr = '경남');


-- ORDER BY : 결과물에 대한 영향을 미치지는 않지만 결과가 출력되는 순서를 조절하는 구문이다.
-- 가입일이 가장 빠른 순서 (오름차순 정렬)  
SELECT name, mDate from usertbl ORDER BY mDate ASC;

-- 가입일을 내림차순 정령 
SELECT name, mDate from usertbl ORDER BY mDate DESC;

-- 정렬을 두가지 조건으로 
SELECT name, height from usertbl ORDER BY height DESC, name ASC;
-- order by 절은 MySQL 성능을 상당히 떨어뜨릴 소지가 있기 때문에 꼭 필요한 경우가 아니라면 
-- 사용하지 않는 것이 좋다. 


-- DISTINCT 문구 (중복된 것은 하나만 남긴다) 

SELECT addr FROM usertbl;
SELECT addr FROM usertbl ORDER BY addr;
select DISTINCT addr from usertbl;

-- LIMIT 문구 
SELECT name, addr FROM usertbl LIMIT 3;

-- LIMIT 시작, 끝 
SELECT name, addr FROM usertbl ORDER BY name;
SELECT name, addr FROM usertbl ORDER BY name LIMIT 3, 9; -- (0번부터시작)3번째부터 9개 


-- 테이블 복사하는 CREATE TABLE 
CREATE TABLE buytbl2 (SELECT * FROM buytbl);
select * from buytbl2;
-- 특정한 열만 복사해서 만들수도 있다. 
CREATE TABLE buytbl3 (SELECT num, userId, prodName FROM buytbl);
select * from buytbl3;
-- 주의할 점(테이블 복사시에는) primary key 및 foreign key 등 제약 조건은 복사 되지 않는다. 











































 
 














