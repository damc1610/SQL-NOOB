--maneras de usar el comando insert

INSERT INTO tabla(columnas*) VALUES (VALORES)
INSERT INTO authors (author_id, name. nationality) VALUES ('','Juan Rulfo ', 'MEX');
INSERT INTO authors(name,nationality) VALUES ('Gabriel Garcia Marquez', 'COL');
INSERT INTO authors VALUES (NULL,'Juan Gabriel Vasquez','COL');
INSERT INTO authors (name,nationality)
VALUES ('Julio Cortazar', 'ARG'),('Isabel Allende', 'CHI'), ('Octavio Paz', 'MEX'), ('Juan Carlos Onetti','URU');
--agregando datos en la tabla clients
INSERT INTO clients (name,email,birthdate,gender,active) VALUES ('Pedro Sanchez','Pedro.78522059J@random.names','1992-01-31','M',0)
ON DUPLICATE KEY UPDATE SET active = VALUES(active)
-- usando insert con querys anidados (haciendo subconsultas);
-- datos para insertar (csb)
-- El laberinto de la soledad, Octavio Paz, 1952
-- Vuelta al laberinto de la Soledad, Octavio Paz, 1960
INSERT INTO books (title,author_id) VALUES ('El laberinto de la soledad',10);
INSERT INTO books (title, author_id, `year`)
VALUES ('Vuelta al laberinto de la Soledad',
(SELECT author_id FROM authors WHERE name = 'Octavio Paz' LIMIT 1 ),
1960);
