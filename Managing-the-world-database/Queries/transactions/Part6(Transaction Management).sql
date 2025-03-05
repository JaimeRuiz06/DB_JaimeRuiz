START TRANSACTION;

INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('Partial City', 'USA', 'Partial District', 800000);

SAVEPOINT before_update;

UPDATE country
SET Population = Population + 500000
WHERE Code = 'USA';

UPDATE country
SET Population = Population + 500000
WHERE Code = 'XYZ';  -- This will fail because 'XYZ' doesn't exist

-- If an error occurs, rollback to the savepoint
ROLLBACK TO SAVEPOINT before_update;

-- Check the results of the partial rollback
SELECT * FROM city WHERE Name = 'Partial City';  -- The city should still exist
SELECT * FROM country WHERE Code = 'USA';  -- The country population should have been updated before the failed query

COMMIT;
