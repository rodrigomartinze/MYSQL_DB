USE sakila;

DELIMITER $$
CREATE TRIGGER actualizar_fecha_cliente_direccion
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
 IF NEW.address_id <> OLD.address_id THEN
 SET NEW.last_update = NOW();
 END IF;
END$$
DELIMITER ;
UPDATE customer
SET address_id = 2
WHERE customer_id = 1;
SELECT customer_id, address_id, last_update
FROM customer
WHERE customer_id = 1;
DELIMITER $$
CREATE TRIGGER actualizar_fecha_renta_por_pago
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
 UPDATE rental
 SET last_update = NOW()
 WHERE rental_id = NEW.rental_id;
END$$
DELIMITER ;
INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (1, 1, 1, 4.99, NOW());
SELECT rental_id, last_update
FROM rental
WHERE rental_id = 1;
DELIMITER $$
CREATE TRIGGER actualizar_fecha_inventario_pelicula
BEFORE UPDATE ON inventory
FOR EACH ROW
BEGIN
 IF NEW.film_id <> OLD.film_id THEN
 SET NEW.last_update = NOW();
 END IF;
END$$
DELIMITER ;
UPDATE inventory
SET film_id = 2
WHERE inventory_id = 1;
SELECT inventory_id, film_id, last_update
FROM inventory
WHERE inventory_id = 1;
DELIMITER $$
CREATE TRIGGER actualizar_fecha_empleado_nombre
BEFORE UPDATE ON staff
FOR EACH ROW
BEGIN
 IF NEW.first_name <> OLD.first_name OR NEW.last_name <> OLD.last_name THEN
 SET NEW.last_update = NOW();
 END IF;
END$$
DELIMITER ;
UPDATE staff
SET first_name = 'Carlos'
WHERE staff_id = 1;
SELECT staff_id, first_name, last_name, last_update
FROM staff
WHERE staff_id = 1;

