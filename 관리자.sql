--HR ������ ��й�ȣ ���� + lock ����
--identified�� ��й�ȣ�̰� �̰� �����ڿ����� �ؾ� ��
alter user hr
identified by hr
account unlock;

--���ο� ���� ����
create user scott
identified by tiger;

--���� �Ҵ�
grant resource, connect
to scott;