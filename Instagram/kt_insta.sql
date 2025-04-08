USE kt_insta;
SELECT * FROM users;

-- 1. 가입이 제일 오래된 5명 찾기 
SELECT * FROM users ORDER BY created_at LIMIT 5;