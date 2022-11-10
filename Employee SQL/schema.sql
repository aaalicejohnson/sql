drop table if exists dept_emp;
drop table if exists dept_manager;
drop table if exists salaries; 
drop table if exists employees;
drop table if exists departments;
drop table if exists titles;

create table departments
	(dept_no VARCHAR(4), 
	dept_name VARCHAR,
	PRIMARY KEY (dept_no));

create table titles 
	(title_id VARCHAR(5) PRIMARY KEY, 
		titles VARCHAR);
 
create table employees 
	(emp_no INT NOT NULL PRIMARY KEY, 
	 emp_title_id VARCHAR(5), 
	 birth_date DATE, 
	 first_name VARCHAR, 
	 last_name VARCHAR, 
	 sex char(1), 
	 hire_date DATE,
	 FOREIGN KEY (emp_title_id) REFERENCES titles(title_id));
 
create table dept_emp 
	(emp_no INT NOT NULL, 
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));
	
create table dept_manager
	(dept_no VARCHAR(4),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no));

create table salaries 
	(emp_no INT NOT NULL, 
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no));
	