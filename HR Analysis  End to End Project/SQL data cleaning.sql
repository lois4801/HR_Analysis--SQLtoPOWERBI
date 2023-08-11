-- creating the database for the hr data analysis
CREATE DATABASE projects;

-- to direct all queries to the database selected
USE projects;

-- it will show the data type of all columns. 
DESCRIBE column_name;
-----------------------------------------------------------------------------
-- the table that we would want to analyze
SELECT * FROM hr;

-- it will show the data type of all columns. 
DESCRIBE hr;

-- changing the data
ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;


-- this will automatically apply updates that you are currently doing to your database.
SET sql_safe_updates = 0;


----------------------------------------------------------------------------
-- choosing the column birthdate from the hr table
SELECT birthdate FROM hr;


-- updating the hr table by setting the 'birthdate' format into the right format which is year-month-date
UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;


-- changing the data type from text to date of the  'birthdate' column
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
--------------------------------------------------------------------------

-- updating the hr table by setting the 'hire_date' format into the right format which is year-month-date
UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;


-- to change change the data type from text to date of the 'hire_date' column
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

--------------------------------------------------------------------

-- updating the hr table by setting the 'termdate' format into the right format year-month-date
-- detecting the current format used in the cells 2008-12-05- 01:21:48 UTC and converting to the right format
-- now all the empty cells will be filled with right format because of the  IS NOT NULL syntax

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))-- the i represents minute because the m is already been used to represent months
WHERE termdate IS NOT NULL AND termdate != ' '; -- empty cells will be filled with the right format year-month-date or 0000-00-00

-- to change the data type from text to date of the 'termdate' column
ALTER TABLE hr
MODIFY COLUMN termdate DATE;

---------------------------------------------------------------------
-- to add column named age with a data type  INT
ALTER TABLE hr ADD COLUMN age INT;

-- calculating the age to fill the cells
UPDATE hr
SET age = timestampdiff(YEAR, birthdate, CURDATE()); -- calculating the difference between the currentdate and the birthdate

-- to  confirm that the age applied
SELECT birthdate, age from hr;


----------------------------------------------------------------------

-- checking anomalies in the dataset if some data has lesser than 0 or more than 120 for the age
SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;


-- checking how many rows has an age of lesser than 18
SELECT count(*) FROM hr WHERE age < 18;

---------------------------------------------------------------------

-- checking how many rows whose termdate is the current date
SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();


-- checking how many rows whose termdate is  0000-00-00
-- these were actually the empty cells that has been filled a while ago
SELECT COUNT(*)
FROM hr
WHERE termdate = '0000-00-00';

SELECT location FROM hr;