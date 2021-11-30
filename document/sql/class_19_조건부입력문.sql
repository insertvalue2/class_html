USE sqldb;

-- 문제 1
-- memberTBL 테이블 생성과 동시에 usertbl 테이블에서 3건만 데이터 입력 
CREATE TABLE memberTBL (SELECT userID, name, addr FROM usertbl LIMIT 3); -- 3건만 가져옴

-- PK 생성 방법 
ALTER TABLE memberTBL 
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID); -- PK를 지정함
    
SELECT * FROM memberTBL;


-- 3건 입력 
INSERT INTO memberTBL VALUES('BBK' , '비비코', '미국'); -- 오류
INSERT INTO memberTBL VALUES('SJH' , '서장훈', '서울'); -- 실행 안됨
INSERT INTO memberTBL VALUES('HJY' , '현주엽', '경기'); -- 실행 안됨 

SELECT * FROM memberTBL;

-- IGNORE : 무시하고 진행해라 
INSERT IGNORE INTO memberTBL VALUES('BBK' , '비비코', '미국');
INSERT IGNORE INTO memberTBL VALUES('SJH' , '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES('HJY' , '현주엽', '경기');

SELECT * FROM memberTBL;


-- ON DUPLICATE KEY UPDATE : 중복이 되면 데이터를 업데이트 해라 
INSERT INTO memberTBL VALUES('BBK' , '비비코', '미국')
	ON DUPLICATE KEY UPDATE name='비비코', addr='미국';
INSERT INTO memberTBL VALUES('DJM' , '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE name='동짜몽', addr='일본';

SELECT * FROM memberTBL;





