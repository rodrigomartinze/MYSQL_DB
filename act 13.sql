USE sakila;

SELECT MIN(rental_date) AS fecha_mas_antigua FROM rental;

SELECT MIN(actor_id) AS id_actor_mas_bajo FROM actor;

SELECT MIN(length) AS duracion_minima FROM film;

SELECT MAX(rental_date) AS fecha_mas_reciente FROM rental;

SELECT MAX(actor_id) AS id_actor_mas_alto FROM actor;

SELECT MAX(length) AS duracion_maxima FROM film;

SELECT COUNT(*) AS total_actores FROM actor;

SELECT COUNT(*) AS total_peliculas_pg FROM film WHERE rating = 'PG';

SELECT COUNT(*) AS total_clientes_tienda_1 FROM customer WHERE store_id = 1;

SELECT SUM(amount) AS total_pagos FROM payment;

SELECT SUM(length) AS duracion_total_peliculas FROM film;

SELECT SUM(amount) AS total_pago_cliente_5 FROM payment WHERE customer_id = 5;

SELECT AVG(length) AS promedio_duracion FROM film;

SELECT AVG(amount) AS promedio_pagos FROM payment;

SELECT AVG(rental_duration) AS promedio_dias_renta FROM film;

SELECT first_name AS nombre, last_name AS apellido FROM actor;

SELECT COUNT(*) AS total_peliculas FROM film;

SELECT customer_id AS cliente_id, SUM(amount) AS pago_total FROM payment GROUP BY customer_id;

SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo FROM actor;

SELECT CONCAT(title, ' - ', rating) AS titulo_y_clasificacion FROM film;

SELECT CONCAT(first_name, ' ', last_name, ' (ID: ', customer_id, ')') AS nombre_con_id FROM customer;

SELECT UPPER(first_name) AS nombre_mayuscula, UPPER(last_name) AS apellido_mayuscula FROM actor;

SELECT UPPER(title) AS titulo_mayuscula FROM film;

SELECT UPPER(country) AS pais_mayuscula FROM country;

SELECT LOWER(first_name) AS nombre_minuscula, LOWER(last_name) AS apellido_minuscula FROM actor;

SELECT LOWER(title) AS titulo_minuscula FROM film;

SELECT LOWER(country) AS pais_minuscula FROM country;

SELECT title AS titulo FROM film ORDER BY title ASC LIMIT 10, 5;

SELECT * FROM customer ORDER BY last_name ASC LIMIT 15, 5;
