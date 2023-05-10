use learn;

-- 7. Создать представление, которое содержит всех мужчин
-- 8. Создать представление, которое содержит всех женщин
-- 9. Увеличить всем учащимся оценку в 10 раз
-- 10.  Поменяйте у Олега Петрова фамилию на Сидоров
-- 11.  Для всех учеников, у которых оценка не больше 31 увеличить на 10

CREATE VIEW v_students AS
	SELECT *
    FROM students
    WHERE gender = 'M';
    
CREATE VIEW v_students AS
	SELECT *
    FROM students
    WHERE gender = 'F';

SELECT * FROM v_students;

-- ----------------------------------------------------------

SELECT DISTINCT avg_mark
FROM students
ORDER BY avg_mark;

ALTER TABLE students
MODIFY COLUMN avg_mark decimal(4,1);
UPDATE students
SET avg_mark = avg_mark * 10;

UPDATE students
SET lastname = 'Сидоров'
WHERE firstname = 'Олег' AND lastname = 'Петров';

UPDATE students
SET avg_mark = avg_mark * 10
WHERE avg_mark <= 31;

SELECT * FROM students;


