SELECT city.Name AS City, country.Name AS Country, countrylanguage.Language
FROM city
JOIN country ON city.CountryCode = country.Code
JOIN countrylanguage ON country.Code = countrylanguage.CountryCode
WHERE countrylanguage.IsOfficial = 'T' 
AND countrylanguage.Language != 'English';

SELECT country.Code, country.Name, total_population
FROM country
JOIN (
    SELECT CountryCode, SUM(Population) AS total_population
    FROM city
    GROUP BY CountryCode
) AS country_population ON country.Code = country_population.CountryCode;
