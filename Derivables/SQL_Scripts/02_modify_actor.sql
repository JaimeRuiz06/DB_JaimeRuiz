-- Insert a new actor record
INSERT INTO actor (first_name, last_name, last_update)
VALUES ('Jaime', 'Ruiz',  NOW());

-- Update an actor's last name
UPDATE actor
SET last_name = 'SMITH'
WHERE first_name = 'John' AND last_name = 'SUVARI';

-- Delete an actor from the table
DELETE FROM actor
WHERE first_name = 'Jaime' AND last_name = 'Ruiz';