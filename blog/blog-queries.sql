USE BLOG;

/* 1 */
INSERT INTO articles
VALUES(7,'Corona','1st Dead in India'2,5);

UPDATE articles
SET heading = 'CORONA'
WHERE id = 7;

DELETE FROM articles
WHERE id = 7;

INSERT INTO authors
VALUES(7,'John');

UPDATE authors
SET name = 'John Doe'
WHERE id = 7;

DELETE FROM authors
WHERE id = 7;

INSERT INTO categories
VALUES(6, 'Medicine');

UPDATE categories
SET name = 'Pandemic'
WHERE id = 6;

DELETE FROM categories
WHERE id = 6;

INSERT INTO comments
VALUES(10,'Nice',9,8);

UPDATE comments
SET content = 'Nice'
WHERE id = 10;

DELETE FROM comments
WHERE id = 10;
/* 2 */
SELECT * from articles
INNER JOIN authors
ON articles.id = authors.id
WHERE name = 'Uday Nayak';

SET @author_name = 'Uday Nayak';
SELECT * from articles
INNER JOIN authors
ON articles.id = authors.id
WHERE name = @author_name;

/* 3 */
SELECT articles.id, heading, articles.content, comments.content AS comment from articles
INNER JOIN comments
ON comments.article_id = articles.id
INNER JOIN authors
ON articles.id = authors.id
WHERE authors.name = 'Uday Nayak';


/* 4 */
SELECT * from articles
JOIN comments
ON comments.article_id = articles.id
WHERE comments.id is NOT NULL;

SELECT * from articles
WHERE id NOT IN(
  SELECT article_id from comments
);

/* 5 */ 
SELECT * from (
SELECT articles.id, articles.content, COUNT(comments.content) AS comment_count from articles
INNER JOIN comments
ON comments.article_id = articles.id
GROUP BY articles.id)combined_blog
ORDER BY comment_count DESC
LIMIT 1;

/* 6 */
SELECT articles.id, articles.content from articles
LEFT JOIN comments
ON comments.article_id = articles.id
GROUP BY user_id
HAVING COUNT(comments.content) = 1
