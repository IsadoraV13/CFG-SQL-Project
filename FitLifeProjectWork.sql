-- QUICK SUMMARY
-- FitLife is a local gym run on the concept of low fees to encourage everyone to lead a healthy life. 
-- Members receive a cumulative 3% discount for each week where they attend the gym at least 3 times
-- There is a special 20% discount (instead of 12% for 4 weeks) for attending at least 3 times every week for 4 weeks
-- the concept is being trialled and there is also a small number of classes run by experienced coaches at peak hours

-- Rules:
	-- 1) A session is defined as at least 45min elapsed between checking in and checking out
	-- 2) Only one session per day counts towards the discount
    -- 3) Because of the 4 weekly incentive, payment is taken via Direct Debit every 4 weeks (not every calendar month)
    -- 4) The discount resets to zero every 4 weeks and the member has to 'earn' their discount again for the next cycle

CREATE DATABASE FitLife;

USE FitLife;
CREATE TABLE members(
member_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
surname VARCHAR(50) NOT NULL,
email VARCHAR(30) NOT NULL
);

CREATE TABLE coaches(
coach_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(30) NOT NULL,
surname VARCHAR(50) NOT NULL,
email VARCHAR(30) NOT NULL,
start_date DATE NOT NULL
);

CREATE TABLE attendance(
session_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
member_id INT, 
check_in TIMESTAMP,
check_out TIMESTAMP,
eligible_session INT,
FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE discount(
discount_band INT NOT NULL PRIMARY KEY,
discount_percent INT
);

-- values are inserted as percentages to avoid human input error 
-- the correct discount is then calculated in stored procedure 'updateFee'
INSERT INTO discount
VALUES
(0, 0),
(1, 3),
(2, 6),
(3, 9),
(4, 20);

-- the default membership fee is £30 (with a default discount is £0). 
-- Discounts earned are then calculated and applied via the stored procedure 'updateFee'
CREATE TABLE fee(
member_id INT,
discount_band INT,
fee DECIMAL(5,2) DEFAULT 30.00, -- check that this works
FOREIGN KEY (member_id) REFERENCES members(member_id),
FOREIGN KEY (discount_band) REFERENCES discount(discount_band)
);

CREATE TABLE classes(
class_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
coach_id INT,
class_description VARCHAR(30),
class_start TIMESTAMP,
class_end TIMESTAMP,
FOREIGN KEY (coach_id) REFERENCES coaches(coach_id)
);

-- Create View so that the Admin Assistant can easily print and 
-- affix it around the gym and send it by email to members
CREATE VIEW classSchedule AS
	SELECT 
		dayname(class_start) AS Day,
        CONVERT(class_start, DATE) AS Date,
        CONVERT(class_start, TIME) AS Start,
        CONVERT(class_end, TIME) AS End,
        class_description AS Class,
        CONCAT(coaches.first_name, ' ', coaches.surname) AS Coach
	FROM classes
    JOIN coaches
    ON classes.coach_id = coaches.coach_id
    ORDER BY Date ASC;
    

-- Create a trigger BEFORE inserting a new row in attendance to check whether 
	-- 1) the session is >= 45min
    -- 2) it is the first eligible session that day
-- if yes, set eligible_session = 1
DELIMITER //
CREATE TRIGGER session_eligibility_check
BEFORE INSERT
ON attendance
FOR EACH ROW
BEGIN
	SET new.eligible_session = IF 
		(TIMESTAMPDIFF(MINUTE, new.check_in, new.check_out) >= 45 AND 
			NOT EXISTS (SELECT member_id, CONVERT(check_in, DATE), eligible_session FROM attendance
			 WHERE member_id=new.member_id AND CONVERT(check_in, DATE)=CONVERT(new.check_in, DATE) AND eligible_session=1),
		1, 0); -- an eligibility of 1 means there was already an eligible session that day
END//
DELIMITER ;


-- CALCULATE FEE (5 steps)
-- Step 1: Create Procedure that updates fee Table with all current members
	   -- the table will be truncated after this process is done, so that discounts and fees are reset for the next cycle
       -- Assumption: there is another process (not covered in this project) to delete inactive members from the members table
 
DELIMITER // 
CREATE PROCEDURE updateFeeTable()
BEGIN
	INSERT INTO fee(member_id) SELECT member_id FROM members;
END //
DELIMITER ;

-- Step 2: Create Procedure that updates the fee Table with the discount band for each member for every 4 week period
DELIMITER //
CREATE PROCEDURE updateDiscountBand()

BEGIN
	-- select only members who have weeks with at least 3 sessions
    -- and return via a Common Table Expression the sum of the count of those weeks,
    -- e.g. a member with a sum of 2 has had 2 weeks with the minimum attendance of 3 sessions
    -- a sum of 2 is equal to discount_band 2, which is 6%
	WITH results AS(
    SELECT m_id, sum(weeks) AS discount_band
	FROM 
	(SELECT member_id as m_id, COUNT(DISTINCT(week(check_in,1))) AS weeks FROM attendance
	-- for this to work for this project, the WHERE clause checks between 7Nov (first timestamp in attendance Table) and now
    -- next to it I have commented the actual code I would use to check 'the last 4 weeks'
    -- 'NOW()' would be as per the event further down that would trigger the day after the end of every 4 week period
    WHERE check_in between '2022-11-07 00:00:00' AND NOW() -- between date_sub(NOW(),INTERVAL 4 WEEK) AND NOW()
	GROUP BY member_id, week(check_in,1)
	HAVING SUM(eligible_session) >=3
	) AS countWeeks
	GROUP BY m_id)
    
    -- with the results from the CTE, update fee table with the correct discount_band for each user who earned a discount
    -- the discount_band is set to 0 as default, so we only update it for members who earned a discount (not the whole table)
    UPDATE fee f
	INNER JOIN results r
    ON r.m_id = f.member_id
    SET f.discount_band = r.discount_band;
    
END// 
DELIMITER ;

-- Step 3: Create Procedure that then calculates the appropriate fee based on the newly updated discount_band
DELIMITER // 
CREATE PROCEDURE updateFee()

BEGIN
	DECLARE defaultFee decimal(5,2);
    SET defaultFee = 30.00;
	UPDATE fee f
    INNER JOIN discount d
	ON f.discount_band = d. discount_band 
	SET f.fee = defaultFee * (100-d.discount_percent)/100;
-- again, we are only re-calculating the fee for those who earned a discount (not the whole table)
END// 
DELIMITER ;	

-- Step 4: Create Event to:
	-- 1) update fee Table with every active member
    -- 2) calculate & update each member's discount_band
    -- 3) calculate & update each member's fee
CREATE EVENT calculateFee
-- for this to work for this project, it will run NOW but I have commented below what the actual schedule would be
ON SCHEDULE AT NOW()
-- ON SCHEDULE 
-- EVERY 4 WEEK
-- STARTS '2022-12-05 01:00:00'
DO
	SET SQL_SAFE_UPDATES = 0;
	CALL updateFeeTable();
    CALL updateDiscountBand(); 
    CALL updateFee();
    SET SQL_SAFE_UPDATES = 1;

DROP EVENT calculateFee;

-- Step 5: Create Event to delete content of Fee Table
	-- Assumption: the correct fee is passed on to the Payment systems which then keeps a record of it
    -- and the fee Table is deleted after 72hrs
    -- the Attendance table is not deleted so it can be used to resolve any dispute on incorrect discounts
CREATE EVENT truncateFeeTable
-- for this to work for this project, it will run NOW but I have commented below what the actual schedule would be
ON SCHEDULE AT NOW()
-- ON SCHEDULE 
-- EVERY 4 WEEK
-- STARTS '2022-12-08 01:00:00'
DO
	TRUNCATE TABLE fee;

-- Calculate Revenue with a Stored Function
DELIMITER // 
CREATE FUNCTION calculateRevenue()
RETURNS DECIMAL(5,2)
DETERMINISTIC

BEGIN
	DECLARE revenueThisPeriod decimal(5,2);
    SELECT SUM(fee) FROM fee INTO revenueThisPeriod;
    RETURN revenueThisPeriod;
	
END// 
DELIMITER ;	
