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

-- 다중 열 GROUP BY
SELECT author_fname, author_lname
FROM books
ORDER BY author_lname;

-- author_lname으로 그룹화 후 각 그룹의 개수를 출력
SELECT author_lname, COUNT(*) 
FROM books
GROUP BY author_lname;

-- author_lname, author_fname으로 그룹화 후 각 그룹의 개수를 출력
SELECT author_fname, author_lname, COUNT(*) 
FROM books
GROUP BY author_lname, author_fname;

-- author_fname, author_lname을 합쳐서 author로 출력한 후 각 그룹의 개수를 출력
SELECT CONCAT(author_fname, ' ', author_lname) AS author, COUNT(*)
FROM books
GROUP BY author;

-- GROUP BY와 MIN/MAX 사용하기
-- 각 저자의 가장 먼저 출판된 책의 출판년도와 가장 최근에 출판된 책의 출판년도 출력
SELECT author_lname, MIN(released_year), MAX(released_year)
FROM books
GROUP BY author_lname;

-- 각 저자의 전체 책 개수와 가장 먼저 출판된 책의 출판년도와 가장 최근에 출판된 책의 출판년도 출력
SELECT author_lname, 
    COUNT(*) AS book_written, 
    MIN(released_year) AS latest_release, 
    MAX(released_year) AS earliest_release
FROM books
GROUP BY author_lname;

-- 각 저자의 전체 책 개수와 가장 먼저 출판된 책의 출판년도와 가장 최근에 출판된 책의 출판년도, 가장 많은 페이지수 출력
SELECT author_lname, 
    COUNT(*) AS book_written, 
    MIN(released_year) AS latest_release, 
    MAX(released_year) AS earliest_release,
    MAX(pages) AS longest_page_count
FROM books
GROUP BY author_lname;

SELECT author_lname, 
    author_fname,
    COUNT(*) AS book_written, 
    MIN(released_year) AS latest_release, 
    MAX(released_year) AS earliest_release,
    MAX(pages) AS longest_page_count
FROM books
GROUP BY author_lname, author_fname;

-- SUM : 합계
-- 전체 책의 페이지수 합계
SELECT SUM(pages) FROM books;

-- 각 저자의 전체 책의 페이지수 합계
SELECT author_lname, SUM(pages) AS total_pages 
FROM books
GROUP BY author_lname;

SELECT author_lname, pages
FROM books;

SELECT author_lname, COUNT(*), SUM(released_year)
FROM books
GROUP BY author_lname;

-- 각 저자의 전체 책의 개수와 페이지수 합계
SELECT author_lname, COUNT(*), SUM(pages)
FROM books
GROUP BY author_lname;

-- AVG : 평균
-- 전체 페이지들의 평균
SELECT AVG(pages) FROM books;

SELECT AVG(stock_quantity) FROM books;

-- 연도와 재고 수량의 평균
SELECT released_year, AVG(stock_quantity)
FROM books
GROUP BY released_year
ORDER BY released_year;

-- 연도별 각 저자의 전체 책의 개수와 재고 수량 평균
SELECT released_year, AVG(stock_quantity), COUNT(*)
FROM books
GROUP BY released_year;

-- 출판 연도별 책의 개수
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;

-- 전체 책의 재고 수량 합계
SELECT SUM(stock_quantity) FROM books;

SELECT author_fname, author_lname, AVG(released_year) 
FROM books 
GROUP BY author_fname, author_lname;

-- 가장 많은 페이지수를 가진 책의 저자 이름 출력
SELECT author_fname, author_lname, pages
FROM books
WHERE pages = (
    SELECT MAX(pages) FROM books
);

SELECT CONCAT(author_fname, ' ', author_lname) AS author, pages
FROM books
WHERE pages = (
    SELECT MAX(pages) FROM books
);




