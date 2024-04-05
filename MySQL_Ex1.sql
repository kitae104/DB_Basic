-- 테이블 전체 지우기 
DELETE FROM cats;

-- 특정 데이터 지우기 
DELETE FROM cat WHERE name = 'Egg';

-- 테이블 삭제하기 
DROP cat;

-- age가 4인 고양이 지우기 
DELETE FROM cats WHERE age = 4;

-- cat_id와 age가 같은 고양이 지우기 
SELECT * FROM cats WHERE cat_id = age;	-- 우선 해당 경우가 있는지 검색
DELETE FROM cats WHERE cat_id = age;	-- 제거
SELECT * FROM cats;						-- 확인 

-- ---------------------------------------------------
SELECT * FROM cats;
SELECT * FROM cats WHERE breed = 'Tabby';

-- 데이터 수정하기 
-- 조건에 맞는 경우만 변경 
UPDATE cats SET breed = 'Shorthair' WHERE breed = 'Tabby';
SELECT * FROM cats;

-- 단일 컬럼 변경
UPDATE employees SET last_name ='roosterbeard';	 
SELECT * FROM employees;

-- 동시에 여러 컬럼 변경하기 
UPDATE employees SET current_status = 'laid-off', last_name ='who cares'
SELECT * FROM employees;

UPDATE cats SET age=14 WHERE name='Misty'; 
SELECT * FROM cats;

-- Jackson 을 Jack 으로 변경하기 
UPDATE cats SET name = 'Jack' WHERE name = 'Jackson';
SELECT * FROM cats;

-- Ringo의 breed를 Tabby에서 British Shorthair 로 변경하기 
UPDATE cats SET breed = 'British Shorthair' WHERE name = 'Ringo';

-- breed가 Maine Coon인 경우 age를 12로 변경하기 
UPDATE cats SET age = 12  WHERE breed = 'Maine Coon';

