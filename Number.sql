CREATE Table products (
    price DECIMAL(5, 2)
);

INSERT INTO products (price) VALUES (4.50);
INSERT INTO products (price) VALUES (456.52);
-- INSERT INTO products (price) VALUES (1456.2); -- Error(자리수는 맞지만 소수점 앞쪽의 자리수가 맞지 않음)
INSERT INTO products (price) VALUES (6.206);    -- Warning(소수점 아래 자리수가 맞지 않지만 잘라서 입력됨)
SHOW WARNINGS;

SELECT * FROM products;