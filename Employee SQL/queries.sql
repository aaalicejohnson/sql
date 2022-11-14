--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
FROM employees as e
INNER JOIN salaries as s ON
e.emp_no = s.emp_no;


--List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM employees as e 
INNER JOIN dept_manager as dm ON 
dm.emp_no = e.emp_no
INNER JOIN departments as d ON 
dm.dept_no = d.dept_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e 
INNER JOIN dept_emp as de ON 
e.emp_no = de.emp_no
INNER JOIN departments as d ON 
de.dept_no = d.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex 
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON 
e.emp_no = de.emp_no
INNER JOIN departments as d ON 
d.dept_no = de.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
INNER JOIN dept_emp as de ON 
e.emp_no = de.emp_no
INNER JOIN departments as d ON 
d.dept_no = de.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

--List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.

SELECT last_name, count(last_name) AS "Count"
FROM employees
GROUP BY last_name
ORDER BY "Count" DESC;