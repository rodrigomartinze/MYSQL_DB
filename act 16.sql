CREATE DATABASE clase;

USE clase;

CREATE TABLE productos (

    id INT PRIMARY KEY,

    nombre VARCHAR(50),

    categoria VARCHAR(50),

    precio DECIMAL(10, 2),

    stock INT,

    stock_status VARCHAR(20)

);

INSERT INTO productos (id, nombre, categoria, precio, stock) VALUES

(1, 'Laptop', 'Tecnología', 1500.00, 10),

(2, 'Mouse', 'Tecnología', 25.00, 0),

(3, 'Teclado', 'Tecnología', 50.00, 60),

(4, 'Monitor', 'Tecnología', 300.00, 20),

(5, 'Silla', 'Muebles', 120.00, 15),

(6, 'Escritorio', 'Muebles', 250.00, 5);





SELECT nombre,
  CASE
    WHEN precio < 100 THEN 'Económico'
    WHEN precio BETWEEN 100 AND 500 THEN 'Moderado'
    ELSE 'Caro'
  END AS rango_precio
FROM productos;


SELECT nombre,
  CASE
    WHEN stock = 0 THEN 'Sin Stock'
    WHEN stock < 20 THEN 'Bajo Stock'
    ELSE 'Disponible'
  END AS disponibilidad
FROM productos;


SELECT *,
  CASE
    WHEN precio > 1000 THEN precio * 0.10
    WHEN precio BETWEEN 500 AND 1000 THEN precio * 0.05
    ELSE 0
  END AS descuento
FROM productos;

-- 4.
UPDATE productos SET stock_status =
  CASE
    WHEN stock = 0 THEN 'Sin Stock'
    WHEN stock < 20 THEN 'Bajo'
    ELSE 'Disponible'
  END;


UPDATE productos SET categoria =
  CASE
    WHEN precio > 1000 THEN 'Alta Gama'
    WHEN precio BETWEEN 500 AND 1000 THEN 'Gama Media'
    ELSE 'Gama Baja'
  END;


SELECT * FROM productos
ORDER BY
  CASE
    WHEN stock_status = 'Sin Stock' THEN 1
    WHEN stock_status = 'Bajo' THEN 2
    ELSE 3
  END;


SELECT *, 
  CASE
    WHEN precio > 1000 THEN 1
    WHEN precio BETWEEN 500 AND 1000 THEN 2
    ELSE 3
  END AS prioridad_precio
FROM productos
ORDER BY prioridad_precio;


SELECT *,
  CASE
    WHEN categoria = 'Muebles' AND stock < 10 THEN 'Sí'
    ELSE 'No'
  END AS oferta_especial
FROM productos;


DROP TABLE productos;

CREATE TABLE productos (

    id INT PRIMARY KEY,

    nombre VARCHAR(50),

    categoria VARCHAR(50),

    precio DECIMAL(10, 2),

    stock INT,

    descuento DECIMAL(10, 2)

);

 

INSERT INTO productos (id, nombre, categoria, precio, stock, descuento) VALUES

(1, 'Laptop', 'Tecnología', 1500.00, 10, NULL),

(2, 'Mouse', 'Tecnología', 25.00, NULL, 5.00),

(3, 'Teclado', 'Tecnología', 50.00, 60, NULL),

(4, 'Monitor', 'Tecnología', 300.00, 20, 15.00),

(5, 'Silla', 'Muebles', 120.00, NULL, NULL),

(6, 'Escritorio', 'Muebles', 250.00, 5, 10.00);



SELECT nombre, IFNULL(stock, 0) AS stock FROM productos;


SELECT nombre, precio - IFNULL(descuento, 0) AS precio_final FROM productos;


SELECT nombre, IFNULL(categoria, 'Desconocida') AS categoria_segura FROM productos;


UPDATE productos SET stock = 0 WHERE stock IS NULL;


UPDATE productos SET descuento = 0 WHERE descuento IS NULL;


SELECT * FROM productos ORDER BY IFNULL(stock, 0);

 