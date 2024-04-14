-- 집계 함수 : 여러 행을 하나의 결과로 집계하는 함수

-- 1. COUNT() : 행의 개수를 반환
-- 전체 책의 개수
SELECT COUNT(*) FROM books;

-- 페이지수가 300 이상인 책의 개수
SELECT COUNT(*) FROM books WHERE pages > 300;

-- author_fname의 갯수는 몇개?
SELECT COUNT(author_fname) FROM books;

-- author_fname의 중복을 제외한 갯수는 몇개?
SELECT COUNT(DISTINCT (author_fname)) FROM books;

-- released_year의 중복을 제외한 갯수는 몇개?
SELECT COUNT(DISTINCT (released_year)) FROM books;

-- title에 the가 들어간 책의 제목을 출력
SELECT title FROM books WHERE title LIKE '%the%';

-- the가 들어간 책의 개수
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

-- 2. GROUP BY : 그룹화 후 집계 함수 사용
-- author_lname으로 그룹화 후 author_lname을 출력
SELECT author_lname FROM books GROUP BY author_lname;

-- author_lname으로 그룹화 후 각 그룹의 개수를 출력하되 개수가 많은 순으로 출력
SELECT author_lname, COUNT(*) AS books_written
FROM books
GROUP BY
    author_lname
ORDER BY books_written DESC;

-- released_year로 그룹화 후 각 그룹의 개수를 출력
SELECT released_year, COUNT(*) AS books_released
FROM books
GROUP BY
    released_year;

SELECT author_lname, COUNT(author_lname)
FROM books
GROUP BY
    author_lname;

-- 3. MIN() : 최소값 / MAX() : 최대값
-- 가장 이전에 출판된 책의 출판년도
SELECT MIN(released_year) FROM books;

-- 가장 페이지수가 많은 책의 페이지수
SELECT MAX(pages) FROM books;

-- 알파벳 순서가 가장 느린 author_lname과 가장 순서가 빠른 author_lname 찾기
SELECT MIN(author_lname), MAX(author_lname) FROM books;

-- 4. Subquery : 하위 쿼리
-- 페이지수가 가장 많은 책의 제목(LIMIT 사용)
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- 페이지수가 가장 많은 책의 제목(Subquery 사용)
SELECT * 
FROM books 
WHERE pages = ( 
    SELECT MAX(pages) 
    FROM books 
);

-- 가장 먼저 출판된 책의 제목
SELECT title, released_year
FROM books
WHERE released_year = (
    SELECT MIN(released_year)
    FROM books
);