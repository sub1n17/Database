show databases;

create database studydb;
use studydb;
CREATE TABLE user1 (
	userid VARCHAR(10),
    name VARCHAR(10),
    hp CHAR(13),
    age INT
);
drop table user1;

show databases;

# 실습 2-2
INSERT INTO user1 values ('A101', '김유신' , '010-1234-1111', 25);
INSERT INTO user1 values ('A102', '김춘추' , '010-1234-2222', 23);
INSERT INTO user1 values ('A103', '장보고' , '010-1234-3333', 32);
INSERT INTO user1(userid, name, age) values ('A104', '강감찬' ,  45);
INSERT INTO user1 SET userid='A105', name='이순신', hp='010-1234-5555';


# 실습 2-3
SELECT * FROM user1;
SELECT * FROM user1 WHERE userid='A101';
SELECT * FROM user1 WHERE name='김춘추';
SELECT * FROM user1 WHERE age < 30;
SELECT * FROM user1 WHERE age >= 30;
SELECT userid, name, age FROM user1;

# 실습 2-4
UPDATE user1 set hp='010-1234-4444' WHERE userid='A104';
UPDATE User1 SET age=51 WHERE userid='A105';
UPDATE User1 SET hp='010-1234-1001', age=27 WHERE userid='A101';

#실습 2-5
DELETE FROM user1 WHERE userid='A101';
DELETE FROM user1 WHERE userid = 'A102' AND age=25;
DELETE FROM user1 WHERE age >= 30;

# 실습 2-6 테이블 컬럼 수정
ALTER TABLE user1 ADD gender TINYINT;
ALTER TABLE user1 ADD birth CHAR(10) AFTER name;
ALTER TABLE uesr1 MODIFY gender CHAR(1);
ALTER TABLE user1 DROP gender;
ALTER TABLE user1 DROP birth;
SELECT * FROM user1;

# 실습 2-7 테이블 복사
CREATE TABLE user1_1 LIKE user1; -- user1 테이블을 가지고 user1_1 테이블 복사, 데이터는 복사 안 됨
INSERT INTO user1_1 SELECT * FROM user1; -- user1 테이블의 데이터를 user1_1로 복사
select * from user1_1;