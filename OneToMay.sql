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