-- 데이터 베이스 백업과 복원 
-- 다른 매체에 보관 : 데이터 베이스에 문제가 생겼을 때 원상태로 돌려놓는 작업 
-- DBA가 해야 하는 가장 중요한 작업중 하나가 백업과 복원이다. 


use shopDB;  -- 더블 클릭한 효과

SELECT * FROM productTBL; -- 블록 설정 후 ctrl + enter (실행 단축키) 

-- 시나리오 1 (사고치기) 
DELETE FROM producttbl; -- 테이블 삭제  

-- 시나리오 2 (다른 데이터 베이스 선택) 
use sys; -- 시스템 데이터 


-- 시나리오 3 ( 복원하기 ) 
-- Administration 탭 선택 --> Data import/Restore 선택 

-- https://sso-feeling.tistory.com/105 




