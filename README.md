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

2. During data transformation after data analysis
- The data under date (column), hire_date(column) has a combination of different date format
- example  06-04-91 (month- day- year) and  6/29/1984 (month-day- year). Some data included has the right format 2012-01-01 (year- month- year)

- I had a hard time during data transformation, errors were encountered via excel and sql because the dataset has multiple formats included in each column.

- Importing the data first in excel and did power query to transform the data but it created error on some data.
-- A friend of mine were able to transform all the data into (month / day/ year) through his developer power query ms excel software. But mine cant, so I have to think another way.
![Screenshot 2023-08-13 222944](https://github.com/lois4801/HR_Analysis/assets/96842662/182d9361-cd79-46c0-ac03-0b8634faa285)


  ![Screenshot 2023-08-13 222920](https://github.com/lois4801/HR_Analysis/assets/96842662/a597042e-a459-4c36-bc4b-e020e257f7b4)



### Then using sql. I made different trials before I finally cracked it.


### This is the orignal data
![image](https://github.com/lois4801/HR_Analysis/assets/96842662/a165f68d-4a12-41bd-9129-cf941cb8c78f)


### FIRST TRIAL
- I keep receiving error for running this program. Incorrect value: '06-04-91' for function str_to_date. Tried tweaking some but it is just the same.

![Screenshot 2023-08-13 224520](https://github.com/lois4801/HR_Analysis/assets/96842662/76aefd21-a108-4595-9139-811c348d3de7)

### Second trial
-  Created another column and hoping to transform the all the data all at once. But I failed.

![second trial](https://github.com/lois4801/HR_Analysis/assets/96842662/ed8b0f18-d618-4cc3-8fca-d27b371d624d)


![second trial2](https://github.com/lois4801/HR_Analysis/assets/96842662/7afaa0fe-3867-4abf-baeb-182c01b7fc68)


### Third trial
- Tried transforming one data at a time in the same column and see if it will work. If it will work then I will try transforming the next one.

![third trial](https://github.com/lois4801/HR_Analysis/assets/96842662/dc9489f1-f701-439a-a6e6-43dd983f0756)

![third trial2](https://github.com/lois4801/HR_Analysis/assets/96842662/0b79d5ea-d92b-4a5d-b5a3-5229be371321)

- Now I will try to transform the second one.

  



  
