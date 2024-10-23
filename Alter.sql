-- 테이블 수정하기(Alter)
-- 1. 열 추가하기(ADD) 
SELECT * FROM company;

ALTER TABLE company
ADD COLUMN city VARCHAR(25);

SELECT * FROM company;

ALTER TABLE company
ADD COLUMN employee_count INT NOT NULL;

-- 2. 열 삭제하기(DROP) 
ALTER TABLE company
DROP COLUMN employee_count;

ALTER TABLE company
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

-- 3. 테이블/열 이름 변경하기(RENAME) 
RENAME TABLE company TO suppliers;

SELECT * FROM suppliers;

ALTER TABLE suppliers
RENAME COLUMN city TO town;

-- 4. 열 수정하기(Modify) 
ALTER TABLE suppliers
MODIFY COLUMN town VARCHAR(50);

ALTER TABLE suppliers
MODIFY COLUMN name VARCHAR(100) DEFAULT '홍길동';

INSERT INTO suppliers (phone, address, town) VALUES ('2221213455', '1234 Main St', 'Springfield');

ALTER TABLE suppliers
CHANGE COLUMN name biz_name VARCHAR(40);

SELECT * FROM suppliers;

-- 5. 제약 조건 추가하기(ADD CONSTRAINT)
ALTER TABLE suppliers
ADD CONSTRAINT biz_name_address UNIQUE(biz_name, address);

INSERT INTO suppliers (biz_name, phone, address, town) VALUES ('billy', '1231213455', '2222 Main St', 'Springfield');
-- 중복된 값이 있어 제약 위배로 에러 발생
INSERT INTO suppliers (biz_name, phone, address, town) VALUES ('billybob', '2221213455', '1234 Main St', 'Springfield');