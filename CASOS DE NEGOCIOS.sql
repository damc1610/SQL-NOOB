-- vamos a plantear unas preguntas y las vamos a responder en comandos sql 
-- PREGUNTAS : 3. CUANTOS LIBROS HAY DE CADA NACIONALIDAD / 4 CUAL ES EL PROMEDIO / DESVIACION STANDARD DEL PRECIO DE LIBROS
-- 5 IDEM, PERO POR NACIONALIDAD / 6 CUAL ES EL PRECIO MAXIMO/MINIMO DE UN LIBRO / 7 COMO QUEDARIA EL REPORTE DE PRESTAMOS
-- 1- Que nacionalidades hay?
SELECT nationality FROM authors --agrupo la cantidad de nacionalidades
GROUP BY nationality;
ORDER BY nationality

-- otra manera de hacerlo es con el DISTINCT
SELECT DISTINCT nationality FROM authors ORDER BY nationality; --El comando distinct te escoge las diferentes opciones y te las muestra en la tabla

-- 2 Cuantos escritores hay de cada nacionalidad
SELECT nationality, COUNT(author_id) as 'Nacionalidad de escritores' FROM authors
GROUP BY nationality 
ORDER BY COUNT(author_id) desc, nationality; -- el orden by se pueden agregar otros parametros para ordenar, si una condicion no define el orden toma el otro para ordenarlo.

-- variaciones de la respuestas usando otros comandos para excluir datos
SELECT nationality, COUNT(author_id) as 'Nacionalidad de escritores' FROM authors
WHERE nationality IS NOT NULL --EXCLUYENDO A LOS VALORES NULOS
AND nationality NOT IN ('RUS', 'AUT') -- NO ME INCLUYAS A LOS QUE DIGAN 'RUS' Y 'AUT'
GROUP BY nationality 
ORDER BY COUNT(author_id) desc, nationality;

-- EJEMPLO AHORA ME VAS A INCLUIR A AUT Y RUS

SELECT nationality, COUNT(author_id) as 'Nacionalidad de escritores' FROM authors
WHERE nationality IS NOT NULL
AND nationality  IN ('NULL') -- EL CAMBIO ES QUE AHORA DICE IN EN VEZ DE NOT IN
GROUP BY nationality 
ORDER BY COUNT(author_id) desc, nationality;



-- comprobando que este bien el codigo COUNT(NAME) as 'Cantidad de Escritores Pais'
SELECT name, author_id, FROM AUTHORS 
where nationality = 'ENG';
-- EJEMPLO DE CODIGO PARA COPIAR EN SQL SIN COMENTARIOS (PROBANDO LOS CODIGOS DE ARRIBA)
SELECT nationality, COUNT(author_id) as 'Nacionalidad de escritores' FROM authors
WHERE nationality IS NULL
GROUP BY nationality 
ORDER BY COUNT(author_id) desc, nationality;

-- PRUEBA
SELECT name, author_id, nationality FROM authors
WHERE nationality IS NULL
ORDER BY  nationality;



-- RESPONDIENDO PREGUNTA 3 CUANTOS LIBROS HAY DE CADA NACIONALIDAD?

SELECT a.nationality, COUNT(b.book_id) as 'libros de cada nacionalidad' 
FROM books as b 
 join authors as a
 on b.author_id=a.author_id
GROUP BY a.nationality
order by b.book_id, a.nationality asc ;

-- COMPROBANDO A VER SI ESTA BUENO EL CODIGO
SELECT a.name, b.book_id, a.author_id, a.nationality
FROM books as b 
 join authors as a
 on b.author_id=a.author_id
 WHERE nationality IS NULL
order by  a.nationality asc ; -- EFECTIVAMENTE COINCIDE LA CANTIDAD DE LIBROS DE CADA NACIONALIDAD 

-- CUAL ES EL PROMEDIO O DESVIACION ESTANDAR DE LOS PRECIOS DE LOS LIBROS


-- primero asignandole los valores de los precios a la tabla books con la funcion floor y rando
UPDATE books -- FLOOR(RAND()*(b-a+1))+a; donde a es el valor mas pequeno y b es el mas grande (rango para que tome valores la funcion rand)
  SET price = (RAND()*(35-10+1))+10 --este comando te devuelve un numero entero gracias a floor y donde (35) es el valor mas alto y (10) es el valor mas pequeno que quiero, es decir el rango donde quiero generar los valores 
  WHERE book_id between 1 and 198

UPDATE books
SET price = (RAND()*(35-10+1))+10 -- sin el floor para que los valores tengan decimales
WHERE book_id between 1 and 198;
-- ahora si respondiendo pregunta 4
SELECT AVG(price) FROM books; -- FUNCION AVG, CALCULA EL PROMEDIO DE LO QUE LE INDIQUES
SELECT AVG(price) as prom, STDDEV(price) as ' Desviacion Estadar' FROM books; -- FUNCION STDDEV, te calcula la desviacion estandar de una columna
-- agregando mas operaciones matematicas y agrupando los libros por nacionalidad
SELECT  nationality, 
 COUNT(book_id) as libros, 
 AVG(price) as prom, 
 STDDEV(price) as ' Desviacion Estadar' 
FROM books as b
 JOIN authors as a 
  ON a.author_id = b.author_id\
GROUP BY nationality
ORDER BY libros desc ;

-- RESPONDIENDO PREGUNTA 6 cual es el precio maximo/minimo de un libro
SELECT MAX(price), MIN(price) FROM BOOKS; -- FUNCIONES MAX Y MIN, son para buscar los valores maximos y minimos de una columna.
-- ahora cruzando las tablas con paises 
SELECT nationality, MAX(price), MIN(price) 
FROM BOOKS as b 
JOIN authors as a 
 ON a.author_id=b.author_id
GROUP BY nationality;

-- RESPONDIENDO LA PREGUNTA FINAL REPORTE DE PRESTAMOS

-- reporte sencillo
SELECT c.name, t.type , b.title, a.name, a.nationality
FROM transactions AS t
LEFT JOIN clients  AS c 
 ON c.client_id = t.client_id
LEFT JOIN books AS b
 ON b.book_id = t.book_id
LEFT JOIN authors AS a 
 ON b.author_id = a.author_id
-- reporte usando la FUNCION QUE CONCATENAR FUNCION QUE JUNTA DOS O MAS CADENAS DE CARACTERES
SELECT c.name, t.type , b.title,
CONCAT(a.name, " (", a.nationality, ")") AS autor -- FUNCIONA QUE CONCATENA LOS CARACTERES
FROM transactions AS t
LEFT JOIN clients  AS c 
 ON c.client_id = t.client_id
LEFT JOIN books AS b
 ON b.book_id = t.book_id
LEFT JOIN authors AS a 
 ON b.author_id = a.author_id;
-- ahora le vamos a meter una nueva FUNCION TO_DAY
-- TO_DAY ES UTIL PARA COMPARAR FECHAS, TE INDICA TODO LOS DIAS QUE HA PASADO DES EL INICIO DE LA ERA GREGORIANA, UTIL PARA TRABAJAR CON FECHAS
SELECT c.name, t.type , b.title,
CONCAT(a.name, " (", a.nationality, ")") AS autor,
TO_DAYS(NOW())- TO_DAYS(T.created_at) AS ago -- operacion con TO_DAYS para sabes hace cuanto vendio o rento el libro resto el dia que se creo y el dia de hoy
FROM transactions AS t
LEFT JOIN clients  AS c 
 ON c.client_id = t.client_id
LEFT JOIN books AS b
 ON b.book_id = t.book_id
LEFT JOIN authors AS a 
 ON b.author_id = a.author_id;








