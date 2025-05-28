USE sakila;


SELECT ci.city_id, ci.city, s.store_id
FROM city ci
RIGHT JOIN store s ON ci.city_id = s.city_id;


SELECT co.country_id, co.country, ci.city
FROM country co
RIGHT JOIN city ci ON co.country_id = ci.country_id;


SELECT ci.city_id, ci.city, CONCAT(c.first_name, ' ', c.last_name) AS cliente_nombre
FROM city ci
RIGHT JOIN address a ON ci.city_id = a.city_id
RIGHT JOIN customer c ON a.address_id = c.address_id;


SELECT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id AND i.store_id = 1
WHERE r.rental_id IS NULL AND i.store_id = 1;


SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_nombre, COUNT(fa.film_id) AS peliculas_contadas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY actor_nombre;


SELECT f.title, COUNT(DISTINCT i.store_id) AS tiendas_registradas
FROM film f
JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.title;


SELECT l.name AS idioma, COUNT(f.film_id) AS peliculas_contadas
FROM language l
LEFT JOIN film f ON l.language_id = f.language_id
GROUP BY idioma;


SELECT f.title, COUNT(r.rental_id) AS veces_rentada
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title;


SELECT rental_id, COUNT(payment_id) AS pagos_realizados
FROM payment
GROUP BY rental_id;


SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente_nombre, COUNT(r.rental_id) AS peliculas_rentadas
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, cliente_nombre;


SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_nombre, COUNT(r.rental_id) AS peliculas_rentadas
FROM staff s
LEFT JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, staff_nombre;


SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente_nombre, SUM(p.amount) AS total_pagos
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, cliente_nombre
HAVING total_pagos > 10;

SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_nombre, SUM(p.amount) AS total_pagos
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, staff_nombre
HAVING total_pagos > 100;


SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente_nombre, COUNT(p.payment_id) AS pagos_junio
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE MONTH(p.payment_date) = 6
GROUP BY c.customer_id, cliente_nombre;


SELECT rental_duration, COUNT(film_id) AS cantidad_peliculas
FROM film
GROUP BY rental_duration;


SELECT YEAR(payment_date) AS anio, SUM(amount) AS total_pagos
FROM payment
GROUP BY anio;


SELECT DAYNAME(payment_date) AS dia_semana, SUM(amount) AS total_pagos
FROM payment
GROUP BY dia_semana;


SELECT DAY(payment_date) AS dia, MONTH(payment_date) AS mes, YEAR(payment_date) AS anio, SUM(amount) AS total_pagos
FROM payment
GROUP BY anio, mes, dia
HAVING total_pagos > 50;


SELECT length, COUNT(film_id) AS cantidad_peliculas
FROM film
GROUP BY length;


SELECT s.store_id, COUNT(p.payment_id) AS pagos_realizados
FROM store s
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente_nombre, SUM(p.amount) AS total_pagos
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, cliente_nombre
HAVING COUNT(p.payment_id) > 5;


SELECT rating, COUNT(film_id) AS cantidad_peliculas
FROM film
GROUP BY rating;


SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente_nombre, AVG(p.amount) AS promedio_pago
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, cliente_nombre
HAVING promedio_pago > 5;


SELECT rental_duration, COUNT(DISTINCT title) AS cantidad_titulos
FROM film
WHERE rental_duration > 5
GROUP BY rental_duration;

SELECT YEAR(payment_date) AS anio, MONTH(payment_date) AS mes, COUNT(payment_id) AS cantidad_pagos, SUM(amount) AS total_pagos
FROM payment
GROUP BY anio, mes
HAVING cantidad_pagos > 100;

SELECT rating, COUNT(film_id) AS cantidad_peliculas
FROM film
GROUP BY rating
HAVING cantidad_peliculas > 50;
