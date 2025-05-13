Consignas SAKILA - 27/03
ej 1
SELECT f.title, a.address AS dirrecion, c.city,co.country
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN store s
ON i.store_id = s.store_id
INNER JOIN address a
ON s.address_id = a.address_id
INNER JOIN city  c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id
where title = "CLUB GRAFFITI"

ej 2

SELECT * FROM film f

INNER JOIN film_category fc
ON f.film_id= fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
INNER JOIN language l
ON f.language_id = l.language_id

where length BETWEEN  60 and 120


--where nombre de columna

--ejemplo WHERE nombre_columna BETWEEN 1 y 2

ej 3

SELECT  first_name ,last_name ,a.address,c.city,co.country
FROM staff s
INNER JOIN store st
ON s.store_id = st.store_id
INNER JOIN address a
ON st.address_id = a.address_id
INNER JOIN city c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id
 ej 4
 SELECT title, min(rental_date), max(rental_date)
FROM rental r

INNER JOIN inventory i
ON r.inventory_id = i .inventory_id
INNER JOIN film f
ON i.film_id = f.film_id
GROUP BY f.title
ej 5
SELECT * FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
INNER JOIN language l
ON f.language_id = l.language_id
INNER JOIN film_actor  fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id

INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN film_text fm
ON i.film_id = fm.film_id

INNER JOIN rental r
ON i.inventory_id = r.inventory_id
INNER JOIN payment  p
ON r.rental_id = p.rental_id
INNER JOIN staff s
ON p.staff_id = s.staff_id

INNER JOIN store st
ON s.store_id = st.store_id

INNER JOIN customer cu
ON st.store_id = cu.store_id
INNER JOIN address ad
ON cu.address_id = ad.address_id
INNER JOIN city  ci
ON ad.city_id = ci.city_id
INNER JOIN country cou
ON ci.country_id = cou.country_id
ej 6
SELECT count(*),rating 
from film
GROUP BY rating
ej 7
SELECT count(*), c.name
from film f

INNER JOIN film_category fc
ON f.film_id= fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
GROUP BY c.category_id
ej 8
SELECT first_name FROM actor/*otra manera*/
ORDER BY first_name DESC limit 10


/*manera selecionada*/
SELECT COUNT(a.actor_id) AS cant_actor, a.first_name FROM actor a
inner join film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
GROUP BY a.actor_id
ORDER BY cant_actor DESC LIMIT 10

count(cuenta la cantidad)

 ej 9 
SELECT  count (i.film_id) AS cant_pelis, first_name ,last_name ,a.address,c.city,co.country
FROM staff s
INNER JOIN store st
ON s.store_id = st.store_id
INNER JOIN inventory i
ON i.store_id = st.store_id
INNER JOIN address a
ON st.address_id = a.address_id
INNER JOIN city c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id
GROUP BY st.store_id

/*Dia 15/4/2025*/
ej 10

SELECT count(i.film_id) AS cant_pelis , a.address as direccion, c.city, co.country
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN store st
ON i.store_id = st.store_id
INNER JOIN address a
ON st.address_id = a.address_id
INNER JOIN city c
ON a.city_id = c.city_id
INNER JOIN country co
ON c.country_id = co.country_id
GROUP BY st.store_id

ej 11 
SELECT avg(r.rental_id) --avg()promedio
FROM film f
INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental  r
ON i.inventory_id = r.inventory_id

ej 12
SELECT 
r.rental_date AS fecha_alquiler,
r.return_date AS fecha_devolucion,
SUM (rental_duration * rental_rate),
f.rental_rate AS costo_total
FROM rental r
INNER JOIN inventory i
ON r.inventory_id = i.inventory_id
INNER JOIN film f
ON i.film_id = f.film_id


WHERE f.title = 'ALABAMA DEVIL'
ORDER BY r.rental_date DESC;

EJ 13
SELECT 
     f.title AS nombre_pelicula,
     f.length AS duracion_minutos,
     c.name AS categoria

FROM film f
INNER JOIN film_category fc
ON f.film_id = fc.film_id
INNER JOIN category c
ON fc.category_id = c.category_id
ORDER BY f.length DESC;

EJ 14
SELECT count(a.actor_id) as actores, f.title 
FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
WHERE title like 'W%'
GROUP BY f.film_id 
HAVING actores >=5
ORDER BY actores ASC
--group by divide
EJ 15
SELECT sum(p.amount) as pagosTotales,first_name, last_name
FROM customer c
INNER JOIN payment p
ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY cliente ASC

EJ 16
SELECT 
     f.title AS nombre_pelicula,
     f.length AS duracion_minutos,
	 first_name

FROM film f
INNER JOIN film_actor fa
ON f.film_id = fa.film_id
INNER JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY a.first_name
HAVING  f.length <= 60
ORDER BY f.length ASC;

EJ 17
SELECT 
    r.rental_id ,
    last_name AS apellido_delCliente,
    a.address AS dirrecion,
	co.country AS pais,
	ci.city AS ciudad 

FROM customer c
INNER JOIN address a
ON c.address_id = a.address_id
INNER JOIN city  ci
ON a.city_id = ci.city_id
INNER JOIN country co
ON ci.country_id = co.country_id
INNER JOIN rental r
ON c.customer_id = r.customer_id
INNER JOIN payment p
ON r.customer_id = p.customer_id
ORDER BY r.rental_id ASC;

EJ 18
INSERT into actor (actor_id,first_name, last_name, last_update) 
VALUES (202,"gabriel", "fabian", "2025-05-13 16:27:10")

EJ 19
INSERT into actor (actor_id,first_name, last_name, last_update) 
VALUES (203,"gabriel", "fabian", "2025-05-13 16:27:10"),(204,"joel","agustin","2025-05-13 16:40:10")

EJ 20
UPDATE actor first_name = gabriel, last_name = fabian 
WHERE first_name = brenda AND last_name = torres

21 falta terminar 
DELETE from actor
WHERE

/*T E M A 
            N U E V O
INSERT INTO actor(actor_id,first_name,last_name,last_update)/*insertamos en lista actor(puede ser otra lista) nuestro datos para q aparezca  */
VALUES(201,"sol","perez","2023-12-4 8:40:29")

update actor  /*modifica tu nombre lo cambia por el q quierad */
set first_name = "Fede",last_name = "villace"/*nombre nuevo*/
where first_name = "perez"/*nombre q vamos a cambiar */

DELETE  FROM actor /*nos aparece la tabla actual si hacemos esto*/

WHERE actor_id = "201" /*entramos a la columna actor_id */
 
 */

 /*DESC de Z a A
 ASC DE A a Z
 '%w'si esta adelante de la letra significa que la ultima letra tiene q ser con w
 'w% 'si esta atras de la letra significa q la primera letra tiene q ser con w
 '%w%' si esta en los dos lados de la letra significa q la letra del medio tiene q ser w*/