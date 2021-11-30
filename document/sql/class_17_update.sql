/*
	UPDATA : 데이터 수정 
    기존에 입력되어 있는 값을 변경하기 위해서는 UPDATE문을 사용한다. 
		
	UPDATE 테이블 이름 
		SET 열1 = 값1, 열2 = 값2, ...
        WHERE 조건 ; 
        
    !) 대부분의 UPDATE 구문에 WHERE 절이 추가 되어야 한다. 
       아니면 전체 데이터가 변경이 된다. 
*/

SELECT * FROM testTbl4; 

UPDATE testTbl4 
SET Lname  = '없음'
WHERE fname = 'anneke';

-- 시나리오 1 
-- 가끔 WHERE 절을 생략할 경우도 있다. 
-- buytbl 에서 price 단가가 모두 1.5 배 인상되었다면 

SELECT * FROM buytbl;

UPDATE buytbl SET price = price * 1.5; 

SELECT * FROM buytbl;

