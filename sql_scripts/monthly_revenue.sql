CREATE VIEW monthly_revenue AS
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
SUM(oi.quantity * oi.unit_price) AS current_revenue,
LAG(SUM(oi.quantity * oi.unit_price)) OVER(ORDER BY DATE_FORMAT(o.order_date, '%Y-%m')) AS previous_revenue
FROM orders o 
JOIN order_items oi
ON o.order_id = oi.order_id
AND o.status != 'cancelled'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m');
