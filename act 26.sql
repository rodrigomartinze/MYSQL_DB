USE sakila;

CREATE VIEW films_categories AS
SELECT f.title, c.name AS category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

CREATE VIEW film_languages AS
SELECT f.title, l.name AS language
FROM film f
LEFT JOIN language l ON f.language_id = l.language_id;

CREATE VIEW film_category_counts AS
SELECT c.name, COUNT(f.film_id) AS total_peliculas
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

CREATE VIEW films_categories AS
SELECT CONCAT(f.title, ' ', c.name) AS movie_category
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

CREATE VIEW address_stores AS
SELECT a.address, s.store_id
FROM address a
LEFT JOIN store s ON a.address_id = s.address_id;

CREATE VIEW rentals_movies AS
SELECT r.rental_date, f.title
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

CREATE VIEW movie_rental_count AS
SELECT f.title, COUNT(r.rental_id) AS veces_rentada
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id;

CREATE VIEW movie_rental_count AS
SELECT f.title, COUNT(r.rental_id) AS veces_rentada
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id;

CREATE VIEW actor_movie_count AS
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor, COUNT(fa.film_id)
AS peliculas
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id;

CREATE VIEW store_staff_count AS
SELECT st.store_id, COUNT(s.staff_id) AS total_empleados
FROM store st
LEFT JOIN staff s ON st.store_id = s.store_id
GROUP BY st.store_id;

CREATE VIEW film_length_comparacion AS
SELECT title FROM film WHERE length = (
SELECT length FROM film WHERE title = 'ALTEN CENTER') - 2;

CREATE VIEW customer_altos_payments AS
SELECT CONCAT(first_name, ' ', last_name) AS nombre FROM customer
WHERE customer_id IN (
SELECT customer_id FROM payment WHERE amount > 5);

CREATE VIEW film_rental_rate_match AS
SELECT title FROM film WHERE rental_rate = (
SELECT rental_rate FROM film WHERE title = 'ZOOLANDER FICTION');
CREATE VIEW film_actors AS
SELECT CONCAT(first_name, ' ', last_name) AS name FROM actor WHERE
actor_id = (
SELECT actor_id FROM film_actor WHERE film_id = (
SELECT film_id FROM film WHERE title = 'GHOSTBUSTERS ELF'));

CREATE VIEW film_length_above_avg AS
SELECT title FROM film WHERE length>(
SELECT AVG(length) FROM film);

CREATE VIEW film_length_media AS
SELECT title FROM film WHERE length>(
SELECT AVG(length) FROM film);

SELECT * FROM film_length_media;

CREATE VIEW customer_payment_lista AS
SELECT CONCAT(first_name, ' ', last_name) AS name FROM customer
WHERE customer_id IN (
SELECT DISTINCT customer_id FROM payment);

SELECT * FROM customer_payment_lista;

CREATE VIEW available_films AS
SELECT title FROM film WHERE film_id NOT IN (
SELECT film_id FROM inventory WHERE inventory_id IN (
SELECT rental_id FROM rental));

CREATE VIEW disponibles_films AS
SELECT title FROM film WHERE film_id NOT IN (
SELECT film_id FROM inventory WHERE inventory_id IN (
SELECT rental_id FROM rental));

SELECT * FROM disponibles_films;

CREATE VIEW popular_categories AS
SELECT name FROM category WHERE category_id IN (
SELECT category_id FROM film_category GROUP BY category_id
HAVING COUNT(category_id) > 50 );

SELECT * FROM popular_categories;

CREATE VIEW employees_trabajadores AS
SELECT CONCAT(first_name, ' ', last_name) AS employee_name FROM staff
WHERE store_id = (
SELECT store_id FROM inventory GROUP BY store_id ORDER BY
COUNT(film_id) DESC LIMIT 1 );

SELECT * FROM employees_trabajadores;

CREATE VIEW films_mismos_ratings AS
SELECT title FROM film WHERE rating = (
SELECT rating FROM film WHERE title = 'ACADEMY DINOSAUR');
SELECT * FROM films_mismos_ratings;

CREATE VIEW actors_alta_participation AS
SELECT CONCAT(first_name, ' ', last_name) AS name FROM actor WHERE
actor_id IN (
SELECT actor_id FROM film_actor GROUP BY actor_id HAVING
COUNT(film_id) > 20 );

SELECT * FROM actors_alta_participation;
CREATE VIEW films_mismo_replacement_cost AS
SELECT title FROM film WHERE replacement_cost = (
SELECT replacement_cost FROM film WHERE title = 'CRUSADE MONEY');
SELECT * FROM films_mismo_replacement_cost;

USE escuela;

CREATE VIEW grados_con_mas_de_10_estudiantes AS
SELECT grado FROM estudiante WHERE grado IN (
SELECT grado FROM estudiante
GROUP BY grado
HAVING COUNT(grado) >= 10);


SELECT * FROM grados_con_mas_de_10_estudiantes;

CREATE VIEW materias_profesores_codigo AS
SELECT * FROM materia WHERE id_profesor IN (
SELECT id_profesor FROM profesor WHERE telefono LIKE '001%');
SELECT * FROM materias_profesores_codigo;

CREATE VIEW horarios_aulas_101 AS
SELECT * FROM horario WHERE id_aula IN (
SELECT id_aula FROM aula WHERE nombre_aula LIKE '%101%');


SELECT * FROM horarios_aulas_101;

CREATE VIEW cafeteria_precios_mayores AS
SELECT * FROM cafeteria WHERE precio>(
SELECT MAX(precio) FROM cafeteria WHERE tipo_plato='Desayuno');

SELECT * FROM cafeteria_precios_mayores;

CREATE VIEW cafeteria_precios_mayores AS
SELECT * FROM cafeteria WHERE precio>(
SELECT MAX(precio) FROM cafeteria WHERE tipo_plato='Desayuno');

SELECT * FROM cafeteria_precios_mayores;
USE tienda_departamental;

CREATE VIEW clientes_con_ventas AS
SELECT * FROM cliente WHERE id_cliente IN (
SELECT DISTINCT id_cliente FROM venta);

SELECT * FROM clientes_con_ventas;

CREATE VIEW empleados_con_ventas AS
SELECT * FROM empleado WHERE id_empleado IN (
SELECT DISTINCT id_empleado FROM venta);

SELECT * FROM empleados_con_ventas;

CREATE VIEW ventas_mayores_promedio AS
SELECT * FROM venta WHERE total>(
SELECT AVG(total) FROM venta);

SELECT * FROM ventas_mayores_promedio;

CREATE VIEW proveedores_precio_bajo AS
SELECT * FROM proveedor WHERE id_proveedor IN (
SELECT id_proveedor FROM producto_proveedor WHERE precio_compra <
50);

SELECT * FROM proveedores_precio_bajo;

CREATE VIEW categorias_con_productos AS
SELECT * FROM categoria WHERE id_categoria IN (
SELECT DISTINCT id_categoria FROM producto);

SELECT * FROM categorias_con_productos;

USE videojuegos;
CREATE VIEW jugadores_nivel_superior AS
SELECT * FROM jugador WHERE nivel>(
SELECT AVG(nivel) FROM jugador);

SELECT * FROM jugadores_nivel_superior;

CREATE VIEW logros_misma_recompensa AS
SELECT * FROM logro WHERE recompensa IN (
SELECT recompensa FROM logro WHERE id_logro = 1);

SELECT * FROM logros_misma_recompensa;

CREATE VIEW jugadores_registrados_recientes AS
SELECT * FROM jugador WHERE fecha_registro > (
SELECT DATE('2024-01-15'));

SELECT * FROM jugadores_registrados_recientes;

CREATE VIEW misiones_con_recompensas AS
SELECT * FROM mision WHERE recompensa IS NOT NULL;

SELECT * FROM misiones_con_recompensas;




use liga_futbol;

CREATE VIEW jugadores_con_mas_de_100_goles AS
SELECT * FROM jugador WHERE id IN (
SELECT id_jugador FROM estadistica_jugador WHERE goles > 100);

SELECT * FROM jugadores_con_mas_de_100_goles;

CREATE VIEW equipo_fundado_en_1902 AS
SELECT nombre FROM equipo WHERE id = (
SELECT id FROM equipo WHERE fundacion = '1902-03-06');

SELECT * FROM equipo_fundado_en_1902;

CREATE VIEW jugadores_mas_asistencias_que_1 AS
SELECT * FROM jugador WHERE id IN (
SELECT id_jugador FROM estadistica_jugador WHERE asistencias > (
SELECT asistencias FROM estadistica_jugador WHERE id_jugador = 1));

SELECT * FROM jugadores_mas_asistencias_que_1;

CREATE VIEW jugador_mas_tarjetas_rojas AS
SELECT nombre FROM jugador WHERE id = (
SELECT id_jugador FROM estadistica_jugador ORDER BY tarjetas_rojas
DESC LIMIT 1);

SELECT * FROM jugador_mas_tarjetas_rojas;

CREATE VIEW jugador_maximo_goleador AS
SELECT nombre FROM jugador WHERE id = (
SELECT id_jugador FROM estadistica_jugador
ORDER BY goles DESC LIMIT 1);

SELECT * FROM jugador_maximo_goleador;