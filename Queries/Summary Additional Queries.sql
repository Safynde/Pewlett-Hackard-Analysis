-- List of current employees by department, gender, salary
SELECT e.emp_no,
	de.dept_no,
	e.first_name,
	e.last_name,
	s.salary,
	e.gender,
	de.to_date
INTO emp_dept
FROM employees as e
INNER JOIN salaries as s
	ON(e.emp_no = s.emp_no)
	INNER JOIN dept_emp as de
	ON(e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND(de.to_date = '9999-01-01');

SELECT * FROM emp_dept

SELECT gender, COUNT(gender) AS "Frequency count"
FROM emp_dept
GROUP BY gender
ORDER BY "Frequency count" DESC;

 SELECT AVG (salary)
  AS averagfesalary
 FROM emp_dept
 WHERE gender ='F'

SELECT AVG (salary)
  AS averagmesalary
 FROM emp_dept
 WHERE gender ='M'
 

 
 
