1. Who is the senior most employeebased on job title?

SELECT * FROM employee
ORDER BY levels desc 
Limit 1

2. Which countries have the most invoices?

SELECT COUNT(*) as c, billing_country 
FROM invoice 
group by billing_country 
order by c desc

3. What are top 3 values of total invoice ?

SELECT * FROM invoice
ORDER BY total desc 
Limit 3

4. Which is the best customers? We would like to throw a promotional Music festivalin the we made the most money.
Write a query hat returns one city that returns one city that has hoghest sum of invoice total.Return both the
city name and sum of all invoices otals. 

SELECT SUM(total) as invoice_total, billing_city
FROM invoice
group by billing_city
order by invoice_total desc

5. Who is th best customer? The customer who spent the most moneywill be declared the best customer. Write a 
query that returns the perseon who has spent the most money. 

SELECT customer.customer_id, customer.first_name,  customer.last_name, SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total DESC 
LIMIT 1