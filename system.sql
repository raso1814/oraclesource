--���ο� ����� ����
create user c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

-- ���ο� ����ڿ��� ���� �ο�
grant connect, RESOURCE, dba to c##scott;

-- 사용자 관리
-- SCOTT, HR 오라클 데이터베이스가 기본 계정으로 제공

-- 오라클 데이터베이스 특징
--테이블, 인덱스, 뷰... 여러가지 객체가 사용자별로 생성되고 관리

--데이터베이스 스키마
--데이터 간 관계, 데이터 구조, 제약조건 등 데이터를 저장 및 관리하기 위해 정의한
--데이터베이스 구조의 범위
--사용자==스키마

--사용자 생성
CREATE USER C##TEST IDENTIFIED BY 12345;
--사용자 비밀번호 변경 
ALTER USER C##TEST IDENTIFIED BY 54321;

--사용자 삭제
DROP USER C##TEST;

--데이터베이스 접속 권한 부여
GRANT CREATE SESSION TO C##TEST;
GRANT CREATE TABLE TO C##TEST;

--권한 관리 

-- 시스템 권한 : 사용자 생성, 정보수정, 삭제 

CREATE USER C##TEST2 IDENTIFIED BY 12345;
GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO C##TEST2;

DROP USER C##TEST CASCADE;

DROP USER C##TEST2 CASCADE;

CREATE USER C##TEST2 IDENTIFIED BY 12345
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT RESOURCE, CREATE SESSION, CREATE TABLE TO C##TEST2;
--RESOURCE : TRIGGER, SEQUENCE, TABLE.. 생성권한들이 모여있는 롤


--C##TEST에게 USERS 테이블 공간 2M 할당
ALTER USER C##TEST2 QUOTA 2M ON USERS;

DROP USER C##TEST2 CASCADE;

create user c##java identified by 12345;
ALTER USER C##java QUOTA 30M ON USERS;
GRANT RESOURCE, connect TO c##java; 