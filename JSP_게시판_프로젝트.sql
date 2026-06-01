# 260601 JSP 게시판 프로젝트 실습

# 데이터베이스 생성
DROP DATABASE IF EXISTS board; -- 기존 board 데이터베이스 제거
CREATE DATABASE board; -- board 데이터베이스 생성
USE board; -- board 데이터베이스 선택

SHOW DATABASES;

# 사용자 생성 및 권한부여
DROP USER IF EXISTS 'board'@'%';
CREATE USER 'board'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON `board`.* TO 'board'@'%';
FLUSH PRIVILEGES;

SELECT User, Host
FROM mysql.user
WHERE User='board';

CREATE TABLE `User` (
	`userid` VARCHAR(20) PRIMARY KEY, -- 아이디
	`pass` VARCHAR(100),  -- 비밀번호
	`name` VARCHAR(20), -- 이름
	`nick` VARCHAR(20) UNIQUE, -- 닉네임
	`email` VARCHAR(40) UNIQUE, -- 이메일
	`hp` CHAR(13) UNIQUE, -- 휴대폰
	`role` VARCHAR(20) DEFAULT 'MEMBER', -- 회원 등급 (ADMIN, MEMBER, GUEST)
	`zip` CHAR(5),
	`addr1` VARCHAR(100), -- 기본주소
	`addr2` VARCHAR(100), -- 상세주소
	`regip` VARCHAR(100), -- 회원 시스템 IP 주소
	`rdate` DATETIME, -- 회원가입일
	`leaveDate` DATETIME -- 회원 탈퇴일
);

CREATE TABLE `Terms` (
	`no` INT AUTO_INCREMENT PRIMARY KEY, -- 약관번호
	`basic` TEXT, -- 기본약관, 약 64KB 크기 용량 (문자열 최대치 VARCHAR(255)보다 더 큰 값)
	`privacy` TEXT -- 개인정보 취급방침 약관, 약 64KB 크기 용량
);

CREATE TABLE `Article` (
	`ano` INT AUTO_INCREMENT PRIMARY KEY,
	`type` VARCHAR(20), -- 카테고리
	`title` VARCHAR(50), -- 제목
	`content` TEXT, -- 내용
	`comment` INT DEFAULT 0, -- 댓글 개수
	`file` TINYINT DEFAULT 0, -- 파일
	`hit` INT DEFAULT 0,
	`writer` VARCHAR(20) NOT NULL, -- 작성자
	`regip` VARCHAR(20) NOT NULL, -- 회원 시스템 IP 주소
	`wdate` DATETIME, -- 작성일
    FOREIGN KEY (`writer`) REFERENCES `User` (`userid`)
);

CREATE TABLE `Comment` (
	`cno` INT AUTO_INCREMENT PRIMARY KEY, -- 댓글번호
	`parent` INT NOT NULL,
	`content` TEXT, -- 댓글 내용
	`writer` VARCHAR(20) NOT NULL, -- 댓글 작성자
	`regip` VARCHAR(100) NOT NULL, -- 회원 시스템 IP 주소
	`wdate` DATETIME, -- 댓글 작성일
     FOREIGN KEY (`parent`) REFERENCES `Article` (`ano`),
     FOREIGN KEY (`writer`) REFERENCES `User` (`userid`)
);

CREATE TABLE `File` (
	`fno` INT AUTO_INCREMENT PRIMARY KEY, -- 파일 번호
	`ano` INT NOT NULL,
	`ofname` VARCHAR(100) NOT NULL, -- 원본 파일명
	`sfname` VARCHAR(100) NOT NULL, -- 새로 저장된 파일명
	`download` INT DEFAULT 0, -- 다운로드 횟수
	`rdate` DATETIME, -- 파일 등록일
    FOREIGN KEY (`ano`) REFERENCES `Article` (`ano`)
);