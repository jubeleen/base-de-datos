--ACTIVIDAD 1

SELECT f.title, a.address, c.city, co.country
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN store s
ON i.store_id = s.store_id
INNER JOIN address a 
ON s.address_id = a.address_id
INNER JOIN city c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id
WHERE f.title = 'ACADEMY DINOSAUR';


--ACTIVIDAD 2

SELECT f.title, c.name, l.name, f.rating, f.length
FROM film f
INNER JOIN film_category fc 
ON f.film_id = fc.film_id
INNER JOIN category c 
ON fc.category_id = c.category_id
INNER JOIN language l 
ON f.language_id = l.language_id
WHERE f.length BETWEEN 60 AND 120;


--ACTIVIDAD 3

SELECT St.first_name, st.last_name, a.address, c.city, co.country
FROM staff st
INNER JOIN address a
ON a.address_id = st.address_id
INNER JOIN city c
ON c.city_id = a.city_id
INNER JOIN country co
ON co.country_id = c.country_id


--ACTIVIDAD 4

SELECT  f.title, MAX(rental_duration), MIN(rental_duration)
FROM film f


--ACTIVIDAD 5

SELECT f.title, l.name, c.name, f.length, f.rating, s.first_name, s.last_name, a.address, ci.city, co.country, r.rental_date, p.amount 
FROM film f
INNER JOIN language l ON f.language_id = l.language_id
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
INNER JOIN payment p ON r.rental_id = p.rental_id
INNER JOIN customer cu ON p.customer_id = cu.customer_id
INNER JOIN address a ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
INNER JOIN staff s ON p.staff_id = s.staff_id;

--ACTIVIDAD 6

SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

--ACTIVIDAD 7

SELECT c.name, COUNT(*)
FROM category c
INNER JOIN film_category fc ON c.category_id =
fc.category_id
GROUP BY c.name;

--ACTIVIDAD 8

SELECT a.first_name, a.first_name, COUNT(*)
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(*)DESC
LIMIT 10;

--ACTIVIDAD 9

SELECT a.address, c.city, co.country, COUNT(*)
FROM Inventory i
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
GROUP BY a.address, c.city, co.country;

--ACTIVIDAD 10

SELECT a.address, c.city, co.country, COUNT(DISTINCT i.film_id)
FROM inventory i
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
GROUP BY a.address, c.city, co.country;

--ACTIVIDAD 11

SELECT c.name, AVG(f.rental_rate)
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id 
GROUP BY c.name;

--ACTIVIDAD 12


--ACTIVIDAD 13

SELECT f.title, f.length, c.name
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id =c.category_id
ORDER BY f.length DESC;

--ACTIVIDAD 14

SELECT f.title 
FROM film f
WHERE f.title LIKE'%w%'
AND(
 SELECT COUNT(*) 
 FROM film_actor fa
 WHERE fa.film_id = f.film_id
)>=5;

--ACTIVIDAD 15

SELECT title, rental_rate
FROM film
ORDER BY rental_rate ASC
LIMIT 10;

--ACTIVIDAD 16

SELECT f.title, f.length, a.first_name, a.last_name
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
WHERE f.length = (SELECT MIN(length) FROM film);

--ACTIVIDAD 17

SELECT cu.last_name, ci.city, co.country, a.address, r.rental_id, p.amount
FROM customer cu
INNER JOIN address a ON cu.address_id = a.address_id
INNER JOIN city ci ON a.city_id = ci.city_id
INNER JOIN country co ON ci.country_id = co.country_id
INNER JOIN rental r ON cu.customer_id = r.customer_id
INNER JOIN payment p ON r.rental_id = p.rental_id
ORDER BY p.amount ASC;

--ACTIVIDAD 18

INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES ("201", "julieta", "mendoza","2020-12-23 07:12:29")

--ACTIVIDAD 19

INSERT INTO actor(actor_id, first_name, last_name, last_update)
VALUES ("202", "beatriz", "cabrera","2020-12-23 07:12:29"),("203", "javier", "mendoza","2020-12-23 07:12:29")

--ACTIVIDAD 20

UPDATE actor 
set first_name = "santiago"
WHERE first_name = "julieta" AND last_name = "mendoza"

UPDATE actor 
set first_name = "zulma"
WHERE first_name = "beatriz" AND last_name = "cabrera"

UPDATE actor 
set first_name = "maximiliano", last_name = "colavolpe"
WHERE first_name = "javier" AND last_name = "mendoza"

--ACTIVIDAD 21

