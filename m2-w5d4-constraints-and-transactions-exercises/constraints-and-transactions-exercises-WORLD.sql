-- Write queries to return the following:
-- Make the following changes in the "world" database.

-- 1. Add Superman's hometown, Smallville, Kansas to the city table. The 
-- countrycode is 'USA', and population of 45001. (Yes, I looked it up on 
-- Wikipedia.)

INSERT INTO city (id, NAME, DISTRICT, countrycode, POPULATION) 
VALUES (4080,'SMALLVILLE', 'KANSAS', 'USA', 45001);

-- 2. Add Kryptonese to the countrylanguage table. Kryptonese is spoken by 0.0001
-- percentage of the 'USA' population.

insert into countrylanguage (countrycode, language, percentage, isofficial) 
values ('USA', 'Kryptonese', 0.0001, false);

-- 3. After heated debate, "Kryptonese" was renamed to "Krypto-babble", change 
-- the appropriate record accordingly.

update countrylanguage
set language= 'Krypto-babble'
where language = 'Kryptonese';

-- 4. Set the US captial to Smallville, Kansas in the country table.

update country
set capital = 4080
where code = 'USA';

-- 5. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

No, the id of smallville is still referenced in the country table, as being the capital of the USA.

-- 6. Return the US captial to Washington.

update country
set capital = 3813
where code = 'USA';

-- 7. Delete Smallville, Kansas from the city table. (Did it succeed? Why?)

Yes. Smallville is no longer referenced in the country table, therefore
it is not a violation of referential integrity.

-- 8. Reverse the "is the official language" setting for all languages where the
-- country's year of independence is within the range of 1800 and 1972 
-- (exclusive). 
-- (590 rows affected)

update countrylanguage
set isofficial = not isofficial
where countrylanguage.countrycode 
IN ( SELECT COUNTRY.CODE FROM COUNTRY WHERE COUNTRY.INDEPYEAR > 1800 and country.indepyear <1972 );

-- 9. Convert population so it is expressed in 1,000s for all cities. (Round to
-- the nearest integer value greater than 0.)
-- (4079 rows affected)

update city
set population = population / 1000;

-- 10. Assuming a country's surfacearea is expressed in miles, convert it to 
-- meters for all countries where French is spoken by more than 20% of the 
-- population.
-- (7 rows affected)

update country
set surfacearea = surfacearea * 2590000
where country.code 
in (select countrylanguage.countrycode from countrylanguage where countrylanguage.language = 'French' and countrylanguage.percentage >= 20);
