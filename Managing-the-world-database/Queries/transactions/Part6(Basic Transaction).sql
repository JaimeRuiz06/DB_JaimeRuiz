START TRANSACTION;

-- Insert a new city into the 'city' table
INSERT INTO city (Name, CountryCode, District, Population)
VALUES ('Test City', 'USA', 'Test District', 500000);

SELECT * FROM city WHERE Name = 'Test City';

ROLLBACK;

-- Verify that the city is not in the table anymore
SELECT * FROM city WHERE Name = 'Test City';
