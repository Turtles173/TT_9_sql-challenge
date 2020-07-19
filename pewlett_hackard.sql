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
-- USED LUCIDCHART

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

-- CREATE INDEX "FK" ON  "dept_manager" ("dept_no", "emp_no");
-- FOREIGN KEY (dept_no) references departments(dept_no), 

-- DEPARTMENT EMPLOYEE TABLE
CREATE TABLE "dept_emp" (
  	"emp_no" INT NOT NULL,
  	"dept_no" VARCHAR(5) NOT NULL
);

--CREATE INDEX "FK" ON  "dept_emp" ("emp_no", "dept_no");

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

--CREATE INDEX "FK" ON  "employees" ("emp_title_id");

-- SALARIES TABLE
CREATE TABLE "salaries" (
  	"emp_no" INT NOT NULL,
  	"salary" INT NOT NULL
);

-- CREATE INDEX "FK" ON  "salaries" ("emp_no");

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

