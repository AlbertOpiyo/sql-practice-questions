-- will use the Eyo white Database
--lets first retrieve all details of products from the product table
SELECT *
 FROM [EyoWhite].[CustomerTab].[CustomerOrdersTabl];

 -- you are working for a company that sources orders from different suppliers.
 -- your task is toretrieve analyse the quantities of orders made.
 -- retrieve a list of all unique orders made.
select distinct ProductID
from [EyoWhite].[CustomerTab].[CustomerOrdersTabl]

-- you are working for a company that sources products from varous suppliers. 
-- your task is to analyze quantities of the orders made.
-- retrieve a list of all product orders and display only their identity
select ProductID
from [EyoWhite].[CustomerTab].[CustomerOrdersTabl];

-- you work for an online company that ofers a wide range of products . your task is to 
-- analyze products within specific ranges to assst customers in finding products that meet their budget
-- a. retrieve a list of products that are affordable for budget conscoius customers(under $1 per product)
select ProductID,ProductDescription,Cost
from eyowhite.CustomerTab.CustomerProductTabl
where Cost <1;

--b. Find products that fall within a moderate price(between $2 and $5)
select ProductID,ProductDescription,Cost
from eyowhite.CustomerTab.CustomerProductTabl
where Cost between 2 and 5;

--c.identify highend products that caters to products looking for premium items(cosst over 6)
select ProductID,ProductDescription,Cost
from eyowhite.CustomerTab.CustomerProductTabl
where Cost > 6;

-- you are tasked with selecting specific products for a customer order based on a desired product IDs
--to fulfill the customer order, retrieve the following specific IDs(2,567, and,89)
select ProductID,ProductDescription,Cost
from eyowhite.CustomerTab.CustomerProductTabl
where ProductID in (2,567,89);

select ProductID,ProductDescription,Cost
from eyowhite.CustomerTab.CustomerProductTabl -- can also be used
where ProductID =2 or ProductID=567 or ProductID=89;

-- you are  workng for an ecomerce company, and you want to fnd products with a specific name.
--the customers want the products with a specific name i.e instant camera or phone stand
select ProductID,ProductDescription,Cost
from eyowhite.CustomerTab.CustomerProductTabl 
where ProductDescription='Instant Camera' or ProductDescription='Phone Stand';

-- you manage inventory for an online store and want to identify products ordered.
-- you are tasked with retrieving product details for quantity of items purchased on aparticular time that were more than 5
SELECT OrderID,CustomerID,ProductID,OrderQuantity,OrderDate
 FROM [EyoWhite].[CustomerTab].[CustomerOrdersTabl]
 where Not orderquantity=5;

 -- you work for an online store and want customers to find products that match certain description.
 --your task is to retrieve products that have certain keyword in their production description
 --retrieve products that have the word set in their descriptions.
 select ProductID,ProductDescription,Cost
from eyowhite.CustomerTab.CustomerProductTabl
where ProductDescription like  '%set%';

--- you are managing an employee database and you want to identify employee salaries who have not entered
-- on payroll. retrive job titles and IDs for employee whose name have not appeared on payroll
select EmployeeId,JobTitle
from eyowhite.employee.pay
where Salary is null;

--retrieve employee job title and IDS where names have apperaed on payroll
select EmployeeId,JobTitle
from eyowhite.employee.pay
where Salary is  not null;

-- you are managing an ecommerce platform and what to determine if there are products with a specific value.
-- your task is to check if there are products with a price above $6
select ProductID,ProductDescription,Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where cost > 6;

-- you are managing an eccomerce platform and your task is to determine f all
--prodcuts have a cost greater than $4
select *
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where cost > all (select Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where cost <4);

-- you are managing an ecommerce platform and your task is to check if there's at least one prodcut with a price
-- exceeding a certain threshold. check if there is any product with aprice greater than $4
select *
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where 4< any (select Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
);

-- you are managing employee payroll data and want to calculate total income i.e salary and bonus
-- and filter those exceeding a certain threshold. your task is to retreve employeeids, job titles, and calculated ncome for 
-- employees with more than $3000 dollars as total monthly income
select EmployeeID,JobTitle,(Salary+Bonus) as total_income
from EyoWhite.Employee.Pay
where (Salary+bonus) > 3000;

-- youre managing an employee payroll and want to calculate an hourly threshold by multiplying it by 100 and
-- filter employees whose threshold exceed  predefined limit. your task is to calculate the threshold and retrieve employeeids,
-- titles, hourly rates, and calculated thresholds for employees exceeding $1500
select EmployeeID,HourlyRate,(HourlyRate *1000) as thresholds
from EyoWhite.Employee.Pay
where (HourlyRate *1000)>1500 ;

-- you manage an online marketplace and you want to provide customers with product listing sorted by price range.
-- your task is to retrieve a list of products with their product descriptions and prices sorted in ascendng cost 
select ProductID,ProductDescription,Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
order by cost asc;

-- the customers now want to see the price range from the most expensive product
select ProductID,ProductDescription,Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
order by cost desc;

-- a customer wants to know a list of low cost products of less than $6 retrieve the products with ascendingorder of
-- all the products
select ProductID,ProductDescription,Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where cost < 6
order by cost asc;

-- now provide products with more than $3 in descending order
select ProductID,ProductDescription,Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where cost > 3
order by cost desc;

-- you have been tasked to create a list of affordable prodcuts using their description name in ascending order
--retrieve products under the $5 cost
select ProductID,ProductDescription,Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where cost <5
order by ProductDescription asc;

-- you have been instructed to a list of affordable products in your store sorted by their description name in descending
-- order alphabetically. retrieve the products in descending order and limit the products to under $5
select ProductID,ProductDescription,Cost
from [EyoWhite].[CustomerTab].[CustomerProductTabl]
where cost <5
order by ProductDescription desc;

-- you are managing an HR database and want to rank your employees according to their perfomance.
-- you want to order the employees first by their job titles in ascending order then by salary in descending order.
--retrieve employee details i.e- IDs, job title, and salaries using the instructions above
select EmployeeID,JobTitle,Salary
from EyoWhite.Employee.Pay
order by JobTitle asc, Salary desc;

-- you are managing an employee database and you want to generate a report on high salary employees together
-- with their jo titles . you want to order the employees first by their roles then by their salary in each department.
-- retrieve the employee details with job titles, id, salary and hire date for employee title salesman and shipper
select EmployeeID,JobTitle,HireDate,salary
from EyoWhite.Employee.Pay
where JobTitle in ('Salesman', 'Shipper')
order by JobTitle,Salary;

-- you are managing an online store and want to produce a balanced presentation of products.
-- you want to retrieve products ordered by their descripton in ascending order then price in ascending order
-- retrieve product details i.e ids, description, prices, using the above criteria
select ProductID,ProductDescription,Cost
from EyoWhite.CustomerTab.CustomerProductTabl
order by ProductDescription asc, cost asc;

--you are managing an inventory for a company and want to generate a reorder list of products.you priorities the products first
-- by their description in descending order then by unit cost in ascending order. retrieve ids, description and cost using the criteria
select ProductID,ProductDescription,Cost
from EyoWhite.CustomerTab.CustomerProductTabl
order by 2 desc, 3;

-- you are managing employee payroll data and need to perform various counnts to analyze the dataset.
-- your task is to count the followng
-- a. the total number of employees
select count(employeeid) as employee_ids
from EyoWhite.Employee.Pay;
--b.) number of distinct job titles in the organization 
select count ( distinct JobTitle) as  job_titles
from EyoWhite.Employee.Pay;
-- c, total number of salary record
select count(Salary) salary_count
from EyoWhite.Employee.Pay;
-- d total number of rows in employye.pay table
select count(*) as total_rows
from EyoWhite.Employee.Pay;

-- you are managing the payroll data and you need to calculate the total sum salaries of employees to understand
-- the organizaton payroll expenses.
select sum(Salary) as salary_expense
from EyoWhite.Employee.pay;


-- you are managing the payroll data and you need to calculate the average salaries of employees to understand
-- the organizaton payroll expenses.
select avg(Salary) as avg_salary_expense
from EyoWhite.Employee.pay;

-- you are managing the payroll data and need to analyze the salary information for your employees. your task is to
-- a. find the minimum salaries for your employees
select min(Salary) as min_salary_expense
from EyoWhite.Employee.pay;

-- a. find the maximum salaries for your employees
select max(Salary) as max_salary_expense
from EyoWhite.Employee.pay;

-- you are managing employee data and need to calculate total compensation for each employee. total compensation includes 
-- sum of salary and bonus . your task is to calcualte total compensation for each employee and avarage for each employee
--total compensation
select EmployeeID ,JobTitle,Salary,Bonus,(Salary+Bonus) as total_compensation
from EyoWhite.Employee.pay;
-- avergae salary
select avg(Salary+ Bonus) as avg_total_compensation
from EyoWhite.Employee.pay;

-- you are managing employee data and want to analyse the dstribution of employees across different cities.
-- your task is to list the unique combnations of employeeid and city to determine which employees are in each city
select  distinct EmployeeID,City
from EyoWhite.Employee.Employee;

select EmployeeID,City
from EyoWhite.Employee.Employee
group by EmployeeID,City;

-- you are managing employee payroll data and you want to analyze the distribution of employee salaries while showing the total
-- salry for each employee. your task is to calculate the total salary for each employee and list the unique combinations of 
-- salary and employeeid to understand how salaries are distributed among employees
select EmployeeID, sum(salary)
from EyoWhite.Employee.pay
group by EmployeeID, Salary;

-- you are managing employee data and want to analyze the population of employees in different cities. your task is to count 
-- the number of employees in each cities and list the cties alongside the employee counts
select city, count(employeeID) as employee_count
from EyoWhite.Employee.Employee
group by City;

-- you are managing employee data and want to analyse the population of employees n different cities.
-- your task is to count the number of employees in each city , list the cities alongside with their respective employees.
-- and sort the results in descending order of employee count
select city, count(EmployeeID) as employee_count
from EyoWhite.Employee.Employee
group by City
order by 2 desc;

-- you are managing employee data and want to analyse the population of employees n different cities.
-- your task is to count the number of employees in each city , list the cities alongside with their respective employees.
-- and sort the results in multiple columns
select city, count(employeeID) as employee_count
from EyoWhite.Employee.Employee
group by City
order by 1,2;

-- you are managing employee payroll data table and you want to analyze the distribution of employee total compensation
-- while also filtering out specific groups of employees based on salary conditions. calculate the salary plus the bonus
-- for each employee, list the unique combinations of salary and employeeid to understand how salaries are distributed among employees
-- and filter out employees whose salaries are above or equal to 3000
select EmployeeID, sum(salary+ bonus) as total_compensation
from EyoWhite.Employee.Pay
group by EmployeeID
having sum(salary+ bonus)<=3000;

-- you are managing employee data and want to analyze the population of employee in different cities.
-- your task is to count the number of employees in each city, list the cities along witht their respective employee count
--filter out cities with more than 3 employees and sort the results by the number of employees in descending order
select city, count(EmployeeID) as employee_count
from EyoWhite.Employee.Employee
group by city
having count(employeeid)<3
order by employee_count desc;

-- you are managing employee data and want to analyze the population of employee in different cities.
-- your task is to count the number of employees in each city, list the cities along witht their respective employee count
--filter out cities with more than 3 employees and sort the results using multiple columns
select city, count(EmployeeID) as employee_count
from EyoWhite.Employee.Employee
group by city
having count(employeeid)<3
order by 1,2 desc;

-- you are managing employee data and you want to create a report that displays the fullnames of employees by concatenating their
-- first name and last name. your task is to generate a list of employeeid alongside their fullnames
select EmployeeID, FirstName  + ' ' + LastName as fullname
from EyoWhite.Employee.Employee;

select EmployeeID, concat(FirstName, ' '  ,LastName) as fullname
from EyoWhite.Employee.Employee

-- you are managing employee data in employee table . and you want their privacy of phone numbers by replacing the last 4 digits
--of each phone number by "XXXX" for security reasons. your task is to create a report that displays the phonenumbers "XXX"
-- for all employees.
select EmployeeID,LastName,FirstName,phone,
	TRANSLATE(phone,'0123456789','XXXXXXXXXX') as protectednumber
from EyoWhite.Employee.Employee;

--you are managing employee data. your task is to convert the last and first names to upper character for uniformity
select UPPER(firstname) firstname ,upper(lastname) lastname
from EyoWhite.Employee.Employee;

-- you are managing employee data and you want to extract a portion of the numbers for a report . your task is to create
-- a report that displays a substring of the phone numbers starting from the 6th character with a length of 4 employees
select FirstName,lastname,phone,SUBSTRING(phone,6,4) as phone_substr
from EyoWhite.Employee.Employee;

-- you are managing employee data and have realised that some addresses have leading or trailing spaces that need to be
-- removed for consistency . your task is to create a report that displays employee information with cleaned and trimmed address
select EmployeeID,FirstName,LastName,trim(employeeaddress) as cleaned_address
from EyoWhite.Employee.Employee;

--you are managing employee data and you need to determine the length of both the lastname and firstname of employees for reporting purposes
-- your task is to create a report that displays the employeeids along with the length of their lastnames and first names
select FirstName, len(firstname) as firstnamelenght,lastname,len(lastname) as lastnamelength
from EyoWhite.Employee.Employee;

-- you are managing employee compensation data which includes information about hourly pay, salary, bonuses, . your task is to
-- create a report that calculates total compensation for each employee,considering all employees. handle null records gracefully
select EmployeeID,hourlyrate,salary,bonus,
 coalesce(salary,0) +coalesce(bonus,0)
from EyoWhite.Employee.pay;

--you are managing employee data, and you need to format the phone column to ensure that all phone numbers have consistent
-- lenght of 15 characters by adding trailing spaces where needed.this is essential for data consistency. do the task
select EmployeeID,FirstName,LastName,phone,len(phone), RIGHT(phone+REPLICATE('-',15),15) as formattednumber,
len(RIGHT(phone+REPLICATE('-',15),15))
from EyoWhite.Employee.Employee;

-- you are manging product data in the product table and you need to format the product description table column to esnure all stings
-- have the same length by adding tools or periods at the end . do this task
select ProductDescription,ProductDescription,LEN(PRODUCTDESCRIPTION),
left(REPLICATE('.',30) +ProductDescription,30),len(left(REPLICATE('.',30) +ProductDescription,30))
from eyowhite.CustomerTab.CustomerProductTabl;

-- you are managing product data,and the cost columnis currently stored as strings or money. you need to convert the cost column
-- to a numerical data type to perform accurate calculations and comparisons based on cost . your goal os to convert the price of all products 
select ProductID,ProductDescription,
cast(cost as float) as convertedcost
from eyowhite.CustomerTab.CustomerProductTabl;

-- ypu are managing employee data and you need to perform data transformations on the names and phone numbers for reporting purposes.
-- you want to create a new column called fullname that concatenates first name and lastname with a space inbetween . format the phone number column
-- to seperate the numbers between dashes.
select concat(firstname, ' ',lastname) as fullname,
concat(substring(phone,1,3),'-',SUBSTRING(phone, 4,3),'-',substring(phone,7,4))
from EyoWhite.Employee.Employee;

--you are managing employee data and you need to calculate the years of service for each employee based on their hiredate and lastdate
--you want to identify the years employeee have worked .calculate the years of service for each employee based and identify 
-- employees who have worked atleast seven years
select EmployeeID,HireDate,LastDate,DATEDIFF(year,hiredate,lastDate) as serviceyear
from EyoWhite.Employee.Pay
where DATEDIFF(year,hiredate,lastDate)>= 7 
--and year(hiredate) between 2001 and 2009 and 
--year(lastdate) between 2011 and 2012;

--you are managing employee data and you need to project the potential future salaries of employees based on their current salary, bonus
-- and a salary increase rate . emplloyees are eligible for a salary increase if they have been with the company for atlease 2 years
-- and their last date is between 2011 and 2012. the salary increase rat is 5%
select EmployeeID,jobtitle, HireDate,LastDate,salary, bonus,DATEDIFF(year,hiredate,lastDate) as serviceyear,
case when DATEDIFF(year,hiredate,lastDate)>= 2 
and year(lastdate) between 2011 and 2012 then salary * 1.05
else salary end as projectedsalary
from EyoWhite.Employee.Pay

-- you manage employee data, and you need to calculate performance bonuses for employees based on their job titles and salaries
-- employee with the job title manager are eligible for a 10% bonus on their current salary while other employees receive a 5% bonus.
-- however the bonus should only be calculated for employees whoselast date is between 2011 and 2012
select EmployeeID,jobtitle, HireDate,LastDate,salary, bonus,DATEDIFF(year,hiredate,lastDate) as serviceyear,
case when jobtitle like '%Manager%' then salary *1.10
else salary *1.05 end as futuresalary
from EyoWhite.Employee.Pay
where year(lastdate) between 2011 and 2012;

-- you need to calculate and update salaries for employees based on their job titles, salary and the curent month. employees with the job
-- title manager receive 10% bonus on their current salary if the current month is january. the other employeesif the current month is july,
-- they receive a 7% bonus on their salary . otherwise they all receive a stndard 5%.
SELECT EmployeeID,
JobTitle,
Salary AS CurrentSalary,
Bonus AS CurrentBonus,
Salary *
(CASE
WHEN MONTH (GETDATE ()) = 1 AND JobTitle = 'Manager' THEN 0.10
WHEN MONTH (GETDATE ()) = 7 AND JobTitle <> 'Manager' THEN 0.07
ELSE 0.05
END) AS PerformanceBonus
FROM eyowhite.Employee.Pay

--you manage employee data and you need to calculate and update salaries of employees based on their jon titles plus years of service
--employees with job title salesman have an elgibilty of a 10% increase if they have been in the company for more than 5 years.
--employeee with job title shipper receive a 5% salary increase if they have been in the company for more than 3 years.
--for all other employees no salary adjustment is made.
select EmployeeID,jobtitle, HireDate,LastDate,salary, bonus,DATEDIFF(year,hiredate,lastDate) as serviceyear,
case when jobtitle like '%salesman%'  and DATEDIFF(year,hiredate,lastDate)>5 then salary *1.10
	when jobtitle like '%shipper%'  and DATEDIFF(year,hiredate,lastDate)>3 then salary *1.05
else salary end as futuresalary
from EyoWhite.Employee.Pay

-- you manage employee data and you need to calculate overtime pay for employees who have worked more than 40 hours per week
--employees are paid their hourly rates and 1.5 times more for any additional hours they work . calculate and update the salries based on their weekly work
SELECT EmployeeID,
JobTitle,
HireDate,
HourlyRate,
LastDate,
CASE
WHEN HourlyRate IS NOT NULL AND DATEDIFF (WEEK, HireDate, GETDATE ()) > 0 THEN
(40 * HourlyRate) + ((CASE WHEN HourlyRate > 0 THEN (HourlyRate * 1.5) ELSE 0 END)
* (DATEDIFF (WEEK, HireDate, GETDATE ()) - 1) * 40)
ELSE
Salary
END AS CalculatedSalary
FROM eyowhite.Employee.Pay;

-- in your organization, employees accrue vacatons based on their yearsof service. employees with less than 5 years of service
-- receive 10 vacationsdays per year while those with 5 or more years of service receive 15 vacation days per year. calcuate the vaction days.
SELECT EmployeeID,
JobTitle,
HireDate,
DATEDIFF(YEAR, HireDate, LastDate) AS YearsOfService,
CASE
WHEN DATEDIFF(YEAR, HireDate, lastdate) < 5 THEN 10
ELSE 15
END AS VacationDaysAccrued
FROM eyowhite.Employee.Pay;

--in your organization, employees are eligible for retirement after they reach a certain number of years of service. You need to determine
--which employees are eligible for retirement based on their hiredates. identify anddisplay the employees eligible for retirment
-- based on 8 years of service or more 
SELECT EmployeeID,
JobTitle,
HireDate,
DATEDIFF(YEAR, HireDate,lastdate) AS YearsOfService, 
lastdate,
case when DATEDIFF(YEAR, HireDate,lastdate) >=8 then 'retirment'
else 'continue' end as retirmentcolumn
from EyoWhite.Employee.Pay;

-- in your organization you need to generate the hiredate and last date based on a certain format for reporting purposes.
-- YYYY-MM-DD. 
SELECT EmployeeID,
JobTitle,
CONVERT (NVARCHAR (10), HireDate, 120) AS HireDateFormatted,
CONVERT (NVARCHAR (10), LastDate, 120) AS LastDateFormatted
FROM eyowhite.Employee.Pay;

--in your organization , you want to generate a report to recognise employees' work anniverssary . the report should include 
-- the employees job title and a message congratulating them on their work annivessary. the message should specify the numbers
-- of years they have worked in the company.
SELECT JobTitle,
CONCAT ('Congratulations, "', JobTitle, '", on your ', DATEDIFF (YEAR,
HireDate, lastdate), '-year work anniversary with our company!') AS
AnniversaryMessage
FROM eyowhite.Employee.Pay;

-- In a company, you need to generate a report that combines employee personal information and their job-related details.
--You have two tables, Employee.Employee and Employee.pay.Create a report that combines employee 
--personal information (name, address, and contact) with their job-related details (job title, hire date, salary, and bonus)
select CONCAT(e.firstname, ' ',e.LastName) as fullname,
e.EmployeeAddress,e.Phone,
p.JobTitle,p.HireDate,p.Salary,p.Bonus
from EyoWhite.Employee.Employee as e
inner join  EyoWhite.Employee.pay as p
on  e.employeeid=p.employeeid;

--In a company, you want to evaluate employee performance by combining their personal information and job-related details. 
--You have two tables, Employee.Employee and Employee.pay. Create a report that combines 
--employee personal information (name, address,and contact) with their job-related details (job title, hire date, salary, and bonus) for
--performance evaluation. Additionally, calculate the total compensation (Salary + Bonus) for each employee
select CONCAT(e.firstname, ' ',e.LastName) as fullname,
e.EmployeeAddress,e.Phone,
p.JobTitle,p.HireDate,p.Salary,p.Bonus,
(p.Salary + p.Bonus) AS TotalCompensation
from EyoWhite.Employee.Employee as e
inner join  EyoWhite.Employee.pay as p
on  e.employeeid=p.employeeid;

--In a company, you want to identify employees eligible for promotion based on their job titlesa nd the duration 
--of their employment. You have two tables: Employee.Employee and Employee.pay. Create a report that identifies employees eligible for promotion based on the
--following criteria:
--Employees with the job title "Sales Support" or "Salesman." --Employees who have been with the company for at least 5 years
select CONCAT(e.firstname, ' ',e.LastName) as fullname,
p.JobTitle,p.HireDate,p.LastDate
from EyoWhite.Employee.Employee as e
inner join  EyoWhite.Employee.pay as p
on  e.employeeid=p.employeeid
where (p.JobTitle='salesman' or p.JobTitle='sales support' )and DATEDIFF(YEAR, p.HireDate,p.lastdate) >=5;

--In a company, you want to identify employees eligible for a year-end bonus based on their job
--titles and bonus amounts. You have two tables: Employee.Employee and Employee.pay.
--Create a report that lists employee details and sort the results by job title and bonus amount.
--You want to identify employees who are eligible for a bonus based on the following criteria:
--Employees with the job title "Salesman" or "Sales Support" and Employees who have received a bonus greater than or equal to $1000
select CONCAT(e.firstname, ' ',e.LastName) as fullname,
p.JobTitle,p.Salary,p.Bonus
from EyoWhite.Employee.Employee as e
inner join  EyoWhite.Employee.pay as p
on  e.employeeid=p.employeeid
where (p.JobTitle='salesman' or p.JobTitle='sales support' ) and bonus >=1000
order by 2,4;

--In a company, you want to analyse the tenure and salaries of employees in a specific role and
--also sorted by job title and salary amount. You have two tables: Employee.Employee and
--Employee.pay. Create a report that lists employee details for the role of ‘Salesman’ or sales
--support’ and sorts the results by job title and salary. Additionally, calculate the tenure (in years) of each employee from their Hire Date to the current date
SELECT CONCAT(e.firstname, ' ',e.LastName) as fullname,
e.City,
p.JobTitle,p.Salary,
DATEDIFF (YEAR, p.HireDate, p.lastdate) AS TenureInYears
FROM eyowhite.Employee.Employee e
INNER JOIN eyowhite.Employee.Pay p ON e.EmployeeID = p.EmployeeID
WHERE p.JobTitle = 'Salesman' or p.JobTitle = 'Sales Support'
ORDER BY p.JobTitle, p.Salary;

-- In a retail business, you want to analyse customer orders, including the product details, for the
--cities from which orders are made, sorted by order date and quantity. You have three tables:
--CustomerTab.CustomerTabl, CustomerTab.CustomerOrdersTabl, and
--CustomerTab.CustomerProductTabl. Create a report that lists customer orders and includes
--product details. Sort the results by order date and order quantity in any order.
SELECT t.CustomerName,
t.City,
O.OrderDate,
P.ProductDescription,
O.OrderQuantity
FROM eyowhite.CustomerTab.CustomerTabl t
INNER JOIN eyowhite.CustomerTab.CustomerOrdersTabl O ON t.CustomerID = O.CustomerID
INNER JOIN eyowhite.CustomerTab.CustomerProductTabl P ON O.ProductID = P.ProductID
ORDER BY O.OrderDate, O.OrderQuantity;

--In a retail business, you want to analyse customer orders, including the product details, for all
--customers, even if they haven't placed any orders. You have three tables:
--CustomerTab.CustomerTabl, CustomerTab.CustomerOrdersTabl, and
--CustomerTab.CustomerProductTabl. Create a report that lists all customers and their orders
--(if any), including product details. Sort the results by customer name, order date, and product description
SELECT t.CustomerName,
t.City,
O.OrderDate,
P.ProductDescription,
O.OrderQuantity
FROM eyowhite.CustomerTab.CustomerTabl t
left JOIN eyowhite.CustomerTab.CustomerOrdersTabl O ON t.CustomerID = O.CustomerID
left JOIN eyowhite.CustomerTab.CustomerProductTabl P ON O.ProductID = P.ProductID
ORDER BY t.CustomerName, O.OrderDate,P.ProductDescription;

--In a retail business, you want to analyse customer orders, including the product details, for all
--orders, even if the customers' information is missing. You have three tables:
--CustomerTab.CustomerTabl, CustomerTab.CustomerOrdersTabl, and
--CustomerTab.CustomerProductTabl. Create a report that lists all customer orders (if any) and
--includes customer information (if available), along with product details. Sort the results by customer name, order date, and product description
SELECT t.CustomerName,
t.City,
O.OrderDate,
P.ProductDescription,
O.OrderQuantity
FROM eyowhite.CustomerTab.CustomerTabl t
right JOIN eyowhite.CustomerTab.CustomerOrdersTabl O ON t.CustomerID = O.CustomerID
left JOIN eyowhite.CustomerTab.CustomerProductTabl P ON O.ProductID = P.ProductID
ORDER BY t.CustomerName, O.OrderDate,P.ProductDescription;

-- In your business, you want to analyse the relationship between customers and their orders.
--You have two tables: CustomerTab.CustomerTabl and CustomerTab.CustomerOrdersTabl.
--Create a comprehensive report that lists all customers and their orders, including those
--customers who haven't placed any orders yet and those orders that have no associated
--customer information. Sort the results alphabetically by customer name and by order date
SELECT t.CustomerName,
t.Address,
t.City,
t.ZipCode,
t.Phone,
O.OrderID,
O.OrderQuantity,
O.OrderDate
FROM eyowhite.CustomerTab.CustomerTabl t
FULL JOIN eyowhite.CustomerTab.CustomerOrdersTabl O ON t.CustomerID = O.CustomerID
ORDER BY t.CustomerName, O.OrderDate;

--In your company, you want to promote carpooling among employees who live in the same city
--to reduce transportation costs and environmental impact. Identify pairs of employees who live
--in the same city and can potentially carpool together. Create a list of these employee pairs,
--along with their contact information. Use the Employee.Employee table
select  e. EmployeeID AS EmployeeID1,
concat(e. LastName,' ',e. FirstName) AS fullnameone,
e. Phone AS Employeephoneone,
ep. EmployeeID AS EmployeeiD2,
concat(ep. LastName,' ',ep. FirstName) AS fullnametwo,
ep. Phone AS Employeephonetwo,
e. City AS CommonCity
from eyowhite.employee.employee as e
join eyowhite.employee.employee as ep
on e.city=ep.City and e. EmployeeID < ep.EmployeeID;

-- In a retail business, you want to analyse customer orders, including the product details, even
--if there might be missing orders for certain products. You have two tables:
--CustomerTab.CustomerOrdersTabl, and CustomerTab.CustomerProductTabl. Create a report
--that lists all product descriptions and their orders (if any).
SELECT t.ProductDescription, O.OrderQuantity
FROM eyowhite.CustomerTab.CustomerProductTabl t
LEFT OUTER JOIN eyowhite.CustomerTab.CustomerOrdersTabl O
ON t.ProductID = O.ProductID;

-- In a human resources analysis project, you have two tables: Employee.Employee and
-- Employee.Pay. You want to calculate the total compensation for each employee, which
-- includes their salary and bonus. You need to create a report that shows the total compensation for each employee
SELECT E.EmployeeID,
E.LastName,
E.FirstName,
(EP.Salary + EP.Bonus) AS TotalCompensation
FROM eyowhite.Employee.Employee E
CROSS JOIN eyowhite.Employee.Pay EP
ORDER BY E.EmployeeID;

--In a company's human resources analysis project, you have two tables: Employee.Employee
--and Employee.Pay. The company is interested in identifying employees with the highest
--bonuses. They want to create a report that lists the top five employees with the highest
--bonuses and includes their names and bonus amounts

SELECT
E.LastName,
E.FirstName,
EP.Bonus
FROM eyowhite.Employee.Employee E
INNER JOIN eyowhite.Employee.Pay EP ON E.EmployeeID = EP.EmployeeID
WHERE EP.Bonus IN (
SELECT TOP 5 Bonus
FROM eyowhite.Employee.Pay
)
ORDER BY EP.Bonus DESC;

--You want to find customers who have placed orders with a total quantity greater than a certain
--threshold. Assuming we want to find customers, who have placed orders with a total order
--quantity greater than 25. 
SELECT CustomerName
FROM eyowhite.CustomerTab.CustomerTabl
WHERE CustomerID IN (
SELECT CustomerID
FROM eyowhite.CustomerTab.CustomerOrdersTabl
GROUP BY CustomerID
HAVING SUM(OrderQuantity) > 25
);

--Calculate the total cost of products ordered by each customer and identify the customers who
--have spent the most on their orders.
SELECT
CustomerID,
SUM(order_total) AS total_spent
FROM (
SELECT
o.CustomerID,
p.Cost * o.OrderQuantity AS order_total
FROM
eyowhite.CustomerTab.CustomerOrdersTabl o
JOIN
eyowhite.CustomerTab.CustomerProductTabl p ON o.ProductID = p.ProductID
) AS customer_orders
GROUP BY
CustomerID
ORDER BY
total_spent DESC;

--Find the products that have never been ordered by any customer
SELECT
p.ProductID,
p.ProductDescription
FROM
eyowhite.CustomerTab.CustomerProductTabl p
LEFT JOIN
(
SELECT DISTINCT
ProductID
FROM
eyowhite.CustomerTab.CustomerOrdersTabl
) AS ordered_products
ON
p.ProductID = ordered_products.ProductID
WHERE
ordered_products.ProductID IS NULL;

--Calculate the average cost of products ordered by each customer, and then identify customers
--whose average order cost is above a threshold of 50.
SELECT
CustomerID,
AVG(order_total) AS average_order_cost
FROM (
SELECT
o.CustomerID,
p.Cost * o.OrderQuantity AS order_total
FROM
eyowhite.CustomerTab.CustomerOrdersTabl o
JOIN
eyowhite.CustomerTab.CustomerProductTabl p ON o.ProductID = p.ProductID
) AS customer_orders
GROUP BY
CustomerID
HAVING
AVG(order_total) > 50;

--Find the average salary for employees who joined the company in the same year as the
--employee with the highest salary, and also provide the count of such employees
SELECT AVG(EP.Salary) AS AverageSalary, COUNT(*) AS EmployeeCount
FROM eyowhite.Employee.Pay AS EP
WHERE YEAR(EP.HireDate) = (
SELECT YEAR(HireDate)
FROM eyowhite.Employee.Pay
WHERE Salary = (
SELECT MAX(Salary)
FROM eyowhite.Employee.Pay
)
);

-- Identify employees who are eligible for a promotion based on the following criteria: they must
--have been with the company for at least five years, and their current salary is below the
--average salary of all employees in the same job title
SELECT E.EmployeeID, E.FirstName, E.LastName, EP.JobTitle, EP.Salary
FROM eyowhite.Employee.Employee AS E
INNER JOIN eyowhite.Employee.Pay AS EP ON E.EmployeeID = EP.EmployeeID
WHERE EP.HireDate <= DATEADD(YEAR, -5, GETDATE())
AND EP.Salary < (
SELECT AVG (EP2.Salary)
FROM eyowhite.Employee.Pay AS EP2
WHERE EP2.JobTitle = EP.JobTitle
);

--A retail company wants to analyse its customer base to identify high-value customers. To do
--this, they need to find the top 10 customers who have placed the highest total quantity of
--orders. Additionally, they want to know the addresses of these top 10 customers. 
SELECT
c.CustomerName,
c.Address
FROM
eyowhite.CustomerTab.CustomerTabl c
WHERE
c.CustomerID IN (
SELECT TOP 10
o.CustomerID
FROM
eyowhite.CustomerTab.CustomerOrdersTabl o
GROUP BY
o.CustomerID
ORDER BY
SUM(o.OrderQuantity) DESC
);

--A retail company wants to create a consolidated list of top-selling and least-selling products
--from their inventory. They also want to include the product cost in the report. However, the
--data is stored in a single table: The Product table. To create this report, they need to combine
--the necessary information from the Product table into a single result set.
SELECT
ProductID,
ProductDescription,
Cost,
'Top-Selling' AS SalesCategory
FROM
eyowhite.CustomerTab.CustomerProductTabl
WHERE
ProductID IN (
SELECT TOP 5
ProductID
FROM
eyowhite.CustomerTab.CustomerProductTabl
ORDER BY
Cost DESC
)
UNION

-- Query to retrieve least-selling products
SELECT
ProductID,
ProductDescription,
Cost,
'Least-Selling' AS SalesCategory
FROM
eyowhite.CustomerTab.CustomerProductTabl
WHERE
ProductID IN (
SELECT TOP 5
ProductID
FROM
eyowhite.CustomerTab.CustomerProductTabl
ORDER BY
Cost ASC
);

-- A company wants to create a single list of all products and customers that are associated with
--a particular address for marketing purposes. However, the data is stored in two separate
--tables: Product table and Customer table. To achieve this, they need to combine the relevant
--information from both tables into a single result set for a specific city
SELECT
ProductID,
ProductDescription AS Name,
NULL AS Address
FROM
eyowhite.CustomerTab.CustomerProductTabl
UNION
-- Query to retrieve customers from the specified city
SELECT
CustomerID,
CustomerName AS Name,
City AS Location
FROM
eyowhite.CustomerTab.CustomerTabl;

--A company wants to identify customers who have never placed an order. They have customer
--information stored in the Customer table and order information in the Order table. To find
--customers who have not placed orders, they need to combine information from both sources
--and identify customers who do not have any corresponding orders
SELECT
c.CustomerID,
c.CustomerName,
c.Address,
c.City
FROM
eyowhite.CustomerTab.CustomerTabl c
EXCEPT
-- Query to retrieve customers who have placed orders
SELECT
c.CustomerID,
c.CustomerName,
c.Address,
c.City
FROM
eyowhite.CustomerTab.CustomerTabl c
JOIN
eyowhite.CustomerTab.CustomerOrdersTabl o
ON
c.CustomerID = o.CustomerID;

--A company wants to identify products that have never been ordered by any customers. They
--have product information stored in the Product table and order information in the Order table.
--To find products that have not been ordered, they need to combine information from both
--sources and identify products that do not have any corresponding orders
SELECT
p.ProductID,
p.ProductDescription,
p.Cost
FROM
eyowhite.CustomerTab.CustomerProductTabl p
EXCEPT
-- Query to retrieve products that have been ordered
SELECT
p.ProductID,
p.ProductDescription,
p.Cost
FROM
eyowhite.CustomerTab.CustomerProductTabl p
JOIN
eyowhite.CustomerTab.CustomerOrdersTabl o
ON
p.ProductID = o.ProductID;

--A company wants to analyse its payroll expenses and generate a report that provides insights
--into the total salary expenditure by job title and department. The company stores employee
--pay-related information in the Employee Pay table. To create a comprehensive payroll report,
--they need to calculate subtotals and a grand total of salary expenses, considering both job
--titles and departments
-- the rollup functions creates subtotals and totals. it is an extension of the groupby
SELECT
JobTitle,
EmployeeID,
SUM(Salary) as TotalSalary
FROM
eyowhite.Employee.Pay
GROUP BY ROLLUP (JobTitle, EmployeeID );

-- A company wants to know the total number of orders placed by each customer, as well as the
--total quantity of each product ordered by each customer
SELECT CustomerID, ProductID,
COUNT(*) AS TotalOrders,
SUM(OrderQuantity) AS TotalQuantity
FROM eyowhite.CustomerTab.CustomerOrdersTabl
GROUP BY CustomerID, ProductID
WITH ROLLUP;

-- A company wants to know the total number of orders placed by each customer, as well as the
--total quantity of each product ordered by each customer, grouped by month using the Ordertable.
SELECT CustomerID, ProductID, MONTH(OrderDate) AS OrderMonth,
COUNT(*) AS TotalOrders,
SUM(OrderQuantity) AS TotalQuantity
FROM eyowhite.CustomerTab.CustomerOrdersTabl
GROUP BY CustomerID, ProductID, MONTH(OrderDate)
WITH ROLLUP;

--A company wants to know the total salary paid to each job title using the Employee Pay table.
SELECT JobTitle, SUM(Salary) AS TotalSalary
FROM eyowhite.Employee.Pay
GROUP BY JobTitle
WITH ROLLUP;

SELECT JobTitle, SUM(Salary) AS TotalSalary
FROM eyowhite.Employee.Pay
GROUP BY  ROLLUP (JobTitle)


-- A company wants to analyse its employee compensation data to gain insights into salary
--trends, job titles, and compensation expenses. They have two tables, the "Employee" table
--and the "EmployeePay" table
SELECT
JobTitle AS Job_Title,
City AS City,
YEAR(HireDate) AS Hire_Year,
SUM(Salary) AS Total_Compensation_Expense
FROM
eyowhite.Employee.Pay
JOIN
eyowhite.Employee.Employee ON eyowhite.Employee.Pay.EmployeeID = eyowhite.Employee.Employee.EmployeeID
GROUP BY
CUBE (JobTitle, City, YEAR(HireDate))
ORDER BY
Job_Title, City, Hire_Year;

-- A retail company wants to analyse its sales data and customer information to make informed
--decisions about expanding its market presence. They have two tables, the "Order" table, and
--the "Customer" table. And maybe the product table too
SELECT
p.ProductID AS Product,
c.City AS City,
YEAR(o.OrderDate) AS Order_Year,
SUM(o.OrderQuantity * p.Cost) AS "Revenue"
FROM
eyowhite.CustomerTab.CustomerOrdersTabl o
JOIN
eyowhite.CustomerTab.CustomerTabl c ON o.CustomerID = c.CustomerID
JOIN
eyowhite.CustomerTab.CustomerProductTabl p ON o.ProductID = p.ProductID
GROUP BY
CUBE (p.ProductID, c.City, YEAR(o.OrderDate))
ORDER BY Product, City, Order_Year;

-- A retail company, "ShopSmart," wants to analyse customer purchases to identify loyal
--customers and provide them with exclusive discounts. They have two tables, "Product" and
--"Order," . Determine whether a customer is a loyal customer based on the total amount spent.
--A loyal customer is defined as someone who has spent more than 200 in total
SELECT
CustomerID,
CASE
WHEN SUM(OrderQuantity * Cost) > 500 THEN 'Loyal Customer'
ELSE 'Regular Customer'
END AS CustomerStatus,
SUM(OrderQuantity * Cost) AS TotalAmountSpent
FROM eyowhite.CustomerTab.CustomerOrdersTabl t
JOIN eyowhite.CustomerTab.CustomerProductTabl p ON t.ProductID =p.ProductID
GROUP BY CustomerID
HAVING SUM(OrderQuantity * Cost) > 200;

--A retail company, "SaleSmart," wants to analyse product sales data to identify which products
--should be included in a new promotional campaign. They have two tables, "Product" and
--"Order," and need to identify products that meet specific criteria for promotion. Identify
--products that have generated total sales revenue exceeding 1,000. Determine which products
--have been sold more than 100 times. Identify products with a profit margin of at least 30%.
--Profit margin is defined as (Profit / Revenue) * 100, where Profit = Total Sales Revenue - Total
--Cost. Find products that have not been sold at all.

SELECT
ProductDescription,
Cost,
SUM(OrderQuantity * Cost) AS TotalRevenue,
SUM(OrderQuantity) AS TotalQuantitySold,
((SUM(OrderQuantity * Cost) - COUNT(OrderID) * Cost) / SUM(OrderQuantity *
Cost)) * 100 AS ProfitMargin,
CASE
WHEN SUM(OrderQuantity * Cost) > 500 THEN 'High Sales'
ELSE 'Low Sales'
END AS SalesCategory,
CASE
WHEN SUM(OrderQuantity) > 100 THEN 'High Demand'
ELSE 'Low Demand'
END AS DemandCategory,
CASE
WHEN ((SUM(OrderQuantity * Cost) - COUNT(OrderID) * Cost) / SUM
(OrderQuantity * Cost)) * 100 >= 30 THEN 'High Profit Margin'
ELSE 'Low Profit Margin'
END AS ProfitMarginCategory,
CASE
WHEN SUM(OrderQuantity) = 0 THEN 'Not Sold'
ELSE 'Sold'
END AS SoldStatus
FROM eyowhite.CustomerTab.CustomerOrdersTabl t
JOIN eyowhite.CustomerTab.CustomerProductTabl p ON t.ProductID =p.ProductID
GROUP BY ProductDescription, Cost
HAVING SUM(OrderQuantity * Cost) > 500 OR SUM(OrderQuantity) > 100 OR ((SUM
(OrderQuantity * Cost) - COUNT(OrderID) * Cost) / SUM(OrderQuantity * Cost)) *
100 >= 30 OR SUM(OrderQuantity) = 0;

--In a banking institution, there is a need to optimise cross-selling of financial products to its customers.
--The bank wants to identify opportunities for cross-selling financial products to its customers based on
--their account types and balances. Specifically, they want to find customers who have a certain type
--of account (e.g., savings account) with a balance above 5000 and offer them a related financial
--product (e.g., a Certificate of Deposit or Investment Plan). Use the Finance.UniqueCustomers and
--Finance.UniqueAccounts tables

select c.CustomerID,
c.FirstName,
c.LastName,
c.Email,
c.PhoneNumber,
a.AccountID,
a.AccountType,
a.Balance
from [Finance and Banking].Finance.UniqueAccounts as a
inner join [Finance and Banking].Finance.UniqueCustomers as c
on c.CustomerID = a.CustomerID
WHERE
a.AccountType = 'Savings' 
AND a.Balance >= 5000;

--In a banking institution, there is a pressing need to detect and prevent fraudulent activities within
--customer accounts. The bank wants to proactively identify potential instances of fraud by monitoring
--account transactions and identifying suspicious patterns. Specifically, they want to find accounts
--where the balance suddenly drops significantly or where there are multiple large withdrawals in a
--short period of time. The following instances will be analysed:
--Balance < 0) -- Detect negative balances, which could indicate overdraft or unauthorized transactions.
 --OR
--(Amount < 1000) -- Detect large withdrawals (you can adjust the threshold)
-- OR
--(Amount > 5000); -- Detect large deposits (you can adjust the threshold)
--Use Finance.UniqueCustomers, Finance.UniqueAccounts and Finance.UniqueTransations tables
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
a.AccountID,
a.AccountType,
a.Balance,
t.TransactionDate,
t.Amount
FROM
[Finance and Banking].Finance.UniqueCustomers as c
INNER JOIN
[Finance and Banking].Finance.UniqueAccounts as a ON c.CustomerID = a.CustomerID
INNER JOIN
[Finance and Banking].finance.UniqueTransactions as t ON a.AccountID = t.AccountID
WHERE
(a.Balance < 0)
OR
(t.Amount < 1000)
OR
(t.Amount > 5000);

--A bank wants to improve its marketing efforts by segmenting its customers based on their account
--behaviour and demographics. The bank aims to create targeted marketing campaigns tailored to
--specific customer segments. They want to categorise customers based on their average account
--balances. The segments are defined as follows:
-- "High-Value Customer" if the average balance is greater than or equal to 5,000.
--"Medium-Value Customer" if the average balance is between 1,000 and 5,000.
--"Low-Value Customer" if the average balance is below 1,000.
--Use the Finance.UniqueCustomers and Finance.Accounts tables.
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
AVG(a.Balance) AS AverageBalance,
CASE
WHEN AVG(a.Balance) >= 5000 THEN 'High-Value Customer'
WHEN AVG(a.Balance) >= 1000 AND AVG(a.Balance) < 5000 THEN 'Medium-Value
Customer'
ELSE 'Low-Value Customer'
END AS CustomerSegment
FROM
[Finance and Banking].Finance.UniqueCustomers c
INNER JOIN
[Finance and Banking].Finance.UniqueAccounts a ON c.CustomerID = a.CustomerID
GROUP BY
c.CustomerID, c.FirstName, c.LastName

--A bank wants to analyse the distribution of different account types among its customers and determine
--the average balance for each account type. This analysis will help the bank understand the popularity
--of different account types and their average account balances

-- Count the number of customers for each account type
SELECT
A.AccountType,
COUNT(DISTINCT C.CustomerID) AS NumberOfCustomers
FROM
[Finance and Banking].Finance.UniqueAccounts A
INNER JOIN
[Finance and Banking].Finance.UniqueCustomers C ON A.CustomerID = C.CustomerID
GROUP BY
A.AccountType
ORDER BY
A.AccountType;

-- Calculate the average balance for each account type
SELECT
A.AccountType,
AVG(A.Balance) AS AverageBalance
FROM
[Finance and Banking].Finance.UniqueAccounts A
GROUP BY
A.AccountType
ORDER BY
A.AccountType;

--A bank wants to identify accounts that are at risk of overdrawing, i.e., having a negative
--balance. The bank wants to notify customers whose account balances are close to zero to
--prevent overdraft fees and ensure better customer satisfaction. Specifically, the bank wants to
--find accounts with balances below 1000. Use the Finance.UniqueAccounts table and
--Finance.UniqueCustomers table
DECLARE @Threshold DECIMAL(10, 2) = 1000.00;
-- Identify accounts at risk of overdrawing
SELECT
C.CustomerID,
C.FirstName,
C.LastName,
A.AccountID,
A.AccountType,
A.Balance
FROM
[Finance and Banking].Finance.UniqueAccounts A
INNER JOIN
[Finance and Banking].Finance.UniqueCustomers C ON A.CustomerID = C.CustomerID
WHERE
A.Balance < @Threshold;

--A bank wants to identify and analyse inactive accounts to improve customer engagement and
--reduce account maintenance costs. An account is considered inactive if there have been no
--transactions (deposits or withdrawals) in the last 48 months. The bank aims to identify these
--inactive accounts and notify customers to encourage account activity. Use the
--Finance.UniqueAccounts table and Finance.UniqueCustomers table and the
--Finance.UniqueTansactions table
SELECT
C.CustomerID,
C.FirstName,
C.LastName,
A.AccountID,
A.AccountType,
A.Balance
FROM
[Finance and Banking].Finance.UniqueCustomers C
INNER JOIN
[Finance and Banking].Finance.UniqueAccounts A ON C.CustomerID = A.CustomerID
LEFT JOIN
[Finance and Banking].Finance.UniqueTransactions T ON A.AccountID = T.AccountID
GROUP BY
C.CustomerID, C.FirstName, C.LastName, A.AccountID, A.AccountType, A.Balance
HAVING
MAX(T.TransactionDate) IS NULL OR
MAX(T.TransactionDate) < DATEADD(MONTH, -48, GETDATE());

--A bank wants to analyse transaction patterns at its branches to assess the performance of each
--branch in terms of transaction volume. The bank aims to identify branches with the highest and lowest
--transaction counts for a specified period. The task is to analyse branch transaction counts for the
--periods between 2022 and 2023. Use the Finance.UniqueAccounts, Finance.UniqueTransactions and
--Finance.UniqueAccountBranches tables

DECLARE @StartDate DATE = '2022-01-01';
DECLARE @EndDate DATE = '2023-12-31';

SELECT
B.BranchID,
B.BranchName,
B.Location,
COUNT(T.TransactionID) AS TransactionCount
FROM
[Finance and Banking].Finance.UniqueBranches B
LEFT JOIN
[Finance and Banking].Finance.UniqueAccountBranches AB ON B.BranchID = AB.BranchID
JOIN [Finance and Banking].finance.UniqueTransactions T ON AB.AccountID = T.AccountID
WHERE
T.TransactionDate BETWEEN @StartDate AND @EndDate
GROUP BY
B.BranchID, B.BranchName, B.Location
ORDER BY
TransactionCount DESC

--A bank wants to analyse the distribution of its customer accounts across its branches to assess branch
--popularity and account allocation. The bank aims to identify branches with the highest and lowest
--numbers of associated accounts and understand whether certain branches attract more customers.
--Use the Finance.UniqueAccounts, Finance.UniqueTransactions andFinance.UniqueAccountBranches tables
SELECT
B.BranchID,
B.BranchName,
B.Location,
COUNT(AB.AccountID) AS AccountCount
FROM
[Finance and Banking].Finance.UniqueBranches B
LEFT JOIN
[Finance and Banking].Finance.UniqueAccountBranches AB ON B.BranchID = AB.BranchID
GROUP BY
B.BranchID, B.BranchName, B.Location
ORDER BY
AccountCount DESC--A bank wants to generate a summary of account balances for each branch to assess the financial
--performance of its branches. The bank aims to determine the total balance of accounts associated
--with each branch. Use the Finance.UniqueAccounts, Finance.UniqueTransactions and Finance.UniqueAccountBranches tables.
SELECT
B.BranchName,
B.Location,
B.City,
SUM(A.Balance) AS TotalBalance
FROM
[Finance and Banking].Finance.UniqueBranches B
LEFT JOIN
[Finance and Banking].Finance.UniqueAccountBranches AB ON B.BranchID = AB.BranchID
LEFT JOIN
[Finance and Banking].Finance.UniqueAccounts A ON AB.AccountID = A.AccountID
GROUP BY
B.BranchName, B.Location, B.City
ORDER BY
B.BranchName

--A healthcare facility wants to track and manage appointments between patients and doctors efficiently.
--The facility aims to create a system that records appointment details, including patient information,
--doctor information, appointment date and time, and the purpose of the appointment. Use the
--Medical.Appointments, Medical.Patients and the Medical.Doctors tables
SELECT
A.AppointmentID,
P.FirstName AS PatientFirstName,
P.LastName AS PatientLastName,
P.DateOfBirth AS PatientDateOfBirth,
P.Gender AS PatientGender,
P.PhoneNumber AS PatientPhoneNumber,
P.Email AS PatientEmail,
D.FirstName AS DoctorFirstName,
D.LastName AS DoctorLastName,
D.Specialisation AS DoctorSpecialisation,
D.PhoneNumber AS DoctorPhoneNumber,
D.Email AS DoctorEmail,
A.AppointmentDateTime,
A.Purpose
FROM
[HealthCare].Medical.Appointments A
INNER JOIN
[HealthCare].Medical.Patients P ON A.PatientID = P.PatientID
INNER JOIN
[HealthCare].Medical.Doctors D ON A.DoctorID = D.DoctorID
ORDER BY
A.AppointmentDateTime;--A healthcare facility wants to manage medication prescriptions for patients efficiently. The facility aims
--to create a system that records medication details, including medication names, dosages, prescribing
--doctors, prescription dates, and expiration dates. This system will help in tracking medication usage
--and ensuring patients receive the right medications at the right time. Use the Medical.Appointments,
--Medical.Patients, Medical.Doctors and Medical.Medications tables.SELECT
P.FirstName AS PatientFirstName,
P.LastName AS PatientLastName,
P.DateOfBirth AS PatientDateOfBirth,
P.Gender AS PatientGender,
P.PhoneNumber AS PatientPhoneNumber,
P.Email AS PatientEmail,
D.FirstName AS DoctorFirstName,
D.LastName AS DoctorLastName,
D.Specialisation AS DoctorSpecialisation,
A.AppointmentDateTime,
A.Purpose AS AppointmentPurpose,
M.MedicationName,
M.Dosage,
M.PrescriptionDate,
M.ExpiryDate
FROM
[HealthCare].Medical.Patients P
INNER JOIN
[HealthCare].Medical.Appointments A ON P.PatientID = A.PatientID
INNER JOIN
[HealthCare].Medical.Doctors D ON A.DoctorID = D.DoctorID
LEFT JOIN
[HealthCare].Medical.Medications M ON A.PatientID = M.PatientID
ORDER BY
A.AppointmentDateTime, M.PrescriptionDate;--A healthcare facility aims to efficiently manage and track the prescription history of patients. Patients
--should be able to access their prescription history, including prescribed medications, dosages,
--prescribing doctors, prescription dates, and medication expiration dates. Doctors should have access
--to their patients' prescription histories to make informed medical decisions. Use the Medical.Patients,Medical.Medications and Medical.Doctors tablesSELECT
P.FirstName AS PatientFirstName,
P.LastName AS PatientLastName,
P.DateOfBirth AS PatientDateOfBirth,
P.Gender AS PatientGender,
P.PhoneNumber AS PatientPhoneNumber,
P.Email AS PatientEmail,
D.FirstName AS DoctorFirstName,
D.LastName AS DoctorLastName,
D.Specialisation AS DoctorSpecialisation,
M.MedicationName,
M.Dosage,
M.PrescriptionDate,
M.ExpiryDate
FROM
[HealthCare].Medical.Patients P
INNER JOIN
[HealthCare].Medical.Medications M ON P.PatientID = M.PatientID
INNER JOIN
[HealthCare].Medical.Doctors D ON M.PrescribingDoctorID = D.DoctorID
ORDER BY
P.PatientID, M.PrescriptionDate;

--A pharmaceutical company is developing a new medication called Surgeonix to treat a specific
--medical condition. They want to know which patients in their database are most likely to benefit from
--this medication. Use the Medical.Patients and Medical.Medications tables

SELECT PatientID, FirstName, LastName, DateOfBirth, Gender, PhoneNumber, Email
FROM [HealthCare].Medical.Patients
WHERE PatientID IN (
SELECT PatientID
FROM [HealthCare].Medical.Medications
WHERE MedicationName = 'Surgeonix'
);

--A health insurance company wants to know which medications are most commonly prescribed
--to patients under a certain age group. The task is to find the medications that are most
--commonly prescribed to patients under the age of 18. Use the Medical.Medications andMedical.Patients tables

SELECT MedicationName, COUNT(*) AS NumPrescriptions
FROM [HealthCare].Medical.Medications
WHERE PatientID IN (
SELECT PatientID
FROM [HealthCare].Medical.Patients
WHERE DateOfBirth < '2004-01-01'
)
GROUP BY MedicationName
ORDER BY NumPrescriptions DESC;

--A hospital wants to know which doctors are prescribing the most medications to patients with
--a certain purpose of hospital visits. The task is to find the doctors who are prescribing the most
--medications to patients with 'Child infections'. Use the Medical.Medications andMedical.Appointments tables
SELECT PrescribingDoctorID, COUNT(*) AS NumPrescriptions
FROM [HealthCare].Medical.Medications
WHERE PatientID IN (
SELECT PatientID
FROM [HealthCare].Medical.Appointments
WHERE Purpose = 'Child infections'
)
GROUP BY PrescribingDoctorID
ORDER BY NumPrescriptions DESC;

--A pharmaceutical company wants to know which doctors are prescribing their new medication,
--called " Meditrex ", the most often. Use the Medical.Medications table.

SELECT PrescribingDoctorID, COUNT(*) AS NumPrescriptions
FROM [HealthCare].Medical.Medications
WHERE MedicationName = 'Meditrex'
GROUP BY PrescribingDoctorID
ORDER BY NumPrescriptions DESC;

--Find all doctors who have prescribed more than the average number of medications to their patients.
--Use the Medical.Doctors, Medical.Appointments and Medical.Medications tables.

SELECT d.DoctorID, AVG(m.MedicationID) AS AvgMedications
FROM  [HealthCare].Medical.Doctors d
JOIN  [HealthCare].Medical.Appointments a ON d.DoctorID = a.DoctorID
JOIN  [HealthCare].Medical.Medications m ON a.PatientID = m.PatientID
GROUP BY d.DoctorID
HAVING AVG(m.MedicationID) > (SELECT AVG(m.MedicationID)
FROM  [HealthCare].Medical.Medications m);