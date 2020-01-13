--1. 테이블에서 원하는 컬럼 보기
--  -> query문, select문
--  select 컬럼1, 컬럼2,... from 테이블;

--1. 어떤 테이블이 있는지?
select *
from tab; --뷰까지 보여줌

select *
from user_tables;

--2. 테이블의 컬럼 구조
--describe
desc employees

--접속 계정 보기
show user; 

select employee_id, first_name, salary
from employees;

select *
from employees;

