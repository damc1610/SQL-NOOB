-- USANDO EL COMANDO SELECT 
-- CON SELECT PODEMOS TRAER CUALQUIER DATO DE UNA TABLA
SELECT  * FROM clients; -- trae todos los datos de la tabla de clients
SELECT name FROM clients, -- trae todo los datos de la columna name de la tabla clients.
SELECT name, email FROM clients -- trae los datos de la columna name y email de la tabla clients
SELECT * FROM clients LIMIT 10 -- trae solamente 10 datos de la tabla clients, el numero de llimit se puede cambiar
SELECT name,email.gender FROM clients WHERE gender = 'M'; -- me trae los datos de la columna que especifico y que solamemte cumplan la condicion del condicional where, en este caso que tengan en gender M.
SELECT year(birthdate) FROM clients ; -- se pueden usar funciones dentro de select, en este caso de la columna birthdate, solamente muestra anos.
SELECT year(now()); -- se puede uusar select con funciones dentro de funciones
SELECT name, YEAR(NOW()) - YEAR (birthdate) FROM clients LIMIT 10; -- se puede ejecutar operaciones en la clou,na y traer o mostrar con select ();
SELECT * FROM clients WHERE name LIKE '%saave%'; -- Se puede usar el select con funciones en los condicionales, en este caso va a traer todos los datos de la tabla client donde tenga el nombre parecido a saave.
SELECT name,email.gender YEAR(NOW()) - YEAR (birthdate) AS edad FROM clients -- usando select con dos condicionales y con una funcion en las condicionales. es decir me va a traer
WHERE gender = 'F' AND name LIKE '%Lop%'; -- de la tabla clients, los que tengan genero F y teng como nombre parecido a lop

SELECT name, email, gender, YEAR(NOW()) - YEAR (birthdate) AS edad FROM clients WHERE gender = 'F' AND name LIKE '%Lop%'; -- creando un alias a la edad

