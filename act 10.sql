Use sakila;

SELECT * FROM actor WHERE first_name = 'PENELOPE';

SELECT * FROM actor WHERE last_name = 'DAVIS';

SELECT * FROM country WHERE country_id = 10;

SELECT * FROM category WHERE category_id = 15;

SELECT * FROM language WHERE language_id = 5;

SELECT * FROM actor WHERE first_name LIKE '%A%';

SELECT * FROM actor WHERE first_name LIKE 'A%';

SELECT * FROM actor WHERE first_name LIKE '%A';

SELECT * FROM category WHERE category_id IN (1, 3, 5);

SELECT * FROM actor WHERE last_name IN ('DAVIS', 'JONES', 'SMITH');



SELECT * FROM country WHERE country_id IN (1, 5, 7, 11, 13);

SELECT * FROM category WHERE category_id > 5;

SELECT * FROM language WHERE language_id > 5 AND language_id < 10;

SELECT * FROM actor WHERE first_name LIKE 'J%';

SELECT * FROM film WHERE title LIKE '%LOVE%';


SELECT * FROM actor WHERE actor_id BETWEEN 20 AND 30;

SELECT * FROM film WHERE rental_rate BETWEEN 2.99 AND 4.99;

SELECT * FROM customer WHERE store_id IN (1, 2);


SELECT * FROM film WHERE rating IN ('G', 'PG', 'PG-13');
