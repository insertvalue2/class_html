-- 데이터 타입 약 30개 가량 
-- INT UNSIGNED 예약어를 붙여 준다. 
-- 천만명 * 4 바이트 = 4천만 바이트 
-- 천만명 * 2 바이트 = 2천만 바이트 절반이 절약 
-- 데이터 형식을 지정하는 것은 중요 하다. 
-- 열을 지정할때 데이터 형식을 지정하는 것은 중요 하다. 
-- TINYINT 에 UNSIGNED 을 붙이면 0 ~ 255 까지 입력 가능하다. 

-- 형변환 , 문자열 --> 
SELECT CAST('2020-10-19 12:35:29.123' AS DATE) AS 'DATE' ;
SELECT CAST('2020-10-19 12:35:29.123' AS TIME) AS 'TIME' ;
SELECT CAST('2020-10-19 12:35:29.123' AS DATETIME) AS 'DATETIME' ; 

-- 소설책을 저장하고 싶다 
-- LONGTEXT ( 소설책 ) 4G
-- LONGBLOB (영화, 동영사) 4G 


USE sqldb;
-- 변수 사용 가능 
SET @myVar1 = 5 ;
SET @myVar2 = 3 ;
SET @myVar3 = 4.25 ;
SET @myVar4 = '가수 이름==> ' ;
-- 스토어 프로시저나, 함수에서 사용하게 된다. 

SELECT @myVar1 ;
SELECT @myVar2 + @myVar3 ;

SELECT @myVar4 AS '', Name FROM usertbl WHERE height > 180 ;

-- 변수를 실행할 때는 한꺼번에 실행 해야 된다. 


SET @myVar1 = 3 ;
PREPARE myQuery 
    FROM 'SELECT Name, height FROM usertbl ORDER BY height LIMIT ?';
EXECUTE myQuery USING @myVar1 ;


-- 형 변환 

USE sqldb ;
SELECT AVG(amount) AS '평균 구매 개수' FROM buytbl ;

SELECT CAST(AVG(amount) AS SIGNED INTEGER) AS '평균 구매 개수'  FROM buytbl ;
-- 또는
SELECT CONVERT(AVG(amount) , SIGNED INTEGER) AS '평균 구매 개수'  FROM buytbl ;

-- ... 생략 
SELECT CAST('2020$12$12' AS DATE);
SELECT CAST('2020/12/12' AS DATE);
SELECT CAST('2020%12%12' AS DATE);
SELECT CAST('2020@12@12' AS DATE);


-- ... 생략 
SELECT num, CONCAT(CAST(price AS CHAR(10)), 'X', CAST(amount AS CHAR(4)) ,'=' )  AS '단가X수량',
	price*amount AS '구매액' 
  FROM buytbl ;
  

-- 암시적 형변환 
SELECT '100' + '200' ; -- 문자와 문자를 더함 (정수로 변환되서 연산됨)
SELECT CONCAT('100', '200'); -- 문자와 문자를 연결 (문자로 처리)
SELECT CONCAT(100, '200'); -- 정수와 문자를 연결 (정수가 문자로 변환되서 처리)
SELECT 1 > '2mega'; -- 정수인 2로 변환되어서 비교
SELECT 3 > '2MEGA'; -- 정수인 2로 변환되어서 비교
SELECT 0 = 'mega2'; -- 문자는 0으로 변환됨



-- MYSQL 내장 함수 
SELECT IF (100>200, '참이다', '거짓이다') AS '결과';
-- 생략 ... 
SELECT IFNULL(NULL, '널이군요'), IFNULL(100, '널이군요');
-- 생략 ... 
SELECT NULLIF(100,100), IFNULL(200,100);

SELECT 	CASE 10
		WHEN 1  THEN  '일'
		WHEN 5  THEN  '오'
		WHEN 10 THEN  '십' 
		ELSE '모름'
	END AS 'CASE연습';


SELECT LTRIM('   이것이'), RTRIM('이것이   ');
SELECT TRIM('   이것이   '), TRIM(BOTH 'ㅋ' FROM 'ㅋㅋㅋ재밌어요.ㅋㅋㅋ');
SELECT REPEAT('이것이', 3);
SELECT REPLACE ('이것이 MySQL이다', '이것이' , 'This is');
SELECT REVERSE ('MySQL');
SELECT CONCAT('이것이', SPACE(10), 'MySQL이다');
-- 세번째 글자부터 2글자 
SELECT SUBSTRING('대한민국만세', 3, 2);
-- . 을 찾고 2번째 이후 문자는 버림 
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', 2);
-- 뒤에서 부터 . 을 찾고 2번째 앞쪽 문자열을 버림 
SELECT SUBSTRING_INDEX('cafe.naver.com', '.', -2);

SELECT ABS(-100);

SELECT SLEEP(5);
SELECT '5초후에 이게 보여요';


-- 날짜 및 시간 

SELECT ADDDATE('2025-01-01', INTERVAL 31 DAY), ADDDATE('2025-01-01', INTERVAL 1 MONTH);
SELECT SUBDATE('2025-01-01', INTERVAL 31 DAY), SUBDATE('2025-01-01', INTERVAL 1 MONTH);

SELECT ADDTIME('2025-01-01 23:59:59', '1:1:1'), ADDTIME('15:00:00', '2:10:10');
SELECT SUBTIME('2025-01-01 23:59:59', '1:1:1'), SUBTIME('15:00:00', '2:10:10');

SELECT YEAR(CURDATE());
SELECT MONTH(CURDATE());
-- 생략 
-- SELECT DAYOFMONTH(CURDATE());

SELECT HOUR(CURTIME()), MINUTE(CURRENT_TIME()), SECOND(CURRENT_TIME), MICROSECOND(CURRENT_TIME);

SELECT DATE(NOW()), TIME(NOW());

SELECT DATEDIFF('2025-01-01', NOW()), TIMEDIFF('23:23:59', '12:11:10');

SELECT DAYOFWEEK(CURDATE()), MONTHNAME(CURDATE()), DAYOFYEAR(CURDATE());

SELECT LAST_DAY('2025-02-01');

-- 년도에서 지난 날짜를 반환 
SELECT MAKEDATE(2025, 32);
-- 시 분 초 의 타임 형식을 만들어 준다. 
SELECT MAKETIME(12, 11, 10);


-- 이 날짜에서 11개월이 지난 날 ,       이 두 날짜가 몇 개월 차이가 나는지 
SELECT PERIOD_ADD(202501, 11), PERIOD_DIFF(202501, 202312);


SELECT * FROM usertbl;
-- 앞에 조회된 행의 개수를 구한다 
SELECT FOUND_ROWS();

USE sqldb;
-- UPDATE buytbl SET price=price*2;
-- SELECT ROW_COUNT();



