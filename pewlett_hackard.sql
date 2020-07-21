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

-- DEPARTMENT MANAGERS TABLE
CREATE TABLE "dept_manager" (
  	"dept_no" VARCHAR(5) NOT NULL,
  	"emp_no" INT NOT NULL
	
);

-- DEPARTMENT EMPLOYEE TABLE
CREATE TABLE "dept_emp" (
  	"emp_no" INT NOT NULL,
  	"dept_no" VARCHAR(5) NOT NULL
	CONSTRAINT fk_dept_no
      FOREIGN KEY(dept_no) 
	  	REFERENCES departments(dept_no)	
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
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

-- ADD IN THE FOREIGN KEYS AS LUCIDCHART DIDN'T HAVE THE RIGHT SYNTAX
-- https://www.postgresqltutorial.com/postgresql-foreign-key/

-- ADD FOREIGN KEY DEPARTMENT MANAGER / DEPARTMENT EMPLOYEE NUMBER ****
ALTER TABLE dept_manager
ADD CONSTRAINT fk_dept_man_dept_no
FOREIGN KEY(dept_no) 
REFERENCES dept_emp(dept_no);

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

-- ADD FOREIGN KEY DEPT EMPLOYEES / DEPT MANAGER NUMBER ****
ALTER TABLE dept_emp
ADD CONSTRAINT fk_dept_emp_dept_man
FOREIGN KEY(dept_no) 
REFERENCES dept_manager(dept_no);

-- ADD FOREIGN KEY EMPLOYEES TITLE / TITLES ***
ALTER TABLE employees
ADD CONSTRAINT fk_emp_title_titles
FOREIGN KEY(emp_title_no) 
REFERENCES titles(title_id);