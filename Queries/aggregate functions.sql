SELECT
	MIN(movie_length) as "Minimal Movie Length",
	MAX(movie_length) as "Maximal Movie Length"
FROM
	movies
WHERE
	movie_lang = 'Chinese'

SELECT
	MIN(release_date) as "Minimal Release Date",
	MAX(release_date) as "Maximal Release Date"
FROM
	movies
WHERE
	movie_lang = 'Chinese'
	
SELECT
	GREATEST(revenues_domestic, revenues_international),
	LEAST(revenues_domestic, revenues_international)
FROM
	movies_revenues;
	
SELECT
	AVG(movie_length)::numeric(10,2)
FROM
	movies;
	
SELECT
	(mr.revenues_domestic + mr.revenues_international) AS "Total Revenue",
	mv.movie_name AS "Title"
FROM
	movies_revenues AS mr
LEFT JOIN
	movies as mv ON mv.movie_id = mr.movie_id
ORDER BY 1 DESC NULLS LAST;

SHOW DateStyle;

SET DateStyle = 'ISO', 'YMD';

SELECT CURRENT_DATE;

SELECT CURRENT_DATE - 10;

SELECT
	TO_DATE('20201010', 'YYYYMMDD');

SELECT TO_DATE('dECEMBER 1, 2020', 'Month DD, YYYY')

SELECT TO_DATE('8th December 2021', 'DDth Month YYYY');

SELECT TO_TIMESTAMP('8th December 2021 10:20', 'DDth Month YYYY HH:MI')

SELECT
	movie_name,
	release_date,
	TO_CHAR(release_date, 'FMMonth DDth, YYYY')
FROM
	movies;
	
SELECT MAKE_DATE(2020,01,01);	

SELECT MAKE_TIME(12,33,4);

SELECT MAKE_TIMESTAMP(2020,01,01,4,2,5)

SELECT MAKE_INTERVAL(2020,01,01,01,4,2,5);

SELECT MAKE_INTERVAL(weeks => 2);

SELECT MAKE_INTERVAL(years => 1, months => 6, weeks => 3, days => 1);
SELECT MAKE_TIMESTAMPTZ(2020,11,23,10,15,35.35);

SELECT * FROM pg_timezone_names;

SELECT MAKE_TIMESTAMPTZ(2020,11,23,10,15,35.35, 'Europe/Warsaw');

SELECT
	EXTRACT('DAY' FROM CURRENT_TIMESTAMP) AS "DZIEN",
	EXTRACT('MONTH' FROM CURRENT_TIMESTAMP) AS "MIESIAC",
	EXTRACT('YEAR' FROM CURRENT_TIMESTAMP) AS "ROK";
	
SELECT
	EXTRACT('CENTURY' FROM INTERVAL '150 YEARS 4 MONTHS 22 DAYS');
	
SELECT
	CAST('20200101' AS DATE) + INTERVAL '10 DAYS';

SELECT
	CAST('23:20:12' AS TIME) + INTERVAL '5 HOURS 15 MINUTES',
	CAST('14:50:14' AS TIME) - INTERVAL '2 HOURS 2 MINUTES';
	
SELECT
	CURRENT_TIMESTAMP + INTERVAL '2 DAYS 4 HOURS';
	
SELECT
	('2020-01-01'::DATE, '2020-01-31'::DATE) OVERLAPS ('2020-01-10', '2020-03-01');

SELECT NOW();
SELECT STATEMENT_TIMESTAMP();
SELECT CLOCK_TIMESTAMP();
SELECT TIMEOFDAY();

SELECT
	first_name,
	last_name,
	AGE(NOW(), date_of_birth) AS "Actors age"
FROM
	actors;

SELECT CAST(CURRENT_DATE - INTERVAL '10 DAYS' AS DATE);


--przykladowa tabela z logami serwera
CREATE TABLE logs(
	log_id SERIAL PRIMARY KEY,
	add_date DATE DEFAULT CURRENT_DATE,
	add_time TIME DEFAULT CURRENT_TIME
)

INSERT INTO logs(log_id)
VALUES
(2),
(3);

SELECT * FROM logs;

--EPOCH DAJE DOKLADNY WYNIK W SEKUNDACH
SELECT
	EXTRACT(EPOCH FROM '2020-12-21'::TIMESTAMPTZ)-
	EXTRACT(EPOCH FROM '2020-12-01'::TIMESTAMPTZ)
	AS "DIFFERENCE IN SECONDS"

CREATE TABLE times(
	time_id SERIAL PRIMARY KEY,
	start_date DATE,
	start_time TIME,
	start_timestamp TIMESTAMP
)

INSERT INTO times(start_date, start_time, start_timestamp)
VALUES
('EPOCH', 'ALLBALLS', 'INFINITY');

INSERT INTO times(start_date, start_time, start_timestamp)
VALUES
('EPOCH', 'ALLBALLS', '-INFINITY');

INSERT INTO times(start_date, start_time, start_timestamp)
VALUES
(CURRENT_DATE, CURRENT_TIME, CURRENT_TIMESTAMP);

SELECT * FROM times;

SHOW TIME ZONE;

SET TIME ZONE 'Europe/Warsaw';

ALTER TABLE times
ADD COLUMN end_time TIME WITH TIME ZONE,
ADD COLUMN end_date TIMESTAMP WITH TIME ZONE; --zawsze daty i czasu przy zmianach stref czasowych uzywac

INSERT INTO times(end_date, end_time)
VALUES
('2020-01-01 11:30:00 Europe/Warsaw', '11:30:00+1'),
('2020-01-01 11:30:00 US/Alaska', '11:30:00-10')

SELECT DATE_PART('YEAR', '2020-01-01'::Timestamp);
SELECT DATE_PART('MONTH', '2020-01-01'::TIMESTAMP);

SELECT
	movie_name,
	release_date,
	DATE_PART('YEAR', release_date) AS "Release Year",
	DATE_PART('DECADE', release_date) AS "Release Decade"
FROM
	movies
ORDER BY 4;

SELECT DATE_TRUNC('HOUR', '2078-03-23 13:25:44'::TIMESTAMP)

SELECT
	DATE_TRUNC('MONTH', release_date::Timestamp) AS "Release Month",
	COUNT(movie_id)
FROM
	movies
GROUP BY
	"Release Month"
ORDER BY 2 DESC;
