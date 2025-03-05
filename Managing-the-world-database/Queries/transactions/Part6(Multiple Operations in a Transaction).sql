START TRANSACTION;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('New City', 'USA', 'New District', 1000000);

UPDATE country
SET Population = Population + 1000000
WHERE Code = 'USA';

SELECT * FROM city WHERE Name = 'New City';
SELECT * FROM country WHERE Code = 'USA';

COMMIT;