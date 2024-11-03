-- N:M 다대다 관계
CREATE TABLE reviewers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE series(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    released_year YEAR,
    genre VARCHAR(100)
);

CREATE TABLE reviews(
    id INT PRIMARY KEY AUTO_INCREMENT,
    rating DECIMAL(2,1), -- 0.0 ~ 10.0
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id), 
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

SELECT * FROM series;
SELECT * FROM reviewers;
SELECT * FROM reviews;    

-- 두 개의 테이블, series와 reviews를 조인(join)하여 title과 rating 정보를 가져오기
SELECT title, rating 
FROM series JOIN reviews 
ON series.id = reviews.series_id;

-- 드라마 시리즈의 평균 평점을 계산하여 결과를 평균에 대한 오름차순으로 정렬하기 
SELECT title, ROUND(avg(rating),2) as avg_rating
FROM series JOIN reviews 
ON series.id = reviews.series_id
GROUP BY title
ORDER BY avg_rating;

-- 리뷰어의 이름과 그들이 남긴 평점을 가져오기 위해 두 테이블을 조인
SELECT first_name, last_name, rating
FROM reviewers r1 JOIN reviews r2
ON r1.id = r2.reviewer_id;

-- 리뷰가 없는 시리즈의 제목을 가져오기 위해 series 테이블과 reviews 테이블을 왼쪽 조인(LEFT JOIN)하고, rating 값이 NULL인 항목을 필터링
SELECT title as unreviewed_series
FROM series s LEFT JOIN reviews r
ON s.id = r.series_id
WHERE rating IS NULL;

-- 리뷰가 없는 시리즈의 제목을 unreviewed_series라는 이름으로 가져오기 위해 series 테이블과 reviews 테이블을 오른쪽 조인(RIGHT JOIN)하고, rating 값이 NULL인 항목을 필터링
SELECT title AS unreviewed_series
FROM reviews r RIGHT JOIN series s 
ON s.id = r.series_id
WHERE r.rating IS NULL;

-- 장르별 평균 평점을 소수점 두 자리까지 반올림하여 가져오기 위해 series와 reviews 테이블을 조인하고, genre별로 그룹화한 후 평균 평점을 계산
SELECT genre, ROUND(avg(rating), 2) AS avg_rating
FROM series s JOIN reviews r 
ON s.id = r.series_id
GROUP BY s.genre;

-- 각 리뷰어의 이름, 작성한 리뷰 개수, 최소·최대 평점, 평균 평점, 그리고 활동 상태(리뷰 작성 여부에 따라 'ACTIVE' 또는 'INACTIVE')를 가져오기 위해 reviewers와 reviews 테이블을 왼쪽 조인(LEFT JOIN)하고, 리뷰어별로 그룹화하여 통계를 계산
SELECT first_name, last_name, COUNT(rating) AS COUNT, MIN(rating), MAX(rating), ROUND(AVG(rating),2) AS AVG, 
CASE 
    WHEN COUNT(rating) > 0 THEN 'ACTIVE'
    ELSE 'INACTIVE' 
END
FROM reviewers r1 LEFT JOIN reviews r2
ON r1.id = r2.reviewer_id
GROUP BY r1.id;

-- CASE 대신 IF를 사용한 예제(짧은 경우라면 IF, 여러 선택을 원하면 CASE 사용)
SELECT first_name, last_name, COUNT(rating) AS COUNT, MIN(rating), MAX(rating), ROUND(AVG(rating),2) AS AVG, 
IF(COUNT(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS
FROM reviewers r1 LEFT JOIN reviews r2
ON r1.id = r2.reviewer_id
GROUP BY r1.id;

-- 시리즈의 제목, 평점, 리뷰어의 전체 이름을 가져오기 위해 series, reviews, reviewers 테이블을 조인하여 시리즈, 평점, 리뷰어 정보를 결합
SELECT title, rating, CONCAT(first_name, ' ', last_name) AS reviewer
FROM series s INNER JOIN reviews r1
ON s.id = r1.series_id
INNER JOIN reviewers r2
ON r1.reviewer_id = r2.id;
