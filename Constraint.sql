-- 제약 조건 
-- 1. UNIQUE : 특정 열에 중복된 값이 없도록 제약
CREATE TABLE companies (
  supplier_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(15) NOT NULL UNIQUE,
  address VARCHAR(255) NOT NULL
);

CREATE TABLE contacts (
  name VARCHAR(100) NOT NULL,
  phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO contacts (name, phone) VALUES ('billybob', '8781213455');
-- 제약 위배로 에러 발생
INSERT INTO contacts (name, phone) VALUES ('timmytimtim', '8781213455');
INSERT INTO contacts (name, phone) VALUES ('billybob', '9781213455');

-- 2. CHECK : 특정 열에 저장되는 값의 범위를 제한
CREATE TABLE partiers (
  name VARCHAR(50) NOT NULL,
  age INT CHECK (age > 18)
);

INSERT INTO partiers (name, age) VALUES ('billybob', 20);
-- 제약 위배로 에러 발생
INSERT INTO partiers (name, age) VALUES ('timmytimtim', 15);

CREATE TABLE palindromes (
  word VARCHAR(50) CHECK(REVERSE(word) = word)
);

INSERT INTO palindromes (word) VALUES ('radar');
-- 제약 위배로 에러 발생
INSERT INTO palindromes (word) VALUES ('hello');

-- 제약 조건에 이름 부여하기 
CREATE TABLE partiers2 (
  name VARCHAR(50) NOT NULL,
  age INT CONSTRAINT age_over_18 CHECK (age > 18)
);

INSERT INTO partiers2 (name, age) VALUES ('billybob', 20);
-- 제약 위배로 에러 발생
INSERT INTO partiers2 (name, age) VALUES ('timmytimtim', 15);

-- 3. Multi-column Constraints : 여러 열에 대한 제약 조건
CREATE TABLE company(
  supplier_id INT AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(15) NOT NULL UNIQUE,
  address VARCHAR(255) NOT NULL,
  PRIMARY KEY(supplier_id),
  CONSTRAINT name_address UNIQUE(name, address)
);

INSERT INTO company (name, phone, address) VALUES ('billybob', '8781213455', '1234 Main St');
INSERT INTO company (name, phone, address) VALUES ('timmytimtim', '8881213455', '1234 Main St');
-- 제약 위배로 에러 발생
INSERT INTO company (name, phone, address) VALUES ('billybob', '8781213455', '1234 Main St');

CREATE TABLE houses(
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(purchase_price <= sale_price)
);

INSERT INTO houses (purchase_price, sale_price) VALUES (100000, 200000);
-- 제약 위배로 에러 발생
INSERT INTO houses (purchase_price, sale_price) VALUES (200000, 100000);


