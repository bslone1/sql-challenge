DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salary;
DROP TABLE IF EXISTS title;
​
--Departments table:
CREATE TABLE department (
  	dept_no VARCHAR(50) NOT NULL PRIMARY KEY,
  	dept_name VARCHAR(255) NOT NULL
);
​
SELECT * FROM department;
​
--Employees table:
CREATE TABLE employee (
  	emp_no VARCHAR(255) NOT NULL,
	emp_title_id VARCHAR(255) NOT NULL,
  	birth_date VARCHAR(255) NOT NULL,
  	first_name VARCHAR(255) NOT NULL,
  	last_name VARCHAR(255) NOT NULL,
  	sex VARCHAR(255) NOT NULL,
  	hire_date VARCHAR(255) NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);
	
SELECT * FROM employee;
​
--Department employees table:
CREATE TABLE dept_emp (
  	emp_no VARCHAR(255) NOT NULL,
  	dept_no VARCHAR(50) NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
  	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
  	PRIMARY KEY (emp_no, dept_no)
);
	
SELECT * FROM dept_emp;
​
--Managers by department table:
CREATE TABLE dept_manager (
  	dept_no VARCHAR(50) NOT NULL,
  	emp_no VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
  	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);
​
ALTER TABLE dept_manager ADD record_id SERIAL;
ALTER TABLE dept_manager ADD PRIMARY KEY(record_id);
	
SELECT * FROM dept_manager;	
​
--Salaries table:	
CREATE TABLE salary (
  	emp_no VARCHAR(255) NOT NULL,
  	salary VARCHAR(255) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no)
);
​
ALTER TABLE salary ADD record_id SERIAL;
ALTER TABLE salary ADD PRIMARY KEY (record_id);
​
SELECT * FROM salary;
​
--Titles table:
CREATE TABLE title (
  	title_id VARCHAR(255) NOT NULL,
  	title VARCHAR(255) NOT NULL
);
​
ALTER TABLE title ADD record_id SERIAL;
ALTER TABLE title ADD PRIMARY KEY (record_id);
​
SELECT * FROM title;