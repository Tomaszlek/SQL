CREATE TABLE courses(
	course_id SERIAL PRIMARY KEY,
	course_name VARCHAR(100) NOT NULL,
	course_level VARCHAR(50) NOT NULL,
	sold_units INT NOT NULL
);

INSERT INTO courses(course_name, course_level, sold_units) VALUES
('Machine Learning in Python', 'Premium', 100),
('Data Science Bootcamp', 'Premium', 50),
('Introduction to Python', 'Basic', 200),
('Understanding MongoDB', 'Premium', 100),
('Algorithms and Data Structures', 'Premium', 200);

SELECT * FROM courses;

SELECT
	course_level,
	course_name,
	SUM(sold_units) AS "Sprzedane kursy"
FROM
	courses
GROUP BY 
	course_level, 
	ROLLUP(course_name)
ORDER BY course_level, course_name;

CREATE TABLE Przedmioty (
    id INT PRIMARY KEY,
    nazwa VARCHAR(255),
    kategoria VARCHAR(50),
    podkategoria VARCHAR(50),
    ilosc_na_stanie INT
);

INSERT INTO Przedmioty (id, nazwa, kategoria, podkategoria, ilosc_na_stanie) VALUES
(1, 'Laptop', 'Elektronika', 'Komputery', 10),
(2, 'Monitor', 'Elektronika', 'Monitory', 15),
(3, 'Smartfon', 'Elektronika', 'Telefony', 20),
(4, 'Ołówek', 'Artykuły biurowe', 'Przybory piśmiennicze', 100),
(5, 'Długopis', 'Artykuły biurowe', 'Przybory piśmiennicze', 150),
(6, 'Zeszyt A4', 'Artykuły biurowe', 'Zeszyty', 200);

--raport z liczenia poszczegolnych ilosci pewnych rzeczy w kategoriach
SELECT
	CASE
		WHEN GROUPING(kategoria) = 1 THEN 'Suma Łączna wartości całego towaru w magazynie'
		WHEN GROUPING(podkategoria) = 1 THEN 'Suma łączna wartości dla kategorii'
		ELSE
			COALESCE(kategoria, '')
	END AS "Kategorie",
	
	COALESCE(podkategoria, '') AS Podkategoria,
	SUM(ilosc_na_stanie) AS Ilość_towarów
FROM
	Przedmioty
GROUP BY
	ROLLUP(kategoria, podkategoria)
ORDER BY
	kategoria, podkategoria
	




