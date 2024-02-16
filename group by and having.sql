--GROUP BY I HAVING

SELECT
	movie_lang AS "Jezyk Filmu",
	COUNT(movie_lang) AS "Ilosc filmow w jezyku"
FROM
	movies
GROUP BY "Jezyk Filmu"
ORDER BY 2 DESC;

SELECT
	movie_lang,
	AVG(movie_length)::NUMERIC(5, 2) AS "Srednia dlugosc filmu"
FROM
	movies
GROUP BY movie_lang
ORDER BY 2 DESC;

SELECT
	age_certificate,
	SUM(movie_length)
FROM
	movies
GROUP BY
	age_certificate
ORDER BY 2 DESC NULLS LAST;

SELECT
	MIN(movie_length),
	MAX(movie_length),
	movie_lang
FROM
	movies
GROUP BY
	movie_lang;
	
SELECT
	movie_lang,
	age_certificate,
	AVG(movie_length)::Numeric(5, 2) AS "Average Movie Length"
FROM
	movies
GROUP BY
	movie_lang, age_certificate
ORDER BY
	1, 3 DESC;
	
SELECT
	movie_lang,
	age_certificate,
	AVG(movie_length)::Numeric(5, 2) AS "Average Movie Length"
FROM
	movies
WHERE
	movie_length > 100
GROUP BY
	movie_lang, age_certificate
ORDER BY
	1, 3 DESC;
	
SELECT
	age_certificate,
	AVG(movie_length)::Numeric(5, 2) AS "Average Movie Length"
FROM
	movies
WHERE
	age_certificate LIKE '12' or age_certificate LIKE '15'
GROUP BY
	age_certificate
	
SELECT
	COUNT(director_id) AS "Directors",
	nationality
FROM
	directors
GROUP BY
	nationality
ORDER BY 1 DESC;

SELECT
	SUM(movie_length) AS "Sum of Movie Length",
	age_certificate,
	movie_lang
FROM
	movies
GROUP BY
	age_certificate, movie_lang
Order by 1 DESC
OFFSET 0
FETCH FIRST 5 ROWS ONLY;

---having

SELECT
	movie_lang,
	SUM(movie_length) AS "Total Length"
FROM
	movies
GROUP BY
	movie_lang
HAVING
	SUM(movie_length) > 200
ORDER BY
	2 DESC;
	
	
SELECT
	director_id,
	SUM(movie_length)
FROM
	movies
GROUP BY
	director_id
HAVING
	SUM(movie_length) > 200
ORDER BY
	2 DESC;
	
--Where vs Having
SELECT
	SUM(movie_length),
	movie_lang
FROM
	movies
GROUP BY
	movie_lang
HAVING
	SUM(movie_length) > 200
ORDER BY
	1 DESC;
	
SELECT
	SUM(movie_length),
	movie_lang
FROM
	movies
WHERE
	movie_length > 200
GROUP BY
	movie_lang
ORDER BY
	1 DESC;	
	

CREATE TABLE employees_test(
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(100),
	department VARCHAR(100),
	salary INT
)

INSERT INTO employees_test(employee_name, department, salary)
VALUES
('John', 'Alaska', 3500),
('Charles', 'Ferrari', 50000),
('Fernando', NULL, 3000);


SELECT
	COALESCE(department, 'No department') as "Department",
	COUNT(employee_id) AS "Department Workers"
FROM
	employees_test
GROUP BY 
	Department;
	
	
	
	
	








