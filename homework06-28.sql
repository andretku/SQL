-- 1) найдите имя и фамилию пользователей, у которых нет заказов
SELECT 
	name,
	lastname
FROM customers
WHERE NOT id IN (
	SELECT 
		customer_id 
	FROM orders
);


-- 2) найдите название товаров, которые ни разу не заказывали
SELECT
	title
FROM products
WHERE id NOT IN (
	SELECT 
		product_id 
	FROM orders
);


-- 3) найдите название товаров, которые ни разу не заказывали онлайн
SELECT
	title
FROM products
WHERE id NOT IN (
	SELECT 
		product_id
	FROM orders
	WHERE order_type = 'online'
);


-- 4) найдите имя и фамилию покупателя, который сделал самый дорогой заказ
SELECT 
	c1.name,
	c1.lastname,
	max(t2.total_sum) AS total_order
FROM customers c1
INNER JOIN (
	SELECT 
		o1.customer_id, 
		sum(o1.product_count * p2.price) AS total_sum
	FROM orders o1
	INNER JOIN products p2
	ON o1.product_id = p2.id  
	GROUP BY o1.customer_id
	) t2
ON c1.id = t2.customer_id;
