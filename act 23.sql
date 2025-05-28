USE sakila;

SELECT title FROM film WHERE length = (
SELECT length FROM film WHERE title = 'ALIEN CENTER');

SELECT DISTINCT CONCAT(c.first_name, ' ', c.last_name) AS cliente FROM customer c WHERE c.customer_id IN (
SELECT customer_id FROM payment WHERE amount > 5);

SELECT title FROM film WHERE rental_rate = (
SELECT rental_rate FROM film WHERE title = 'ZOOLANDER FICTION');

SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name) AS actor FROM actor a WHERE a.actor_id IN (
SELECT fa.actor_id FROM film_actor fa JOIN film f ON fa.film_id = f.film_id WHERE f.title = 'GHOSTBUSTERS ELF');

SELECT title FROM film WHERE length > (
SELECT AVG(length) FROM film);

SELECT DISTINCT CONCAT(c.first_name, ' ', c.last_name) AS cliente FROM customer c WHERE c.customer_id IN (
SELECT customer_id FROM payment);

SELECT title FROM film WHERE film_id NOT IN (
SELECT DISTINCT film_id FROM inventory i JOIN rental r ON i.inventory_id = r.inventory_id);

SELECT name FROM category WHERE category_id IN (
SELECT category_id FROM film_category GROUP BY category_id HAVING COUNT(film_id) > 50);

SELECT DISTINCT CONCAT(e.first_name, ' ', e.last_name) AS empleado FROM staff e WHERE e.store_id = (
SELECT s.store_id FROM store s JOIN inventory i ON s.store_id = i.store_id GROUP BY s.store_id ORDER BY COUNT(i.film_id) DESC LIMIT 1);

SELECT title FROM film WHERE rating = (
SELECT rating FROM film WHERE title = 'ACADEMY DINOSAUR');

SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor FROM actor a WHERE a.actor_id IN (
SELECT fa.actor_id FROM film_actor fa GROUP BY fa.actor_id HAVING COUNT(fa.film_id) > 20);

SELECT title FROM film WHERE replacement_cost = (
SELECT replacement_cost FROM film WHERE title = 'CRUSADE HONEY');
