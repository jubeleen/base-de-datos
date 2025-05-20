--ACTIVIDAD 1 : Nombre y Apellido de todos los empleados, en orden alfabético.

SELECT FirstName, LastName
FROM employees
ORDER BY LastName ASC, FirstName ASC;

--ACTIVIDAD 2 : Nombre y duración de todas las canciones del álbum "Big Ones" ordenados del más largo al más corto

SELECT t.Name AS TrackName, t.Milliseconds
FROM tracks t
JOIN albums a ON t.AlbumId = a.AlbumId
WHERE a.Title = 'Big Ones'
ORDER BY t.Milliseconds DESC;

--ACTIVIDAD 3 : Nombre de todos los géneros con la cantidad de canciones de cada uno

SELECT g.Name AS Genre, COUNT(t.TrackId) AS CantidadCanciones
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.Name
ORDER BY CantidadCanciones DESC;

--ACTIVIDAD 4 : Nombre de los discos con al menos 5 canciones

SELECT a.Title AS AlbumTitle, COUNT(t.TrackId) AS NumCanciones
FROM albums a
JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.AlbumId
HAVING COUNT(t.TrackId) >= 5
ORDER BY NumCanciones DESC;

--ACTIVIDAD 5 : Nombre y precio total de los 10 discos más baratos

SELECT a.Title AS AlbumTitle, SUM(ii.UnitPrice) AS PrecioTotal
FROM albums a
JOIN tracks t ON a.AlbumId = t.AlbumId
JOIN invoice_items ii ON t.TrackId = ii.TrackId
GROUP BY a.AlbumId
ORDER BY PrecioTotal ASC
LIMIT 10;

--ACTIVIDAD 6 : Nombre del tema, nombre del género y nombre del disco del los temas que valen $0.99

SELECT t.Name AS TrackName, g.Name AS Genre, a.Title AS AlbumTitle
FROM tracks t
JOIN genres g ON t.GenreId = g.GenreId
JOIN albums a ON t.AlbumId = a.AlbumId
JOIN invoice_items ii ON t.TrackId = ii.TrackId
WHERE ii.UnitPrice = 0.99;

--ACTIVIDAD 7 : Nombre del tema, duración, nombre del disco y nombre del artista de los 20 temas más cortos

SELECT t.Name AS TrackName, t.Milliseconds, a.Title AS AlbumTitle, ar.Name AS Artist
FROM tracks t
JOIN albums a ON t.AlbumId = a.AlbumId
JOIN artists ar ON a.ArtistId = ar.ArtistId
ORDER BY t.Milliseconds ASC
LIMIT 20;

--ACTIVIDAD 8 : Apellido, puesto, apellido del jefe y cantidad de clientes que atiende de todos los empleados, ordenado desde los que atienden más clientes a los que atienden menos

SELECT 
    e.LastName AS Empleado,
    e.Title AS Puesto,
    j.LastName AS Jefe,
    COUNT(c.CustomerId) AS ClientesAtendidos
FROM employees e
LEFT JOIN employees j ON e.ReportsTo = j.EmployeeId
LEFT JOIN customers c ON e.EmployeeId = c.SupportRepId
GROUP BY e.EmployeeId
ORDER BY ClientesAtendidos DESC;

--ACTIVIDAD 9 : Insertar cuatro (4) canciones que les gusten.
--ACTIVIDAD 10 : Mostrar las cuatro canciones ingresadas.
--ACTIVIDAD 11 : Modifiquen dos (2) canciones por otras que se les ocurran.
--ACTIVIDAD 12 : Mostrar las dos (2) canciones modificadas.
--ACTIVIDAD 13: Borrar dos (2) datos ingresados, realizando un solo delete.
