SELECT Name 
FROM country
WHERE Code IN (
    SELECT CountryCode
    FROM city
    WHERE Population > 1000000
    GROUP BY CountryCode
    HAVING COUNT(*) > 5
);

SELECT Name
FROM country
WHERE Code IN (
    SELECT CountryCode
    FROM countrylanguage
    WHERE IsOfficial = 'T'
    GROUP BY CountryCode
    HAVING COUNT(*) > 3
);
