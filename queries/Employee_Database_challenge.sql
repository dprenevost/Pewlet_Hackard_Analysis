SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (t.to_date = '9999-01-01');
     
SELECT * FROM retirement_titles;

-- DROP TABLE retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows

SELECT DISTINCT ON  (emp_no)(title),
emp_no,
first_name,
last_name
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

--DROP TABLE unique_titles;

--DROP TABLE updated_retirement_title;
-- Check the table
SELECT * FROM unique_titles;


--Create retiring_titles from unique_titles
SELECT title, COUNT(title) 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "count" DESC;

-- write a query to create a Mentorship Eligibility table that holds the employees
-- who are eligible to participate in a mentorship program.

SELECT DISTINCT ON  (e.emp_no)
	e.emp_no, 
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
	INNER JOIN titles as t
		ON(e.emp_no = t.emp_no)
	INNER JOIN dept_emp as de
		ON(e.emp_no = de.emp_no)
	WHERE(e.birth_date BETWEEN '1965-01-01' AND '1975-12-31')
		AND (de.to_date = '9999-01-01')
ORDER BY "emp_no" ASC;




SELECT COUNT(emp_no), title
FROM mentorship_eligibility_expanded_1 
GROUP BY mentorship_eligibility_expanded_1.title;



SELECT DISTINCT ON  (e.emp_no)
	e.emp_no, 
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
--INTO mentorship_eligibility_expanded_1
FROM employees as e
	INNER JOIN titles as t
		ON(e.emp_no = t.emp_no)
	INNER JOIN dept_emp as de
		ON(e.emp_no = de.emp_no)
	WHERE(e.birth_date BETWEEN '1963-01-01' AND '1975-12-31')
		AND (de.to_date = '9999-01-01')
ORDER BY "emp_no" ASC;
