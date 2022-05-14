--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;

--3. Create a new table using the INTO clause.4. Join both tables on the primary key.
--4. Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. 
--5.Then, order by the employee number.
SELECT t.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM titles AS t
JOIN employees AS e 
ON t.emp_no=e.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY t.emp_no asc, from_date desc;

SELECT * FROM retirement_titles

--6. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
Select emp_no, first_name, last_name, title
FROM retirement_titles;

--7.Use Dictinct with Orderby to remove duplicate rows
--8. Create a Unique Titles table using the INTO clause.
--9. Sort the Unique Titles table in ascending order by the employee number and descending order by the most recent title.

SELECT DISTINCT ON (emp_no) emp_no, 
first_name, 
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, from_date DESC;

SELECT * FROM unique_titles;

--10. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by their most recent job title who are about to retire.
--11. First, retrieve the number of titles from the Unique Titles table.
--12. Then, create a Retiring Titles table to hold the required information.
--13. Group the table by title, then sort the count column in descending order.

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

-- mentorship eligibility
SELECT DISTINCT ON (e.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
  ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility


