-- REPLACE : 문자열 변경하기
SELECT REPLACE ('Hello World', 'Hell', '1234');

SELECT REPLACE ( 'cheese bread coffee milk', ' ', ' and ' );

SELECT REPLACE ('Hello World', 'l', '7');

SELECT REPLACE ('Hello World', 'o', '0');

SELECT REPLACE ('HellO World', 'o', '*');

SELECT REPLACE (title, ' ', '-') FROM books;

-- REVERSE : 문자열 꺼꾸로 출력하기
SELECT REVERSE('Hello World');

SELECT REVERSE(NULL);

SELECT REVERSE(author_fname) FROM books;

SELECT CONCAT(
        author_fname, REVERSE(author_fname)
    )
FROM books b;

-- CHAR_LENGTH 문자열 길이 출력
SELECT CHAR_LENGTH('Hello World');

SELECT LENGTH("홍길동");

-- 문자열 길이(바이트 단위)
SELECT CHAR_LENGTH('홍길동');

-- 문자열 길이(글자수)
SELECT CHAR_LENGTH(title), title FROM books;

SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;
