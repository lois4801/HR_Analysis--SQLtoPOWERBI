

![giphy (1)](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/9401bb26-7ee4-4d9c-8939-6f66c815e5cc)

Please support me by following me in my social media accounts, For more projects to share like this. 

Github>>>>>>>https://github.com/lois4801

LinkedIn>>>>> https://www.linkedin.com/in/artemis-jay/).

# HR_Analysis
## This project is an Analysis of HR Data from year 2000 to 2023. 
-  This project has a raw data that hasnt been cleaned yet. Rows is comprised of 22215. It could be cleaned and corrected through excel or python, but for this project I will be focusing more in SQL. Then it will be imported in PowerBI for data visualization.If I have some more time, I will also include google looker studio.

----------------------------------------------------------------------------------------
## Problem Statement
This project has a raw data that hasn’t been cleaned yet. Rows is comprised of 22215. It could be cleaned and corrected through excel or python, but for this project I will be focusing more in SQL. Then it will be imported in PowerBI for data visualization. If I have some more time, I will also include google looker studio.
---------------------------------------------------------------------------------------
## Here are the following questions needed to be answered ( Revised, corrected and communicated)

### For Dashboard 1- Age and Gender Employee Analysis

** Ages>=18  means all employees who have hired from 18 above regardless if they are terminated or not ( termdate column is null or with value)

- What is the gender distribution/ breakdown of employees in the company? Ages>=18 
- What is the age vs gender distribution of employees in the company?
-  How does the gender distribution across departments ?
- How does the gender distribution across job titles?
- Termination rate by age?



### For Dashboard 2- Employee Summary1 Analysis

** Ages>=18  means all employees who have hired from 18 above regardless if they are terminated or not (( termdate column is null or with value)

- What is the race/ethnicity breakdown of employees in the company? Ages>=18
- How many employees work at headquarters versus remote locations?
- What is the distribution of employees across locations by state?
- What is the average length of employment for employees who have been terminated?
- Which department has the highest turnover or termination rate?
- How has the company's employee count changed over time based on hire and term dates?



### For Dashboard 3- Employee Summary2 Analysis
- What is the average length of employment for employees who have been terminated?
- What is the average length of employment for employees who have been terminated?
- Which department has the highest turnover rate?
- How has the company's employee count changed over time based on hire and term dates?
-  What is the tenure distribution for each department?
-----------------------------------------------------------------------------------
## Project Planning
![s4](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/af486e3a-84c5-4544-83f5-8d5f48135c9c)

-----------------------------------------------------------------------------------

## Process Map

![s5](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/65ada006-8037-4dbb-9d15-d2314330d6c5)

---------------------------------------------------------------------------------------
## Data ETL
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


### 2a. Converting birthdate and hiredate troubleshooting
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


### 2b. Converting the data under termdate column
### Original data
- ![termdate](https://github.com/lois4801/HR_Analysis/assets/96842662/c1c6f0ab-aaa8-4e6b-b23a-510cf0f9954e)

### TRIALS I MADE
- I got mixed up at first between null, not null, not empty, empty, filled, unfilled data, and blank cells. But to get my 
 brain wrap around it. I have troubleshooted what kind of data I want to appear.
- In my experience,  during designing the relational database it is important to know and set the critical values that you would want to appear  in your database system  otherwise people like me will get confuse and get a hard time cleaning and analyzing data. 

- There are many ways to solve this. It depends on your goal. I can convert first cells with data into YEAR-MONTH-DATE then fill the blank cells with null values or 0000-00-00  or just leave it blank. On my end I considered using trial 5.

 -  SEE BELOW TROUBLESHOOTING I HAVE MADE

-- TRIAL 1

![termdate1](https://github.com/lois4801/HR_Analysis/assets/96842662/33914cd6-bb6e-44ce-93fe-d83c9e48f398)


- TRIAL 2

![termdate2](https://github.com/lois4801/HR_Analysis/assets/96842662/01825099-0f7e-48e4-ab4f-2b300a9f6578)

- TRIAL 3
![termdate3](https://github.com/lois4801/HR_Analysis/assets/96842662/7d17f457-3190-49ad-aad0-146d57b598bc)

- TRIAL 4
![termdate4](https://github.com/lois4801/HR_Analysis/assets/96842662/ecb87fe0-2ca6-4d89-b417-a305cde5085a)

- TRIAL 5 ( THE ONE I CONSIDERED USING FOR NOW)
![termdate5](https://github.com/lois4801/HR_Analysis/assets/96842662/bab7988c-bf55-49b1-844e-7ba01afbccbb)

- Converting the blank cells into null values
![termdate6](https://github.com/lois4801/HR_Analysis/assets/96842662/7366024b-c30d-415c-982c-261fe46dca5d)


### 3. AGE ANOMALIES
- After adding an age column and calculated the age . I was expecting age like  positive values. But it seems that I these are unprecendented anomalies along the way that I have to analyze and clean up as well.

![1](https://github.com/lois4801/HR_Analysis/assets/96842662/3360205e-86f1-4f2d-b618-5d95b3079fff)

- I will walk you through my process of analyzing and cleaning the data
  
![age1](https://github.com/lois4801/HR_Analysis/assets/96842662/d04b17a6-d165-4ec0-a4bd-745135ecdecc)

![age2](https://github.com/lois4801/HR_Analysis/assets/96842662/e8c91985-59b5-4ed6-9a88-32483ef10648)

![age3](https://github.com/lois4801/HR_Analysis/assets/96842662/77102cdd-682e-4c6c-b805-77a17991c563)

![age4](https://github.com/lois4801/HR_Analysis/assets/96842662/be3aa69c-abd8-40a0-be55-1a795d64a281)

![age5](https://github.com/lois4801/HR_Analysis/assets/96842662/cc09f80a-99a3-48ad-913a-870eb529cfe1)

![age 6](https://github.com/lois4801/HR_Analysis/assets/96842662/a0f70537-aba5-41c2-b634-a1eab4b76d88)

![age7](https://github.com/lois4801/HR_Analysis/assets/96842662/d445dac8-883e-4f8d-b6a2-12874d236e66)

![age8](https://github.com/lois4801/HR_Analysis/assets/96842662/e32c86bf-3c56-4ce4-b943-e714666cb0bd)



YEAR IN COMPANY DATA ANOMALIES

![y1](https://github.com/lois4801/HR_Analysis/assets/96842662/56110ef5-4854-4d96-a8b9-d92e80a10912)


![y2](https://github.com/lois4801/HR_Analysis/assets/96842662/68334e94-8fcb-4d38-8f21-ee80e550a364)

-  It’s possible that there could be errors or inconsistencies in the data that need to be addressed. For example, the hire date or term date for those employees might be incorrect, or there could be issues with the calculation itself.
If the negative values are indeed errors, then you have a few options for how to handle them.

- One option would be to delete those rows from my  dataset, but this could potentially bias my results if those employees are not representative of the overall population.

- Second option would be to retain those rows but exclude them from any calculations or visualizations that involve the “years in company” variable.

- Third option is  to correct the errors, if possible, by updating the hire date or term date for those employees based on the assumption that it was mistype during data entry. This will allow me to include them to the rows with ZERO  YEARS IN THE COMPANY dataset later.

![y3](https://github.com/lois4801/HR_Analysis/assets/96842662/ec06cb42-41bd-4e6a-98ed-bfe4075f1839)

![image](https://github.com/lois4801/HR_Analysis/assets/96842662/8d56a2a1-7cfa-45b0-acf5-07a6741d0ab4)

### PowerBI- Troubleshooting
- Transforming my line graph into smooth curved. I found it in the following order Format Visual>> Visual>> Lines>> Linear.

![s5](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/ebd9bf78-b7a4-47d1-a99e-37df4a3e9a7c)

-	Creating my Area Chart. Choose all the  variables you needed and be sure to place the year in the x-axis. 
-	It should appear with a word YEAR instead of sum of year. 

![s6](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/ab9208dd-93be-41ef-a4f2-f0643c215f31)


- I have changed the colors of the area charts to match the color scheme of my dashboard. It took me sometime to find it. 

![image](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/cdd79dfe-7752-49af-b26e-1befc685ac95)

--------------------------------------------------------------------------------
-	Two maps I have created didn’t match with my goal to present remote and hybrid employees per state and city.
-	Because this project  computations are heavily created under the MySQL platform. I have to find a way to match my graphs and for them to communicate  and interacting with each other. 

#### HERES HOW for >>> Interactive Map and Bar chart  and Pie Chart for  REMOTE and HYBRID  EMPLOYEE COUNT PER STATE and CITY

- Select  REMOTE VS HEADQUARTERS dataset. (From  MySQL computed) and HR File( Cleaned and Transformed under MySQL). Then follow the checked marks for each file.

![s8](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/b2897c26-72d7-4702-808b-4ff24a2eb633)

![s9](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/08dc4909-072a-4098-8924-85fe6d257f98)

![s10](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/1a618973-fa48-4def-942d-f8f27fc44c67)

-----------------------------------------------------------------------------------

## PowerBI DASHBOARD RESULTS

### For Dashboard 1- Age and Gender Employee Analysis
![s1](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/48263f11-2f1a-4b28-89e3-48eb7a8d6fef)

### For Dashboard 2- Employee Summary1 Analysis
![s2](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/bb4cabf8-702f-4fd9-8d34-a677e5846a05)

### For Dashboard 3- Employee Summary2 Analysis
![s3](https://github.com/lois4801/HR_Analysis--SQLtoPOWERBI/assets/96842662/536d03c3-16a4-408d-b84a-1ccb7213b185)


--------------------------------------------------------------------------

## My Biggest Takeaway from this project 
-• Well defining and planning the dashboard contents  during the first process is very important especially if the owners’ questions are all over the place and vague.

-• Be sure to also clarify things if the question of the owner is vague. Example is turnover or termination count, rate, and total count.  

-• Be sure to also clarify or ask if some variables can be adjusted ( like using “ages>=18” instead of “ termdate is null” ) to capture all employees in the company.  

-• For as long as you have now the formula for termination rate etc. You can use the cleaned and transformed whole HR file to select for certain columns (attributions like age, gender, first name etc). 

-• What I did with this project>>>>computed the termination rate by department, then when I found that it is also important to include termination rate by age. I just click the age in the cleaned dataset.

-• After finalizing all the questions, I have decided to provide  three dashboards for more meaningful insights for each.





















  
