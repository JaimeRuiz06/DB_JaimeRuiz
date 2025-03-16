DELIMITER $$

-- Drop Foreign Keys (Manually Checking If They Exist)
ALTER TABLE rental DROP FOREIGN KEY fk_rental_customer;
ALTER TABLE rental DROP FOREIGN KEY fk_rental_inventory;
ALTER TABLE inventory DROP FOREIGN KEY fk_inventory_store;

-- Add Foreign Key Constraints
ALTER TABLE rental 
ADD CONSTRAINT fk_rental_customer 
FOREIGN KEY (customer_id) 
REFERENCES customer(customer_id) 
ON DELETE CASCADE, 

ADD CONSTRAINT fk_rental_inventory 
FOREIGN KEY (inventory_id) 
REFERENCES inventory(inventory_id) 
ON DELETE RESTRICT;

ALTER TABLE inventory 
ADD CONSTRAINT fk_inventory_store 
FOREIGN KEY (store_id) 
REFERENCES store(store_id) 
ON DELETE CASCADE;

-- Drop triggers if they exist
DROP TRIGGER IF EXISTS before_rental_insert;
DROP TRIGGER IF EXISTS before_film_update;

-- Trigger to prevent renting unavailable films
CREATE TRIGGER before_rental_insert 
BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
    DECLARE available INT;
    
    SELECT COUNT(*) INTO available 
    FROM inventory 
    WHERE inventory_id = NEW.inventory_id;
    
    IF available = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'This film is not available for rental';
    END IF;
END $$

-- Trigger to update last_update timestamp when modifying films
CREATE TRIGGER before_film_update 
BEFORE UPDATE ON film
FOR EACH ROW
BEGIN
    SET NEW.last_update = NOW();
END $$

DELIMITER ;

