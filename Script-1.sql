-- First query, we will select all the records from the actor table

select * from actor

-- first and last name for actor table

select first_name,last_name
from actor;

-- Query for first name Nick using the where clause

select first_name, last_name
from actor
where first_name like 'Nick';

-- query for first name data that starts with J using like and where clauses and wildcard

select first_name,actor_id
from actor 
where first_name like 'J%';

-- query for all first names that start with K and has two letters after with underscore
select first_name, actor_id
from actor 
where first_name like 'K__';

-- query for all names that start with K and ends with th
select first_name, last_name, actor_id
from actor 
where first_name like 'K__%th';

-- comparing operators 
-- <=, >=, <, >, <>
-- explore data with select all data so we can change into a new table
select * from payment

-- query for customers that paid greater than $2
select customer_id, amount
from payment
where amount > 2.00; 

-- query that shows customers that paid less than 7.99
select customer_id, amount
from payment
where amount < 7.99;

-- query for less or equal too
select customer_id, amount
from payment
where amount <= 7.99;

-- query for greater than
select customer_id, amount
from payment
where amount > 7.99;

-- great or equal to
select customer_id, amount
from payment
where amount >= 7.99;

-- query for data that shows for customers who paid not equal to $0 ordered in desending order
select customer_id, amount
from payment
where amount <> 0.00
order by amount desc; 


-- SQL aggregate functions. Things like sum, avg, count, min, max
-- query to display the sum of amounts paid that are greater than 5.99
select sum(amount) 
from payment 
where amount > 5.99;

-- Query to display the average amounts paid greater than 5.99
select avg(amount) from payment where amount > 5.99;

--Query to display count of amounts paid over 5.99
select count(amount) from payment where amount > 5.99;

-- Query to display min amount paid over 7.99
select min(amount) from payment where amount > 7.99;

-- Query to display the count of distinct amounts paid greater than 5.99
select count(distinct amount) from payment where amount > 5.99;

-- query to display min amount greater than 5.99
select min(amount) as min_num_payments 
from payment 
where amount > 7.99;


-- query to display max amount greater than 5.99
select max(amount) as max_num_payments 
from payment 
where amount > 7.99;

-- demo of groupby
select amount
from payment
where amount = 4.96;

--query to display different amounts grouped together
-- and count the amounts
select amount, count(amount)
from payment
group by amount 
order by amount;


-- display cust ID with sum amounts for each id
select customer_id, sum(amount)
from payment
group by customer_id 
order by customer_id desc;


-- HOMEWORK

select first_name, last_name
from actor
where last_name like 'Wahlberg';

SELECT COUNT(*) AS payment
FROM payment
WHERE amount >= 3.99 AND amount <= 5.99;


SELECT film_id, COUNT(*) AS copy_count
FROM inventory
GROUP BY film_id
ORDER BY copy_count DESC
LIMIT 1;

select last_name, COUNT(*) AS copy_count
from customer
where last_name = 'William'
group by last_name;



SELECT staff.staff_id, staff.first_name, staff.last_name, COUNT(rental.rental_id) AS rental_count
FROM staff
JOIN customer ON staff.store_id = customer.store_id
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY staff.staff_id, staff.first_name, staff.last_name
ORDER BY rental_count DESC
LIMIT 1;

SELECT COUNT(DISTINCT district) AS district_count
FROM ;

SELECT fa.film_id, f.title, COUNT(fa.actor_id) AS actor_count
FROM film_actor fa
JOIN film f ON fa.film_id = f.film_id
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.store_id = 1
GROUP BY fa.film_id, f.title
ORDER BY actor_count DESC
LIMIT 1;


--inner join on actor and film actor table
select actor.actor_id, first_name, last_name, film_id
from film_actor 
inner join actor 
on actor.actor_id = film_actor.actor_id

-- left join on actor and film_actor table
select actor.actor_id, first_name, last_name, film_id
from film_actor 
left  join actor 
on actor.actor_id = film_actor.actor_id


select customer.first_name, customer.last_name, customer.email, country
from customer 
full  join address 
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id
full join country 
on city.country_id = country.country_id
where country = 'Angola'


--subqueries 
--two queries split a part
--find a customer id that has an amount greater than 175 in total payments

select customer_id
from payment
group by customer_id 
having sum(amount) > 175
order by sum(amount) desc;

select store_id, first_name, last_name
from customer 
where customer_id in(
	select customer_id 
	from payment 
	group by customer_id 
	having sum(amount)>175
	order by sum(amount) desc
)
-- basic query where all films are in English

select *
from film
where language_id in(
	select language_id 
	from language
	where name = 'English'
)

select * from payment

SELECT COUNT(*) AS customer_count
FROM customer
WHERE last_name LIKE '%es';

SELECT payment.amount, COUNT(rental.rental_id) AS rental_count
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE customer.customer_id BETWEEN 380 AND 430
GROUP BY payment.amount
HAVING COUNT(rental.rental_id) > 250;

SELECT rating, COUNT(*) AS movie_count
FROM film
GROUP BY rating
ORDER BY movie_count DESC
LIMIT 1;










