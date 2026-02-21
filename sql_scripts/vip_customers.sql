CREATE VIEW vip_customers AS
WITH orders_cte AS 
(
	SELECT
    o.customer_id,
    SUM(oi.quantity * oi.unit_price) AS total_spent,
    COUNT(DISTINCT oi.order_id) AS total_orders
    FROM order_items oi
    JOIN orders o 
    ON oi.order_id = o.order_id
    AND o.status != 'cancelled'
    GROUP BY o.customer_id
)
SELECT CONCAT(c.first_name, ' ', c.last_name) AS full_name,
oc.total_spent,
oc.total_orders
FROM clean_customers c
JOIN orders_cte oc 
ON oc.customer_id = c.customer_id
ORDER BY oc.total_spent DESC;
