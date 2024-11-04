DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);

INSERT INTO
    employees (department, salary)
VALUES ('engineering', 80000),
    ('engineering', 69000),
    ('engineering', 70000),
    ('engineering', 103000),
    ('engineering', 67000),
    ('engineering', 89000),
    ('engineering', 91000),
    ('sales', 59000),
    ('sales', 70000),
    ('sales', 159000),
    ('sales', 72000),
    ('sales', 60000),
    ('sales', 61000),
    ('sales', 61000),
    ('customer service', 38000),
    ('customer service', 45000),
    ('customer service', 61000),
    ('customer service', 40000),
    ('customer service', 31000),
    ('customer service', 56000),
    ('customer service', 55000);

SELECT * FROM employees;

SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY
    department;

SELECT AVG(salary) FROM employees;

-- OVER()사용하기 : 전체 집계값을 구할 때 사용 각 행마다 적용
SELECT AVG(salary) OVER () FROM employees;

SELECT emp_no, department, salary, AVG(salary) OVER ()
FROM employees;

-- employees 테이블에서 emp_no, department, salary를 가져오고, 전체 데이터에서 최소 급여(MIN(salary) OVER ())와 최대 급여(MAX(salary) OVER ()) 값을 각 행에 추가하여 표시
SELECT emp_no, 
    department, 
    salary, 
    MIN(salary) OVER (),
    MAX(salary) OVER ()
FROM employees;