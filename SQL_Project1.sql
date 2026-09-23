-- STEP-1:  CREATE finance_db Database
CREATE DATABASE finance_db;
use finance_db;

-- STEP-2: CREATE Finance1 Table
CREATE TABLE finance1(
id VARCHAR(50),
member_id VARCHAR(50),
loan_amnt INT,
funded_amnt INT,
funded_amnt_inv DECIMAL(15,2),
term VARCHAR(20),
int_rate DECIMAL(10,2),
installment DECIMAL(10,2),
grade VARCHAR(10),
sub_grade VARCHAR(10),
emp_title VARCHAR(255),
emp_length VARCHAR(50),
home_ownership VARCHAR(20),
annual_inc INT,
verification_status VARCHAR(50),
issue_d VARCHAR(50),
loan_status VARCHAR(20),
pymnt_plan VARCHAR(10),
desc1 LONGTEXT,
purpose VARCHAR(100),
title VARCHAR(255),
zip_code VARCHAR(10),
addr_state VARCHAR(10),
dti DECIMAL(10,2));

-- Enable Local Infile Settings
SET GLOBAL local_infile = 1;

# STEP-3: Fast-Import All 39k Rows
-- Here, Importing the values from finance_1 data set which is in CSV format

LOAD DATA LOCAL INFILE "C://Users//sarod//OneDrive//Desktop//Finance_1 (2) (1).csv"
INTO TABLE finance1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Here, Add the another column for getting year and upadate the value
ALTER TABLE finance1 ADD COLUMN YEAR INT;
SET sql_safe_updates=0;
-- CAST()  convert text to number format
-- UNSIGNED means the number cannot be negative
UPDATE finance1 SET YEAR = 2000 + CAST(SUBSTRING_INDEX(issue_d, '-', 1)AS UNSIGNED);

-- Here, same STEP-2 and STEP-3 applying for finance_2 data set
CREATE TABLE finance2(
id VARCHAR(50),
delinq_2yrs INT,
earliest_cr_line VARCHAR(20),
inq_last_6mnths INT,
mnths_since_last_delinq VARCHAR(10),
mnths_since_last_record VARCHAR(10),
open_acc INT,
pub_rec INT,
revol_bal VARCHAR(50),
revol_util DECIMAL(10,2),
total_acc INT,
initial_list_status VARCHAR(10),
out_prncp DECIMAL(15,2),
out_prncp_inv DECIMAL(15,2),
total_pymnt DECIMAL(20,2),
total_pymnt_inv DECIMAL(20,2),
total_rec_prncp DECIMAL(20,2),
total_rec_int DECIMAL(20,2),
total_rec_late_fee DECIMAL(10,1),
recoveries DECIMAL(15,1),
collection_recovery_fee DECIMAL(15,2),
last_pymnt_d VARCHAR(20),
last_pymnt_amnt DECIMAL(20,2),
next_pymnt_d VARCHAR(20),
last_credit_pull_d VARCHAR(20));

LOAD DATA LOCAL INFILE "C://Users//sarod//OneDrive//Desktop//Finance_2 (2) (1).csv"
INTO TABLE finance2
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT * FROM finance1;
SELECT COUNT(*) FROM finance1;

SELECT * FROM finance2;
SELECT COUNT(*) FROM finance2;

-- 1) YEAR WISE LOAN AMOUNT STATUS
SELECT 
    YEAR, SUM(loan_amnt) AS Total_Amount
FROM
    finance1
GROUP BY YEAR
ORDER BY YEAR;

-- 2) GRADE AND SUB-GRADE WISE REVOL_BAL
SELECT 
    grade, sub_grade, SUM(revol_bal) AS TOTAL_REVOL_BALANCE
FROM
    finance1
        INNER JOIN
    finance2 ON finance1.id = finance2.id
GROUP BY grade , sub_grade
ORDER BY grade;

-- 3) TOTAL PAYMENT FOR VERIFIED STATUS VS TOTAL PAYMNENT FOR NON-VERIFIED STATUS
SELECT 
    verification_status, CONCAT(ROUND(SUM(total_pymnt)/1000000,2)," M") AS TOTAL_PAYMENT
FROM
    finance1
        INNER JOIN
    finance2 ON finance1.id = finance2.id
WHERE
    verification_status != 'Source Verified'
GROUP BY verification_status;

-- 4) STATE WISE AND LAST_CREDIT_PULL_D WISE LOAN STATUS
SELECT 
    f1.addr_state,
    f2.last_credit_pull_d,
    f1.loan_status,
    COUNT(*) AS Total_Loans
FROM
    finance1 AS f1
        INNER JOIN
    finance2 AS f2 ON f1.id = f2.id
GROUP BY f1.addr_state , f2.last_credit_pull_d , f1.loan_status
ORDER BY f1.addr_state , f2.last_credit_pull_d;


-- 5) HOME OWNERSHIP Vs LAST PAYMENT DATE STATS
SELECT 
    home_ownership,
    last_pymnt_d,
    CONCAT(ROUND(SUM(last_pymnt_amnt) / 10000, 2),
            ' K') AS Last_Payment_Amount
FROM
    finance1
        INNER JOIN
    finance2 ON finance1.id = finance2.id
GROUP BY home_ownership , last_pymnt_d
ORDER BY home_ownership , last_pymnt_d DESC;








