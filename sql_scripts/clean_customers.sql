CREATE VIEW clean_customers AS
SELECT customer_id, 
CONCAT(UPPER(LEFT(TRIM(first_name),1)),LOWER(SUBSTRING(TRIM(first_name),2))) AS first_name,
CONCAT(UPPER(LEFT(TRIM(last_name),1)),LOWER(SUBSTRING(TRIM(last_name),2))) AS last_name,
COALESCE(TRIM(city),'Nieznane') AS city,
registration_date
FROM customers;

