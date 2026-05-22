# 260522 트랜잭션과 병렬제어

# 실습 8-1
START TRANSACTION;
SELECT * FROM bank_account;
UPDATE bank_account SET a_balance = a_balance - 10000 WHERE a_no='101-11-1001';
UPDATE bank_account SET a_balance = a_balance - 10000 WHERE a_no='101-11-1003';

-- 작업완료
COMMIT;

SELECT * FROM bank_account;

# 실습 8-2
START TRANSACTION;
UPDATE bank_account SET a_balance = a_balance - 10000 WHERE a_no='101-11-1001';
UPDATE bank_account SET a_balance = a_balance + 10000 WHERE a_no='101-11-1003';

-- 작업취소
ROLLBACK;


# 실습 8-3
UPDATE bank_account SET a_balance = a_balance - 10000 WHERE a_no='101-11-1001';
SELECT * FROM bank_account where a_no = '101-11-1001';

start transaction;
UPDATE bank_account SET a_balance = a_balance - 10000 WHERE a_no='101-11-1001';

commit;



