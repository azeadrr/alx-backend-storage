-- Average weighted score for all!
-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUsers

DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUsers;
DELIMITER $$ ;
CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
  UPDATE users AS Usrs,
    (
	SELECT Usrs.id, SUM(score * weight) / SUM(weight) AS wvg
	FROM users AS Usrs
	JOIN corrections as Cr ON Usrs.id = Cr.user_id
	JOIN projects AS Pr ON Cr.project_id = Pr.id
	GROUP BY Usrs.id )
  AS Wg
  SET Usrs.average_score = Wg.wvg
  WHERE Usrs.id=Wg.id;
END $$

DELIMITER ; $$
