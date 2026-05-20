# 260520 shopERD 실습
# 실습 6-2
INSERT INTO `Customer` VALUES ('c101', '김유신', '010-1234-1001', '경남 김해시', '2023-01-01');
INSERT INTO `Customer` VALUES ('c102', '김춘추', '010-1234-1002', '경남 경주시', '2023-01-02');
INSERT INTO `Customer` VALUES ('c103', '장보고', '010-1234-1003', '전남 완도군', '2023-01-03');
INSERT INTO `Customer` VALUES ('c104', '강감찬', '010-1234-1004', '서울시 관약구', '2023-01-04');
INSERT INTO `Customer` VALUES ('c105', '이순신', '010-1234-1005', '부산 금정구', '2023-01-05');
select * from customer;

INSERT INTO `Product` VALUES (1, '새우깡', 5000, 1500, '농심');
INSERT INTO `Product` VALUES (2, '초코파이', 2500, 2500, '오리온');
INSERT INTO `Product` VALUES (3, '포카칩', 3600, 1700, '오리온');
INSERT INTO `Product` VALUES (4, '양파링', 1250, 1800, '농심');
INSERT INTO `Product` VALUES (5, '죠리퐁', 2200, NULL, '크라운');
select * from Product;

INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c102', 3, 2, NOW());
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c101', 4, 1, NOW());
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c102', 1, 1, NOW());
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c103', 5, 5, NOW());
INSERT INTO `Order` (orderId, orderProduct, orderCount, orderDate) VALUES ('c105', 2, 1, NOW());
select * from `Order`;
ALTER TABLE `Order` MODIFY orderNo INT AUTO_INCREMENT;

# 실습 6-3
SELECT 
	o.orderNo, 
    c.name, 
    p.prodName, 
    o.orderCount, 
    o.orderDate 
FROM `Order` AS o
JOIN `Customer` AS c ON o.orderId = c.custId
JOIN `Product` AS p ON o.orderProduct = p.prodNo;


SELECT 
	o.orderNo, 
    o.orderProduct,
    p.prodName,
    p.price,
    o.orderCount, 
    o.orderDate 
FROM `Order` AS o
JOIN `Customer` AS c ON o.orderId = c.custId
JOIN `Product` AS p ON o.orderProduct = p.prodNo
WHERE name = '김유신';


SELECT SUM(price * orderCount) as `총주문금액`
FROM `Order` AS o
JOIN `Product` AS p ON o.orderProduct = p.prodNo;


# 실습 6-5
INSERT INTO bank_customer VALUES ('730423-1000001', '김유신', 1, '010-1234-1001', '경남 김해시');
INSERT INTO bank_customer VALUES ('730423-1000002', '김춘추', 1, '010-1234-1002', '경남 경주시');
INSERT INTO bank_customer VALUES ('750423-1000003', '장보고', 1, '010-1234-1003', '전남 완도군');
INSERT INTO bank_customer VALUES ('102-12-51094', '(주)정보산업', 2, '051-500-1004', '부산시 부산진구');
INSERT INTO bank_customer VALUES ('930423-1000005', '이순신', 1, '010-1234-1005', '서울 종로구');
SELECT * FROM bank_customer;

INSERT INTO bank_account VALUES ('101-11-1001', 'S1', '자유저축예금', '730423-1000001',  '2011-04-11', 1550000);
INSERT INTO bank_account VALUES ('101-11-1002', 'S1', '자유저축예금', '930423-1000005', '2011-05-12', 260000);
INSERT INTO bank_account VALUES ('101-11-1003', 'S1', '자유저축예금', '750423-1000003', '2011-06-13', 75000);
INSERT INTO bank_account VALUES ('101-12-1001', 'S2', '기업전용예금', '102-12-51094', '2011-07-14', 15000000);
INSERT INTO bank_account VALUES ('101-13-1001', 'S3', '정기저축예금', '730423-1000002', '2011-08-15', 1200000);
SELECT * FROM bank_account; 

INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1001', 1, 50000, NOW());
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-12-1001', 2, 1000000, NOW());
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1002', 3, 260000, NOW());
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1002', 2, 100000, NOW());
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1003', 3, 75000, NOW());
INSERT INTO bank_transaction (t_a_no, t_dist, t_amount, t_datetime) VALUES ('101-11-1001', 1, 150000, NOW());

# 실습 6-6
SELECT 
	c.c_no, c.c_name, c.c_phone, a.a_no, a.a_item_name, a.a_balance
FROM bank_customer as c
JOIN bank_account as a
ON c.c_no = a.a_c_no;

#**************************************************************************** 
SELECT * FROM bank_transaction 
	WHERE t_a_no = (SELECT a_no FROM bank_account 
							WHERE a_c_no = (SELECT c_no FROM bank_customer 
														WHERE c_name = '이순신'));
                                                        
-- SELECT *
-- FROM bank_transaction t
-- JOIN bank_account a ON t.t_a_no = a.a_no
-- JOIN bank_customer c ON a.a_c_no = c.c_no
-- WHERE c.c_name = '이순신';
#**************************************************************************** 
							
	
SELECT * 
	FROM bank_customer AS c
	JOIN bank_account AS a ON c.c_no = a.a_c_no
    WHERE c_dist = 1
    ORDER BY a_balance DESC
    LIMIT 1;
    
    
# 실습 6-8
INSERT INTO student VALUES ('20201011', '김유신', '010-1234-1001', 3, '경남 김해시');
INSERT INTO student VALUES ('20201122', '김춘추', '010-1234-1002', 3, '경남 경주시');
INSERT INTO student VALUES ('20210213', '장보고', '010-1234-1003', 2, '전남 완도군');
INSERT INTO student VALUES ('20210324', '강감찬', '010-1234-1004', 2, '서울 관악구');
INSERT INTO student VALUES ('20220415', '이순신', '010-1234-1005', 3, '서울 종로구');
select * from student;

INSERT INTO lecture VALUES (101, '컴퓨터과학 개론', 2, 40, '본301'); 
INSERT INTO lecture VALUES (102, '프로그래밍 언어', 3, 52, '본302'); 
INSERT INTO lecture VALUES (103, '데이터베이스', 3, 56, '본303'); 
INSERT INTO lecture VALUES (104, '자료구조', 3, 60, '본304'); 
INSERT INTO lecture VALUES (105, '운영체제', 3, 52, '본305'); 
select * from lecture;

INSERT INTO register VALUES ('20220415', 101, 60, 30, NULL, NULL);
INSERT INTO register VALUES ('20210324', 103, 54, 36, NULL, NULL);
INSERT INTO register VALUES ('20201011', 105, 52, 28, NULL, NULL);
INSERT INTO register VALUES ('20220415', 102, 38, 40, NULL, NULL);
INSERT INTO register VALUES ('20210324', 104, 56, 32, NULL, NULL);
INSERT INTO register VALUES ('20210213', 103, 48, 40, NULL, NULL);
SELECT * FROM register;

# 실습 6-9 **************************************************************************** 
SELECT * 
	FROM student AS s 
    LEFT JOIN register AS r 
    ON s.stdNo = r.regStdNo
    WHERE r.regStdNo is null;
# **************************************************************************** 

SELECT 
	`regStdNo`, 
    `regLecNo`, 
    `regMidScore`,
    `regFinalScore`,
    `regMidScore` + `regFinalScore` as `합`,
    case
		when (`regMidScore` + `regFinalScore` >= 90) then 'A'
		when (`regMidScore` + `regFinalScore` >= 80) then 'B'
		when (`regMidScore` + `regFinalScore` >= 70) then 'C'
		when (`regMidScore` + `regFinalScore` >= 60) then 'D'
	else 'F'
    end as `등급`
from `Register`;


SELECT 
	`stdNo`,
    `stdName`,
    `stdYear`,
    `lecName`,
    `regMidScore`,
    `regFinalScore`,
    `regTotalScore`,
    `regGrade`
	FROM Student AS s
    JOIN Register AS r ON s.stdNo = r.regStdNo
    JOIN Lecture AS l ON r.regLecNo = l.lecNo
	WHERE stdYear = 2;






