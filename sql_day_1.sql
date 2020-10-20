-- Hello World SQL Query, SELECT all records from actor table
SELECT *
FROM actor;

-- Query for first_name and last name in the actor table
SELECT first_name,last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT first_name,last_name
FROM actor
WHERE first_name = 'Nick';

-- Query for a first_name that equal to Nick using the LIKE and WHERE clauses
SELECT first_name,last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_name data that starts with a J using the LIKE and WHERE clauses - using the wildcard
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 letters after the K using LIKE and WHERE clauses - using underscore
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K__';

--Query for all forst_name data that starts with a K and ends with th
--using the LIKE and WHERE clauses -- using both wild card and underscore
SELECT first_name,last_name, actor_id
FROM actor
WHERE first_name LIKE 'K__%th';


-- Comparing operators are:
-- Greater Than (>) -- Less Than (<)
-- Greater or Equal (>=) -- Less or Equal (<=)
-- Not Equal (<>)

-- Explore Data with SELECT  ALL Query(Specific to changing into new table)
SELECT *
FROM payment;

-- Query for data that shows customers who paid
-- an amount GREATER than $2
SELECT customer_id,amount
FROM payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid
-- an amount LESS than $7.99
SELECT customer_id,amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who paid
-- an amount LESS than or EQUAL to $7.99
SELECT customer_id,amount
FROM payment
WHERE amount <= 7.99;

-- Query for data that shows customers who paid
-- an amount GREATER than or EQUAL to $2.00
-- in Ascending order**
SELECT customer_id,amount
FROM payment
WHERE amount >= 2.00
ORDER BY amount ASC;

-- Query for data that shows customers who paid
-- an amount BETWEEN $2.00 and $7.99 
-- Using the BETWEEN with the AND clause**
SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 2.00 AND 7.99;

-- Query for data that shows customers who paid
-- an amount NOT EQUAL to $0.00 
-- Ordered in DESENDING Order
SELECT customer_id,amount
FROM payment
WHERE amount <> 0.00
ORDER BY amount DESC;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()