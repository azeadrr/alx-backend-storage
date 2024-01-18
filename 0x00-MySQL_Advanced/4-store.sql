-- Buy buy buy
-- SQL script that creates a trigger that decreases the quantity

DROP TRIGGER IF EXISTS upte_item;
DELIMITER $$ ;

CREATE TRIGGER upte_item BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
    UPDATE items
    SET quantity = quantity - NEW.number
    WHERE name = NEW.item_name;
END; $$

DELIMITER ; $$
