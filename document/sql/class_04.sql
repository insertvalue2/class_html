-- 스토어드 프로시저 
-- stored procedure란 MySql에서 제공해주는 프로그래밍 기능을 말합니다. 
-- 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합이다.

select * from membertbl where memberName = '당탕이';
select * from producttbl where productName = '냉장고';

-- 스토어드 프로시저 생성 방법 
-- DELIMITER \\
-- CREATE PROCEDURE 스토어드프로시저명(IN|OUT 파라미터)
-- BEGIN
-- 	-- SQL 프로그래밍 코딩 부분..
-- END \\
-- DELIMITER ;

-- CALL 스토어드프로시저명();로 호출



DELIMITER // 
create procedure myProc()
begin
	select * from membertbl where memberName = '당탕이';
    select * from producttbl where productName = '냉장고';
END	// 
DELIMITER ; 

call myProc();
