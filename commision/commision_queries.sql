use commission;

SELECT * FROM (
SELECT employees.name,SUM(commission_amount) AS total_commision from employees
INNER JOIN commissions
ON commissions.employee_id = employees.id
GROUP BY employee_id)combined
LIMIT 1

SELECT * from employees
GROUP BY salary
LIMIT 3,1

SELECT departments.name, SUM(commission_amount)from departments
INNER JOIN employees
ON departments.id = employees.department_id
INNER JOIN commissions
ON commissions.employee_id = employees.id
GROUP BY department_id
LIMIT 1;

SELECT * FROM (
SELECT employees.name,SUM(commission_amount) AS total_commision from employees
INNER JOIN commissions
ON commissions.employee_id = employees.id
GROUP BY employee_id)combined
WHERE total_commision > 4000 