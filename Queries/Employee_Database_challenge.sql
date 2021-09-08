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

