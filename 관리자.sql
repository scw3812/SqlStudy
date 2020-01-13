--HR 계정의 비밀번호 설정 + lock 해제
--identified가 비밀번호이고 이건 관리자에서만 해야 함
alter user hr
identified by hr
account unlock;

--새로운 계정 생성
create user scott
identified by tiger;

--권한 할당
grant resource, connect
to scott;