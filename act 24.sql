USE escuela;

SELECT grado FROM estudiante WHERE grado IN (
SELECT grado FROM estudiante
GROUP BY grado
HAVING COUNT(grado) >= 10
);

SELECT * FROM materia WHERE id_profesor IN (
SELECT id_profesor FROM profesor WHERE telefono LIKE '001%'
);

SELECT * FROM horario WHERE id_aula IN (
SELECT id_aula FROM aula WHERE nombre_aula LIKE '%101%'
);


SELECT * FROM cafeteria WHERE precio > (
SELECT MAX(precio) FROM cafeteria WHERE tipo_plato = 'Desayuno'
);

USE tienda_departamental;

SELECT * FROM venta WHERE total > (
SELECT AVG(total) FROM venta
);

SELECT * FROM proveedor WHERE id_proveedor IN (
SELECT id_proveedor FROM producto_proveedor WHERE precio_compra < 50
);


SELECT * FROM categoria WHERE id_categoria IN (
SELECT DISTINCT id_categoria FROM producto
);


USE videojuegos;

SELECT * FROM jugador WHERE nivel > (
SELECT AVG(nivel) FROM jugador
);



SELECT * FROM logro WHERE recompensa IN (
SELECT recompensa FROM logro WHERE id_logro = 1
);

SELECT * FROM jugador WHERE fecha_registro > (
SELECT DATE('2024-01-15')
);

USE liga_futbol;

SELECT * FROM jugador WHERE id IN (
SELECT id_jugador FROM estadistica_jugador WHERE goles > 100
);

SELECT nombre FROM equipo WHERE id = (
SELECT id FROM equipo WHERE fundacion = '1902-03-06'
);

SELECT * FROM jugador WHERE id IN (
SELECT id_jugador FROM estadistica_jugador WHERE asistencias > (
SELECT asistencias FROM estadistica_jugador WHERE id_jugador = 1));

SELECT nombre FROM jugador WHERE id = (
SELECT id_jugador FROM estadistica_jugador ORDER BY tarjetas_rojas DESC LIMIT 1
);

SELECT nombre FROM jugador WHERE id = (
SELECT id_jugador FROM estadistica_jugador
ORDER BY goles DESC LIMIT 1
);