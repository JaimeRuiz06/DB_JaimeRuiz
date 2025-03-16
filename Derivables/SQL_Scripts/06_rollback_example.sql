START TRANSACTION;

-- Attempt to rent a movie that is out of stock
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id, return_date, last_update)
SELECT NOW(), inventory_id, 1, 1, NULL, NOW()
FROM inventory
WHERE inventory_id = 9999;  

ROLLBACK;
