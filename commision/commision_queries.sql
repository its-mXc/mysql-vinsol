use commission;

SELECT employees.name,SUM(commission_amount) AS total_commision from employees
INNER JOIN commissions
ON commissions.employee_id = employees.id
GROUP BY employee_id
ORDER BY total_commision DESC
LIMIT 1;

SELECT name, salary from employees
GROUP BY id
ORDER BY salary DESC
LIMIT 3,1;

SELECT departments.id, departments.name, SUM(commission_amount) from departments
INNER JOIN employees
ON departments.id = employees.department_id
INNER JOIN commissions
ON commissions.employee_id = employees.id
GROUP BY department_id
ORDER BY `SUM(commission_amount)` DESC
LIMIT 1;

SELECT employees.name,SUM(commission_amount) AS total_commision from employees
INNER JOIN commissions
ON commissions.employee_id = employees.id
GROUP BY employee_id
HAVING total_commision > 4000;