## LAB | SQL Subqueries
USE sakila;
-- Challenge: Write SQL queries to perform the following tasks using the Sakila database:

-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT film.title AS film_title, COUNT(inventory.inventory_id) AS num_copies
FROM film
JOIN inventory ON film.film_id = inventory.film_id
WHERE film.title = 'Hunchback Impossible'
GROUP BY film.title;

-- by subquery 
SELECT film.title AS film_title,
    (SELECT COUNT(*)
		FROM inventory
		WHERE inventory.film_id = film.film_id) AS num_copies
FROM film
WHERE film.title = 'Hunchback Impossible';

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT film.title AS film_title, film.length AS film_length
FROM film
WHERE film.length > (SELECT AVG(length)FROM film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT actor.actor_id, actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE film.title = 'Alone Trip';

