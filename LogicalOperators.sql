-- 논리 연산들
-- 1 NOT Equal : 특정 값이 아닌 행을 반환
SELECT * FROM books;

SELECT title FROM books WHERE released_year != '2017';

SELECT title, author_lname
FROM books
WHERE
    author_lname != 'Gaiman';

-- 2. NOT LIKE : 특정 문자열을 포함하지 않는 행을 반환
SELECT title FROM books WHERE title NOT LIKE '%the%';

SELECT
    title,
    author_fname,
    author_lname
FROM books
WHERE
    title NOT LIKE '%W%';
-- 제목에 W를 포함하지 않는 행을 반환
-- 3. Greater Than : 특정 값보다 큰 행을 반환
SELECT * FROM books WHERE released_year > '2005';

SELECT * FROM books WHERE pages > 500;

SELECT 80 > 140;

SELECT 1 > NULL;

SELECT title, pages, released_year FROM books WHERE pages > 500;

-- 4. Less Than : 특정 값보다 작은 행을 반환
SELECT title, released_year FROM books WHERE released_year < '2000';

SELECT title, pages, released_year
FROM books
WHERE
    released_year < '2000'
ORDER BY released_year;

SELECT title, pages, released_year FROM books WHERE pages < 200;

SELECT title, pages, released_year FROM books WHERE pages >= 500;

SELECT title, pages, released_year
FROM books
WHERE
    released_year >= 2010;

SELECT * FROM books WHERE released_year <= 1985;

-- 5. AND : 두 개 이상의 조건을 모두 만족하는 행을 반환
SELECT
    title,
    author_lname,
    released_year
FROM books
WHERE
    author_lname = 'Eggers'
    AND released_year > '2010';

SELECT
    title,
    author_lname,
    released_year
FROM books
WHERE
    author_lname = 'Eggers'
    AND released_year > '2010'
    AND title LIKE '%novel%';

SELECT title, pages, released_year
FROM books
WHERE
    CHAR_LENGTH(title) > 30
    AND pages > 500;

-- 6. OR : 두 개 이상의 조건 중 하나라도 만족하는 행을 반환
SELECT
    title,
    author_lname,
    released_year
FROM books
WHERE
    author_lname = 'Eggers'
    OR released_year > '2010';

SELECT
    title,
    author_lname,
    released_year
FROM books
WHERE
    author_lname = 'Eggers'
    OR released_year > '2010'
    OR title LIKE '%novel%';

SELECT title, pages, released_year
FROM books
WHERE
    CHAR_LENGTH(title) > 30
    OR pages > 500;

SELECT title, pages
FROM books
WHERE
    pages < 200
    OR title LIKE '%stories%';

-- 7. BETWEEN : 두 값 사이에 있는 행을 반환
SELECT title, released_year
FROM books
WHERE
    released_year >= 2004
    AND released_year <= 2015;

SELECT title, released_year
FROM books
WHERE
    released_year BETWEEN 2004 AND 2015;

SELECT title, pages FROM books WHERE pages BETWEEN 200 AND 291;

SELECT title, pages FROM books WHERE pages NOT BETWEEN 200 AND 291;

-- 날짜 비교하기
SELECT * FROM people WHERE birthdate < '2021-01-01';

SELECT * FROM people WHERE YEAR(birthdate) < 2021;

SELECT * FROM people WHERE birthtime > '12:00:00';

SELECT * FROM people WHERE HOUR(birthtime) > 12;

SELECT CAST('2021-01-01' AS DATE);

SELECT CAST('09:00:00' AS TIME);

SELECT *
FROM people
WHERE
    birthdate BETWEEN '2021-01-01' AND '2022-12-31';

SELECT * FROM people WHERE HOUR(birthtime) BETWEEN 9 AND 17;

----------------------------------------------------------------
-- 8. IN : 여러 값 중 하나라도 일치하는 행을 반환
SELECT title, author_lname
FROM books
WHERE
    author_lname = 'Carver'
    OR author_lname = 'Lahiri'
    OR author_lname = 'Smith';

SELECT title, author_lname
FROM books
WHERE
    author_lname IN ('Carver', 'Lahiri', 'Smith');
-- Carver, Lahiri, Smith 중 하나라도 일치하는 행을 반환
SELECT title, author_lname
FROM books
WHERE
    author_lname NOT IN('Carver', 'Lahiri', 'Smith');
-- Carver, Lahiri, Smith가 아닌 행을 반환
SELECT title, released_year
FROM books
WHERE
    released_year >= 2000 -- 2000년 이후
    AND released_year % 2 = 1;
-- 홀수 년도
-- 9. CASE : 조건에 따라 다른 결과를 반환
SELECT
    title,
    released_year,
    CASE
        WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS 'Genre'
FROM books;

SELECT
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity BETWEEN 0 AND 50  THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100  THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150  THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;

SELECT
    title,
    stock_quantity,
    CASE
        WHEN stock_quantity <= 40 THEN '*'
        WHEN stock_quantity <= 70 THEN '**'
        WHEN stock_quantity <= 100 THEN '***'
        WHEN stock_quantity <= 140 THEN '****'
        ELSE '*****'
    END AS stock
FROM books;

-- 10. IS NULL : NULL인 행을 반환
SELECT title, released_year FROM books WHERE author_lname IS NULL;

-- 논리 연산 연습문제
SELECT 1 IN (5, 3) OR 9 BETWEEN 8 AND 10;

SELECT *
FROM books
WHERE
    released_year < 1980;

SELECT *
FROM books
WHERE
    author_lname = 'Eggers'
    OR author_lname = 'Chabon';
    
SELECT *
FROM books
WHERE
    author_lname = 'Lahiri'
    AND released_year > 2000;

SELECT *
FROM books
WHERE
    pages BETWEEN 100 AND 200;

SELECT title, author_lname
FROM books
WHERE
    author_lname like 'C%'
    OR author_lname like 'S%';

SELECT title, author_lname, SUBSTR(author_lname, 1, 1) AS first_letter
FROM books
WHERE
    SUBSTR(author_lname, 1, 1) in ('C', 'S');

SELECT title, author_lname,
    CASE
        WHEN title like '%stories%' THEN 'Short Stories'
        WHEN title like '%novel%' THEN 'Novel'
        ELSE 'Other'
    END AS genre
FROM books
WHERE
    SUBSTR(author_lname, 1, 1) in ('C', 'S');

SELECT author_fname, author_lname, 
CASE 
    WHEN COUNT(1) = 1 THEN '1 book'    
    ELSE CONCAT(COUNT(*), ' books')
END
FROM books
WHERE author_lname IS NOT NULL
GROUP BY author_fname, author_lname;

