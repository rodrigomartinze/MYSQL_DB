USE sakila;

SELECT SUM(amount) * 0.10 AS comision_mayo
FROM payment
WHERE staff_id = 2 AND MONTH(payment_date) = 5;

SELECT SUM(amount) * 0.10 AS comision_junio
FROM payment
WHERE staff_id = 1 AND MONTH(payment_date) = 6;

SELECT payment_id, staff_id, amount,
LEAST(amount * 0.10 + 1, amount * 0.50) AS comision_final
FROM payment
WHERE DATE(payment_date) = '2005-05-30';

SELECT customer_id, rental_id, amount,
amount * 0.20 AS descuento,
amount - amount * 0.20 AS nuevo_monto
FROM payment
WHERE DAY(payment_date) IN (30, 31);

SELECT rental.customer_id, rental.rental_id, payment.payment_date,
DATE_ADD(payment.payment_date, INTERVAL 3 DAY) AS nueva_fecha_entrega
FROM rental
JOIN payment ON rental.rental_id = payment.rental_id
WHERE DAYOFWEEK(rental.rental_date) = 2;

SELECT rental_id, DATEDIFF(return_date, rental_date) AS dias_transcurridos
FROM rental;

SELECT rental_id, customer_id, rental_date
FROM rental
WHERE DAYOFWEEK(rental_date) = 1;

SELECT rental_id, customer_id, rental_date
FROM rental
WHERE DAYOFWEEK(rental_date) = 1 AND MONTH(rental_date) = 5;

SELECT rental_id, customer_id, rental_date, return_date
FROM rental
WHERE DAYOFWEEK(return_date) = 1 AND MONTH(return_date) = 6;
