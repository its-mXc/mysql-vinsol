use exercise2;

SELECT * FROM locations
WHERE lname IN (
	SELECT location FROM sandwiches
	WHERE filling IN (
		SELECT filling FROM tastes 
        WHERE name = 'Jones'
	)
);

SELECT lname, phone, address from locations
INNER JOIN sandwiches
ON sandwiches.location = locations.lname
INNER JOIN tastes
ON sandwiches.filling = tastes.filling
WHERE tastes.name = 'Jones';

SELECT location, COUNT(DISTINCT name) from tastes
INNER JOIN sandwiches
ON sandwiches.filling = tastes.filling
GROUP BY location
