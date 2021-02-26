-- Challenge Objective 1: Create new table that has titles of current employees born between 1952 and 1955.

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    t.title,
    t.from_date,
    t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON t.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

--SELECT * FROM retirement_titles;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO retirement_distinct
FROM retirement_titles as rt
ORDER BY rt.emp_no, to_date DESC;

--SELECT * FROM retirement_distinct;

-- Counting titles

SELECT COUNT(rd.title), rd.title
INTO retiring_titles_only
FROM retirement_distinct as rd
GROUP BY rd.title
ORDER BY COUNT(rd.title) DESC;

--SELECT * FROM retiring_titles_only;

SELECT * FROM titles;
SELECT * FROM dept_emp;
SELECT * FROM employees;

-- Challenge Objective 2: Mentorship eligibility program, with employees born in 1965.

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.birth_date,
    de.from_date,
    de.to_date,
    t.title
INTO mentorship_eligibility
FROM employees as e
LEFT JOIN dept_emp as de
ON de.emp_no = e.emp_no
LEFT JOIN titles as t
ON t.emp_no = e.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

--SELECT * FROM mentorship_eligibility;