USE sakila;

SELECT staff_id, SUM(amount) AS total_monto_mayo
FROM payment
WHERE MONTH(payment_date) = 5
GROUP BY staff_id;

SELECT MONTH(payment_date) AS mes, AVG(amount) AS promedio_pago
FROM payment
GROUP BY MONTH(payment_date);

SELECT customer_id, AVG(amount) AS promedio_pago
FROM payment
GROUP BY customer_id;

SELECT DAYOFWEEK(payment_date) AS dia_semana, AVG(amount) AS promedio_pago
FROM payment
GROUP BY DAYOFWEEK(payment_date);

SELECT customer_id, COUNT(*) AS total_rentas
FROM rental
GROUP BY customer_id;

SELECT staff_id, COUNT(*) AS total_rentas
FROM rental
GROUP BY staff_id;

SELECT store_id, COUNT(*) AS total_clientes
FROM customer
GROUP BY store_id;

SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;

SELECT country_id, COUNT(*) AS total_ciudades
FROM city
GROUP BY country_id;

SELECT inventory.store_id, COUNT(*) AS total_peliculas
FROM inventory
GROUP BY inventory.store_id;

SELECT customer_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY customer_id;

SELECT staff_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY staff_id
HAVING total_pagado > 100;

SELECT customer_id, COUNT(*) AS pagos_junio
FROM payment
WHERE MONTH(payment_date) = 6
GROUP BY customer_id;

SELECT rental_duration, COUNT(*) AS cantidad_peliculas
FROM film
GROUP BY rental_duration;

SELECT YEAR(payment_date) AS anio, COUNT(*) AS total_pagos
FROM payment
GROUP BY YEAR(payment_date);

SELECT DAYOFWEEK(payment_date) AS dia_semana, SUM(amount) AS total_pagado
FROM payment
GROUP BY DAYOFWEEK(payment_date);

SELECT DAY(payment_date) AS dia_mes, SUM(amount) AS total_pagado
FROM payment
GROUP BY DAY(payment_date)
HAVING total_pagado > 500;

SELECT length, COUNT(*) AS total_peliculas
FROM film
GROUP BY length;

SELECT store_id, COUNT(*) AS total_pagos
FROM payment
GROUP BY store_id;

SELECT customer_id, SUM(amount) AS total_pagado
FROM payment
GROUP BY customer_id
HAVING COUNT(*) > 5;

SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating;

SELECT customer_id, AVG(amount) AS promedio_pago
FROM payment
GROUP BY customer_id
HAVING promedio_pago > 5;

SELECT rental_duration, COUNT(*) AS total_peliculas
FROM film
WHERE rental_duration > 5
GROUP BY rental_duration;

SELECT MONTH(payment_date) AS mes, SUM(amount) AS total_pagado, COUNT(*) AS total_pagos
FROM payment
GROUP BY MONTH(payment_date)
HAVING total_pagos > 100;

SELECT rating, COUNT(*) AS total_peliculas
FROM film
GROUP BY rating
HAVING total_peliculas > 200;
