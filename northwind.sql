--cwiczenia na northwindzie
SELECT *
FROM orders
WHERE ship_country in('USA', 'France');

SELECT
	ship_country,
	COUNT(*)
FROM orders
WHERE ship_country in('USA', 'France')
GROUP BY ship_country;

SELECT
	ship_country,
	COUNT(*)
FROM orders
WHERE ship_country in('Brazil', 'Argentina', 'Venezuela', 'Mexico')
GROUP BY ship_country;


SELECT
	order_id,
	CEIL(((unit_price * quantity) - discount)::numeric(10,2)) AS "Całkowita Sprzedaż"
FROM
	order_details
ORDER BY 2 DESC;

SELECT
	MIN(order_date),
	MAX(order_date)
FROM
	orders;
	
SELECT
	c.category_name,
	COUNT(p.product_id)
FROM
	categories c
INNER JOIN products p ON c.category_id = p.category_id
GROUP BY c.category_name

	
SELECT
	product_name,
	units_in_stock,
	reorder_level
FROM
	products
WHERE
	units_in_stock < reorder_level;
	
SELECT
	freight
FROM
	orders
LIMIT 5;

SELECT
	freight
FROM
	orders
WHERE extract(YEAR from order_date) = 1997
LIMIT 5;

SELECT
	ship_country,
	round(SUM(freight)::numeric, 2)
FROM
	orders
WHERE extract(YEAR from order_date) = (SELECT MAX(extract(YEAR from order_date))
						 				from orders)
GROUP BY ship_country
ORDER BY 2 DESC
LIMIT 5;

SELECT
	customer_id
FROM
	customers
WHERE EXISTS(
	SELECT customer_id
	FROM orders
	WHERE order_id is null
);

SELECT
	COUNT(o.order_id),
	c.customer_id
FROM ORDERS O
FULL JOIN CUSTOMERS C ON O.CUSTOMER_ID = C.CUSTOMER_ID
group by C.customer_id
order by 1;

SELECT
	c.company_name,
	ROUND(SUM((od.quantity*od.unit_price) - od.discount)::NUMERIC, 2) AS "Łączna wartość zamówień"
FROM
	customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.company_name
having SUM((od.quantity*od.unit_price) - od.discount) IS NOT NULL
ORDER BY 2 DESC
LIMIT 5;

WITH double_orders AS(
	SELECT
		order_id,
		quantity
	FROM
		order_details
	WHERE
		quantity > 60
	GROUP BY
		order_id,
		quantity
	HAVING COUNT(*) > 1
	ORDER BY
		order_id
)
SELECT *
FROM order_details
WHERE order_id IN (SELECT order_id FROM double_orders)
ORDER BY order_id;

SELECT order_id
FROM orders
WHERE required_date < shipped_date;

SELECT DISTINCT e.first_name || ' ' || e.last_name AS "Employee"
FROM employees e
LEFT JOIN orders o ON e.employee_id = o.employee_id
WHERE o.required_date < o.shipped_date;

SELECT country
FROM customers

UNION

SELECT country
FROM suppliers;


WITH next_order_date AS(
	SELECT
		customer_id,
		order_date,
		LEAD(order_date, 1) 
		OVER (PARTITION BY customer_id ORDER BY customer_id, order_date) AS Data_następnego_zamówienia
	FROM orders
)

SELECT
	customer_id,
	order_date,
	Data_następnego_zamówienia,
	(Data_następnego_zamówienia - order_date) AS Czas_pomiędzy_zamówieniami
FROM
	next_order_date
WHERE
	(Data_następnego_zamówienia - order_date) >= 5
ORDER BY 4 DESC
LIMIT 10
	
--pierwsze zamowienie dla danego kraju, ważne!!!
WITH ilosc_zamowien_na_dany_kraj AS(
	SELECT
		ship_country,
		order_id,
		order_date,
		ROW_NUMBER() OVER(PARTITION BY ship_country ORDER BY ship_country, order_date) country_row_number
	FROM
		orders
)

SELECT
	ship_country,
	order_id,
	order_date
FROM
	ilosc_zamowien_na_dany_kraj
WHERE
	country_row_number = 1
ORDER BY
	ship_country

	
	
	
	