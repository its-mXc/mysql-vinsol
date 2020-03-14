use campaign;

SELECT DISTINCT city from details;

SELECT city, COUNT(email) AS `people count` from details
GROUP BY city;

SELECT city, COUNT(email) AS `people count` from details
GROUP BY city
ORDER BY `people count` DESC
LIMIT 1;

SELECT substring_index(email, '@', -1) AS domain
FROM details
GROUP BY substring_index(email, '@', -1);

SELECT substring_index(email, '@', -1) AS domain, COUNT(*) AS email_count
FROM details
GROUP BY substring_index(email, '@', -1)
ORDER BY email_count DESC
LIMIT 1;



