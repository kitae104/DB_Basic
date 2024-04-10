-- DISTINCT : 중복된 데이터를 제거하여 보여준다. DISTINCT는 SELECT문에서만 사용 가능하다.
-- 기존 테이블에 새로운 데이터 추가
INSERT INTO
    books (
        title, author_fname, author_lname, released_year, stock_quantity, pages
    )
VALUES (
        '10% Happier', 'Dan', 'Harris', 2014, 29, 256
    ),
    (
        'fake_book', 'Freida', 'Harris', 2001, 287, 428
    ),
    (
        'Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367
    );

SELECT * FROM books;

-- author_lname을 중복없이 보이시오.
SELECT DISTINCT author_lname FROM books;

-- author_fname과 author_lname을 나열하기
SELECT author_fname, author_lname FROM books;

-- 정렬하여 중복된 이름이 있는지 확인
SELECT author_fname, author_lname FROM books ORDER BY author_fname;

-- author_fname과 author_lname을 합치고 중복없이 보이시오.
SELECT DISTINCT author_lname, author_fname FROM books;

SELECT DISTINCT
    CONCAT(
        author_fname, ' ', author_lname
    ) as 'full name'
FROM books;

-- ORDER BY : 정렬 기준을 지정한다. ASC(오름차순), DESC(내림차순)
-- title과 author_lname을 보이시오.(정렬 없이)
SELECT title, author_lname FROM books;

-- title과 author_lname을 author_lname을 기준으로 오름차순으로 보이시오
SELECT title, author_lname FROM books ORDER BY author_lname;

-- book_id, author_fname과 author_lname을 author_lname을 기준으로 오름차순으로 보이시오
SELECT
    book_id,
    author_fname,
    author_lname
FROM books
ORDER BY author_lname;

-- book_id, author_fname과 author_lname을 author_lname을 기준으로 내림차순으로 보이시오
SELECT
    book_id,
    author_fname,
    author_lname
FROM books
ORDER BY author_lname DESC;

-- title과 released_year을 released_year을 기준으로 오름차순으로 보이시오
SELECT title, released_year FROM books ORDER BY released_year;

-- ORDER BY Index : 컬럼의 인덱스 번호를 사용하여 정렬한다.
-- title과 released_year을 released_year을 기준으로 내림차순으로 보이시오
SELECT title, released_year FROM books ORDER BY 2 DESC;

-- ORDER BY col1, col2 : col1을 기준으로 정렬하고, col1이 같은 경우 col2를 기준으로 정렬한다.
-- author_lname, released_year, 그리고 title 을 우선 author_lname을 기준으로 오름차순으로 정렬하고 released_year는 내림차순으로 정렬하시오.
SELECT
    author_lname,
    released_year,
    title
FROM books
ORDER BY author_lname, released_year DESC;

-- author_fname과 author_lname을 합치고 정렬하시오.
SELECT CONCAT(
        author_fname, ' ', author_lname
    ) as author
FROM books
ORDER BY author;

-- LIMIT : 결과를 제한한다. LIMIT는 SELECT문에서만 사용 가능하다.
-- title과 released_year을 released_year을 기준으로 오름차순으로 보이시오. 그리고 결과를 5개로 제한하시오.
SELECT book_id, title, released_year
FROM books
ORDER BY released_year
LIMIT 5;

-- title과 released_year을 released_year을 기준으로 오름차순으로 보이시오. 그리고 결과를 2번째부터 2개를 보이시오.
SELECT book_id, title, released_year
FROM books
ORDER BY released_year
LIMIT 2, 2;

SELECT book_id, title, released_year
FROM books
ORDER BY released_year DESC
LIMIT 5
OFFSET
    3;

-- LIKE : 문자열을 비교한다. %는 0개 이상의 문자열을 의미하고, _는 한 문자를 의미한다.
-- author_fname이 'David' 데이터를 보이시오.
SELECT
    title,
    author_fname,
    author_lname
FROM books
WHERE
    author_fname = 'David';

-- author_fname에  'da'가 포함된 데이터를 보이시오.
SELECT
    title,
    author_fname,
    author_lname
FROM books
WHERE
    author_fname LIKE '%da%';

-- author_fname이 4자인 데이터를 보이시오.
SELECT * FROM books WHERE author_fname LIKE '____';

-- 두번째 위치에 a가 나오는 데이터를 보이시오.
SELECT * FROM books WHERE author_fname LIKE '_a_';

-- author_fname이 'n'으로 끝나는 데이터를 보이시오.
SELECT * FROM books WHERE author_fname LIKE '%n';

-- 와일드 카드 이스케이프
-- title에 '%'가 포함된 데이터를 보이시오.
SELECT * FROM books WHERE title LIKE '%\%%';

-- title에 '_'가 포함된 데이터를 보이시오.
SELECT * FROM books WHERE title LIKE '%\_%';

-- title에 'stories'가 포함된 데이터를 보이시오.
SELECT title FROM books WHERE title LIKE '%stories%';

-- 가장 많은 페이지를 가진 책을 보이시오.
SELECT * FROM books ORDER BY pages DESC LIMIT 1;

-- 가장 최근에 출판된 책 3가지를 보이시오.
SELECT CONCAT(title, ' - ', released_year) AS summary
FROM books
ORDER BY released_year DESC
LIMIT 3;

--  author_lname에 ' '을 포함한 모든 책을 보이시오.
SELECT *
FROM books
WHERE author_lname LIKE '% %';

-- stock_quantity가 적은 책 3개를 보이시오.
SELECT title, released_year, stock_quantity
FROM books
ORDER BY stock_quantity LIMIT 3;

-- author_lname에 대해 정렬한 후 title에 대해 정렬하시오.
SELECT title, author_lname
FROM books
ORDER BY author_lname, title;

-- author_lname에 대해 정렬한 후 author_fname에 대해 정렬하고 대문자로 변경 하시오.
SELECT CONCAT(
        'MY FAVORITE AUTHOR IS', ' ', UPPER(author_fname), ' ', UPPER(author_lname)
    ) AS yell
FROM books
ORDER BY author_lname, author_fname DESC;