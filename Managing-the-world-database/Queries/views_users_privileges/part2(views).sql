USE world;
-- View to show cities with a population over 1 million
CREATE VIEW high_population_cities AS
SELECT name AS city_name, country_code, population
FROM world.city
WHERE population > 1000000;

-- View to show countries with their languages, excluding English
CREATE VIEW countries_with_languages AS
SELECT c.name AS country_name, cl.language
FROM world.country c
JOIN world.countrylanguage cl ON c.code = cl.country_code
WHERE cl.language != 'English';
