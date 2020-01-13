--scott 계정 테이블 정보 보기
select *
from user_tables;

--특정 테이블의 구조(이름 = 컬럼, 유형 = 데이터 종류)
--데이터종류에서 (4,2)이면 4가 정수라는 뜻이고 2가 실수
--VARCHAR2(10)은 10byte
desc emp;

--데이터 조회1
--select는 컬럼명
select empno, ename, sal
from emp;

--데이터 조회2 *은 모든 컬럼(열)
--레코드(행)
select *
from emp;

--데이터 조회3 컬럼과 연산(수정되는게 아니고 보이는 것만)
select empno, ename, sal, sal * 12
from emp;

--데이터 조회4 별칭
select empno as "사원번호", ename as "이름", sal as "월급", sal * 12 as "연봉"
from emp;

--데이터 조회5 null과 연산하면 null
select empno, ename, sal, (sal + nvl(comm, 0)) * 12
from emp;
--null을 변경 : nvl(컬럼, 값)

--데이터 조회6 컬럼 연결
select empno || ename
from emp;

--데이터 조회7 컬럼과 값(리터럴)
select empno || '입니다'
from emp;

select '사원번호:' || empno || ' 이름:' || ename as "사원번호/이름"
from emp;

--데이터 조회8 중복제거
select distinct job
from emp;

--조건 지정하여 원하는 레코드만 추출
select * 
from emp
where job = 'SALESMAN';
--sql에서는 =이 같다
select * 
from emp
where sal > 2000;

--논리 연산자: and, or, not
select * 
from emp
where sal > 2000 and sal < 3000;

--범위: between A and B [A,B] -> 숫자, 문자, 날짜
select * 
from emp
where hiredate between '80/01/01' and '81/01/01';

--여러값 검색
select * 
from emp
where sal in(800, 3000, 1500);

select * 
from emp
where ename in('SMITH', 'TURNER', 'FORD');

--비슷한 값 -> LIKE : %, _중 하나와 같이 사용
--% -> 없거나 여러개 _ -> 반드시 하나
select *
from emp
where ename like '%K%';

select *
from emp
where ename like '____K';

--널값 찾기 is null
select *
from emp
where comm is null;

--정렬 desc은 내림차순, asc가 오름차순
select *
from emp
--where
order by sal desc, empno asc;

--order by 별칭, order by 숫자(컬럼 순서)
select empno as 사원번호, sal as 월급
from emp
order by sal desc;

select empno as 사원번호, sal as 월급
from emp
order by 월급 desc;

select empno as 사원번호, sal as 월급
from emp
order by 2 desc, 1 desc;

--함수 종류
--  단일행 -> 레코드 1개
--      문자, 숫자, 날짜, 변환, 조건
--  다중행(그룹함수) -> 레코드 여러개
--      최댓값, 최솟값, 합계, 평균, 레코드 개수

--단일함수
--문자함수
--첫글자만 대문자로
select ename, initcap(ename)
from emp;
--소문자로
select ename, lower(ename)
from emp;
--대문자로
select ename, upper('hello')
from emp;
--연결함수
select ename, sal, concat(ename, sal)
from emp;
--문자 끼워넣기
select ename, lpad(ename, 10, '*'), rpad(ename, 10, '*')
from emp;
--부분열
select job, substr(job, 0, 3)
from emp;
--문자열 길이
select ename, length(ename)
from emp;
--변경
select ename, replace(ename, 'S', 'Z')
from emp;
--공백 및 특정문자 제거 ltrim(), rtrim(), trim()
select trim('    ad sa ')
from dual;
--dual -> 가상의 테이블
select ltrim('aaabaaa', 'a'), rtrim('aasaasdasdaa aaaa', 'a'), trim('a' from 'aaaaasaffaaaa')
from dual;
--trim(leading/traling/both 문자A from 문자B) -> 앞/ 뒤/ 양쪽에서 문자B의 문자A를 지운다.

--숫자함수
--나머지
select mod(10,3)
from dual;
--반올림, 버림
select round(4.667), round(4.667, 2), trunc(4.667, 2)
from dual;
--양수, 음수, 0 판단
select sign(-1), sign(0), sign(100)
from dual;
--절댓값
select abs(-13), abs(100)
from dual;

--날짜 함수 -> 날짜 연산이 가능
--현재 날짜 -> sysdate(오라클에서만 사용)
select sysdate, sysdate + 1, sysdate - 1
from dual;
--날짜 포맷 바꾸기
alter session set NLS_DATE_FORMAT='YYYY/MM/DD';
--월 추가
select sysdate, add_months(sysdate, 2), add_months(sysdate, -2)
from dual;
--날짜 사이 월 차이 계산
select months_between(sysdate, hiredate), round(months_between(sysdate, hiredate))
from emp;
--날짜 반올림, 버림(연도, 월)
select hiredate, round(hiredate, 'YEAR'), round(hiredate, 'MONTH'), trunc(hiredate, 'year'), trunc(hiredate, 'month')
from emp;

--변환함수
--  묵시적 변환(자동)
select *
from emp
where sal = '800';

select *
from emp
where hiredate = '1980/12/17';
--  명시적 변환(캐스팅) : 함수 이용
select *
from emp
where sal = to_number('800');

select *
from emp
where hiredate = to_date('1980/12/17');

select to_char(987654321)
from dual;

--자릿수만큼만 주면 됨
select to_char(987654321, '999,999,999')
from dual;
--화폐 단위 사용 가능, L쓰면 컴퓨터 국가 화폐 나옴
select to_char(987654321, 'L999,999,999')
from dual;

select to_char(sysdate, 'YY/mm/DD(Day,dy) AMhh24:MI:ss ')
from dual;

--조건함수 decode(오라클에서만, =만 가능), case(ANSI)
--if~elif : case 컬럼 when 값 then 표현식
--                   when 값 then 표현식
--                   when 값 then 표현식
--                   else 표현식
--          end
--동등연산자(=)
select empno, ename, sal,
case job when 'CLERK' then sal*0.1
         when 'SALESMAN' then sal*0.2
         when 'PRESIDENT' then sal*0.3
         when 'MANAGER' then sal*0.4
         when 'ANALYST' then sal*0.5
         else sal
end as "TEX"
from emp;
--부등연산자
select empno, ename, sal,
case when sal >= 4000 then 'Best'
     when sal >= 3000 then 'Good'
     else 'Normal'
end as "SAL_char"
from emp;

--그룹함수
-- sum, avg, max, min, count
select sum(sal), round(avg(sal), 2) as "AVG(SAL)", max(sal), min(sal), count(sal), count(distinct sal), count(*)
from emp;

select deptno, sum(sal)
from emp
--where
group by deptno;

--select - 5
--from - 1
--where 조건식 - 2
--group by - 3
--having 조건식 - 4 -> 그룹을 필터링
--order by - 6
--옵티마이저 -> sql 실행

select deptno, sum(sal)
from emp
group by deptno
having deptno = 10;

--실습: 부서별 인원수가 6명 이상인 부서코드 검색
--실습: 사원테이블에서 입사월이 12월인 사원만 출력

select *
from emp;

select deptno
from emp
group by deptno
having count(deptno)>=6;

--select *
--from emp
--where hiredate like '____/12/__';

select *
from emp
where to_char(hiredate, 'MM') = '12';