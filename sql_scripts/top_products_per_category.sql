CREATE VIEW top_products_per_category AS
WITH stats AS 
(
	SELECT 
    oi.product_id,
    SUM(oi.quantity) AS number_sold
    FROM order_items oi
    JOIN orders o 
    ON oi.order_id = o.order_id
    AND o.status != 'cancelled'
	GROUP BY oi.product_id
),
ranking AS 
(
	SELECT p.category,
    p.product_name,
    s.number_sold,
	DENSE_RANK() OVER(PARTITION BY p.category ORDER BY s.number_sold DESC) AS rnk
    FROM stats s
    JOIN products p 
    ON s.product_id = p.product_id
)
SELECT category, product_name, number_sold
FROM ranking
WHERE rnk = 1;

