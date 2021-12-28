USE `university`;
set global log_bin_trust_function_creators = 1;
DELIMITER $$

DROP function IF EXISTS `count_avg_student_rank`;

CREATE FUNCTION `count_avg_student_rank` ()
RETURNS INTEGER
BEGIN
	RETURN (select avg(student_rank) from student);
END$$


DROP function IF EXISTS `select_towns`;

CREATE FUNCTION `select_towns` (middle_school_name varchar)
RETURNS varchar(45)
BEGIN
	RETURN (select town.name from town join middle_school on  middle_school.Town_town_name = town.name
    where  middle_school.Town_town_name = middle_school_name)
END$$

DELIMITER ;