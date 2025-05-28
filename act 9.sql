Use sakila;

SELECT * FROM country;

SELECT * FROM category;

SELECT * FROM language;

SELECT country_id, country FROM country;

SELECT name FROM category;

SELECT language_id, name FROM language;

SELECT * FROM country ORDER BY last_update DESC;

SELECT * FROM category ORDER BY name DESC;

SELECT * FROM language ORDER BY name DESC;

SELECT DISTINCT first_name FROM actor;
