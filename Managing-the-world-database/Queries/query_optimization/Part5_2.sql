-- 2. Optimizing the Query for Cities with Population > 1 Million and Name Starting with "A"

EXPLAIN SELECT city.name, population
FROM city
WHERE population > 1000000 AND city.name LIKE 'A%'
ORDER BY city.name;

CREATE INDEX idx_population_city_name ON city(population, city_name);
