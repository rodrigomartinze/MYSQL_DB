USE sakila;

SELECT f.title, c.name AS categoria
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

SELECT f.title, l.name AS idioma
FROM film f
LEFT JOIN language l ON f.language_id = l.language_id;

SELECT c.name AS categoria, COUNT(fc.film_id) AS cantidad_peliculas
FROM category c
LEFT JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente, 
       SUM(p.amount) AS total_pagado
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id;

SELECT a.address_id, a.address, s.store_id
FROM address a
LEFT JOIN store s ON a.address_id = s.address_id;

SELECT r.rental_date, f.title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

SELECT e.first_name, e.last_name, s.store_id
FROM staff e
LEFT JOIN store s ON e.store_id = s.store_id;

SELECT ci.city_id, ci.city, COUNT(c.customer_id) AS cantidad_clientes
FROM city ci
LEFT JOIN address a ON ci.city_id = a.city_id
LEFT JOIN customer c ON a.address_id = c.address_id
GROUP BY ci.city_id, ci.city;

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS cliente, f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

SELECT f.title, COUNT(r.rental_id) AS veces_rentada
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title;

SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS peliculas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;

SELECT s.store_id, COUNT(st.staff_id) AS empleados
FROM store s
LEFT JOIN staff st ON s.store_id = st.store_id
GROUP BY s.store_id;
