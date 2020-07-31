-- DATA ENGINEERING
-- Create the tables and import the data
-- Drop the tables if exists

DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- IMPORT DATA TABLE TYPES AND KEYS
-- BUT DON'T USE THEIR FK CODE - IT DOESN'T WORK
-- ERD CHART AND IMPORT FROM LUCIDCHART

-- DEPARTMENTS TABLE
CREATE TABLE "departments" (
  	"dept_no" VARCHAR(5) NOT NULL,
  	"dept_name" VARCHAR(30) NOT NULL,
  	PRIMARY KEY ("dept_no")
);

-- EMPLOYEES TABLE
CREATE TABLE "employees" (
  	"emp_no" INT NOT NULL,
  	"emp_title_id" VARCHAR(10) NOT NULL,
  	"birth_date" DATE NOT NULL,
  	"first_name" VARCHAR(50) NOT NULL,
  	"last_name" VARCHAR(50) NOT NULL,
  	"sex" VARCHAR(10) NOT NULL,
  	"hire_date" DATE NOT NULL,
  	PRIMARY KEY ("emp_no")
);

-- DEPARTMENT EMPLOYEE TABLE
CREATE TABLE "dept_emp" (
  	"emp_no" INT NOT NULL,
  	"dept_no" VARCHAR(5) NOT NULL
);

-- DEPARTMENT MANAGERS TABLE
CREATE TABLE "dept_manager" (
  	"dept_no" VARCHAR(5) NOT NULL,
  	"emp_no" INT NOT NULL
);

-- SALARIES TABLE
CREATE TABLE "salaries" (
  	"emp_no" INT NOT NULL,
  	"salary" INT NOT NULL
);

-- TITLES TABLE
CREATE TABLE "titles" (
  	"title_id" VARCHAR(10) NOT NULL,
  	"title" VARCHAR(30) NOT NULL,
  	PRIMARY KEY ("title_id")
);

-- CHECK TO SEE THE TABLES HAVE BEEN DEFINED
-- SELECT * FROM departments;
-- SELECT * FROM dept_emp;
-- SELECT * FROM dept_manager;
-- SELECT * FROM employees;
-- SELECT * FROM salaries;
-- SELECT * FROM titles;

-- ADD IN THE FOREIGN KEYS AS LUCIDCHART DIDN'T HAVE THE RIGHT SYNTAX
-- https://www.postgresqltutorial.com/postgresql-foreign-key/

-- ADD FOREIGN KEY DEPARTMENT MANAGER / DEPARTMENT EMPLOYEE NUMBER ***
ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_emp_dept_man
FOREIGN KEY(dept_no) 
REFERENCES departments(dept_no);

-- ADD FOREIGN KEY DEPARTMENT MANAGER / EMPLOYEES NUMBER
ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_man_emp_no
FOREIGN KEY(emp_no) 
REFERENCES employees(emp_no);

-- ADD FOREIGN KEY SALARIES / EMPLOYEES NUMBER
ALTER TABLE salaries
ADD CONSTRAINT fk_sal_emp_no
FOREIGN KEY(emp_no) 
REFERENCES employees(emp_no);

-- ADD FOREIGN KEY DEPT EMPLOYEES / EMPLOYEES NUMBER
ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_emp_no
FOREIGN KEY(emp_no) 
REFERENCES employees(emp_no);

-- ADD FOREIGN KEY DEPT EMPLOYEES / DEPT MANAGER NUMBER
ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_departments
FOREIGN KEY(dept_no) 
REFERENCES departments(dept_no);

-- ADD FOREIGN KEY EMPLOYEES TITLE / TITLES
ALTER TABLE employees
ADD CONSTRAINT fk_emp_title_titles
FOREIGN KEY(emp_title_id) 
REFERENCES titles(title_id);

-- CHECK TABLES
-- SELECT * FROM departments;
-- SELECT * FROM dept_emp;
-- SELECT * FROM dept_manager;
-- SELECT * FROM employees;
-- SELECT * FROM salaries;
-- SELECT * FROM titles;

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

