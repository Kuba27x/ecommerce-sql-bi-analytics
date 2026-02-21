DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(50),
    registration_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    delivery_date DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'jan', 'kowalski', 'Warszawa', '2023-11-15'),
(2, ' ANNA ', 'Nowak', NULL, '2023-12-01'),
(3, 'Piotr', 'Wisniewski', 'Krakow', '2024-01-10'),
(4, 'maria', 'wojcik', '  Poznan', '2024-01-22'),
(5, 'Tomasz', 'Kaczmarek', 'Warszawa', '2024-02-05');

INSERT INTO products VALUES
(101, 'Laptop Pro 15', 'Laptopy', 4500.00),
(102, 'Smartfon X', 'Telefony', 2999.00),
(103, 'Sluchawki Bezprzewodowe', 'Akcesoria', 350.00),
(104, 'Myszka Gamingowa', 'Akcesoria', 150.00),
(105, 'Monitor 27', 'Monitory', 1200.00);

INSERT INTO orders VALUES
(1001, 1, '2024-01-15 10:30:00', '2024-01-17 14:00:00', 'completed'),
(1002, 2, '2024-01-20 15:45:00', '2024-01-25 11:00:00', 'completed'),
(1003, 3, '2024-02-10 09:15:00', NULL, 'cancelled'),                
(1004, 1, '2024-02-14 18:20:00', '2024-02-16 10:00:00', 'completed'),
(1005, 4, '2024-02-28 11:00:00', '2024-03-02 12:30:00', 'completed'),
(1006, 5, '2024-03-05 08:30:00', '2024-03-06 09:00:00', 'completed'),
(1007, 2, '2024-03-10 14:20:00', '2024-03-12 15:00:00', 'completed');

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 4500.00),
(2, 1001, 104, 2, 150.00),
(3, 1002, 102, 1, 2999.00),
(4, 1003, 105, 1, 1200.00),
(5, 1004, 103, 1, 350.00),
(6, 1005, 101, 1, 4500.00),
(7, 1005, 103, 1, 350.00),
(8, 1006, 102, 2, 2999.00),
(9, 1007, 104, 1, 150.00);