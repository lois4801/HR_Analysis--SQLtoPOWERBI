# HR_Analysis
## This project is an Analysis of HR Data from year 2000 to 2020. 
-  This project has a raw data that hasnt been cleaned yet. It could be cleaned and correct the formating through excel but this will take forever due to the reason that the rows is comprised of 22215.

  - Thus it is better to clean the data through python or sql and import the data in powerbi for data visualization. For now we will be using SQL instead to clean and correct the formating issues of dates,columns etc.


## NOTE: 
- I have created a database and table named hr and imported all the data in its raw form. I didnt changed the data type as well.

 Here are the following questions needed to be answered.

-- What is the gender breakdown of employees in the company?


-- What is the race/ethnicity breakdown of employees in the company?


-- What is the age distribution of employees in the company?


-- How many employees work at headquarters versus remote locations?


-- What is the average length of employment for employees who have been terminated?


-- How does the gender distribution vary across departments and job titles?


-- What is the distribution of job titles across the company?


-- Which department has the highest turnover rate?


-- What is the distribution of employees across locations by state?


-- How has the company's employee count changed over time based on hire and term dates?


-- What is the tenure distribution for each department?

## Problems Encountered and how I solved it.

1. During date formatting change, I mistakenly made all the dates into null during the process. So be be sure to never update the data into the main server itself. Make a copy of csv file and do your analysis using that file. 

2. During data cleaning
- The data under date (column), hire_date(column) has a combination of different date format
- example  06-04-91 (month- day- year) and  6/29/1984 (month-day- year). Some data included has the right format 2012-01-01 (year- month- year)

- I had a hard time during data transformation, errors were encountered via excel and sql because the dataset has multiple formats included in each column.

- Importing the data first in excel and did power query to transform the data but it created error on some data.
![Screenshot 2023-08-13 222944](https://github.com/lois4801/HR_Analysis/assets/96842662/182d9361-cd79-46c0-ac03-0b8634faa285)


  ![Screenshot 2023-08-13 222920](https://github.com/lois4801/HR_Analysis/assets/96842662/a597042e-a459-4c36-bc4b-e020e257f7b4)





  
