-- Average weighted score
-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
DELIMITER $$
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (user_id INT)
BEGIN
    DECLARE totwg_score INT DEFAULT 0;
    DECLARE totwg INT DEFAULT 0;

    SELECT SUM(corrections.score * projects.weight)
        INTO totwg_score
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    SELECT SUM(projects.weight)
        INTO totwg
        FROM corrections
            INNER JOIN projects
                ON corrections.project_id = projects.id
        WHERE corrections.user_id = user_id;

    IF totwg = 0 THEN
        UPDATE users
            SET users.average_score = 0
            WHERE users.id = user_id;
    ELSE
        UPDATE users
            SET users.average_score = totwg_score / totwg
            WHERE users.id = user_id;
    END IF;
END $$
DELIMITER ; $$
