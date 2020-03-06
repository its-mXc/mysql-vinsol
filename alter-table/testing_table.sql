use vinsol;
--DROP TABLE testing_table;
CREATE TABLE testing_table (
	name varchar(30),
    contact_name varchar(30),
    roll_no varchar(20)
);
ALTER TABLE testing_table
DROP COLUMN name;
ALTER TABLE testing_table
RENAME COLUMN contact_name TO username;

ALTER TABLE testing_table
ADD COLUMN first_name varchar(30) FIRST;

ALTER TABLE testing_table
ADD COLUMN last_name varchar(30) AFTER first_name;

ALTER TABLE testing_table 
MODIFY roll_no INT(10);
-- SELECT * from testing_table