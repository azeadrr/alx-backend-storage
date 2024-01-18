-- Email validation to sent
-- SQL script that creates a trigger that resets the attribute valid_email

DEL $$ ;

DROP TRIGGER IF EXISTS rest_mail_val;
CREATE TRIGGER rest_mail_val BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    IF (OLD.email != NEW.email) THEN
    SET NEW.valid_email = 0;
    END IF;
END; $$

DEL ; $$