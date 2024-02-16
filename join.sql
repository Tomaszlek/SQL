SELECT
	movies.movie_id,
	movies.movie_name,
	movies.director_id
FROM
	movies
INNER JOIN
	directors
ON movies.director_id = directors.director_id;


SELECT
	MV.movie_id,
	MV.movie_name,
	MV.director_id
FROM
	movies MV
INNER JOIN
	directors D
ON MV.director_id = D.director_id;


SELECT
	MV.movie_id,
	MV.movie_name,
	MV.director_id,
	MV.movie_lang,
	D.first_name || ' ' || D.last_name AS "Directors Name"
FROM
	movies MV
INNER JOIN
	directors D
ON MV.director_id = D.director_id
WHERE
	MV.movie_lang = 'English';
	
SELECT
	actors.first_name,
	actors.last_name,
	movies.movie_name
FROM
	actors
INNER JOIN
	movies_actors USING(actors_id)
INNER JOIN
	movies USING(movie_id)
	

SELECT
	mv.movie_name,
	dr.first_name,
	dr.last_name AS "Directors Name",
	mr.revenues_domestic
FROM
	movies mv
INNER JOIN	
	directors dr ON mv.director_id = dr.director_id
INNER JOIN
	movies_revenues mr ON mv.movie_id = mr.movie_id
WHERE
	mv.movie_lang = 'Chinese'
	
	
SELECT
	mv.movie_name AS "Movie Title",
	dr.first_name || ' ' || dr.last_name AS "Directors Name",
	mr.revenues_domestic + mr.revenues_international AS "Movie Income",
	mv.movie_lang AS "Movie Language"
FROM
	movies mv
INNER JOIN
	directors dr ON mv.director_id = dr.director_id
INNER JOIN
	movies_revenues mr ON mv.movie_id = mr.movie_id
WHERE
	mv.release_date BETWEEN '2005-01-01' AND '2008-12-31'
Order By 3 DESC nulls last
LIMIT 10
	
SELECT
	mv.movie_name,
	dr.first_name, 
	dr.last_name,
	mv.movie_lang
FROM
	movies mv
LEFT JOIN
	directors dr ON mv.director_id = dr.director_id
WHERE
	mv.movie_lang = 'Chinese'
	
SELECT
	d.first_name || ' ' || d.last_name AS "Directors Name",
	SUM(r.revenues_domestic + r.revenues_international) AS "Total Income"
FROM
	directors d
LEFT JOIN
	movies m ON d.director_id = m.director_id
LEFT JOIN
	movies_revenues r ON m.movie_id = r.movie_id
GROUP BY 
	d.first_name,
	d.last_name
HAVING
	SUM(r.revenues_domestic + r.revenues_international) > 100
ORDER BY
	2 DESC NULLS LAST

SELECT
	d.first_name,
	d.last_name,
	COUNT(m.movie_id) AS "Total Movies"
FROM
	directors d
RIGHT JOIN
	movies m ON d.director_id = m.director_id
GROUP BY
	d.first_name,
	d.last_name
ORDER BY
	3 DESC NULLS LAST
	
SELECT
	d.first_name || ' ' || d.last_name AS "Directors Name",
	mv.movie_lang
FROM
	movies mv
FULL JOIN
	directors d ON mv.director_id = d.director_id
WHERE
	mv.movie_lang IN ('English', 'Portugese', 'Russian', 'Chinese', 'Japanese')
	
--self join
SELECT
	*
FROM
	directors d1
INNER JOIN
	directors d2 ON d1.director_id = d2.director_id
	
SELECT
	m1.movie_name,
	m2.movie_name,
	m1.movie_length
FROM
	movies m1
INNER JOIN
	movies m2 ON m1.movie_length = m2.movie_length
	AND m1.movie_name != m2.movie_name
	
SELECT
	m1.movie_name,
	m2.director_id
FROM
	movies m1
INNER JOIN
	movies m2 ON m1.director_id = m2.movie_id
ORDER BY 2;

SELECT
	m.movie_name,
	d.first_name
FROM
	movies m
CROSS JOIN
	directors d
	
SELECT *
FROM movies
NATURAL left JOIN directors;
	
	