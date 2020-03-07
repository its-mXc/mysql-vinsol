use exercise2;

SELECT title from titles
WHERE publisher = 'Macmillan';

SELECT DISTINCT branch from holdings
WHERE title in (
  SELECT title from titles
  WHERE author = 'Ann Brown'
)
ORDER BY branch;

SELECT DISTINCT branch from holdings
INNER JOIN titles
ON titles.title = holdings.title
WHERE author='Ann Brown'
ORDER BY branch;

SELECT branch, SUM(`#copies`) AS Books FROM holdings
GROUP BY branch