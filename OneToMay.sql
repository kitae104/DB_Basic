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