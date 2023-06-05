------------------------------------------------------------------------------------------
----- https://app.quickdatabasediagrams.com/#/d/L1QEKH ----
------------------------------------------------------------------------------------------

--Data Analysis
--List the employee number, last name, first name, sex, and salary of each employee.
--300024
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees AS e
LEFT JOIN Salaries AS s ON e.emp_no = s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
--24
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM Department_mgr AS dm
LEFT JOIN Departments AS d ON dm.dept_no = d.dept_no
LEFT JOIN Employees AS e ON dm.emp_no = e.emp_no;


--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
--331603
SELECT edi.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employee_Dept_ID AS edi
LEFT JOIN Employees AS e ON edi.emp_no = e.emp_no
LEFT JOIN Departments AS d ON edi.dept_no = d.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.
--52245
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employee_Dept_ID AS edi
LEFT JOIN Employees AS e ON edi.emp_no = e.emp_no
LEFT JOIN Departments AS d ON edi.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
--137952
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employee_Dept_ID AS edi
LEFT JOIN Employees AS e ON edi.emp_no = e.emp_no
LEFT JOIN Departments AS d ON edi.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) AS frequency
FROM Employees
GROUP BY last_name
ORDER BY frequency DESC;