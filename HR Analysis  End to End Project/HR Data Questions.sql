
use projects;


-- QUESTIONS
-- What is the gender breakdown of employees in the company? Include where age greater than or equal to 18 

SELECT gender, count(*) as 'Count' -- dont  forget the comma after first column identification
FROM hr
where age>=18
GROUP BY gender;

----------------------------------------------------------------------------------
-- What is the race/ethnicity breakdown of employees in the company? Arrange by

SELECT race, count(*) as 'Count'
FROM hr
where age>=18
GROUP BY race
ORDER BY count(*) DESC;-- arrange it by highest to lowest

----------------------------------------------------------------------------------

-- What is the age distribution  of employees in the company? Group by gender and age
SELECT
	CASE 
		WHEN age>=18 and age<=24 then '18-24'
        WHEN age>=25 and age<=34 then '25-34'
		WHEN age>=35 and age<=44 then '35-44'
        WHEN age>=45 and age<=54 then '45-54'
        WHEN age>=55 and age<=64 then '55-64'
        ELSE '65+'
		END AS age_group, gender,  -- do not forget the comma after the column
    
    count(*) as COUNT -- do not put space after count
    FROM HR
	WHERE age>=18  -- no comma after 
	
    GROUP BY age_group, gender
    ORDER BY age_group, gender;

-----------------------------------------------------------------------------------------



-- How many employees work at headquarters versus remote locations?
SELECT  location, count(*) AS count
FROM hr
GROUP  BY location; 

----------------------------------------------------------------------------------------
--  Who are the employees whose termdate is less than or equal to current date
-- How many years have they stayed in the company
SELECT emp_id, first_name, last_name,hire_date, termdate,
    FLOOR(DATEDIFF(termdate, hire_date) / 365) AS 'Years In Company'
FROM hr
WHERE termdate <= CURDATE();

-- checking all the employee lists that has negative value for ' Years In Company'
SELECT emp_id, first_name, last_name, termdate,
    FLOOR(DATEDIFF(termdate, hire_date) / 365) AS 'Years In Company'
FROM hr
WHERE FLOOR(DATEDIFF(termdate, hire_date) / 365) < 0;


-- Data Transformation>>>>  
-- change the data of those employee whose ' YEARS in Company' were negative values such that
--   Copy the data in hire_date to the termdate. This will now produce a data of  0 Years in Company data
UPDATE hr
SET termdate = hire_date
WHERE FLOOR(DATEDIFF(termdate, hire_date) / 365) < 0;


-- are the employees that has been fired immediately after hired or
 -- they are just considered apprentice, volunteer, intern or any other reasons.

SELECT emp_id, first_name, last_name, hire_date,termdate,
    FLOOR(DATEDIFF(termdate, hire_date) / 365) AS 'Years In Company'
FROM hr
WHERE FLOOR(DATEDIFF(termdate, hire_date) / 365) = 0;


-- What is the average length of employment for employees who have been terminated?
-- it means how long does the employee is working with the company?

SELECT 
-- we subtracted the termdate to the hiredate
round(avg(datediff(termdate, hire_date))/365,0) as 'AVG Length of Employment' 
FROM hr
-- we filter out the employees who has been terminated
WHERE termdate<= curdate(); 


--------------------------------------------------------------------
-- How does the gender distribution vary across departments and job titles ?

use projects;
" 1. Consider all employees whose age is greater or equal to 18. 
which means those who are legally employed "
SELECT department,jobtitle, gender, COUNT(*)AS count
FROM hr
WHERE age>=18
GROUP BY  department, gender
ORDER BY department;

" 2. Consider all employees where their termdate has been filled only. 
Those rows who has null values will be included"

SELECT department,jobtitle, gender, COUNT(*)AS count
FROM hr
-- This line filters the rows to be retrieved based on the condition that the value in the termdate column is null.
WHERE termdate is null
GROUP BY  department, gender
ORDER BY department;



---------------------------------------------------------------------------------------
-- Which department has the highest turnover rate or termination rate?

"use the following columns terminated_count, total count to compute for termination_rate. 
Use subquery to include the  computation for termination_count, department count  "

NOTE:
-- Whether or not to include employees whose years in the company is zero in the terminated count
-- depends on the specific use case and the definition of “terminated” being used.

-- If “terminated” is defined as an employee who has left the company for any reason,
-- then it may make sense to include employees with zero years of service. 
 
 -- However, if “terminated” is defined more narrowly, such as an employee who was fired 
 -- or laid off, then it may not make sense to include employees with zero years of service.
 -- Ultimately, the decision on whether or not to include these employees should be 
 -- based on the specific needs and goals of the analysis 


SELECT department,
    count(*) as 'Total Count',
    count(case when termdate is not null and termdate<=curdate() then 1 end) as 'Terminated Count',
    -- divide it by 100 and rounded by 2 decimal places
    round((count(case when termdate is not null and termdate<curdate() then 1 end) / count(*)) *100,2) as 'Termination Rate'
FROM hr
GROUP BY department
ORDER BY `Termination Rate` DESC;

--------------------------------------------------------------------------------------
-- What is the distribution of employees across locations by state? 
-- Age should be >=18 if they are terminated or no
 select location_state, count(*)as count
 from hr
 WHERE  age>=18
 group by location_state
 order by count desc;


-- What is the distribution of employees across locations by city? 
-- Age should be >=18 regardless if they are terminated or no

 select location_city, count(*)as count
 from hr
 WHERE age>=18
 group by location_city
 order by count desc;

----------------------------------------------------------------------------------------
-- How has the company's employee count changed over time based on hire and term dates?
-- the numnber of hires are 100, use subquery, order by year


select year, hires, terminations, 
hires-terminations as 'net change',
(terminations/ hires)* 100 as 'change_percent'

from
	(
		Select 
        year(hire_date) as 'YEAR', count(*) as 'HIRES', -- do not forget comma 
        -- counting the terminated employees
	    sum(case when termdate is not null and termdate <=curdate() then 1 end) as 'terminations'
		from hr
        group by YEAR(hire_date) 
       )
		as subquery
        group by year
        order by year asc;

--------------------------------------------------------------------------------------------

-- What is the tenure distribution for each department?
-- This is how long or  Years on average does employees stay in each department before they quit or terminated.


select department, round(avg(datediff(termdate,hire_date)/365), 0) as 'AVG_Tenure'
from hr
where termdate is not null and  termdate<=curdate() 
group by department;


