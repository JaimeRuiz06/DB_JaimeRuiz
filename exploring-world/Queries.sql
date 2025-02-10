-- 1. Query
SELECT country.Name AS country_name, countrylanguage.Language AS official_language 
FROM country 
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T';

-- 2. Query
SELECT city.Name AS city_name, city.Population 
FROM city 
JOIN country ON city.CountryCode = country.Code
WHERE country.Name = 'Germany';

-- 3. Query
SELECT Name AS country_name, SurfaceArea 
FROM country 
ORDER BY SurfaceArea ASC 
LIMIT 5;

-- 4. Query
SELECT Name AS country_name, Population 
FROM country 
WHERE Population > 50000000 
ORDER BY Population DESC;

-- 5. Query
SELECT Continent, AVG(LifeExpectancy) AS avg_life_expectancy 
FROM country 
GROUP BY Continent;

-- 6. Query
SELECT Region, SUM(Population) AS total_population 
FROM country 
GROUP BY Region;

-- 7. Query
SELECT country.Name AS country_name, COUNT(city.ID) AS city_count 
FROM city 
JOIN country ON city.CountryCode = country.Code
GROUP BY country.Name 
ORDER BY city_count DESC;

-- 8. Query
SELECT city.Name AS city_name, country.Name AS country_name, city.Population 
FROM city 
JOIN country ON city.CountryCode = country.Code
ORDER BY city.Population DESC 
LIMIT 10;

-- 9. Query
SELECT DISTINCT country.Name AS country_name 
FROM country 
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'French' AND countrylanguage.IsOfficial = 'T';

-- 10. Query
SELECT DISTINCT country.Name AS country_name 
FROM country 
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.Language = 'English' AND countrylanguage.IsOfficial = 'F';

-- 12. Query
SELECT Continent, Name AS country_name, GNP 
FROM ( 
  SELECT Continent, Name, GNP, 
         RANK() OVER (PARTITION BY Continent ORDER BY GNP DESC) AS rank_rich, 
         RANK() OVER (PARTITION BY Continent ORDER BY GNP ASC) AS rank_poor 
  FROM country 
) ranked 
WHERE rank_rich = 1 OR rank_poor = 1;

-- 13. Query
SELECT Name AS country_name, LifeExpectancy 
FROM country 
WHERE LifeExpectancy < (SELECT AVG(LifeExpectancy) FROM country);

-- 14. Query
SELECT city.Name AS capital_city 
FROM city 
JOIN country ON city.ID = country.Capital
WHERE country.Population > 100000000;

-- 15. Query
SELECT Continent, COUNT(Name) AS country_count 
FROM country 
GROUP BY Continent 
ORDER BY country_count DESC 
LIMIT 1;
