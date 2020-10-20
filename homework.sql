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

--Query to display sum of amounts payed that are greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

--Query to display average of amounts payed that are greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

--Query to display the count of amounts payed that are greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

--Query to display the count of  DISTINCT amounts payed that are greater than 5.99
SELECT COUNT(DISTINCT amount) --non repeating values-use distinct in () 
FROM payment
WHERE amount > 5.99;

--Query to display min amount greater than 7.99
SELECT MIN(amount) AS Min_Num_Payments
FROM payment
WHERE amount > 7.99;

--Query to display max amount greater than 7.99
SELECT MAX(amount) AS Max_Num_Payments
FROM payment
WHERE amount > 7.99;

--Query to display all amounts (quick demo of groupby)
SELECT amount
FROM payment
WHERE amount = 7.99;

--Query to display different amounts grouped together
--and count the amounts
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;

-- Query to display customer_ids with the summed amounts for each customer_id
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id DESC;

-- Query to display customer_ids with the summed amounts for each customer_id
-- a different way to use Group by(*may not be the best way*)
SELECT customer_id, amount
FROM payment
GROUP BY amount,customer_id
ORDER BY customer_id DESC;

--Query to explore the data inside of the customer table
SELECT *
FROM customer;

-- Query to display customer_ids that show up more than 5 times
-- Grouping by the customer's email
SELECT COUNT(customer_id),email --we're counting the occurces of customer_id
FROM customer
WHERE email LIKE 'j__.w%'
GROUP BY email
HAVING COUNT(customer_id) > 0;

--HOMEWORK QUESTIONS--
--1. How many actors are there with the last name ‘Wahlberg’? (2)
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';

--2. How many payments were made between $3.99 and $5.99? (5607)
SELECT customer_id,amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

--3. What film does the store have the most of? (search in inventory) (8)
SELECT COUNT(film_id),film_id
FROM inventory
GROUP BY film_id 
HAVING COUNT(film_id) > 0
ORDER BY film_id DESC;

--4. How many customers have the last name ‘William’? (0)
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

--5. What store employee (get the id) sold the most rentals? (1)
SELECT *
FROM rental;

SELECT COUNT(staff_id),staff_id
FROM rental
GROUP BY staff_id 
HAVING COUNT(staff_id) > 0
ORDER BY staff_id;

--6. How many different district names are there? (378)
SELECT *
FROM address;

SELECT COUNT(DISTINCT district),district 
FROM address
WHERE district LIKE '%'
GROUP BY district
HAVING COUNT(district) > 0;

--7. What film has the most actors in it? (use film_actor table and get film_id)(508)
SELECT film_id, COUNT(film_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
--8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table) (?)
SELECT *
FROM customer;

SELECT first_name,last_name, store_id 
FROM customer
WHERE last_name LIKE '%es';


--9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--with ids between 380 and 430? (use group by and having > 250)
SELECT *
FROM payment;

SELECT customer_id, COUNT(rental_id)
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY customer_id
ORDER BY COUNT(rental_id) DESC;

--10. Within the film table, how many rating categories are there? And what rating has the most movies total? (5, 223)
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;

--HOMEWORK ENDS--



