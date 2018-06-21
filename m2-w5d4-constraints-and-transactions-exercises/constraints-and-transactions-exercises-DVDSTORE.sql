-- Write queries to return the following:
-- The following changes are applied to the "pagila" database.**

-- 1. Add actors, Hampton Avenue, and Lisa Byway to the actor table.

INSERT INTO ACTOR (first_name, last_name) values ('HAMPTON', 'AVENUE');
INSERT INTO ACTOR (first_name, last_name) values ('LISA', 'BYWAY' );

-- 2. Add "Euclidean PI", "The epic story of Euclid as a pizza delivery boy in 
-- ancient Greece", to the film table. The movie was released in 2008 in English. 
-- Since its an epic, the run length is 3hrs and 18mins. There are no special 
-- features, the film speaks for itself, and doesn't need any gimmicks.

INSERT INTO FILM (title, description, release_year, length, language_id) 
values ('Euclidean PI', 'The epic story of Euclid as a pizza delivery boy in ancient Greece', 2008, 193, 1);

-- 3. Hampton Avenue plays Euclid, while Lisa Byway plays his slightly 
-- overprotective mother, in the film, "Euclidean PI". Add them to the film.

insert into actor(first_name, last_name) values ('HAMPTON', 'AVENUE');
insert into actor(first_name, last_name) values ('LISA','BYWAY');

insert into film_actor (actor_id, film_id) values (205, 1003);
insert into film_actor (actor_id, film_id) values(202, 1003);

-- 4. Add Mathmagical to the category table.

INSERT INTO category (name) values ('Mathmagica');

-- 5. Assign the Mathmagical category to the following films, "Euclidean PI", 
-- "EGG IGBY", "KARATE MOON", "RANDOM GO", and "YOUNG LANGUAGE"

UPDATE film_category
set category_id = 17
where film_id in (1003,274,494,714,996);

-- 6. Mathmagical films always have a "G" rating, adjust all Mathmagical films 
-- accordingly.
-- (5 rows affected)

UPDATE film
set rating = 'G'
where film_id in (1003, 274,494,714,996);

-- 7. Add a copy of "Euclidean PI" to all the stores.

insert into inventory (store_id, film_id) values (1,1003);
insert into inventory (store_id, film_id) values (2,1003);

-- 8. The Feds have stepped in and have impounded all copies of the pirated film, 
-- "Euclidean PI". The film has been seized from all stores, and needs to be 
-- deleted from the film table. Delete "Euclidean PI" from the film table. 
-- (Did it succeed? Why?)

No: "film" violates foreign key constraint "film_actor_film_id_fkey" on table "film_actor"
  We need to remove the film_id from the film_actor table first.

-- 9. Delete Mathmagical from the category table. 
-- (Did it succeed? Why?)

delete from category where name = 'Mathmagical'
No, Mathmagica is still referenced from the film_category and the tables
enfore referencial integrity.

-- 10. Delete all links to Mathmagical in the film_category tale. 
-- (Did it succeed? Why?)

Yes,

delete from category
where name = 'Mathmagica';

-- 11. Retry deleting Mathmagical from the category table, followed by retrying
-- to delete "Euclidean PI". 
-- (Did either deletes succeed? Why?)

delete from film
where title = 'Euclidian PI';

delete from category
where name = 'Mathmagica';

no, they both have references in other tables that require referential integrity.

-- 12. Check database metadata to determine all constraints of the film id, and 
-- describe any remaining adjustments needed before the film "Euclidean PI" can 
-- be removed from the film table.

The film_id of Euclidian PI needs to be reoved from film_actor table, before the film can be removed from the film table.