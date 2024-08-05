-- 논리 연산들
-- 1 NOT Equal : 특정 값이 아닌 행을 반환
SELECT * FROM books;

SELECT title FROM books WHERE released_year != '2017';

SELECT title, author_lname
FROM books 
WHERE author_lname != 'Gaiman';

-- 2. NOT LIKE : 특정 문자열을 포함하지 않는 행을 반환
SELECT title FROM books WHERE title NOT LIKE '%the%';

SELECT title, author_fname, author_lname 
FROM books 
WHERE title NOT LIKE '%W%';     -- 제목에 W를 포함하지 않는 행을 반환

-- 3. Greater Than : 특정 값보다 큰 행을 반환
