CREATE DATABASE productos_prueba;

USE productos_prueba;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);

INSERT INTO productos (id, nombre, categoria, precio, stock) VALUES
(1, 'Laptop', 'Tecnología', 1500.00, 10),
(2, 'Mouse', 'Tecnología', 25.00, 100),
(3, 'Teclado', 'Tecnología', 50.00, 60),
(4, 'Monitor', 'Tecnología', 300.00, 20),
(5, 'Silla', 'Muebles', 120.00, 15),
(6, 'Escritorio', 'Muebles', 250.00, 5),
(7, 'Impresora', 'Tecnología', 200.00, 8),
(8, 'Auriculares', 'Tecnología', 45.00, 30),
(9, 'Webcam', 'Tecnología', 80.00, 25),
(10, 'Smartphone', 'Tecnología', 900.00, 12),
(11, 'Tablet', 'Tecnología', 600.00, 18),
(12, 'Cargador', 'Tecnología', 20.00, 50),
(13, 'Lámpara', 'Muebles', 40.00, 9),
(14, 'Estante', 'Muebles', 180.00, 4),
(15, 'Sofá', 'Muebles', 700.00, 2),
(16, 'Cámara', 'Tecnología', 1100.00, 6),
(17, 'Proyector', 'Tecnología', 750.00, 7),
(18, 'Router', 'Tecnología', 120.00, 20),
(19, 'Altavoces', 'Tecnología', 90.00, 10),
(20, 'Mesa', 'Muebles', 200.00, 14),
(21, 'Refrigerador', 'Electrodomésticos', 850.00, 5),
(22, 'Microondas', 'Electrodomésticos', 300.00, 8);

UPDATE productos SET precio = 130.00 WHERE nombre = 'Silla';

UPDATE productos SET precio = precio * 1.10 WHERE categoria = 'Tecnología';


UPDATE productos SET stock = stock + 5 WHERE stock <= 10;

UPDATE productos SET nombre = 'Escritorio de Madera' WHERE id = 6;


UPDATE productos SET precio = precio * 0.95 WHERE precio > 500;

UPDATE productos SET categoria = 'Electrónica' WHERE nombre = 'Monitor';

UPDATE productos SET stock = 0 WHERE precio < 30;

DELETE FROM productos WHERE nombre = 'Mouse';

DELETE FROM productos WHERE categoria = 'Muebles' AND stock < 10;

DELETE FROM productos WHERE precio > 1000;

DELETE FROM productos WHERE id = 4;

DELETE FROM productos WHERE stock = 0;

UPDATE productos SET precio = precio * 1.15 WHERE categoria = 'Tecnología' AND precio < 1000;

DELETE FROM productos WHERE stock < (SELECT AVG(stock) FROM productos);

UPDATE productos SET nombre = CONCAT(nombre, ' Deluxe') WHERE categoria = 'Muebles';
