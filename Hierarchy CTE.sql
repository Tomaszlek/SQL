WITH num AS(
	SELECT * FROM generate_series(1, 10) as ID_czegos
)

SELECT ID_czegos FROM num;

WITH director_1 AS(
	SELECT movies.movie_name
	FROM movies
	INNER JOIN directors ON movies.director_id = directors.director_id
	WHERE directors.director_id = 1
)

SELECT * FROM director_1;

WITH long_movies AS(
	SELECT movie_name,
	(
		CASE
			WHEN movie_length < 100 THEN 'Krótki'
			WHEN movie_length BETWEEN 100 AND 128 THEN 'ŚREDNI'
			ELSE 'DŁUGI'
		END
	)
	FROM movies
)
SELECT * FROM long_movies;

WITH total_directors_revenues AS(
	SELECT 
		d.first_name ||' ' || d.last_name AS "Imię i nazwisko",
		SUM(COALESCE(mr.revenues_domestic, 0) + COALESCE(mr.revenues_international, 0)) AS "Suma Zarobków"
	FROM
		directors d
	LEFT JOIN movies m ON d.director_id = m.director_id
	INNER JOIN movies_revenues mr ON m.movie_id = mr.movie_id
	GROUP BY 1
	ORDER BY 2 DESC
)

SELECT * FROM total_directors_revenues;

--synchroniczny update i delete uzywajac CTE
CREATE TABLE articles(
	id_article SERIAL PRIMARY KEY,
	title VARCHAR(100)
);

CREATE TABLE deleted_articles
AS SELECT * FROM articles LIMIT 0;

INSERT INTO articles(title) VALUES
('ARTICLE1'),
('ARTICLE2'),
('ARTICLE3'),
('ARTICLE4');

WITH cte_delete_articles AS
(
	DELETE FROM articles
	WHERE id_article = 1
	returning *
)
INSERT INTO deleted_articles
SELECT * FROM articles;

CREATE TABLE insert_articles
AS SELECT * FROM articles LIMIT 0;


WITH cte_move_articles AS
(
	DELETE FROM articles
	returning *
)

INSERT INTO insert_articles
SELECT * FROM articles;

--hierarchie i recursive CTE
--szereg czasowy
WITH RECURSIVE szereg_czasowy(list_num) AS(
	--NIEREKURENCYJNE
	SELECT 10
	
	UNION ALL
	--REKURENCYJNE
	
	SELECT list_num + 5
	FROM szereg_czasowy
	WHERE list_num < 50
)

SELECT * FROM szereg_czasowy;

CREATE TABLE items(
	item_id SERIAL PRIMARY KEY,
	item_name TEXT NOT NULL,
	parent INT
)

INSERT INTO items VALUES
(1, 'JAN', 0),
(2, 'JANU', 0),
(3, 'JANW', 2),
(4, 'JANR', 2);


WITH RECURSIVE parent_items AS(
	SELECT 
        item_name, 
        item_id AS id,
        1 AS hierarchy_level
    FROM items
    WHERE parent = 0
    
    UNION
    
    SELECT 
        pt.item_name || '=>' || i.item_name,
        i.item_id,
        pt.hierarchy_level + 1
    FROM items i
    INNER JOIN parent_items pt ON i.parent = pt.id
	
)

SELECT item_name, hierarchy_level
FROM parent_items
ORDER BY hierarchy_level;








