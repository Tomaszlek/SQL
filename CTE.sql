WITH avg_movie_length AS(
	SELECT AVG(movie_length) as average_movie_length
	FROM movies
)

SELECT
	movie_length,
	movie_name,
	movie_lang
FROM
	movies, avg_movie_length 
WHERE
	movie_length > average_movie_length