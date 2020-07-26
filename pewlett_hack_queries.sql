-- LIST THE FOLLOWING DETAILS OF EACH EMPLOYEE: EMPLOYEE NUMBER, LAST NAME, FIRST NAME, SEX, AND SALARY.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no=salaries.emp_no;

-- LIST FIRST NAME, LAST NAME, AND HIRE DATE FOR EMPLOYEES WHO WERE HIRED IN 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

