SELECT
	first_name,
	last_name
FROM 
	actors
UNION
SELECT
	first_name,
	last_name
FROM
	directors
ORDER BY first_name

SELECT
	first_name,
	last_name,
	'actors' AS "table_name"
FROM
	actors
WHERE
	gender = 'F'
UNION
SELECT
	first_name,
	last_name,
	'directors' as "table_name"
FROM
	directors
WHERE
	nationality IN('American', 'Chinese', 'Japanese')
	
SELECT
	first_name,
	last_name,
	'directors' as "table_name"
FROM
	directors
UNION
SELECT
	first_name,
	last_name,
	'actors' as "table_name"
FROM
	actors
WHERE
	date_of_birth > '1990-12-31'
	
SELECT
	first_name,
	last_name,
	'directors' as "table_name"
FROM
	directors
WHERE
	first_name LIKE 'A%'
UNION
SELECT
	first_name,
	last_name,
	'actors' as "table_name"
FROM
	actors
WHERE
	first_name LIKE 'A%'

SELECT
	first_name,
	last_name,
	'directors' as "table_name",
	NULL as date_of_birth --jak nie rowna liczba kolumn, zapychamy nullami
FROM
	directors
UNION
SELECT
	first_name,
	last_name,
	'actors' as "table_name",
	date_of_birth
FROM
	actors
WHERE
	date_of_birth > '1990-12-31'	
	
	
SELECT
	first_name,
	last_name
FROM 
	actors
INTERSECT
SELECT
	first_name,
	last_name
FROM
	directors
ORDER BY first_name


SELECT
	first_name,
	last_name
FROM 
	actors
EXCEPT
SELECT
	first_name,
	last_name
FROM
	directors
ORDER BY first_name
	

SELECT
	first_name,
	last_name
FROM 
	actors
WHERE
	gender = 'F'
EXCEPT
SELECT
	first_name,
	last_name
FROM
	directors
ORDER BY first_name
	
	
	
	
	
	
	