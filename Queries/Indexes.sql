CREATE UNIQUE INDEX idx_u_products_product_id ON products(product_id);

CREATE UNIQUE INDEX idx_u_customers_customer_id ON customers(customer_id);

CREATE UNIQUE INDEX idx_u_orders_order_id_customer_id ON orders(order_id, customer_id);

CREATE UNIQUE INDEX idx_u_employees_employee_id_hire_date ON employees(employee_id, hire_date);

SELECT *
FROM PG_indexes
WHERE schemaname = 'public';


SELECT *
FROM PG_indexes
WHERE tablename = 'orders';

CREATE INDEX idx_suppliers_region ON suppliers(region);

SELECT
	pg_size_pretty(pg_indexes_size('suppliers'));
	
SELECT *
FROM pg_stat_all_indexes
WHERE schemaname = 'public';

SELECT *
FROM pg_stat_all_indexes
WHERE relname = 'orders';

DROP INDEX idx_suppliers_region;
--rozne rodzaje indeksów
CREATE INDEX idx_orders_order_date ON orders USING hash(order_date);

EXPLAIN SELECT *
FROM orders
WHERE order_date = '2010-01-10';




