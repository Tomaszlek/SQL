--HR Database 
SELECT
	department_id,
	MIN(salary),
	MAX(salary),
	AVG(salary),
	SUM(salary)
FROM
	employees
GROUP BY department_id;

SELECT
	MAX(salary) - MIN(salary) AS "Rozpietość w pensjach"
FROM
	employees;
	
SELECT
	MIN(salary),
	manager_id
FROM
	employees
GROUP BY manager_id;

SELECT
	ROUND(AVG(e.salary),2),
	d.department_name
FROM
	employees e
INNER JOIN
	departments d ON e.department_id = d.department_id
GROUP BY
	d.department_name
HAVING 
	d.department_name IN (SELECT d.department_name
						FROM departments d
						INNER JOIN employees e ON d.department_id = e.department_id
						GROUP BY d.department_name
						HAVING COUNT(e.employee_id) >= 10);
						
SELECT
	job_id,
	ROUND(AVG(salary), 2)
FROM
	employees
WHERE job_id != 'IT_PROG'
GROUP BY job_id;

					
SELECT
	job_id,
	ROUND(MAX(salary), 2)
FROM
	employees
GROUP BY job_id
HAVING MAX(salary) >= 5000;

SELECT
	first_name,
	last_name,
	salary,
	0.15*salary AS "15 procent pensji"
FROM
	employees;

SELECT
	job_id,
	ARRAY_AGG(employee_id) AS "Wszystkie ID"
FROM
	employees
GROUP BY job_id
ORDER BY job_id;


SELECT
	first_name,
	email,
	REVERSE(SUBSTR(REVERSE(email), 5)) --biore wszystko od 5 indexu po odwroceniu, po czym odwracam z powrotem by uzyskać maila
FROM
	employees;


SELECT
	first_name,
	UPPER(first_name),
	LOWER(first_name),
	last_name,
	UPPER(last_name),
	LOWER(last_name)
FROM
	employees
WHERE
	first_name LIKE 'A%';
	
SELECT
	SUBSTRING(first_name, 1, 3)
FROM
	employees;

SELECT
	COUNT(DISTINCT job_id) AS "ILOŚĆ ZAWODÓW"
FROM
	employees;

SELECT
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id IN (30, 100)
ORDER BY
	department_id;

SELECT
	first_name,
	last_name,
	department_id
FROM
	employees
WHERE
	department_id NOT IN (30, 100)
	AND salary NOT BETWEEN 10000 AND 20000
ORDER BY
	department_id;

SELECT
	first_name,
	last_name,
	POSITION('c' IN first_name)
FROM
	employees
WHERE
	POSITION('c' IN first_name) >= 2;

UPDATE
	employees
SET
	phone_number = REPLACE(phone_number, '123', '888')
WHERE
	phone_number LIKE '%123%';
	
SELECT
	first_name,
	last_name,
	ROUND(salary/12, 2) AS "Miesięczna pensja"
FROM
	employees;
	
SELECT
	AVG(salary),
	COUNT(employee_id)
FROM
	employees;
	
SELECT
	first_name,
	last_name
FROM
	employees
WHERE 
	LENGTH(last_name) = 6;
	
	
	
	
	
