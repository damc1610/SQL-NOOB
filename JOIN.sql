select b.book_id, a.name , a.author_id, b.title -- trae de las tablas books, el id book; de la tabl de authors el nombre, el ide y de la
from books as b  -- tabla books el titulo del autor
join authors as a 
    on a.author_id = b.author_id -- el author id de authors y el author_id de books son iguales, unelos

select b.book_id, a.name , a.author_id, b.title
from books as b
join authors as a  on a.author_id = b.author_id
where a.author_id between 1 and 5;

SELECT c.name, b.title, a.name, t.type  --probando multiples joins con multiples condicionales con select
FROM transactions as t
join books as b on t.book_id = b.book_id 
join clients as c on t.client_id = c.client_id
join authors as a on b.author_id = a.author_id
where c.gender = 'F' and t.type = 'sell';


SELECT c.name as nomb_cliente , b.title, a.name as nomb_autor, t.type -- probando multiples joins con multiples condicionales, y 
FROM transactions as t                                                -- agregando un alias para mostrar los nombres de manera diferente
join books as b on t.book_id = b.book_id 
join clients as c on t.client_id = c.client_id
join authors as a on b.author_id = a.author_id
where c.gender = 'M' and t.type IN ('sell','lend');

