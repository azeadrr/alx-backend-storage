-- No table for a meeting
-- SQL script that creates a view need_meeting

CREATE OR REPLACE VIEW need_meeting AS
SELECT name from students
WHERE score < 80
    AND (last_meeting IS NULL OR last_meeting < DATE(CURDATE() - INTERVAL 1 MONTH));
