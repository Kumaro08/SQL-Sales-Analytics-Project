create database	sales_analytics;

use sales_analytics;

show tables;

	create table customers (
		customer_id INT primary key auto_increment,
		name varchar(35),
		email varchar (255),
		country varchar (100)
		);
        

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255),
    category VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers (name, email, country) VALUES
('John Doe', 'john@example.com', 'USA'),
('Alice Smith', 'alice@example.com', 'UK'),
('David Johnson', 'david@example.com', 'Canada');

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Headphones', 'Accessories', 150.00);

INSERT INTO orders (customer_id, product_id, quantity, total_price, order_date) VALUES
(1, 1, 1, 1200.00, '2024-02-01'),
(2, 2, 2, 1600.00, '2024-02-02'),
(3, 3, 3, 450.00, '2024-02-03'),
(1, 2, 1, 800.00, '2024-02-04');


SELECT p.product_name, SUM(o.total_price) AS total_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC;

SELECT c.name, SUM(o.total_price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;

SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_price) AS revenue
FROM orders
GROUP BY month
ORDER BY month;



