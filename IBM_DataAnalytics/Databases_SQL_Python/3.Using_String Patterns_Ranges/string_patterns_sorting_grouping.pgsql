-- *****STRING PATTERNS *****

-- Retrieve all employees whose address is in Elgin,IL.
SELECT F_NAME, L_NAME
FROM Employees 
WHERE address LIKE = '%Elgin,IL%';

-- Retrieve all employees who were born during the 1970's.
SELECT F_NAME, L_NAME
FROM Employees
WHERE B_DATE LIKE '197%';

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT F_NAME, L_NAME
FROM Employees
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

-- ******SORTING*****--

-- Retrieve a list of employees ordered by department ID.
SELECT F_NAME, L_NAME, DEP_ID
FROM Employees
ORDER BY DEP_ID;

-- Retrieve a list of employees ordered in descending order by department ID 
-- and within each department ordered alphabetically in descending order by last name.

SELECT F_NAME, L_NAME, DEP_ID
FROM Employees
ORDER BY DEP_ID DESC, L_NAME DESC;


-- *****GROUPING****-------

-- For each department ID retrieve the number of employees in the department.

SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

-- For each department retrieve the number of employees in the department, 
-- and the average employee salary in the department..

SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

-- Label the computed columns in the result set of SQL problem 2 
-- Exercise 3 Problem 2) as NUM_EMPLOYEES and AVG_SALARY.

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;


-- In SQL problem 3 (Exercise 3 Problem 3), order the result set by Average Salary..
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID 
ORDER BY AVG_SALARY;

-- In SQL problem 4 (Exercise 3 Problem 4), limit the result to departments with fewer than 4 employees.
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;



-- *****Functions, Multiple Tables, and Sub-queries*****--






























