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


Select birthdate, termdate,hire_date
from hr;
----------------------------------------------------------------------------
-- choosing the column birthdate from the hr table
SELECT birthdate FROM hr;


-- updating the hr table by setting the 'birthdate' format into the right format which is year-month-date

" This script updates the birthdate column in hr table.
 For each row in the table, it checks if the value of the birthdate column 
 contains a slash or a hyphen. If it contains a slash, it assumes that the date
 is in the format ‘MM/DD/YYYY’ and converts it to the format ‘YYYY-MM-DD’. 
 If it contains a hyphen, it assumes that the date is already in the correct format
 and leaves it unchanged. If it contains neither a slash nor a hyphen, it sets the value to NULL."
 
 
UPDATE hr
SET birthdate= CASE
	-- This line checks if the value of the 'birthdate' column contains a slash ('/').
    -- If it does, this line converts the value from the format 'MM/DD/YYYY' to the format 'YYYY-MM-DD'.
    
    WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    
    -- This line checks if the value of the 'birthdate' column contains a hyphen ('-').
    -- If it does, this line keeps the value unchanged, assuming it's already in the correct format.
    
    WHEN birthdate LIKE '%-%' THEN birthdate -- Keep it as is if it's already in the correct format
    
-- This line specifies what to do if none of the above conditions are met. 
   --  In this case, the value is set to NULL.
   
    ELSE NULL
END;


" This updated script uses a CASE statement to check if each date in the birthdate column
 is in the format ‘MM-DD-YY’. If it is, the script uses the STR_TO_DATE and DATE_FORMAT 
 functions to convert it to the desired format ‘YYYY-MM-DD’. If a date is not in this format, 
 it will be left unchanged."
 
UPDATE hr
SET birthdate = 
    CASE
        -- If the birthdate is in the format 'MM-DD-YY', we'll use the STR_TO_DATE function to convert it to a DATE
        WHEN birthdate LIKE '__-__-__' AND LEFT(birthdate, 2) <= 12 THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%y'), '%Y-%m-%d')
        -- If the birthdate is not in the above format, we'll leave it unchanged
        ELSE birthdate
    END;



 " MIXING BOTH PROGRAMS TOGETHER"
 
-- This line updates the 'hr' table. 
UPDATE hr

-- This line sets the value of the 'birthdate' column for each row in the table.
SET birthdate = 
    CASE
        -- If the birthdate is in the format 'MM/DD/YYYY', we'll use the STR_TO_DATE function to convert it to a DATE
        WHEN birthdate LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
        
        -- If the birthdate is in the format 'MM-DD-YY', we'll use the STR_TO_DATE function to convert it to a DATE
        WHEN birthdate LIKE '__-__-__' AND LEFT(birthdate, 2) <= 12 THEN DATE_FORMAT(STR_TO_DATE(birthdate, '%m-%d-%y'), '%Y-%m-%d')
        
        -- If the birthdate is not in either of the above formats, we'll leave it unchanged
        ELSE birthdate
    END;



describe hr;

-- changing the data type from text to date of the  'birthdate' column
ALTER TABLE hr
MODIFY COLUMN birthdate DATE;
--------------------------------------------------------------------------

-- updating the hr table by setting the 'hire_date' format into the right format which is year-month-date

-- This line updates the 'hr' table. 
UPDATE hr

-- This line sets the value of the 'birthdate' column for each row in the table.
SET hire_date = 
    CASE
        -- If the birthdate is in the format 'MM/DD/YYYY', we'll use the STR_TO_DATE function to convert it to a DATE
        WHEN hire_date LIKE '%/%' THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
        
        -- If the birthdate is in the format 'MM-DD-YY', we'll use the STR_TO_DATE function to convert it to a DATE
        WHEN hire_date LIKE '__-__-__' AND LEFT(hire_date, 2) <= 12 THEN DATE_FORMAT(STR_TO_DATE(hire_date, '%m-%d-%y'), '%Y-%m-%d')
        
        -- If the birthdate is not in either of the above formats, we'll leave it unchanged
        ELSE hire_date
    END;



-- to change change the data type from text to date of the 'hire_date' column
ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

--------------------------------------------------------------------

-- The condition for updating rows is that the value of termdate IS NOT NULL AND  NOT EMPTY STRING (i.e., ''). 
-- This means that only rows with A VALUE in the termdate column will be updated.

UPDATE hr
SET termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL and termdate != '' ; 

-- setting my other blank cells into null values
UPDATE hr
SET termdate = NULL
WHERE termdate= '';


select termdate from hr;-- just to check

-- checking how many rows whose termdate is the current date
SELECT COUNT(*) FROM hr WHERE termdate > CURDATE();

 -- checking how many rows whose termdate is  NULL
-- these were actually the empty cells that has been filled a while ago
SELECT termdate, COUNT(*)
FROM hr
WHERE termdate IS NULL



-- to change the data type from text to date of the 'termdate' column
ALTER TABLE hr
MODIFY COLUMN termdate DATE;


---------------------------------------------------------------------
-- to add column named age with a data type  INT
ALTER TABLE hr ADD COLUMN age INT;

-- calculating the age to fill the cells
UPDATE hr
-- calculating the difference between the currentdate and the birthdate
SET age = timestampdiff(YEAR, birthdate, CURDATE()); 

-- to  confirm that the age applied
SELECT birthdate, age from hr;


-- checking anomalies in the dataset if some data has lesser than 0 or more than 120 for the age
SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

-- Checking  how many of rows or employees is affected and having this data
SELECT count(*) from hr WHERE age< 0;


-- Checking the dataset having age anomalies
SELECT emp_id, first_name, last_name ,birthdate, age from hr WHERE age< 0;

-- checking the count for age=18
SELECT count(*) FROM hr 
WHERE age = 18;

--  Checking the count for the following age=18, age<18, and age>=18
SELECT
    SUM(CASE WHEN age = 18 THEN 1 ELSE 0 END) AS age_18,
    SUM(CASE WHEN age < 18 THEN 1 ELSE 0 END) AS age_under_18,
    SUM(CASE WHEN age >= 18 THEN 1 ELSE 0 END) AS age_18_and_over
FROM hr;

-- Cleaning my data
DELETE FROM hr
WHERE age < 18;

-- Checking if I have now the right data set I need
select count(*) as 'Total Age Rows' from hr;

-- the same
SELECT
 SUM(CASE WHEN age >= 18 THEN 1 ELSE 0 END) AS age_18_and_over
FROM hr;

-- Rechecking the minimum age and oldest age again
SELECT 
	min(age) AS youngest,
    max(age) AS oldest
FROM hr;

---------------------------------------------------------------------
SELECT location, COUNT(*) as count
FROM hr
GROUP BY location;