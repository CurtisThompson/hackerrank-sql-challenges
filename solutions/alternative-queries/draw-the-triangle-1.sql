DELIMITER //
CREATE PROCEDURE draw_triangle(IN n INT)
BEGIN
  SET @count := n;
  WHILE @count > 0 DO
    SELECT CONCAT(REPEAT("* ", @count-1), "*");
    SET @count := @count - 1;
  END WHILE;
END//
DELIMITER ;

CALL draw_triangle(20);