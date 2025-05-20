/*Customers*/ Clientes.

/*employees*/.Empleados.

/*invoices*/ .Facturas.

/*invoices item*/.Artículo de factura.

/*tracks*/.Pistas.

/*media-types*/.Tipos de medios.

/*genres*/.Géneros.

/*playlist track*/.Pista de lista de reproducción.

/* A C T I V I D A D 1*/

SELECT 
   FirstName AS nombre_empleado,
    LastName AS apellido_empleado
FROM employees e 
ORDER BY e.FirstName,LastName ASC;

/*A C T I V I D A D 2*/

SELECT 
    t.Milliseconds as duracion,  
    t.Name AS nombre_cancion

FROM albums a
INNER JOIN tracks t
ON  a.AlbumId = t.AlbumId
WHERE a.Title = 'Big Ones'
ORDER BY t.Milliseconds,t.Name DESC;

/*A C T I V I D A D 3*/

SELECT count(t.TrackId)AS cantidad_canciones,g.Name AS Nombre_DetodosLos_Generos

FROM tracks t
INNER JOIN genres g
ON  t.GenreId = g.GenreId
GROUP BY g.name 

/*act 4*/
SELECT count(a.AlbumId)AS cant_discos,
 a.Title AS nombre

FROM albums a
INNER JOIN tracks t
ON  a.AlbumId = t.AlbumId
GROUP BY a.Title
HAVING cant_discos >= 5
ORDER BY cant_discos ASC;

/*act5*/

SELECT t.TrackId, a.Title as "Album Name", t.UnitPrice as precio_unit
from albums a 
INNER JOIN tracks t 
ON a.AlbumId = t.AlbumId
INNER JOIN invoice_items it
ON t.TrackId = it.TrackId
INNER JOIN invoices i 
ON it.InvoiceId = i.InvoiceId
ORDER BY t.TrackId  ASC LIMIT 10

/*act6*/

SELECT t.TrackId, a.Title as "Album Name", t.UnitPrice as precio_unit,g.name as nombre_genero
from albums a 
INNER JOIN tracks t 
ON a.AlbumId = t.AlbumId
INNER JOIN invoice_items it
ON t.TrackId = it.TrackId
INNER JOIN invoices i 
ON it.InvoiceId = i.InvoiceId
INNER JOIN  genres g
ON t.GenreId = g.GenreId
ORDER BY  a.AlbumId ASC;



/*act 7*/