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