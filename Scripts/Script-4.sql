INSERT INTO todos
(title, description, priority, complete)
VALUES('Go to the store', 'Pick up eggs', 5, False);
INSERT INTO todos
(title, description, priority, complete)
VALUES('Cut the lawn', 'Gress is getting long', 3, False);
INSERT INTO todos
(title, description, priority, complete)
VALUES('FastAPI 공부하기', '기본 사용법 익히기', 5, False);
INSERT INTO todos
(title, description, priority, complete)
VALUES('Algorithm 공부하기', '알고리즘으로 자바 프로그램하기', 5, False);
INSERT INTO todos
(title, description, priority, complete)
VALUES('SW 테스팅 공부하기', '테스팅 내용 정리하기', 5, False);

DELETE FROM todos
WHERE id=6;

select * from todos t ;