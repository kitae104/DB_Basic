show TABLESPACE

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