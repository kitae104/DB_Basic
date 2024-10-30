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


CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);
 
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE,
    amount DECIMAL(8 , 2 ),
    customer_id INT,
    FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON DELETE CASCADE
);

-- CASCADE DELETE
DELETE FROM customers WHERE last_name = 'George'; -- 테이블 생성시 ON DELETE CASCADE 옵션
