-- 인덱스 개념 

-- create table indextbl 
-- (first_name varchar(14), last_name varchar(16), hire_date date); 

-- SELECT * FROM employees.employees;

-- insert into indexTbl 
-- select first_name, last_name, hire_date
-- from employees.employees
-- limit 500; 

-- 아직 색인이 없다 (1 ~ 500 페이지 까지 다 뒤져서 찾는다)  
select * from indextbl where first_name = 'Mary';

-- 인덱스 생성 방법 
 -- CREATE INDEX <인덱스명> ON <테이블명> ( 칼럼명1, 칼럼명2, ... );
create index idx_indextbl_firstname on indextbl(first_name);


select * from indextbl where first_name = 'Mary';