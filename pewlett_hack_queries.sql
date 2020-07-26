-- 1.
-- LIST THE FOLLOWING DETAILS OF EACH EMPLOYEE: EMPLOYEE NUMBER, LAST NAME, FIRST NAME, SEX, AND SALARY.

SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no=salaries.emp_no;

-- 2.
-- LIST FIRST NAME, LAST NAME, AND HIRE DATE FOR EMPLOYEES WHO WERE HIRED IN 1986.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date 
BETWEEN '1986-01-01' 
AND '1986-12-31';

-- 3.
-- LIST THE MANAGER OF EACH DEPARTMENT WITH THE FOLLOWING INFORMATION: 
-- DEPARTMENT NUMBER, 
-- DEPARTMENT NAME, 
-- THE MANAGER'S EMPLOYEE NUMBER, 
-- LAST NAME, AND
-- FIRST NAME.

SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
INNER JOIN dept_manager
ON departments.dept_no=dept_manager.dept_no
INNER JOIN employees
ON dept_manager.emp_no=employees.emp_no;

-- 4.
-- LIST THE DEPARTMENT OF EACH EMPLOYEE WITH THE FOLLOWING INFORMATION: 
-- EMPLOYEE NUMBER, 
-- LAST NAME, 
-- FIRST NAME, AND 
-- DEPARTMENT NAME.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no;

-- 5.
-- LIST FIRST NAME, LAST NAME, AND SEX FOR EMPLOYEES WHOSE FIRST NAME IS: 
-- "HERCULES" AND LAST NAMES BEGIN WITH "B." (THIS HAS BEEN INTERPRETED AS 
-- HERCULES WITH A SURNAME THAT BEGINS WITH B, NOT ALL EMPLOYEES WHO START 
-- WITH B AND / OR HAVE A FIRST NAME OF HERCULES)

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6.
-- LIST ALL EMPLOYEES IN THE SALES DEPARTMENT, INCLUDING THEIR EMPLOYEE NUMBER, 
-- LAST NAME, FIRST NAME, AND DEPARTMENT NAME.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales';

-- 7.
-- LIST ALL EMPLOYEES IN THE SALES AND DEVELOPMENT DEPARTMENTS, INCLUDING THEIR 
-- EMPLOYEE NUMBER, LAST NAME, FIRST NAME, AND DEPARTMENT NAME.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
INNER JOIN employees
ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE departments.dept_name='Sales'
OR departments.dept_name='Development';

-- 8.
-- IN DESCENDING ORDER, LIST THE FREQUENCY COUNT OF EMPLOYEE LAST NAMES, 
-- I.E., HOW MANY EMPLOYEES SHARE EACH LAST NAME.

SELECT last_name,
COUNT(last_name) 
AS "frequency_count"
FROM employees
GROUP BY last_name
ORDER BY "frequency_count"
DESC;

