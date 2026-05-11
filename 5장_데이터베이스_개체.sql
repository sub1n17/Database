# 날짜 2026/05/08
# 내용 5장 데이터베이스 개체 

# 실습 5-1
SHOW INDEX FROM user1; -- 테이블에 설정된 인덱스(특정 컬럼을 빠르게 찾기 위해 DB가 따로 만들어 둔 자료구조) 목록 조회
SHOW INDEX FROM user2;
SHOW INDEX FROM user3;
SELECT * FROM user3;

# 실습 5-2
CREATE INDEX idx_user1_userid ON user1(userid);
ANALYZE TABLE user1;

# 실습 5-3
DROP INDEX idx_user1_userid ON user1;

# 실습 5-4
CREATE VIEW vw_user1 AS (SELECT name, hp, age FROM user1); 
-- user1 테이블에서 name, hp, age만 뽑아서 그 결과를 vw_user1이라는 “가상 테이블”로 만들어라 (SELECT 결과를 테이블처럼 사용할 수 있게 만든 가상 테이블)
CREATE VIEW vw_user4_age_under30 AS (SELECT * FROM user4 WHERE age < 30);
CREATE VIEW vw_employee_with_sales AS (
	SELECT 
		a.empno AS 직원번호,
        b.name AS 직원이름,
		b.job AS 직급,
		c.dname AS 부서명,
		a.year AS 매출년도,
		a.month AS 월,
		a.price AS 매출액
	FROM sale AS a
    JOIN employee AS b ON a.empno = b.empno
    JOIN dept AS c ON b.depno = c.depno
);
    

# 실습 5-5
SELECT * FROM vw_user4_age_under30;

# 실습 5-6
DROP VIEW vw_user4_age_under30;

# 실습 5-7 ⭐PROCEDURE : 자주 쓰는 SQL을 이름 붙여서 함수처럼 만들어두고 호출하는 것 (SQL 재사용, 자주 쓰는 로직 간단 호출)
DELIMITER $$
	CREATE PROCEDURE proc_test2(IN _userName VARCHAR(10)) -- 저장 프로시저 생성(IN 입력값 받는 변수)
	BEGIN -- ~ END : 여러 SQL을 묶는 블록
		SELECT * FROM employee WHERE name=_userName; -- employee 테이블에서 이름이 입력값인 사람 찾기
	End $$
    DELIMITER ;

CALL proc_test2("김유신"); -- 프로시저 실행 // 결과 : employee 테이블에서 name = '김유신'인 데이터 출력
-- 일반 SQL = 매번 손으로 계산
-- 프로시저 = 미리 만들어놓고 사용할 때 호출하기


-- (지피티 연습문제) employee 테이블에서 이름이 _name과 같은 사원의 모든 칼럼 조회해서 출력하기
DELIMITER $$
	CREATE PROCEDURE proc_emp_search(IN _name VARCHAR(10))
    BEGIN
		SELECT * FROM employee WHERE name=_name;
	END $$
DELIMITER ;
CALL proc_emp_search("홍길동");


# 실습 5-8 -- 프로시저는 반환값이 없지만 반환 받을 수 있는 방법
DROP PROCEDURE IF EXISTS proc_test4;

DELIMITER $$
	CREATE PROCEDURE proc_test4(IN _job VARCHAR(10), OUT _count INT) -- 결과를 출력값(OUT) 으로 돌려줌, _count: 결과 저장용 출력값
    BEGIN 				-- into : 결과를 _count 변수에 저장
		SELECT COUNT(*) INTO _count FROM employee WHERE job=_job;
	END $$
DELIMITER ; -- 직급(job)을 입력하면 그 직급 인원 수를 반환하는 프로시저
CALL proc_test4('대리', @_count); -- _count 변수에 결과 저장
SELECT CONCAT ('_count : ', @_count); -- CONCAT() : 문자열 이어붙이기 // _count : 3

# 실습 5-9
DELIMITER $$
	CREATE PROCEDURE proc_test5(IN _name VARCHAR(10))
    BEGIN 
		DECLARE _empno INT; -- 프로시저 내부에서 사용하는 지역 변수 선언
        SELECT empno into _empno FROM employee WHERE name = _name; -- employee 테이블에서 '김유신'의 empno를 찾아서 _empno 변수에 저장
		SELECT * FROM sale WHERE empno = _empno; -- sale 테이블에서 해당 empno의 매출 조회
    END $$
DELIMITER ;
CALL proc_test5('김유신');


-- 프로시저 만들 일 거의 없어서 흐름만 알면 됨.....
# 실습 5-10
DELIMITER $$
	CREATE PROCEDURE proc_test8()
    BEGIN
		# 변수 선언
        DECLARE total INT DEFAULT 0;
        DECLARE temp INT;
        DECLARE endOfRow BOOLEAN DEFAULT false;
        
        # 커서 선언 : 테이블의 특정 컬럼을 포인팅하는 가상개체
        DECLARE saleCursor CURSOR FOR SELECT price FROM sale;
        
        # 반복 조건
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET endOfRow  = TRUE;
        
        # 커서 열기
        OPEN saleCursor;
        
        cursor_loop: LOOP -- 반복문
			FETCH saleCursor INTO temp; -- ★ 현재 가리키는 행을 temp에 대입함 반복문 돌면 커서가 한 행 아래로 내려가서 두번째 행을 가리키고 그 값을 temp에 대입
            -- ★ 커서가 가리키는 현재 행의 값을 temp 변수에 저장, 한번 반복마다 한행씩 이동

			IF endOfRow THEN
				LEAVE CURSOR_LOOP;
            END IF;
            
            SET total = total + temp;
        END LOOP;
        
        SELECT total AS '전체 합계';
        
        CLOSE saleCursor;
	END $$
DELIMITER ;

CALL proc_test8();

# 실습 5-11 반환값이 있는 함수 
-- root로 접속해서 아래 환경설정 후 다시 함수 생성
SET GLOBAL log_bin_

DELIMITER $$
	CREATE FUNCTION func_test1(_empno INT) RETURNS INT -- RETURNS  : 반환타입
	BEGIN 
		DECLARE total INT;
        
        SELECT SUM(price) INTO total FROM sale WHERE empno = _empno;
        
        RETURN total;
	END $$
DELIMITER ;
SELECT func_test1(1001); -- 함수는 select, 프로시저는 CALL

DELIMITER $$
	CREATE FUNCTION func_test2(_price INT) RETURNS DOUBLE
	BEGIN 
		DECLARE bonus DOUBLE;
        IF (_price >= 100000) THEN
			SET bonus = _price * 0.1;
		ELSE
			SET bonus = _price * 0.05;
		END IF;
        
	RETURN bonus;
	END $$
DELIMITER ;
SELECT empno, year, month, price, func_test2(sale) as bonus FROM sale;




