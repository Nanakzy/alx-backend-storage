-- stored procedure
DELIMITER //

CREATE PROCEDURE ComputeAverageWeightedScoreForUsers()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE current_user_id INT;
    DECLARE user_cursor CURSOR FOR SELECT id FROM users;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN user_cursor;
    read_loop: LOOP
        FETCH user_cursor INTO current_user_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        CALL ComputeAverageWeightedScoreForUser(current_user_id);
    END LOOP;

    CLOSE user_cursor;
END //

DELIMITER ;
