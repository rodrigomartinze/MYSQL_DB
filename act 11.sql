USE sakila;

SELECT * FROM actor WHERE (actor_id BETWEEN 10 AND 20) 
	OR (actor_id BETWEEN 30 AND 40) 
    OR (actor_id BETWEEN 50 AND 60);
    
    
SELECT * FROM actor WHERE first_name = 'CARMEN' 
	OR (first_name = 'PENELOPE' AND last_name = 'GUINES');
    
    
SELECT * FROM actor WHERE LEFT(first_name, 1) IN ('A', 'B', 'H', 'J') ORDER BY first_name;


SELECT film_id, title, description FROM film WHERE title LIKE '%DINOSAUR%'
	OR title LIKE '%CRAFT%';


SELECT * FROM film WHERE rating IN ('G', 'PG') AND rental_rate <= 1.5 ORDER BY rental_rate DESC;


SELECT * FROM film WHERE rental_duration > 3 AND rental_rate < 3 ORDER BY rental_rate ASC;


SELECT * FROM customer WHERE store_id = 1 AND last_name LIKE 'A%' 
	OR last_name LIKE 'B%';


SELECT * FROM film WHERE rating IN ('G', 'PG') AND length > 100;


SELECT * FROM payment WHERE amount BETWEEN 5 AND 10 AND amount != 7;

SELECT * FROM actor WHERE first_name LIKE 'M%' AND last_name NOT LIKE 'S%';



SELECT * FROM customer WHERE active = 0 AND address_id IS NOT NULL;


SELECT * FROM rental WHERE YEAR(rental_date) = 2005 AND MONTH(rental_date) != 12;
