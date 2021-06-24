
-- ******SUB QUERIES AND NESTED SELECTs********
-- How does a typical Nested SELECT statement syntax look?

-- SELECT column_name [, column_name ]
-- FROM table1 [, table2 ]
-- WHERE column_name OPERATOR
--    (SELECT column_name [, column_name ]
--    FROM table1 [, table2 ]
--    WHERE condition);

-- 1.Execute a failing query (i.e. one which gives an error) 
-- to retrieve all employees records whose salary is lower than the average salary.
SELECT *
FROM Employees
WHERE SALARY < AVG(SALARY);


-- 2. Execute a working query using a sub-select to retrieve all employees records 
-- whose salary is lower than the average salary.
SELECT EMP_ID, F_NAME, L_NAME, SALARY 
FROM Employees
WHERE SALARY < (SELECT AVG(SALARY) FROM Employees);

-- 3. Execute a failing query (i.e. one which gives an error) to retrieve all employees 
-- records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, MAX(SALARY) AS MAX_SALARY 
FROM Employees

-- 4.Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY 
-- and maximum salary as MAX_SALARY in every row.
SELECT EMP_ID, SALARY, (select MAX(SALARY) from employees ) AS MAX_SALARY 
FROM Employees

-- 5.Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive 
-- employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY)
SELECT * 
FROM ( select EMP_ID, F_NAME, L_NAME, DEP_ID from employees) AS EMP4ALL;


-- *****Accessing Multiple Tables with Sub-Queries****---
--1.Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.--
SELECT * 
FROM employees 
WHERE JOB_ID IN (select JOB_IDENT from jobs);

-- 2.Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT * 
FROM employees 
WHERE JOB_ID IN (select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer');

-- 3. Retrieve JOB information and list of employees who earn more than $70,000.
SELECT JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
FROM jobs where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );

-- 4. Retrieve JOB information and list of employees whose birth year is after 1976.
SELECT JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
FROM jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 );

-- 5. Retrieve JOB information and list of female employees whose birth year is after 1976.
SELECT JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT 
FROM jobs where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE)>1976 and SEX='F' );


-- ******Accessing Multiple Tables with Implicit Joins*****

-- 1. Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
SELECT * 
FROM employees, jobs;

-- 2. Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT * 
FROM employees, jobs 
WHERE employees.JOB_ID = jobs.JOB_IDENT;

-- 3. Redo the previous query, using shorter aliases for table names.
SELECT * 
FROM employees E, jobs J 
WHERE E.JOB_ID = J.JOB_IDENT;

-- 4. Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
SELECT EMP_ID,F_NAME,L_NAME, JOB_TITLE 
FROM employees E, jobs J 
WHERE E.JOB_ID = J.JOB_IDENT;

-- 5. Redo the previous query, but specify the fully qualified column names 
-- with aliases in the SELECT clause.
SELECT E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE 
FROM employees E, jobs J 
WHERE E.JOB_ID = J.JOB_IDENT;