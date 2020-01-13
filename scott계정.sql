--scott ���� ���̺� ���� ����
select *
from user_tables;

--Ư�� ���̺��� ����(�̸� = �÷�, ���� = ������ ����)
--�������������� (4,2)�̸� 4�� ������� ���̰� 2�� �Ǽ�
--VARCHAR2(10)�� 10byte
desc emp;

--������ ��ȸ1
--select�� �÷���
select empno, ename, sal
from emp;

--������ ��ȸ2 *�� ��� �÷�(��)
--���ڵ�(��)
select *
from emp;

--������ ��ȸ3 �÷��� ����(�����Ǵ°� �ƴϰ� ���̴� �͸�)
select empno, ename, sal, sal * 12
from emp;

--������ ��ȸ4 ��Ī
select empno as "�����ȣ", ename as "�̸�", sal as "����", sal * 12 as "����"
from emp;

--������ ��ȸ5 null�� �����ϸ� null
select empno, ename, sal, (sal + nvl(comm, 0)) * 12
from emp;
--null�� ���� : nvl(�÷�, ��)

--������ ��ȸ6 �÷� ����
select empno || ename
from emp;

--������ ��ȸ7 �÷��� ��(���ͷ�)
select empno || '�Դϴ�'
from emp;

select '�����ȣ:' || empno || ' �̸�:' || ename as "�����ȣ/�̸�"
from emp;

--������ ��ȸ8 �ߺ�����
select distinct job
from emp;

--���� �����Ͽ� ���ϴ� ���ڵ常 ����
select * 
from emp
where job = 'SALESMAN';
--sql������ =�� ����
select * 
from emp
where sal > 2000;

--�� ������: and, or, not
select * 
from emp
where sal > 2000 and sal < 3000;

--����: between A and B [A,B] -> ����, ����, ��¥
select * 
from emp
where hiredate between '80/01/01' and '81/01/01';

--������ �˻�
select * 
from emp
where sal in(800, 3000, 1500);

select * 
from emp
where ename in('SMITH', 'TURNER', 'FORD');

--����� �� -> LIKE : %, _�� �ϳ��� ���� ���
--% -> ���ų� ������ _ -> �ݵ�� �ϳ�
select *
from emp
where ename like '%K%';

select *
from emp
where ename like '____K';

--�ΰ� ã�� is null
select *
from emp
where comm is null;

--���� desc�� ��������, asc�� ��������
select *
from emp
--where
order by sal desc, empno asc;

--order by ��Ī, order by ����(�÷� ����)
select empno as �����ȣ, sal as ����
from emp
order by sal desc;

select empno as �����ȣ, sal as ����
from emp
order by ���� desc;

select empno as �����ȣ, sal as ����
from emp
order by 2 desc, 1 desc;

--�Լ� ����
--  ������ -> ���ڵ� 1��
--      ����, ����, ��¥, ��ȯ, ����
--  ������(�׷��Լ�) -> ���ڵ� ������
--      �ִ�, �ּڰ�, �հ�, ���, ���ڵ� ����

--�����Լ�
--�����Լ�
--ù���ڸ� �빮�ڷ�
select ename, initcap(ename)
from emp;
--�ҹ��ڷ�
select ename, lower(ename)
from emp;
--�빮�ڷ�
select ename, upper('hello')
from emp;
--�����Լ�
select ename, sal, concat(ename, sal)
from emp;
--���� �����ֱ�
select ename, lpad(ename, 10, '*'), rpad(ename, 10, '*')
from emp;
--�κп�
select job, substr(job, 0, 3)
from emp;
--���ڿ� ����
select ename, length(ename)
from emp;
--����
select ename, replace(ename, 'S', 'Z')
from emp;
--���� �� Ư������ ���� ltrim(), rtrim(), trim()
select trim('    ad sa ')
from dual;
--dual -> ������ ���̺�
select ltrim('aaabaaa', 'a'), rtrim('aasaasdasdaa aaaa', 'a'), trim('a' from 'aaaaasaffaaaa')
from dual;
--trim(leading/traling/both ����A from ����B) -> ��/ ��/ ���ʿ��� ����B�� ����A�� �����.

--�����Լ�
--������
select mod(10,3)
from dual;
--�ݿø�, ����
select round(4.667), round(4.667, 2), trunc(4.667, 2)
from dual;
--���, ����, 0 �Ǵ�
select sign(-1), sign(0), sign(100)
from dual;
--����
select abs(-13), abs(100)
from dual;

--��¥ �Լ� -> ��¥ ������ ����
--���� ��¥ -> sysdate(����Ŭ������ ���)
select sysdate, sysdate + 1, sysdate - 1
from dual;
--��¥ ���� �ٲٱ�
alter session set NLS_DATE_FORMAT='YYYY/MM/DD';
--�� �߰�
select sysdate, add_months(sysdate, 2), add_months(sysdate, -2)
from dual;
--��¥ ���� �� ���� ���
select months_between(sysdate, hiredate), round(months_between(sysdate, hiredate))
from emp;
--��¥ �ݿø�, ����(����, ��)
select hiredate, round(hiredate, 'YEAR'), round(hiredate, 'MONTH'), trunc(hiredate, 'year'), trunc(hiredate, 'month')
from emp;

--��ȯ�Լ�
--  ������ ��ȯ(�ڵ�)
select *
from emp
where sal = '800';

select *
from emp
where hiredate = '1980/12/17';
--  ����� ��ȯ(ĳ����) : �Լ� �̿�
select *
from emp
where sal = to_number('800');

select *
from emp
where hiredate = to_date('1980/12/17');

select to_char(987654321)
from dual;

--�ڸ�����ŭ�� �ָ� ��
select to_char(987654321, '999,999,999')
from dual;
--ȭ�� ���� ��� ����, L���� ��ǻ�� ���� ȭ�� ����
select to_char(987654321, 'L999,999,999')
from dual;

select to_char(sysdate, 'YY/mm/DD(Day,dy) AMhh24:MI:ss ')
from dual;

--�����Լ� decode(����Ŭ������, =�� ����), case(ANSI)
--if~elif : case �÷� when �� then ǥ����
--                   when �� then ǥ����
--                   when �� then ǥ����
--                   else ǥ����
--          end
--�������(=)
select empno, ename, sal,
case job when 'CLERK' then sal*0.1
         when 'SALESMAN' then sal*0.2
         when 'PRESIDENT' then sal*0.3
         when 'MANAGER' then sal*0.4
         when 'ANALYST' then sal*0.5
         else sal
end as "TEX"
from emp;
--�ε����
select empno, ename, sal,
case when sal >= 4000 then 'Best'
     when sal >= 3000 then 'Good'
     else 'Normal'
end as "SAL_char"
from emp;

--�׷��Լ�
-- sum, avg, max, min, count
select sum(sal), round(avg(sal), 2) as "AVG(SAL)", max(sal), min(sal), count(sal), count(distinct sal), count(*)
from emp;

select deptno, sum(sal)
from emp
--where
group by deptno;

--select - 5
--from - 1
--where ���ǽ� - 2
--group by - 3
--having ���ǽ� - 4 -> �׷��� ���͸�
--order by - 6
--��Ƽ������ -> sql ����

select deptno, sum(sal)
from emp
group by deptno
having deptno = 10;

--�ǽ�: �μ��� �ο����� 6�� �̻��� �μ��ڵ� �˻�
--�ǽ�: ������̺��� �Ի���� 12���� ����� ���

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