INSERT INTO users (username) VALUES
('kitae'),
('alice'),
('bob'),
('charlie'),
('dave'),
('eve');

INSERT INTO photos (image_url, user_id) VALUES
('https://www.instagram.com/kitae/1.jpg', 1),
('https://www.instagram.com/kitae/2.jpg', 1),
('https://www.instagram.com/alice/1.jpg', 2),
('https://www.instagram.com/alice/2.jpg', 2),
('https://www.instagram.com/bob/1.jpg', 3),
('https://www.instagram.com/bob/2.jpg', 3),
('https://www.instagram.com/charlie/1.jpg', 4),
('https://www.instagram.com/charlie/2.jpg', 4),
('https://www.instagram.com/dave/1.jpg', 5),
('https://www.instagram.com/dave/2.jpg', 5),
('https://www.instagram.com/eve/1.jpg', 6),
('https://www.instagram.com/eve/2.jpg', 6);

SELECT * FROM photos;

SELECT p.image_url, u.username
FROM photos p
JOIN users u
ON p.user_id = u.id;


INSERT INTO comments (comment_text, user_id, photo_id) VALUES
('Nice pic1!', 2, 1),
('Nice pic2!', 2, 2),
('Nice pic3!', 3, 3),
('Nice pic4!', 3, 4),
('Nice pic5!', 4, 5),
('Nice pic6!', 4, 6),
('Nice pic7!', 5, 7),
('Nice pic8!', 5, 8),
('Nice pic9!', 6, 9),
('Nice pic10!', 6, 10),
('Nice pic11!', 1, 11),
('Nice pic12!', 1, 12);

SELECT * FROM comments;
