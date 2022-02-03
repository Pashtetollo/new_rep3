USE `Khomiakov_7_44`;
set global log_bin_trust_function_creators = 1;
DELIMITER $$

-- DROP function IF EXISTS `count_avg_student_rank`;

CREATE FUNCTION `count_avg_student_rank` ()
RETURNS INTEGER
BEGIN
	RETURN (select avg(student_ranking) from student);
END$$


-- DROP function IF EXISTS `select_town_name`;

CREATE FUNCTION `select_town_name` (middle_school_name varchar(45))
RETURNS varchar(45)
BEGIN
	RETURN (select town.name from town
    where  middle_school.town_id = town.town_id);
END$$

DELIMITER ;

select * from student where student.student_ranking < (select count_avg_student_rank());