SELECT f.title, a.address AS direccion, c.city, co.country
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
--WHERE date = title
WHERE nombre_columna >= 1 AND nombre_columna <= 2
WHERE nombre_columna BETWEEN 1hs y 2hs

