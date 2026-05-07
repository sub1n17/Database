# 실습 4-1
CREATE TABLE employee (
	empno INT PRIMARY KEY ,
    name VARCHAR(10) NOT NULL,
    gender CHAR(1) NOT NULL, 
    hp CHAR(13) UNIQUE NOT NULL,
    job VARCHAR(10),
    depno INT,
    regdate DATE NOT NULL
);

CREATE TABLE dept (
	depno INT PRIMARY KEY,
    dname VARCHAR(10) NOT NULL,
    tel VARCHAR(12) NOT NULL
);

CREATE TABLE sale (
	no INT PRIMARY KEY AUTO_INCREMENT,
    empno INT NOT NULL,
    year YEAR NOT NULL, 
    month TINYINT NOT NULL,
    price INT DEFAULT 0
);
drop table sale;


# 실습 4-2
INSERT INTO employee VALUES (1001, '김유신', 'M', '010-1234-1001', '부장', 101, '2026-11-19');
INSERT INTO employee VALUES (1002, '김춘추', 'M', '010-1234-1002', '차장', 104, '2026-11-19');
INSERT INTO employee VALUES (1003, '장보고', 'M', '010-1234-1003', '사원', NULL, '2026-11-19');
INSERT INTO employee VALUES (1004, '강감찬', 'M', '010-1234-1004', '대리', 102, '2026-11-19');
INSERT INTO employee VALUES (1005, '신사임당', 'F', '010-1234-1005', '과장', 102, '2026-11-19');
INSERT INTO employee VALUES (1006, '이황', 'M', '010-1234-1006', '차장', 103, '2026-11-19');
INSERT INTO employee VALUES (1007, '이이', 'M', '010-1234-1007', '사원', 105, '2026-11-19');
INSERT INTO employee VALUES (1008, '이순신', 'M', '010-1234-1008', NULL, NULL, '2026-11-19');
INSERT INTO employee VALUES (1009, '허난설헌', 'F', '010-1234-1009', '사원', 104, '2026-11-19');
INSERT INTO employee VALUES (1010, '정약용', 'M', '010-1234-1010', '대리', 104, '2026-11-19');
SELECT * FROM employee;

INSERT INTO dept VALUES (101, '경영지원부', '051-512-1001');
INSERT INTO dept VALUES (102, '영업부', '051-512-1002');
INSERT INTO dept VALUES (103, '개발부', '051-512-1003');
INSERT INTO dept VALUES (104, '인사부', '051-512-1004');
INSERT INTO dept VALUES (105, '기획부', '051-512-1005');
SELECT * FROM dept;

INSERT INTO sale (empno, year, month, price) VALUES (1001, 2018, 1, 98100); 
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2018, 1, 136000);
INSERT INTO sale (empno, year, month, price) VALUES (1003, 2018, 1, 80000);
INSERT INTO sale (empno, year, month, price) VALUES (1004, 2018, 1, 78000);
INSERT INTO sale (empno, year, month, price) VALUES (1005, 2018, 1, 93000);
INSERT INTO sale (empno, year, month, price) VALUES (1001, 2018, 2, 24000);
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2018, 2, 126000);
INSERT INTO sale (empno, year, month, price) VALUES (1003, 2018, 2, 19000);
INSERT INTO sale (empno, year, month, price) VALUES (1005, 2018, 2, 19000);
INSERT INTO sale (empno, year, month, price) VALUES (1006, 2018, 2, 53000); #10
INSERT INTO sale (empno, year, month, price) VALUES (1001, 2019, 1, 24000); 
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2019, 1, 109000); 
INSERT INTO sale (empno, year, month, price) VALUES (1003, 2019, 1, 101000); 
INSERT INTO sale (empno, year, month, price) VALUES (1004, 2019, 1, 53000); 
INSERT INTO sale (empno, year, month, price) VALUES (1007, 2019, 1, 24000); 
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2019, 2, 160000); 
INSERT INTO sale (empno, year, month, price) VALUES (1003, 2019, 2, 101000); 
INSERT INTO sale (empno, year, month, price) VALUES (1004, 2019, 2, 43000); 
INSERT INTO sale (empno, year, month, price) VALUES (1005, 2019, 2, 24000); 
INSERT INTO sale (empno, year, month, price) VALUES (1006, 2019, 2, 109000); #20
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2020, 1, 201000); 
INSERT INTO sale (empno, year, month, price) VALUES (1004, 2020, 1, 63000); 
INSERT INTO sale (empno, year, month, price) VALUES (1005, 2020, 1, 74000); 
INSERT INTO sale (empno, year, month, price) VALUES (1006, 2020, 1, 122000); 
INSERT INTO sale (empno, year, month, price) VALUES (1007, 2020, 1, 111000); 
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2020, 2, 120000); 
INSERT INTO sale (empno, year, month, price) VALUES (1003, 2020, 2, 93000); 
INSERT INTO sale (empno, year, month, price) VALUES (1004, 2020, 2, 84000); 
INSERT INTO sale (empno, year, month, price) VALUES (1005, 2020, 2, 180000); 
INSERT INTO sale (empno, year, month, price) VALUES (1008, 2020, 2, 76000); #30
INSERT INTO sale (empno, year, month, price) VALUES (1001, 2021, 1, 56000); 
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2021, 1, 123000); 
INSERT INTO sale (empno, year, month, price) VALUES (1005, 2021, 1, 91000); 
INSERT INTO sale (empno, year, month, price) VALUES (1007, 2021, 1, 78000); 
INSERT INTO sale (empno, year, month, price) VALUES (1002, 2021, 2, 32000); 
INSERT INTO sale (empno, year, month, price) VALUES (1003, 2021, 2, 148000); 
INSERT INTO sale (empno, year, month, price) VALUES (1004, 2021, 2, 106000); 
INSERT INTO sale (empno, year, month, price) VALUES (1005, 2021, 2, 112000); 
INSERT INTO sale (empno, year, month, price) VALUES (1001, 2021, 3, 47000); 
INSERT INTO sale (empno, year, month, price) VALUES (1006, 2021, 3, 36000); #40
SELECT * FROM sale;

# 실습 4-3
SELECT * FROM Employee WHERE name = '김유신';
SELECT * FROM Employee WHERE job = '차장' AND depno = 101;
SELECT * FROM Employee WHERE job = '차장' OR depno = 101;
SELECT * FROM employee WHERE name != '김춘추';
SELECT * FROM employee WHERE name <> '김춘추'; -- != 연산자와 동일
SELECT * FROM Employee WHERE job = '사원' OR job = '대리';
SELECT * FROM employee WHERE job IN ('사원', '대리'); -- 위의 or 조건절과 동일, job이 사원과 직급에 해당하는 데이터
SELECT * FROM Employee WHERE name LIKE '김%'; -- % : 와일드카드, 아무 문자열 / name이 '김'으로 시작하는 문자열
SELECT * FROM Employee WHERE name LIKE '%신'; -- name이 '신'으로 끝나는 문자열
SELECT * FROM Employee WHERE name LIKE '이_'; -- name이 2글자이면서 성이 '이'로 시작하는 문자열
SELECT * FROM Employee WHERE name LIKE '_순 %';
SELECT * FROM Employee WHERE HP LIKE '010-%';
SELECT * FROM Employee WHERE JOB IS NULL; -- null 값 조회할 때 is null로 해야 함, job = null 불가능
SELECT * FROM Employee WHERE JOB IS NOT NULL;
SELECT * FROM Employee WHERE DEPNO IS NULL;
SELECT * FROM Employee WHERE DEPNO IS NOT NULL;
SELECT * FROM Employee WHERE EMPNO >= 1005;
SELECT * FROM DEPT WHERE DEPNO = 10;
SELECT * FROM DEPT WHERE DNAME = '개발부';
SELECT * FROM DEPT WHERE TEL LIKE '%30%';
SELECT * FROM DEPT WHERE DEPNO IN (10, 30);
SELECT * FROM DEPT WHERE DNAME LIKE '경영__ _';
SELECT * FROM SALE WHERE PRICE > 50000;
SELECT * FROM SALE WHERE price >= 50000 AND price < 100000 AND month = 1;
SELECT * FROM SALE WHERE price BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE price NOT BETWEEN 50000 AND 100000;
SELECT * FROM SALE WHERE year = 2024;
SELECT * FROM SALE WHERE YEAR = 2024 AND MONTH = 2;


# 실습 4-4
SELECT * FROM sale ORDER BY price; -- 오름차순 asc생략되어있음 
SELECT * FROM sale ORDER BY price ASC; 
SELECT * FROM sale ORDER BY price DESC;
SELECT * FROM Employee ORDER BY name;
SELECT * FROM Employee ORDER BY name DESC;
SELECT * FROM employee ORDER BY regdate ASC;
SELECT * FROM sale WHERE price > 50000 ORDER BY price DESC;
SELECT * FROM sale WHERE price > 50000 ORDER BY year DESC, month, price DESC;


# 실습 4-5 (ORDER BY: 우선순위 정렬)
SELECT * FROM sale LIMIT 3; -- 상위 3개만 조회
SELECT * FROM sale LIMIT 0, 3; -- 0번째 인덱스부터 3개 조회
SELECT * FROM sale LIMIT 1, 2;
SELECT * FROM sale LIMIT 5, 3;
SELECT * FROM sale ORDER BY price DESC LIMIT 3, 5; -- price를 내림차순으로 정렬 후 3번째 인덱스부터 5개 조회
SELECT * FROM sale WHERE price < 50000 ORDER BY price DESC LIMIT 3;
SELECT * FROM sale WHERE price > 50000 
						ORDER BY year DESC, 
                        month, price DESC LIMIT 5; -- year > month > price 순으로 정렬 후 상위 5개 조회

# 실습 4-6
SELECT SUM(price) FROM sale;
SELECT CEILING(1.2); -- 2, 올림함수
SELECT CEILING(1.8); -- 2
SELECT FLOOR(1.2); -- 1, 내림함수
SELECT FLOOR(1.8); -- 1
SELECT ROUND(1.2); -- 1, 반올림함수
SELECT ROUND(1.8); -- 2
SELECT RAND(); -- 0 ~ 1 사이 실수 중 랜덤
SELECT RAND() * 10; -- 0 ~ 10 사이 실수 중 랜덤
SELECT CEILING(RAND() * 10); -- 1 ~ 10 사이 실수
SELECT CEILING(RAND() * 45); -- 1 ~ 45 사이 실수


SELECT COUNT(price) AS 갯수 FROM sale; -- null은 count에서 제외
SELECT COUNT(*) AS 튜플갯수 FROM sale;

SELECT LEFT('HelloWorld', 5); -- Hello / 왼쪽에서부터 5개까지 자름
SELECT RIGHT('HelloWorld', 5); -- World / 오른쪽에서부터 5개까지 자름
SELECT SUBSTRING('HelloWorld', 6, 5); -- World / 6번째부터 5개까지 자름
SELECT CONCAT('Hello', 'World'); -- HelloWorld / 두 개를 이어붙임
SELECT CONCAT(empno, name, hp) FROM employee WHERE empno='1008';

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO employee SET 
						empno = '1012', 
                        name='을지문덕', 
                        gender = 'F', 
                        hp = '010-1234-1012',  
                        regdate = NOW();
                        

# 실습 4-7 2018년 1월 매출의 총합
SELECT SUM(price) AS '2018년 1월 매출의 총합' FROM sale WHERE year=2018 AND month=1;

# 실습 4-8 2019년 2월에 5만원 이상 매출에 대한 총합
SELECT SUM(price) AS 총합, AVG(price) AS 평균 FROM sale WHERE price >= 50000 AND year = 2019 AND month = 2;

# 실습 4-9 2020년 전체 매출 중 최저, 최고 매출
SELECT MIN(price) AS 최저매출, MAX(price) AS 최고매출 FROM sale WHERE year = 2020;

# 실습 4-10



# 실습 4-11


# 실습 4-12


# 실습 4-13
# 실습 4-14
# 실습 4-15
# 실습 4-16
# 실습 4-17