--We are all unique!
--SQL script that creates a table users

CREATE TABLE IF NOT EXISTS `users` (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    email CHAR(255) NOT NULL UNIQUE,
    name CHAR(255)
);
