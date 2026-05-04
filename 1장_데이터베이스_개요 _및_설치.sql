-- 날짜 : 2026/05/04
-- 이름 : 최수빈
-- 내용 : 1장 데이터베이스 개요 및 설치

# MySQL 접속 (콘솔환경 cmd)
#> mysql -u root -p
#> -u: user, 사용자 계정
#> -p: password, 비밀번호

# 데이터베이스 생성
CREATE DATABASE mydb;
# 데이터베이스 제거
DROP DATABASE mydb; -- 실행 단축키 : Ctrl + Enter

# 데이터베이스 목록 조회
SHOW DATABASES;

# 작업 데이터베이스 선택
USE mydb;
USE studydb;

-----------
# 일반 관리자 생성
CREATE USER 'admin'@'%' IDENTIFIED BY '1234'; -- admin 계정 생성, %는 외부접속 IP를 의미
GRANT ALL PRIVILEGES ON MYDB. * TO 'admin'@'%'; -- admin에게 mydb의 모든 권한 (읽기/쓰기/수정/식제) 부여
FLUSH PRIVILEGES; -- admin 계정권한 반영

# 계정 삭제
DROP USER 'admin'@'%'; -- %는 외부접속 IP를 의미

 