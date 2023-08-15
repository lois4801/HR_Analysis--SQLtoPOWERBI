# HR_Analysis
## This project is an Analysis of HR Data from year 2000 to 2020. 
-  This project has a raw data that hasnt been cleaned yet. Rows is comprised of 22215. It could be cleaned and correct through excel or python, but for this project I will be focusing more in SQL. Then it will be imported in PowerBI for data visualization.If I have some more time, I will also include google looker studio.


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


### First TRIAL
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


- Then now, the second data will be transformed.

![fourth trial](https://github.com/lois4801/HR_Analysis/assets/96842662/d3681ee7-415f-4d61-b675-95a4bcad2544)



  ![fourth trial2](https://github.com/lois4801/HR_Analysis/assets/96842662/8e86db05-8557-44ea-a1a3-e5c5e13e84bd)


### Final Conclusion
- Now that both can be transformed separately succesfully. I dropped the whole hr table and imported again the raw file to try mixing both programs together and test if it can be run successfully as one program and get just one sweep result.
  
![final trial](https://github.com/lois4801/HR_Analysis/assets/96842662/250a923e-ce60-44fd-8d40-b0d7d93c66b2)

![final trial2](https://github.com/lois4801/HR_Analysis/assets/96842662/e73e293b-1111-4f56-a8f5-efddacbc820a)



- It dit run perfectly. So now, I will be using this program to change the data for the hire_date column.

  ###  Converted the data under hire_date column.

![hire_date](https://github.com/lois4801/HR_Analysis/assets/96842662/989cfd0f-895e-4ccf-bfe3-f574b6a59a53)


![hire_date2](https://github.com/lois4801/HR_Analysis/assets/96842662/0f31e1db-55c7-44ad-90e8-778f3d7141ce)

### Converting the data under termdate column
- Converting the datetime format into standard date format (year- month- date only) and filling the empty cells with year

![image](https://github.com/lois4801/HR_Analysis/assets/96842662/a165f68d-4a12-41bd-9129-cf941cb8c78f)

![termdate](https://github.com/lois4801/HR_Analysis/assets/96842662/66b6cf8c-32fc-4c21-bb39-10a9a52dc96d)\

![termdate2](https://github.com/lois4801/HR_Analysis/assets/96842662/4581502c-e093-4187-8e9b-81b41d2da7bc)

  
