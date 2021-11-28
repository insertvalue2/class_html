-- 툴을 이용한 쿼리문 자동 생성 연습 

-- 자동 생성 
CREATE TABLE `membertbl` (
  `memberID` char(8) NOT NULL,
  `memberName` char(5) NOT NULL,
  `memberAddress` char(20) DEFAULT NULL,
  PRIMARY KEY (`memberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 생략 가능 : 한글이 안깨짐
CREATE TABLE `membertbl` (
  `memberID` char(8) NOT NULL,
  `memberName` char(5) NOT NULL,
  `memberAddress` char(20) DEFAULT NULL,
  PRIMARY KEY (`memberID`)
);

-- PRIMARY KEY를 컬럼 옆에도 사용할 수 있다. 
CREATE TABLE `membertbl` (
  `memberID` char(8) NOT NULL PRIMARY KEY,
  `memberName` char(5) NOT NULL,
  `memberAddress` char(20) DEFAULT NULL
);



-- **다른 구문도 확인**

-- : insert
INSERT INTO `shopdb`.`membertbl`
(`memberID`,
`memberName`,
`memberAddress`)
VALUES
('questzz',
'홍길동',
'부산');

-- : select 구문
SELECT `membertbl`.`memberID`,
    `membertbl`.`memberName`,
    `membertbl`.`memberAddress`
FROM `shopdb`.`membertbl`;



-- update 구문 
UPDATE `shopdb`.`membertbl`
SET
`memberID` = 'questzz2',
`memberName` = '야스오',
`memberAddress` = '서울'
WHERE `memberID` = 'questzz';


-- Delete 구문 
DELETE FROM `shopdb`.`membertbl`
WHERE memberID = 'questzz2';


-- View : 핵심은 AS 다음 구문 
CREATE ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `uv_membertbl`
 AS select `membertbl`.`memberID` AS `memberID`,`membertbl`.`memberAddress` AS `memberAddress` from `membertbl`;

-- 뷰 생성 
Create view uv_membertbl 
as 
	select memberID, memberAddress from membertbl; 

-- 뷰 조회 
select * from uv_membertbl;      









