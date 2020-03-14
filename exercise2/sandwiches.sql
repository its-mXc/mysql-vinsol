use exercise2;

SELECT * FROM locations
WHERE lname IN (
	SELECT location FROM sandwiches
	WHERE filling IN (
		SELECT filling FROM tastes 
        WHERE name = 'Jones'
	)
);

+-----------+----------+------------+
| lname     | phone    | address    |
+-----------+----------+------------+
| Buttery   | 702 3421 | College St |
| O'Neill's | 674 2134 | Pearse St  |
+-----------+----------+------------+

SELECT lname, phone, address from locations
INNER JOIN sandwiches
ON sandwiches.location = locations.lname
INNER JOIN tastes
ON sandwiches.filling = tastes.filling
WHERE tastes.name = 'Jones';

+-----------+----------+------------+
| lname     | phone    | address    |
+-----------+----------+------------+
| O'Neill's | 674 2134 | Pearse St  |
| Buttery   | 702 3421 | College St |
+-----------+----------+------------+

SELECT location, COUNT(DISTINCT name) from tastes
INNER JOIN sandwiches
ON sandwiches.filling = tastes.filling
GROUP BY location;

+-----------+----------------------+
| location  | COUNT(DISTINCT name) |
+-----------+----------------------+
| Buttery   |                    3 |
| Lincoln   |                    2 |
| O'Neill's |                    3 |
| Old Nag   |                    2 |
+-----------+----------------------+
