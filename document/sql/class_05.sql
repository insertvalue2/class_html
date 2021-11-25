/**
	테이블, 인덱스, 뷰, 프로시저 , 트리거 
    
    
    트리거란 테이블에 부착되어서 insert, update, delete 작업이 발생되면 실행되는 코드를 말한다. 
    
    학생 테이블 , --> 자퇴 (행을 삭제) 
    나중에 와서 다녔던 기록좀 뽑아주세요 
    
    자퇴생 테이블을 따로 만들서 자퇴생 테이블에 옮겨 놓으면 된다. 
    
    --> 학생 테이블에서 삭제 동작이 일어 난다면 자동으로 자퇴생 테이블에 데이터를 옮겨 놓게 만든다. 
    '굉장히 편리하다 --> 트리거에 역할' 
    
     
    
*/ 

-- INSERT INTO table_name (column1, column2, column3, ...)
-- VALUES (value1, value2, value3, ...); 

insert into membertbl (memberID, memberName, memberAddress) values ('figure', '연아', '경기도 군포시 당정동'); 

select * from membertbl; 

-- update 구문 
update membertbl set memberAddress = '서울시 강남구 역삼동' where memberName = '연아';

select * from membertbl; 

-- 삭제시 조심 !!!! 
delete from membertbl where memberName = '연아'; 


select * from membertbl; 

-- 탈퇴한 회원에 대해서 관리 하고 싶다면 


-- 테이블 생성 membertbl
create table deletedMembertbl(
	memberID char(8),
    memberName char(5), 
    memberAddress char(20), 
    deletedDate date -- 삭제한 날짜 
);

DELIMITER // 
CREATE trigger tgr_deletedMembertbl -- 트리거 이름 
	AFTER DELETE -- 삭제 후에 작동하게 지정 
    ON membertbl -- 트리거를 부착할 테이블 
    FOR EACH ROW -- 각 행마다 적용시킴 
BEGIN
	-- OLD 테이블의 내용을 백업테이블에 삽입 
    INSERT INTO deletedMemberTBL 
		VALUES(OLD.memberID, OLD.memberNAME, OLD.memberAddress, CURDATE() );
END // 

-- 트리거를 부착하고 (내가 실행하는 것이 아닌 자동으로 실행된다) 


select * from deletedmembertbl;






