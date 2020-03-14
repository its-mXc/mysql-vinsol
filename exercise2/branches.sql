use exercise2;

SELECT title from titles
WHERE publisher = 'Macmillan';

+----------+
| title    |
+----------+
| Susannah |
| The Wife |
+----------+

SELECT DISTINCT branch from holdings
WHERE title in (
  SELECT title from titles
  WHERE author = 'Ann Brown'
)
ORDER BY branch;

+--------+
| branch |
+--------+
| B1     |
| B2     |
| B3     |
+--------+

SELECT DISTINCT branch from holdings
INNER JOIN titles
ON titles.title = holdings.title
WHERE author='Ann Brown'
ORDER BY branch;

+--------+
| branch |
+--------+
| B1     |
| B2     |
| B3     |
+--------+

SELECT branch, SUM(`#copies`) AS Books FROM holdings
GROUP BY branch;

+--------+-------+
| branch | Books |
+--------+-------+
| B1     |     6 |
| B2     |     9 |
| B3     |     9 |
+--------+-------+