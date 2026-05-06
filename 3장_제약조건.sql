# 실습 3-1 기본키 실습

use studydb;
CREATE TABLE user2 (
	userid VARCHAR(10) PRIMARY KEY, -- 첫번째 컬럼은 무조건 PK (중복방지)
    name VARCHAR(10),
    birth CHAR(10),
    addr VARCHAR(50)
);

INSERT INTO user2 VALUES ('A101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO user2 VALUES ('A102', '김춘추', '1972-11-23', '경남 경주시');
INSERT INTO user2 VALUES ('A103', '장보고', '1978-03-01', '전남 완도군');
INSERT INTO user2 VALUES ('A104', '강감찬', '1979-08-16', '서울시 관악구');
INSERT INTO user2 VALUES ('A105', '이순신', '1981-05-23', '부산시 진구');
SELECT * FROM user2;


# 실습 3-3 고유키 실습
CREATE TABLE user3(
	userid VARCHAR(10) PRIMARY KEY, 
    name VARCHAR(10),
    birth CHAR(10),
    hp CHAR(13) UNIQUE, -- 고유키, 중복방지, NULL 값 허용
    addr VARCHAR(50)
);

# 실습 3-4 User3 데이터 추가하기
INSERT INTO user3 VALUES ('A101', '김유신', '1968-05-09', '010-1234-1001', '경남 김해시');
INSERT INTO user3 VALUES ('A102', '김춘추', '1972-11-23', '010-1234-1002','경남 경주시');
INSERT INTO user3 VALUES ('A103', '장보고', '1978-03-01', '010-1234-1003','전남 완도군');
INSERT INTO user3 VALUES ('A104', '강감찬', '1979-08-16', '010-1234-1004','서울시 관악구');
INSERT INTO user3 VALUES ('A105', '이순신', '1981-05-23', '010-1234-1005','부산시 진구');
INSERT INTO user3 VALUES ('A106', '정약용', '1981-05-22', NULL,'부산시 진구');
INSERT INTO user3(userid, name, birth, addr) VALUES ('A107', '을지문덕', '1980-01-22', '부산시 금정구');
INSERT INTO user3(userid, birth, addr, name) VALUES ('A108', '1980-03-22', '부산시 동래구', '송상현');
INSERT INTO user3 SET 
					userid ='B101', 
                    name='홍길동',  
                    birth='1992-05-09', 
                    addr='부산 연제구';
SELECT * FROM user3;


# 실습 3-5 외래키 실습하기 
CREATE TABLE Parent (
	pid VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10),
    birth CHAR(10), -- 1990-01-23 (총 10자리 고정문자열)
    addr VARCHAR(100)
);
drop table parent;
drop table child;

CREATE TABLE child (
	cid VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10),
    hp CHAR(13) UNIQUE,
    parent VARCHAR(10),
    FOREIGN KEY (parent) REFERENCES Parent (pid) -- child 테이블의 parent 컬럼이 Parent 테이블의 pid를 참조(연결)
);

INSERT INTO parent VALUES ('P101', '김유신', '1968-05-09', '경남 김해시');
INSERT INTO parent VALUES ('P102', '김춘추', '1972-11-23', '경남 경주시');
INSERT INTO parent VALUES ('P103', '장보고', '1978-03-01', '전남 완도시');
INSERT INTO parent VALUES ('P104', '강감찬', '1979-08-16', '서울시 관악구');
INSERT INTO parent VALUES ('P105', '이순신', '1981-05-23', '부산시 진구');

INSERT INTO child VALUES ('C101', '김철수', '010-1234-1001', 'P101');
INSERT INTO child VALUES ('C102', '김영희', '010-1234-1002', 'P102');
INSERT INTO child VALUES ('C103', '강철수', '010-1234-1003', 'P103');
INSERT INTO child VALUES ('C104', '이철수', '010-1234-1004', 'P105');
INSERT INTO child VALUES ('C105', '이수영', '010-1234-1005', 'P100'); -- 부모키값 P100이 존재하지 않기 때문에 INSERT 안 됨
INSERT INTO child VALUES ('C106', '최영', '010-1234-1006', NULL); 
SELECT * FROM parent;

# 실습 3-7 DEFAULT와 NOT NULL 실습
CREATE TABLE user4 (
	userid VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10) NOT NULL,
    gender CHAR(1),
    age INT DEFAULT 1,
    hp CHAR(13) UNIQUE,
    addr VARCHAR(20) 
);

INSERT INTO user4 VALUES ('A101', '김유신', 'M', 25, '010-1234-1111', '경남 김해시');
INSERT INTO user4 VALUES ('A102', '김춘추', 'M', 23, '010-1234-2222', '경남 경주시');
INSERT INTO user4 VALUES ('A103', '장보고', 'M', 35, '010-1234-3333', '전남 완도시');
INSERT INTO user4 VALUES ('A104', '강감찬', 'M', 42, '010-1234-4444', '서울시 관악구');
# INSERT INTO user4 VALUES ('A105', NULL, 'M',  NULL, '010-1234-5555', '부산시 진구'); -- name 컬럼은 not null로 설정해서 insert 안 됨
INSERT INTO user4 VALUES ('A105', '이순신', 'M',  NULL, '010-1234-5555', '부산시 진구'); 
INSERT INTO user4 VALUES ('A106', '신사임당', 'F', 32, NULL, '강릉시');
INSERT INTO user4 VALUES ('A107', '허난설헌', 'F', 27, NULL, '경기도 광주시');
INSERT INTO user4(userid, name) VALUES ('A108', '홍길동');
SELECT * FROM user4;


# 실습 3-9 CHECK와 AUTO_INCREMENT 실습
CREATE TABLE user5 (
	seq INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    age INT DEFAULT 1 CHECK (age > 0 AND age < 100), -- CHECK는 프론트쪽에서 체크되기 때문에 데이터에서 check를 굳이 할 필요없어서 잘 안 씀
    addr VARCHAR(20)
);

INSERT INTO user5 (name, gender, age, addr) VALUES ('김유신', 'M', 25, '경남 김해시');
INSERT INTO user5 (name, gender, age, addr) VALUES ('김춘추', 'M', 23, '경남 경주시');
INSERT INTO user5 (name, gender, age, addr) VALUES ('장보고', 'M', 35, '전남 완도시');
INSERT INTO user5 (name, gender, age, addr) VALUES ('강감찬', 'M', 42, '서울시 관악구');
# INSERT INTO user5 (name, gender, age, addr) VALUES ('이순신', 'A', 51, '부산시'); -- check 제약조건과 일치하지 않아서 insert 안 됨
INSERT INTO user5 (name, gender, age, addr) VALUES ('이순신', 'M', 51, '부산시'); 
#INSERT INTO user5 (name, gender, age, addr) VALUES ('신사임당', 'F', -1, '강릉시'); -- check 제약조건과 일치하지 않아서 insert 안 됨
INSERT INTO user5 (name, gender, age, addr) VALUES ('신사임당', 'F', 21, '강릉시'); 

SELECT * FROM user5;
