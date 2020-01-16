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

--join: 원하는 데이터가 여러 테이블에 분산되어 있는 경우에 테이블간의 특정 컬럼(공유컬럼)을 이용하여 데이터를 조회하는 방법
--종류1: inner 조인 - 조건에 일치하는 레코드만 출력, outer 조인 - 조건이 일치하지 않아도 출력
--종류2: 오라클 조인, ANSI 조인
--제약조건(constraints) -> 테이블에 저장되는 데이터가 결점이 없게 해야 함(무결성 -> 하나의 결점만 있더라도 나머지 데이터를 모두 믿을 수 없기 때문)
-- -> 컬럼에 제약 조건을 걸어서 데이터 조건부 저장
-- => 1. 기본키 제약조건(primary key): 레코드 식별용, 중복불가, 반드시 값 존재(unique + not null)
--    2. not null 제약조건(not null): 기본적으로 컬럼에는 null 값이 저장되는데 not null로 반드시 값을 가지게 설정
--    3. unique 제약조건(unique): 유일한 값을 갖게 설정, 중복불가, null도 됨
--    4. check 제약조건(check): 특정값만 저장하도록 지정 ex)성별 -> gender in ('남', '여')
--    5. 외래키(참조키) 제약조건(foreign key): 하나의 테이블을 여러 테이블로 나눠 저장할 때 나누어진 테이블의 관계 설정(마스터 테이블이 가진 값만)
--             (emp테이블(차일드 테이블) -deptno(외래키)-> dept테이블(마스터 테이블, 받는 컬럼(deptno, 이름이 달라도 됨)은 기본키 또는 유니크))
--              => 조인

select *
from user_constraints;
-- p -> 기본키, r(reference) -> 참조키

--1. 오라클 조인: equi 조인 -> = 사용
select *
from emp, dept
where emp.deptno = dept.deptno;

select empno, dept.deptno, ename, dname, loc
from emp, dept
where emp.deptno = dept.deptno;

select *
from emp, dept
where emp.deptno = dept.deptno and emp.sal > 3000;
-- 조인 조건 and 검색 조건 -> 필터링 가능

--2. 오라클 조인: non equi 조인 -> 범위
select *
from emp, salgrade
where sal between losal and hisal;

--3. 오라클 조인: 조건없이 조인(카티션 곱) -> emp데이터 12 * dept데이터 4 = 48 쓰레기 데이터
--         -> 테이블이 n개이면 n-1의 조인을 해줘야 카티션 곱을 방지
select *
from emp, dept;

--4. 오라클 조인: outer 조인 -> (+)로 누락된 데이터를 가진 가상의 레코드를 만들어 조인

select *
from emp, dept
where emp.deptno(+) = dept.deptno;

--1. ANSI 조인
select *
from emp join dept using(deptno);

select *
from emp join dept
on emp.deptno = dept.deptno
where sal > 3000;

select *
from emp join salgrade
on sal between losal and hisal;

--2. ANSI 조인: outer 조인 -> A left, right, full outer join B
insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
values(9999,'홍길동','CLERK', 7839, sysdate, 600, null, null);
commit;

select *
from emp left outer join dept using(deptno);

select *
from emp right outer join dept using(deptno);

select *
from emp full outer join dept using(deptno);

--바인드 변수 :xxx -> 값을 바꿔서 넣을 수 있다
select *
from dept
where deptno = :xxx;

--데이터 저장
--insert into 테이블명(컬럼명, 컬럼명)
--values (값, 값)
insert into dept (deptno, dname, loc)
values (50, '개발', '제주');
commit;

--업데이트
--update 테이블명
--set 컬럼명=값, 컬럼명=값
--where 조건식;  -> 확정할려면 commit, 다시 되돌리려면 roolback
update dept
set dname = 'DEVELOPER', loc = 'JEJU'
where deptno = 50;
commit;

update dept
set dname = 'DEVELOPER', loc = 'JEJU';

rollback;

--삭제
--delete from 테이블명 where 조건식;
delete from dept
where deptno = 3;
commit;

select *
from dept;