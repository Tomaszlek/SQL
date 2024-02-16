SELECT
	movie_name,
	release_date,
	SPLIT_PART(release_date::text, '-', 1) as "Release Year"
FROM
	movies;
	
SELECT SPLIT_PART('1,2,3', ',', 2);

SELECT TRIM('   DJOSAHHAS');
SELECT LTRIM('    DSADASDF', 'D');
SELECT RTRIM('SAUIDHIASUD    ', 'D');
SELECT BTRIM('   DSIUFHUDSF   ', 'D');

SELECT
	TRIM(LEADING '0' FROM CAST(0000123455 AS TEXT));
	
SELECT LTRIM('YUMMY', 'Y');
SELECT RTRIM('YUMMY', 'Y');
SELECT BTRIM('YUMMY', 'Y');

SELECT LPAD('dWQUEH', 15, 'a');
SELECT RPAD('dWQUEH', 15, 'A');

SELECT POSITION('IO' IN 'DSBHFIODSAUVBU');
SELECT POSITION('A' IN 'aAa');

--drawing a chart representing revenues

SELECT 
	mv.movie_name,
	rd.revenues_domestic,
	LPAD('*', CAST(TRUNC(rd.revenues_domestic / 10) AS INT), '*') AS "Chart"
FROM
	movies AS mv
INNER JOIN
	movies_revenues AS rd ON mv.movie_id = rd.movie_id
ORDER BY 3 DESC NULLS LAST;


SELECT
	first_name || ' ' || last_name AS directors_name,
	LENGTH(first_name || ' ' || last_name) AS directors_name_length
FROM
	directors
WHERE
	LENGTH(first_name || ' ' || last_name) >= 10
ORDER BY 
	directors_name_length DESC;

SELECT STRPOS('Jarmoc', 'moc');

SELECT
	first_name,
	last_name
FROM
	directors
WHERE
	STRPOS(last_name, 'on') > 0; -- strpos i position niczym sie nie roznia xd

SELECT SUBSTRING('IUDSHFI' FROM 1 FOR 3);
SELECT SUBSTRING('oPPPAAAA' FOR 4);
SELECT SUBSTRING('aMMANN' FROM 2);
	
SELECT
	first_name,
	last_name,
	SUBSTRING(first_name, 1, 1)
FROM
	directors
ORDER BY
	first_name;
	
	
SELECT REPEAT('jANUSZ', 5);
SELECT REPEAT('JABOL ', 10);
	
SELECT REPLACE('jANUSZ', 'NUSZ', 'N');

UPDATE actors
SET
	first_name = REPLACE(first_name, 'John', 'Wesley');
	
SELECT COUNT(*) FROM movies;

SELECT COUNT(DISTINCT(movie_lang)) FROM movies;

SELECT
	COUNT(DISTINCT(director_id))
FROM
	directors;
	
SELECT
	COUNT(movie_id)
FROM
	movies
WHERE
	movie_lang = 'English'
	
SELECT
	SUM(revenues_domestic)
FROM
	movies_revenues;
	
SELECT
	DISTINCT(SUM(revenues_domestic))
FROM
	movies_revenues;

SELECT
	SUM(revenues_domestic)
FROM
	movies_revenues
WHERE
	revenues_domestic > 200;
	
SELECT
	SUM(movie_length)
FROM
	movies
WHERE
	movie_lang = 'English'


	
	
	
	
	