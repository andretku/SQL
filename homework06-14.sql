USE shop; 

-- 1) вывести название продукта, который чаще всего встречается в заказах
SELECT 
	t1.title
FROM products t1
INNER JOIN (
	SELECT 
		productid,
		count(*) AS product_count
	FROM orders
	GROUP BY productid
	ORDER BY product_count DESC 
	LIMIT 1
) t2
ON t1.id = t2.productid


-- 2) вывести название продукта, который покупают чаще всего (нужно посчетать общее количество купленных единиц)
SELECT 
	t1.title
FROM products t1
INNER JOIN (
	SELECT 
		productid,
		sum(productcount) AS product_sum
	FROM orders
	GROUP BY productid
	ORDER BY product_sum DESC 
	LIMIT 1
) t2
ON t1.id = t2.productid;


-- 3) вывести общую выручку магазина. Сумма всех купленных единиц товара.
SELECT 
	sum(t2.product_sum*t1.price) AS summing_up
FROM products t1
JOIN (
	SELECT 
		productid,
		sum(productcount) AS product_sum
	FROM orders
	GROUP BY productid
) t2
ON t1.id = t2.productid


-- 4) определить сумму выручки за онлайн продажи (online) и за продажи в магазине (direct)
SELECT 
	t3.ordertype,
	sum(t4.summing_up) AS sum_orders
FROM orders t3
JOIN (
	SELECT 
		t2.productid,
		t2.product_sum*t1.price AS summing_up
	FROM products t1
	JOIN (
		SELECT 
			productid,
			sum(productcount) AS product_sum
		FROM orders
		GROUP BY productid
		) t2
	ON t1.id = t2.productid
	) t4
ON t3.productid = t4.productid
GROUP BY t3.ordertype 
