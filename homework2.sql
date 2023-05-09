USE hr;

SELECT salary 
FROM employees
WHERE first_name = 'Lex' AND last_name = 'De Haan';

SELECT * 
FROM employees
WHERE job_id = 'FI_ACCOUNT' 
	AND 
    salary < 8000;
    
SELECT * 
FROM employees
WHERE LOCATE('kk', last_name)
	OR
    LOCATE('ll', last_name);

SELECT * 
FROM employees
WHERE commission_pct IS NULL;

SELECT * 
FROM employees
WHERE NOT department_id IN (80, 110);

SELECT * 
FROM employees
WHERE salary BETWEEN 5000 AND 7000;

-- ===========================================================

SELECT 
	model_name,
    CASE
		WHEN range1 > 1000 AND range1 <= 2500
        THEN 'short-haul'
		WHEN range1 > 2500 AND range1 <= 6000
        THEN 'medium-haul'
        WHEN range1 > 6000
        THEN 'long-haul'
        ELSE 'Undefined'
    END AS category    
FROM airliners;




