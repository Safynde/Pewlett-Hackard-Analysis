--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table
SELECT emp_no, first_name, last_name, birth_date
FROM employees;

--2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;

SELECT t.emp_no, e.first_name, e.last_name, e.birth_date, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM titles AS t
JOIN employees AS e 
ON t.emp_no=e.emp_no
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY t.emp_no asc, from_date desc;


SELECT * FROM retirement_titles;
