use sales;

SELECT salesperson.id, salesperson.name, customer.name AS `customer name` from salesperson
INNER JOIN orders
ON orders.salesperson_id = salesperson.id
INNER JOIN customer
ON orders.cust_id = customer.id
WHERE customer.name = 'Samsonic';

SELECT *, COUNT(orders.id) AS `order count` from  salesperson
INNER JOIN orders
ON orders.salesperson_id = salesperson.id
GROUP BY salesperson.id
HAVING `order count` >=  2;

SELECT * from(
  SELECT salesperson.*, orders.order_date from salesperson
INNER JOIN orders
ON orders.salesperson_id = salesperson.id
WHERE DATEDIFF(CURDATE(), orders.order_date) >= 15
ORDER BY orders.order_date DESC)combined
GROUP BY id
ORDER BY id;

SELECT SUM(orders.amount) AS `total orders amount`from salesperson
INNER JOIN orders
on orders.salesperson_id = salesperson.id
GROUP BY salesperson.id
ORDER BY `total orders amount` DESC
LIMIT 1
INTO @max_amount;

SELECT *, SUM(orders.amount) AS `total orders amount`from salesperson
INNER JOIN orders
on orders.salesperson_id = salesperson.id
GROUP BY salesperson.id
HAVING `total orders amount` = @max_amount;

SELECT salesperson.name, GROUP_CONCAT(customer.industry_type) from salesperson
INNER JOIN orders
ON orders.salesperson_id = salesperson.id
INNER JOIN customer
ON orders.cust_id = customer.id
GROUP BY salesperson.id;

SELECT salesperson.name, SUM(orders.amount) AS `sales amount` from salesperson
INNER JOIN orders
ON orders.salesperson_id = salesperson.id
GROUP BY salesperson.id;

