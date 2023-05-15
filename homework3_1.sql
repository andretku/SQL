USE hr;

-- ? не решил
-- Найти департаменты в которых есть работники, зарабатывающие больше 10 000. 
-- В результате выборки формируются два поля (department_id и поле со значениями 1 или 0) (использовать метод max)
SELECT DISTINCT
    department_id
FROM employees
WHERE salary > 10000;

-- ? не решил
-- Найти департаменты в которых все работники зарабатывают больше 10 000. 
-- В результате выборки формируются два поля (department_id и поле со значениями 1 или 0)  (использовать метод min)
SELECT DISTINCT
    department_id
FROM employees
WHERE salary > 10000;

-- Отсортировать сотрудников по фамилии в алфавитном порядке
SELECT *
FROM employees
ORDER BY last_name;

-- Отсортировать сотрудников по зарплате - от самой большой зарплаты до самой маленькой
SELECT *
FROM employees
ORDER BY salary DESC;

-- Вывести сотрудников, работающих в департаментах с id 60, 90 и 110, отсортированными в алфавитном порядке по фамилии (оператор in).
SELECT *
FROM employees
WHERE department_id IN (60,90,110)
ORDER BY last_name;

-- Вывести сотрудников с job_id ST_CLERK, отсортированными по зарплате - от самой большой зарплаты до самой маленькой.
SELECT *
FROM employees
WHERE job_id = 'ST_CLERK'
ORDER BY salary DESC;

-- Вывести сотрудников, чьи имена начинаются на букву D и отсортировать их в алфавитном порядке по фамилии
SELECT *
FROM employees
WHERE first_name LIKE 'D%'
ORDER BY last_name;

-- ==============================================================================
use airport;

-- ? по задаче, как убрать null
-- 1. Выведите данные о билетах разной ценовой категории. 
SELECT 
	id,
    price,
    CASE
		WHEN price BETWEEN 10000 AND 10000
			THEN 'Economy'
		WHEN price BETWEEN 20000 AND 30000
			THEN 'PremiumEconomy'
		WHEN price > 100000
			THEN 'Business'
		ELSE null
	END AS service_class
FROM tickets;

SELECT * FROM airliners;

-- 2. Разделите самолеты на три класса по возрасту. 
SELECT
	side_number,
    CASE 
		WHEN production_year < 2000
			THEN 'Old'
		WHEN production_year BETWEEN 2000 AND 2010
			THEN 'Mid'
		ELSE 'New'
	END AS age 
FROM airliners
WHERE range1 <= 10000 
ORDER BY production_year;

-- 3. Руководство авиакомпании снизило цены на билеты рейсов LL4S1G8PQW, 0SE4S0HRRU и JQF04Q8I9G.
SELECT 
	id,
    trip_id,
    price,
    CASE
		WHEN service_class = 'Economy'
			THEN price * 0.85
		WHEN service_class = 'Business'
			THEN price * 0.9
		WHEN service_class = 'PremiumEconomy'
			THEN price * 0.8
    END AS new_price
FROM tickets;

SELECT * FROM tickets;

-- =============================================================================
-- Создайте таблицу goods (id, title, quantity)

CREATE TABLE goods (
	id int PRIMARY KEY AUTO_INCREMENT,
	title varchar(128),
    quantity int,
    price int DEFAULT 0
);

INSERT INTO goods (title, quantity, price) VALUES
	('Ball', 5, 50),
	('Doll', 3, 100),
    ('Car', 2, 10),
    ('Pen', 15, 150),
    ('Pencil', 23, 220);

SELECT * FROM goods;

-- изменение полей
ALTER TABLE goods
MODIFY COLUMN title varchar(50);

-- добавление полей
ALTER TABLE goods
ADD COLUMN discount int;

-- удаление полей
ALTER TABLE goods
DROP COLUMN discount;

 -- новая таблица на основании старой
 CREATE TABLE goods_new AS
	SELECT * FROM goods
    WHERE 1=0;
 
 -- удаление таблицы
DROP TABLE goods;