USE func;

create table orders(
order_id int,
customer_id int,
product_id int);

insert into orders VALUES 
(1, 1, 1),
(1, 1, 2),
(1, 1, 3),
(2, 2, 1),
(2, 2, 2),
(2, 2, 4),
(3, 1, 5);

select * from orders;

create table products (
id int,
name varchar(10)
);
insert into products VALUES 
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'E');

SELECT * FROM products;
SELECT * FROM orders;
-- q1:
SELECT p.name,sum(o.customer_id) as total FROM orders o
INNER JOIN products p ON p.id=o.product_id
GROUP BY name
order by total desc




