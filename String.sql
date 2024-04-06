-- REPLACE : 문자열 변경하기
SELECT
    REPLACE ('Hello World', 'Hell', '1234');

SELECT
    REPLACE ('cheese bread coffee milk', ' ', ' and ');

SELECT
    REPLACE ('Hello World', 'l', '7');

SELECT
    REPLACE ('Hello World', 'o', '0');

SELECT
    REPLACE ('HellO World', 'o', '*');

SELECT
    REPLACE (title, ' ', '-')
FROM
    books;

-- REVERSE : 문자열 꺼꾸로 출력하기
SELECT
    REVERSE ('Hello World');

SELECT
    REVERSE (NULL);

SELECT
    REVERSE (author_fname)
FROM
    books;

SELECT
    CONCAT (author_fname, REVERSE (author_fname))
FROM
    books b;

-- CHAR_LENGTH 문자열 길이 출력
SELECT
    CHAR_LENGTH('Hello World');

SELECT
    LENGTH ("홍길동");

-- 문자열 길이(바이트 단위)
SELECT
    CHAR_LENGTH('홍길동');

-- 문자열 길이(글자수)
SELECT
    CHAR_LENGTH(title),
    title
FROM
    books;

SELECT
    author_lname,
    CHAR_LENGTH(author_lname) AS 'length'
FROM
    books;

SELECT
    CONCAT (
        author_lname,
        ' is ',
        CHAR_LENGTH(author_lname),
        ' characters long'
    )
FROM
    books;

-- UPPER : 대문자로 변경 UPPER(문자열)
SELECT
    UPPER('Hello World');

SELECT
    UCASE ('Hello World');

SELECT
    UPPER(title)
FROM
    books;

SELECT
    CONCAT ('MY FAVORITE BOOK IS ', UPPER(title))
FROM
    books;

SELECT
    CONCAT ('I LOVE ', UPPER(title), ' !!!')
FROM
    books;

-- LOWER : 소문자로 변경 LOWER(문자열)
SELECT
    LOWER('Hello World');

SELECT
    LOWER(title)
FROM
    books;

SELECT
    CONCAT ('MY FAVORITE BOOK IS ', LOWER(title))
FROM
    books;

-- INSERT : 문자열 삽입 INSERT(문자열, 시작위치, 길이, 삽입할 문자열)
SELECT
    INSERT ('Hello World', 6, 0, ' Beautiful ');

SELECT
    INSERT ('Hello Boddy', 6, 0, ' There');

SELECT
    INSERT ('Hello Boddy', 6, 4, ' There');

SELECT
    INSERT ('Hello Boddy', 6, 6, ' There');

-- LEFT : 왼쪽에서부터 문자열 추출 LEFT(문자열, 길이)
SELECT
    LEFT ('Hello World', 5);

SELECT
    LEFT (author_fname, 1)
FROM
    books;

-- RIGHT : 오른쪽에서부터 문자열 추출 RIGHT(문자열, 길이)
SELECT
    RIGHT ('Hello World', 5);

-- TRIM : 문자열 공백 제거 TRIM(문자열)
SELECT
    TRIM(' Hello World ');

-- LEADING : 왼쪽 공백 제거 LEADING(문자열)
SELECT
    TRIM(
        LEADING '.'
        FROM
            '......Hello World..'
    );

-- TRAILING : 오른쪽 공백 제거 TRAILING(문자열)
SELECT
    TRIM(
        TRAILING '.'
        FROM
            '......Hello World..'
    );

-- BOTH : 양쪽 공백 제거 BOTH(문자열)
SELECT
    TRIM(
        BOTH '.'
        FROM
            '......Hello World..'
    );

--------------------------------------------------------------------
--연습문제
--------------------------------------------------------------------
-- 다음 문자열을 역순으로 한 후 대문자로 변경하시오.
SELECT
    UPPER(REVERSE ('Hello World'));

-- 다음은 어떻게 출력되는가?
SELECT
    REPLACE (CONCAT ('I', ' ', 'like', ' ', 'cats'), ' ', '-');

-- 타이틀에서 공백을 -> 로 변경하시오.
SELECT
    REPLACE (title, ' ', '->') as title
FROM
    books;

-- author_lname을 순방향과 역방으로 출력하시오.
SELECT
    author_lname as forwords,
    REVERSE (author_lname) as backwards
FROM
    books;

-- author_fname과 author_lname을 합치고 대문자로 변경하시오.
SELECT
    UPPER(CONCAT (author_fname, ' ', author_lname)) as 'full name in caps'
FROM
    books;

-- 제목과 출판일을 합치시오.
SELECT
    CONCAT (title, ' was released in ', released_year) as blurb
FROM
    books;

-- title의 길이를 출력하시오.
SELECT
    title,
    CHAR_LENGTH(title) as 'title length'
FROM
    books;

-- short title, author, quantity 를 보이세요. 
SELECT
    CONCAT (SUBSTR (title, 1, 10), '...') AS 'short title',
    CONCAT (author_lname, ', ', author_fname) AS 'author',
    CONCAT (stock_quantity, ' in stock') AS 'quantity'
FROM
    books;

SELECT * FROM books;