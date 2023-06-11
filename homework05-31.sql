-- 1) Вывести имена студентов и курсы, которые они проходят
USE homework05_31

SELECT
	t1.name,
	t3.title 
FROM students t1
INNER JOIN students2Courses t2
ON t1.id = t2.student_id
INNER JOIN courses t3
ON t2.course_id = t3.id;

-- 2) Вывести имена всех преподавателей с их компетенциями
SELECT 
	t1.name,
	t3.title 
FROM teachers t1
INNER JOIN teachers2competencies t2
ON t1.id = t2.teacher_id 
INNER JOIN competencies t3
ON t2.competencies_id = t3.id;

-- 3) Найти преподавателя, у которого нет компетенций
SELECT 
	t1.name
FROM teachers t1
LEFT JOIN teachers2competencies t2
ON t1.id = t2.teacher_id 
LEFT JOIN competencies t3
ON t2.competencies_id = t3.id
WHERE t3.title IS NULL;

-- 4) Найти имена студентов, которые не проходят ни один курс
SELECT 
	name
FROM students
WHERE name NOT IN (
	SELECT
		t1.name
	FROM students t1
	INNER JOIN students2Courses t2
	ON t1.id = t2.student_id
	INNER JOIN courses t3
	ON t2.course_id = t3.id
);

-- 5) Найти курсы, которые не посещает ни один студент
SELECT 
	title
FROM courses
WHERE title NOT IN (
	SELECT
		t3.title 
	FROM students t1
	INNER JOIN students2Courses t2
	ON t1.id = t2.student_id
	INNER JOIN courses t3
	ON t2.course_id = t3.id
);

-- 6) Найти компетенции, которых нет ни у одного преподавателя
SELECT 
	title
FROM competencies
WHERE title NOT IN (
	SELECT 
		t3.title 
	FROM teachers t1
	INNER JOIN teachers2competencies t2
	ON t1.id = t2.teacher_id 
	INNER JOIN competencies t3
	ON t2.competencies_id = t3.id
);

-- 7) Вывести название курса и имя старосты
SELECT 
	t1.title,
	t2.name AS headman
FROM courses t1
JOIN students t2
ON t1.headman_id = t2.id;

-- 8) Вывести имя студента и имена старост, которые есть на курсах, которые он проходит
SELECT
	t1.name,
	t3.title,
	t4.name AS headman
FROM students t1
JOIN students2Courses t2
ON t1.id = t2.student_id
JOIN courses t3
ON t2.course_id = t3.id
JOIN students t4
ON t3.headman_id = t4.id;




