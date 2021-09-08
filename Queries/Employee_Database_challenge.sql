--Create retirement_titles table
SELECT e.emp_no
, e.first_name
, e.last_name
, e.birth_date
, ti.title
, ti.from_date
, ti.to_date
INTO retirement_titles
FROM employees e
left join titles ti 
on e.emp_no = ti.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles rt
ORDER BY emp_no, to_date DESC

-- Counting titles
SELECT count(emp_no),
title
INTO retiring_titles
FROM unique_titles ut
GROUP BY title
order by 1 desc

--Creating mentorship eligibility table
SELECT distinct on (e.emp_no) e.emp_no
, e.first_name
, e.last_name
, e.birth_date
, de.from_date
, de.to_date
, ti.title
INTO mentorship_eligibilty
FROM employees e
left join dept_emp de
on e.emp_no = de.emp_no
left join titles ti
on e.emp_no = ti.emp_no
where de.to_date = '9999-01-01'
AND (e.birth_date between '1965-01-01' AND '1965-12-31')
order by e.emp_no, ti.to_date desc