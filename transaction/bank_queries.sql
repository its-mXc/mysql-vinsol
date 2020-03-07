USE bank;

UPDATE accounts
INNER JOIN users
ON users.account_no = accounts.account_no
SET balance = balance + 1000
WHERE name = 'Uday Nayak';

UPDATE accounts
INNER JOIN users
ON users.account_no = accounts.account_no
SET balance = balance - 500
WHERE name = 'Uday Nayak';

UPDATE accounts
INNER JOIN users
ON users.account_no = accounts.account_no
SET balance = balance - 200
WHERE name = 'Uday Nayak';

UPDATE accounts
INNER JOIN users
ON users.account_no = accounts.account_no
SET balance = balance + 200
WHERE name = 'Devashish Nayak';

SELECT * from accounts