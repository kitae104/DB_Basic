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

-- employees 테이블에서 각 직원의 번호(emp_no), 부서(department), 급여(salary)를 조회하고, 부서별 평균 급여(dept_avg)를 계산하여 함께 출력
SELECT 
    emp_no,
    department,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg
FROM employees;

-- employees 테이블에서 각 부서(department)의 평균 급여(avg_salary)를 계산하여 출력
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- employees 테이블에서 각 직원의 부서(department)와 급여(salary)를 조회하고, 각 부서별 직원 수(dept_count)를 함께 출력
SELECT department, salary,
    COUNT(*) OVER (PARTITION BY department) AS dept_count
FROM employees;

-- employees 테이블에서 각 직원의 부서(department)와 급여(salary)를 조회하고, 각 부서별 급여 합계(dept_sum)와 전체 급여 합계(total_sum)를 함께 출력
SELECT 
    department, 
    salary,
    SUM(salary) OVER (PARTITION BY department) AS dept_sum,
    SUM(salary) OVER () AS total_sum
FROM employees;

-- 직원 번호(emp_no), 부서(department), 그리고 급여(salary)를 가져오고, 각 부서별 급여의 누적 합계와 총합을 계산
SELECT emp_no, department, salary,
    SUM(salary) OVER (PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER (PARTITION BY department) AS dept_sum
FROM employees;

-- 직원 번호(emp_no), 부서(department), 급여(salary)를 가져오고, 각 부서 내에서 급여가 가장 낮은 값을 반환
SELECT emp_no, department, salary,
    MIN(salary) OVER (PARTITION BY department ORDER BY salary) 
FROM employees;

-- 직원 번호(emp_no), 부서(department), 급여(salary)를 가져오고, 전체 급여 내림차순에 따른 순위를 overall_salary_rank 열에 표시
SELECT emp_no, department, salary,
    RANK() OVER(ORDER BY salary DESC) as overall_salary_rank
FROM employees;

-- 직원 번호(emp_no), 부서(department), 급여(salary)를 가져오고, 각 부서별 급여 내림차순에 따른 순위를 dept_salary_rank 열에 표시하고, 전체 급여 내림차순에 따른 순위를 overall_salary_rank 열에 표시
SELECT emp_no, department, salary,
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_salary_rank
FROM employees
ORDER BY department, salary DESC;

-- DENSE_RANK() 사용하기 : RANK()와 비슷하지만 동일한 순위가 있을 때 다음 순위를 건너뛰지 않고 순위를 계속 매김
-- ROW_NUMBER() 사용하기 : 각 행에 순서를 매김
SELECT 
    emp_no, 
    department, 
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_row_number,
    RANK() OVER(PARTITION BY department ORDER BY SALARY DESC) as dept_salary_rank,
    RANK() OVER(ORDER BY salary DESC) as overall_rank,
    DENSE_RANK() OVER(ORDER BY salary DESC) as overall_dense_rank,
    ROW_NUMBER() OVER(ORDER BY salary DESC) as overall_num
FROM employees ORDER BY overall_rank;

-- NTILE() 사용하기 : 데이터를 동일한 크기의 그룹으로 나누어 순위를 매김
SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(ORDER BY salary DESC) as quartile
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    NTILE(4) OVER(PARTITION BY department ORDER BY salary DESC) as dept_salary_quartile,
    NTILE(4) OVER(ORDER BY salary DESC) as quartile
FROM employees;

-- FIRST_VALUE() 사용하기 : 그룹 내에서 첫 번째 값을 반환
SELECT 
    emp_no, 
    department, 
    salary,
    FIRST_VALUE(salary) OVER(PARTITION BY department ORDER BY salary DESC) as highest_paid_dept,
    FIRST_VALUE(emp_no) OVER(ORDER BY salary DESC) as highest_paid_overall
FROM employees;

-- LAG() 사용하기 : 이전 행의 값을 가져옴
SELECT 
    emp_no, 
    department, 
    salary,
    LAG(salary) OVER(ORDER BY salary DESC) as previous_salary
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(ORDER BY salary DESC) as previous_salary
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary,
    salary - LAG(salary) OVER(PARTITION BY department ORDER BY salary DESC) as dept_previous_salary
FROM employees;


-- LEAD() 사용하기 : 다음 행의 값을 가져옴
SELECT 
    emp_no, 
    department, 
    salary,
    salary - LEAD(salary) OVER(ORDER BY salary DESC) as salary_diff

FROM employees;

