SELECT id 
FROM customers c 
WHERE last_name ='George';

SELECT * 
FROM orders o
WHERE customer_id = (
	SELECT id 
    FROM customers c 
    WHERE last_name ='George');

-- 	크로스 조인 
SELECT  * 
FROM customers c , orders o ; 

-- 내부 조인
SELECT * 
FROM customers c JOIN orders o 
ON o.customer_id = c.id;

SELECT * 
FROM orders o JOIN customers c
ON c.id = o.customer_id;

SELECT first_name, last_name, order_date, amount 
FROM customers c JOIN orders o 
ON o.customer_id = c.id;

