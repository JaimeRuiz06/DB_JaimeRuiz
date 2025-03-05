SHOW TABLES FROM world;

-- Get column details for each table
DESCRIBE world.country;
DESCRIBE world.city;
DESCRIBE world.countrylanguage;

ALTER TABLE world.city
ADD COLUMN is_population_large BOOLEAN;

-- Update the column to be TRUE if the population > 1 million, otherwise FALSE
UPDATE world.city
SET is_population_large = (population > 1000000);

ALTER TABLE world.country
ADD COLUMN region_code CHAR(3) DEFAULT 'NA';

ALTER TABLE world.city
ADD CONSTRAINT check_population_positive CHECK (population >= 0);

ALTER TABLE world.country
ADD CONSTRAINT unique_country_code UNIQUE (code);

CREATE INDEX idx_city_name ON world.city(name);

-- Query without the index
SELECT * FROM world.city WHERE name = 'Madrid';
-- Query with the index
SELECT * FROM world.city WHERE name = 'Madrid';
