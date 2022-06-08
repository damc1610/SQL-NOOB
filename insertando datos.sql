
#creando la tabla books

CREATE TABLE IF NOT EXISTS  books (
    book_id INTEGER UNSIGNED PRYMARY KEY AUTO_INCREMENT, 
    author_id  INTEGER UNSIGNED ,
    title VARCHAR(100) NOT NULL,
    year INTEGER UNSIGNED NOT NULL DEFAULT 1900,
    language VARCHAR(2) NOT NULL DEFAULT 'es'COMMENT 'ISO 639-1 LANGUAGE',
    cover_url VARCHAR (500),
    price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    sellable TINYINT(1) DEFAULT 1,
    description TEXT
    );¬
    ¬

#creando la tabla authors
    CREATE TABLE IF NOT EXISTS authors (
        author_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        name VARCHAR(100) NOT NULL,
        nationality VARCHAR(3)
    ); 


#para aque corra la tabla books


 CREATE TABLE IF NOT EXISTS books (
    -> book_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    -> author_id INT UNSIGNED,
    -> title VARCHAR(100) NOT NULL,
    -> year INT UNSIGNED NOT NULL DEFAULT 1900,
    -> language VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 LANGUAGE',
    -> cover_url VARCHAR(500),
    -> price DOUBLE(6,2) NOT NULL DEFAULT 10.0,
    -> sellable TINYINT(1) DEFAULT 1,
    -> copies INT NOT NULL DEFAULT 1,
    -> description TEXT
    -> );                

    #creando la tabla clients

    CREATE TABLE clients (
        client_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
        `name` VARCHAR(5) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE,
        birthdate DATETIME,
        gender ENUM('M', 'F') NOT NULL,
        active TINYINT(1) NOT NULL DEFAULT '1',
        created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ); 

    #creando la tabla operations
    CREATE TABLE IF NOT EXISTS operations (
        `operation_id` INT(10) UNSIGNED PRIMARY KEY NOT NULL DEFAULT AUTO_INCREMENT,
        `book_id` INT(10) UNSIGNED NOT NULL,
        `client_id` INT(10) UNSIGNED NOT NULL,
        `type` ENUM ('P','D', 'V') NOT NULL COMMENT ' P=Prestado, D=Devuelto, V=Vendido',
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated`_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `finished` TINYINT(1) NOT NULL
        )ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS operations (
        `operation_id` INT(10) UNSIGNED PRIMARY KEY NOT NULL DEFAULT AUTO_INCREMENT,
        `book_id` int(10) unsigned NOT NULL,
        `client_id` int(10) unsigned NOT NULL,
        `type` ENUM ('P','D', 'V') NOT NULL COMMENT ' P=Prestado, D=Devuelto, V=Vendido',
        `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updated`_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `finished` TINYINT(1) NOT NULL
        );

        CREATE TABLE `transactions` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `book_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `type` enum('lend','sell') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;