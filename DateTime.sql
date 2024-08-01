show TABLES;

CREATE TABLE people (
    name VARCHAR(100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('kitae', '2024-07-31', '11:30:45', '2024-07-31 11:30:45');
INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Lulu', '2020-07-31', '12:30:00', '2020-07-31 12:30:00');
INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES ('Juan', '2021-06-14', '22:30:45', '2021-06-11 22:30:45');

SELECT now();

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES ('Jin', CURDATE(), CURTIME(), NOW());

SELECT birthdate FROM people;

SELECT birthdate, DAY(birthdate), DAYOFWEEK(birthdate), DAYOFYEAR(birthdate), 
MONTHNAME(birthdate), WEEK(birthdate), MONTH(birthdate) 
FROM people;

SELECT name, birthdate, HOUR(birthtime), MINUTE(birthtime), SECOND(birthtime) FROM people;

SELECT birthdate FROM people;

SELECT CURDATE() FROM people;

SELECT DATEDIFF(CURDATE(), birthdate) FROM people;

SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH); 

SELECT DATE_ADD(CURDATE(), INTERVAL 1 YEAR); 

SELECT TIMEDIFF(CURTIME(), '07:00:00');

SELECT NOW() - INTERVAL 18 YEAR;

SELECT name, birthdate FROM people;

SELECT name, birthdate, birthdate + INTERVAL 21 YEAR FROM people;

SELECT name, birthdate, YEAR(birthdate + INTERVAL 21 YEAR) as '21 later' FROM people;

SELECT TIMESTAMP("2021-07-31 12:30:45");

CREATE TABLE captions (
    text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO captions (text) VALUES ('Just me and the girls chillin');

INSERT INTO captions (text) VALUES ('Beautiful sunset');

SELECT * FROM captions;

CREATE TABLE captions2 (
    text VARCHAR(150),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    update_at TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO captions2 (text) VALUES ('i love life');

UPDATE captions2 SET text = 'I love music' WHERE text = 'i love life';

SELECT * FROM captions2;

CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(7,2),
    quantity INT
);

SELECT CURTIME();
SELECT NOW();
SELECT DAYOFWEEK(NOW());
SELECT DAYNAME(NOW());

SELECT DATE_FORMAT(NOW(), '%M %D at %k:%i');

CREATE TABLE tweets (
    content VARCHAR(180),
    user_name VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO tweets (content, user_name) VALUES ('Hello World', 'kitae');
INSERT INTO tweets (content, user_name) VALUES('this is my first tweet', 'coltscat');
INSERT INTO tweets (content, user_name) VALUES('this is my second tweet', 'coltscat');

SELECT * FROM tweets;
