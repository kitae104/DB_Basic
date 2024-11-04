SELECT title, released_year, genre, rating, first_name, last_name
FROM reviews r1 
JOIN series s ON s.id = r1.reviewer_id
JOIN reviewers r2 ON r2.id = r1.reviewer_id;

-- VIEW 생성하기
CREATE VIEW full_reviews AS 
SELECT title, released_year, genre, rating, first_name, last_name
FROM reviews r1 
JOIN series s ON s.id = r1.reviewer_id
JOIN reviewers r2 ON r2.id = r1.reviewer_id;

show tables;

SELECT * FROM full_reviews;

-- full_reviews 뷰에서 장르가 'Animation'인 모든 행을 선택.
SELECT * 
FROM full_reviews
WHERE genre = 'Animation';

-- full_reviews 뷰에서 장르별 평균 평점을 계산하여 각 장르와 해당 평균 평점을 반환
SELECT genre, AVG(rating)
FROM full_reviews
GROUP BY genre;

-- VIEW 만들기 
CREATE VIEW ordered_series AS 
SELECT *
FROM series
ORDER BY released_year;

SELECT *
FROM ordered_series;

-- 뷰를 새로 만들거나 기존 뷰를 업데이트 할 때 사용 
CREATE OR REPLACE VIEW ordered_series AS 
SELECT *
FROM series
ORDER BY released_year DESC;

ALTER VIEW ordered_series AS 
SELECT *
FROM series
ORDER BY released_year;

SELECT * FROM ordered_series;

SELECT title, AVG(rating) 
FROM full_reviews
GROUP BY title;

-- HAVING : 그룹화된 결과에 대한 필터링을 수행
-- 각 title에 대해 평균 평점(AVG(rating))과 평점 수(COUNT(rating))를 계산하며, 평점이 1개 초과인 항목만 가져오기
SELECT title, AVG(rating), COUNT(rating)
FROM full_reviews
GROUP BY title
HAVING COUNT(rating) > 1;

-- GROUP BY ROLLUP : 그룹화된 결과에 대한 합계 행을 반환
SELECT title, AVG(rating)
FROM full_reviews
GROUP BY title
WITH ROLLUP;

SELECT title, COUNT(rating)
FROM full_reviews
GROUP BY title
WITH ROLLUP;

-- released_year와 genre별로 평점 수(COUNT(rating))를 계산하며, WITH ROLLUP을 사용해 각 연도와 장르에 대한 소계와 전체 합계를 추가로 제공
SELECT released_year, genre, COUNT(rating)
FROM full_reviews
GROUP BY released_year, genre
WITH ROLLUP;