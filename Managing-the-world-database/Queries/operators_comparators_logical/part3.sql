SELECT c.Name AS country_name, ci.Name AS city_name
FROM world.country c
JOIN world.city ci ON c.Code = ci.CountryCode
WHERE 
    -- Comparison Operators: Countries with population > 50 million but < 200 million
    (c.Population > 50000000 AND c.Population < 200000000)
    
    -- Use IN: Countries with population between 20 million and 50 million
    OR c.Population IN (20000000, 50000000)
    
    -- Logical Operators: Cities with population between 1 million and 10 million, excluding cities in Asia
    OR (ci.Population BETWEEN 1000000 AND 10000000 AND c.Region != 'Asia')
    
    -- Complex Queries: Countries with population > 100 million or the region is 'Europe'
    OR c.Population > 100000000 OR c.Region = 'Europe'
    
    -- Combine LIKE and NOT: Cities starting with 'A' but not ending with 'n'
    OR (ci.Name LIKE 'A%' AND ci.Name NOT LIKE '%n');


