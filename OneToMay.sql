SELECT id 
FROM customers c 
WHERE last_name ='George';

SELECT * 
FROM orders o
WHERE customer_id = (
	SELECT id 
    FROM customers c 
    WHERE last_name ='George');

-- 	CROSS JOIN : 두 테이블 간의 모든 행을 조합 
SELECT  * 
FROM customers c , orders o ; 

-- INNER JOIN : 두 테이블 간의 일치하는 행만 반환
SELECT * 
FROM customers c JOIN orders o 
ON o.customer_id = c.id;

SELECT * 
FROM orders o JOIN customers c
ON c.id = o.customer_id;

SELECT first_name, last_name, order_date, amount 
FROM customers c JOIN orders o 
ON o.customer_id = c.id;

SELECT first_name, last_name, SUM(amount) as total
FROM customers c JOIN orders o 
ON o.customer_id = c.id
GROUP BY first_name, last_name
ORDER BY total;

-- LEFT JOIN : 왼쪽 테이블의 모든 행을 포함하고 오른쪽 테이블의 일치하는 행이 없는 경우 NULL 값을 사용
SELECT first_name, last_name, order_date, amount
FROM customers c LEFT JOIN orders o
ON o.customer_id = c.id;

SELECT first_name, last_name, order_date, amount
FROM orders o LEFT JOIN customers c
ON o.customer_id = c.id;

-- IFNULL : NULL 값을 다른 값으로 대체
SELECT first_name, last_name, IFNULL(SUM(amount), 0) as money_spent
FROM customers c LEFT JOIN orders o
ON c.id = o.customer_id
GROUP BY first_name, last_name;

-- RIGHT JOIN : 오른쪽 테이블의 모든 행을 포함하고 왼쪽 테이블의 일치하는 행이 없는 경우 NULL 값을 사용
SELECT first_name, last_name, order_date, amount
FROM customers c RIGHT JOIN orders o
ON c.id = o.customer_id;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50)    
);

CREATE TABLE papers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(50),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

-- inner join : 두 테이블 간의 일치하는 행만 반환
SELECT first_name, title, grade
FROM students s JOIN papers p
ON s.id = p.student_id
ORDER BY grade DESC;

-- left join : 왼쪽 테이블의 모든 행을 포함하고 오른쪽 테이블의 일치하는 행이 없는 경우 NULL 값을 사용
SELECT first_name, IFNULL(title, 'MISSING'), IFNULL(grade, 0)
FROM students s LEFT JOIN papers p
ON s.id = p.student_id;

-- left join group by : 왼쪽 테이블의 모든 행을 포함하고 오른쪽 테이블의 일치하는 행이 없는 경우 NULL 값을 사용
SELECT first_name, IFNULL(AVG(grade), 0) as average
FROM students s LEFT JOIN papers p
ON s.id = p.student_id
GROUP BY first_name
ORDER BY average DESC;

SELECT first_name, IFNULL(AVG(grade), 0) as average, 
    CASE 
        WHEN IFNULL(AVG(grade), 0) >= 75 THEN  'passing'
        ELSE  'failing'
    END AS passing_status
FROM students s LEFT JOIN papers p
ON s.id = p.student_id
GROUP BY first_name
ORDER BY average DESC;
