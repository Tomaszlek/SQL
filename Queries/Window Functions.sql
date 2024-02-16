CREATE TABLE trades(
	region TEXT,
	country TEXT,
	year INT,
	imports NUMERIC(50),
	exports NUMERIC(50)
);

SELECT * from trades;

--PODSTAWOWE STATYSTYKI
SELECT
	MIN(imports),
	MAX(imports),
	MIN(exports),
	MAX(exports),
	AVG(imports),
	AVG(exports)
FROM
	trades;
	
SELECT
	region,
	Round(AVG(imports), 2) "Import",
	Round(AVG(exports), 2) "Export"
FROM
	trades
GROUP BY region;

UPDATE trades
SET region = 'NORTH AMERICA'
WHERE country = 'USA';

SELECT
	DISTINCT country
FROM
	trades
WHERE
	region = 'SOUTH AMERICA';






