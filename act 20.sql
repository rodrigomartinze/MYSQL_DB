USE sakila;


SELECT film_id, title, description
FROM film;


SELECT f.film_id, f.title, CONCAT(a.first_name, ' ', a.last_name) AS actor_nombre_completo
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id;


SELECT DISTINCT CONCAT(a.first_name, ' ', a.last_name) AS actor_nombre_completo, f.title
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id;


SELECT DISTINCT CONCAT(c.first_name, ' ', c.last_name) AS cliente_nombre_completo, f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;


SELECT s.staff_id, CONCAT(s.first_name, ' ', s.last_name) AS staff_nombre_completo, COUNT(DISTINCT r.customer_id) AS clientes_atendidos
FROM staff s
LEFT JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, staff_nombre_completo;


SELECT s.store_id, a.address, SUM(p.amount) AS total_pagos
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN staff st ON s.store_id = st.store_id
JOIN payment p ON st.staff_id = p.staff_id
GROUP BY s.store_id, a.address;
