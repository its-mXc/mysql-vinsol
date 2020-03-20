use asset_management;

SELECT employees.name, COUNT(*) AS device_count from personal_assigned_assets
INNER JOIN employees
ON employees.id = personal_assigned_assets.emp_id
GROUP BY emp_id
ORDER BY device_count DESC
LIMIT 1;

SELECT employees.name, COUNT(*) AS device_count from personal_assigned_assets
INNER JOIN employees
ON employees.id = personal_assigned_assets.emp_id
WHERE to_date is NULL
GROUP BY emp_id
ORDER BY device_count DESC
LIMIT 1;

SELECT employees.name, from_date , to_date from personal_assigned_assets
INNER JOIN assets
ON assets.id = personal_assigned_assets.asset_id
INNER JOIN employees
ON employees.id = personal_assigned_assets.emp_id
WHERE assets.name = 'Laptop A';

SELECT * from assets
WHERE id NOT IN (
  SELECT asset_id FROM personal_assigned_assets UNION ALL SELECT asset_id from public_assigned_assets
);

SELECT asset.* from assets
INNER JOIN personal_assigned_assets
ON personal_assigned_assets.asset_id = assets.id
INNER JOIN employees
ON employees.id = personal_assigned_assets.emp_id
WHERE employees.name = 'Bob' and personal_assigned_assets.to_date is NULL;

SELECT * from assets
WHERE CURDATE() > DATE_ADD(year, INTERVAL warranty MONTH);

SELECT * from employees
WHERE id NOT IN (
  SELECT emp_id from personal_assigned_assets
);