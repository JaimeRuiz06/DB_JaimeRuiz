-- Create the new user
CREATE USER 'db_user'@'localhost' IDENTIFIED BY '1234';

-- Grant permissions to the new user
GRANT SELECT ON world.city TO 'db_user'@'localhost';
GRANT SELECT ON world.country TO 'db_user'@'localhost';
GRANT INSERT, UPDATE ON world.city TO 'db_user'@'localhost';
GRANT SELECT ON high_population_cities TO 'db_user'@'localhost';

REVOKE INSERT, UPDATE, DELETE ON world.country FROM 'db_user'@'localhost';