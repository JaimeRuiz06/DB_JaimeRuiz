-- 1. Optimizing the Query to Retrieve the 10 Cities with the Highest Populations
EXPLAIN SELECT city.name, population
FROM city
ORDER BY population DESC
LIMIT 10;

CREATE INDEX idx_population ON city(population DESC);

