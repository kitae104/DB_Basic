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
INSERT INTO contacts (name, phone) VALUES ('timmytimtim', '8781213455');
INSERT INTO contacts (name, phone) VALUES ('billybob', '9781213455');

