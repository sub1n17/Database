CREATE DATABASE Shop;
CREATE USER 'shop'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON Shop.* TO 'shop'@'%';
FLUSH PRIVILEGES; -- 현재 세션에 반영

USE Shop;

# 실습 1-1
CREATE TABLE `Customer` (
	custId VARCHAR(10) PRIMARY KEY,
	name VARCHAR(10) NOT NULL,
	hp VARCHAR(13) UNIQUE,
	addr VARCHAR(100) DEFAULT NULL,
	rdate DATE NOT NULL
);

CREATE TABLE `Product` (
	prodNo INT PRIMARY KEY,
	prodName VARCHAR(10) NOT NULL,
	stock INT NOT NULL DEFAULT 0 ,
	price INT DEFAULT NULL,
	company VARCHAR(20) NOT NULL
);

CREATE TABLE `Order` (
	orderNo INT PRIMARY KEY AUTO_INCREMENT,
	orderId VARCHAR(10) NOT NULL,
	orderProduct INT NOT NULL,
	orderCount INT NOT NULL DEFAULT 1,
	orderDate DATETIME NOT NULL
);

INSERT INTO `Customer` VALUES ('c101', '김유신', '010-1234-1001', '김해시 봉황동', '2022-01-01');
INSERT INTO `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경주시 보문동', '2022-01-02');
INSERT INTO `Customer` VALUES ('c103', '장보고', '010-1234-1003', '완도군 청산면', '2022-01-03');
INSERT INTO `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 마포구', '2022-01-04');
INSERT INTO `Customer` (custId, name, rdate) VALUES ('c105', '이성계', '2022-01-05');
INSERT INTO `Customer` VALUES ('c106', '정철', '010-1234-1006', '경기도 용인시', '2022-01-06');
INSERT INTO `Customer` (custId, name, rdate) VALUES ('c107', '허준', '2022-01-07');
INSERT INTO `Customer` VALUES ('c108', '이순신', '010-1234-1008', '서울시 영등포구', '2022-01-08');
INSERT INTO `Customer` VALUES ('c109', '송상현', '010-1234-1009', '부산시 동래구', '2022-01-09');
INSERT INTO `Customer` VALUES ('c1010', '정약용', '010-1234-1010', '경기도 광주시', '2022-01-10');

INSERT INTO `Product` VALUES (1, '새우깡', 5000, 1500, '농심');
INSERT INTO `Product` VALUES (2, '초코파이', 2500, 2500, '오리온');
INSERT INTO `Product` VALUES (3, '포카칩', 3600, 1700, '오리온');
INSERT INTO `Product` VALUES (4, '양파링', 1250, 1800, '농심');
INSERT INTO `Product` (prodNo, prodName, stock, company) VALUES (5, '죠리퐁', 2200, '크라운');
INSERT INTO `Product` VALUES (6, '마카렛트', 3500, 3500, '롯데');
INSERT INTO `Product` VALUES (7, '뿌셔뿌셔', 1650, 1200, '오뚜기');

INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c102', 3, 2, '2022-07-01 13:15:10');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c101', 4, 1, '2022-07-01 14:16:11');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c108', 1, 1, '2022-07-01 17:23:18');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c109', 6, 5, '2022-07-02 10:46:36');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c102', 2, 1, '2022-07-03 09:15:37');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c101', 7, 3, '2022-07-03 12:35:12');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c110', 1, 2, '2022-07-03 16:55:36');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c104', 2, 4, '2022-07-04 14:23:23');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c102', 1, 3, '2022-07-04 12:54:34');
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c107', 6, 1, '2022-07-05 14:21:03');

# 실습 1-4
SELECT * FROM customer;

# 실습 1-5
SELECT custid, name, hp FROM customer;

# 실습 1-6
SELECT * FROM product;

# 실습 1-7
SELECT company FROM product;

# 실습 1-8 : 제품 테이블에서 제조업체를 중복 없이 조회 하시오
SELECT DISTINCT company FROM product;

# 실습 1-9
SELECT prodName, price FROM product;

# 실습 1-10 : 제품 테이블에서 제품명과 단가를 조회하되, 단가에 500원을 더해 ‘조정단가’로 출력하시오. 
SELECT prodName, price + 500 AS 조정단가 FROM product;

# 실습 1-11
SELECT * FROM product WHERE company='오리온';

# 실습 1-12
SELECT orderProduct, orderCount, orderDate FROM `Order` WHERE orderId = 'c102';

# 실습 1-13
SELECT orderProduct, orderCount, orderDate FROM `Order` WHERE orderId = 'c102' AND orderCount >= 2;

# 실습 1-14
SELECT * FROM Product WHERE price >= 1000 AND price <= 2000;

# 실습 1-15 LIKE : “문자 패턴 검색용 연산자”
SELECT custid, name, hp, addr FROM customer WHERE name LIKE '김%';

# 실습 1-16
SELECT custid, name, hp, addr FROM customer WHERE name LIKE '__';

# 실습 1-17
SELECT * FROM customer WHERE hp IS NULL;

# 실습 1-18
SELECT * FROM customer WHERE addr IS NOT NULL;

# 실습 1-19
SELECT * FROM customer ORDER BY rdate DESC;

# 실습 1-20
SELECT * FROM `Order` WHERE orderCount >= 3 ORDER BY orderCount DESC, orderProduct ASC;

 # 실습 1-21
SELECT AVG(price) FROM product;

 # 실습 1-22
SELECT SUM(stock) AS `재고량 합계` FROM product WHERE company = '농심';

 # 실습 1-23
SELECT COUNT(*) AS 고객수 FROM customer;

 # 실습 1-24
SELECT COUNT(DISTINCT company) AS `제조업체 수` FROM product;

 # 실습 1-25
SELECT orderProduct AS `주문 상품번호`, SUM(orderCount) AS `총 주문수량` FROM `Order` GROUP BY orderProduct; 

 # 실습 1-26
SELECT company AS 제조업체, COUNT(*) AS 제품수, MAX(price) AS 최고가 FROM product GROUP BY company;

 # 실습 1-27
SELECT company AS 제조업체, COUNT(*) AS 제품수, MAX(price) AS 최고가 FROM product GROUP BY company HAVING 제품수 >= 2;

 # 실습 1-28
SELECT orderProduct, orderId, SUM(orderCount) AS `총 주문수량` FROM `Order` GROUP BY orderProduct, orderId;

 # 실습 1-29
SELECT orderId, prodName FROM `Order` AS a
JOIN product AS b
ON a.orderProduct = b.prodNo
WHERE orderid = 'c102';

 # 실습 1-30
SELECT orderid, name, prodName, orderDate FROM `Order` AS a
JOIN Customer AS b
ON a.orderId = b.custId
JOIN Product AS c
ON a.orderProduct = c.prodNo
WHERE a.orderDate LIKE '2022-07-03%';
 
