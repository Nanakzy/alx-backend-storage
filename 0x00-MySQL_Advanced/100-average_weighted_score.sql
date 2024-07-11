-- stored procedure
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUser(IN user_id INT)
BEGIN
    DECLARE weighted_sum FLOAT;
    DECLARE total_weight INT;

    -- Calculate the weighted sum of scores for the user
    SELECT SUM(c.score * p.weight)
    INTO weighted_sum
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    -- Calculate the total weight of projects for the user
    SELECT SUM(p.weight)
    INTO total_weight
    FROM corrections c
    JOIN projects p ON c.project_id = p.id
    WHERE c.user_id = user_id;

    -- Update the average score in the users table
    UPDATE users
    SET average_score = IF(total_weight = 0, 0, weighted_sum / total_weight)
    WHERE id = user_id;
END //

DELIMITER ;
