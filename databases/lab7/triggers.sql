DELIMITER $$
USE `university`$$

-- ------------------------------
-- district
-- ------------------------------
DROP TRIGGER IF EXISTS `university`.`district_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `district_BEFORE_DELETE` BEFORE DELETE ON `district` FOR EACH ROW 
district
	declare is_position_present bool;
    select exists(select * from town where 
    town.`district_district_name` = district.`district_name`) into is_position_present;
    if is_position_present
		then signal sqlstate "45000" set message_text = 'this district is still part of a town';
	end if;
END$$

-- ------------------------------
-- student
-- ------------------------------
DROP TRIGGER IF EXISTS `university`.`student_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `student_BEFORE_DELETE` BEFORE DELETE ON `student` FOR EACH ROW 
student
	declare is_position_present bool;
    select exists(select * from student_has_debts where 
    student_has_debts.`student_student_ticket_number` = new.`name`) into is_position_present;
    if is_position_present
		then signal sqlstate "45000" set message_text = 'student still has unclosed debts';
	end if;
END$$

-- ------------------------------
-- student
-- ------------------------------
DROP TRIGGER IF EXISTS `university`.`district_BEFORE_DELETE`;

CREATE DEFINER=`root`@`localhost` TRIGGER `district_BEFORE_DELETE` BEFORE DELETE ON `district` FOR EACH ROW 
district
	declare is_position_present bool;
    select exists(select * from town where 
    town.`district_district_name` = new.`district_name`) into is_position_present;
    if is_position_present
		then signal sqlstate "45000" set message_text = 'this district is still part of a town';
	end if;
END$$


-- ------------------------------
-- student
-- ------------------------------
DROP TRIGGER IF EXISTS `university`.`student_BEFORE_INSERT`;

CREATE DEFINER=`root`@`localhost` TRIGGER `university`.`student_BEFORE_INSERT`
 BEFORE INSERT ON `student` FOR EACH ROW
BEGIN
    if (new.`name` not in ('Світлана', 'Петро', 'Оля', 'Тарас', 'Василь', 'Антон'))
        then signal sqlstate "45000" set message_text = 'Wrong name provided';
    end if;
END$$


-- ------------------------------
-- middle_school
-- ------------------------------
DROP TRIGGER IF EXISTS `university`.`middle_school_BEFORE_INSERT`;

CREATE DEFINER=`root`@`localhost` TRIGGER `middle_school_BEFORE_INSERT` BEFORE INSERT ON `middle_school` FOR EACH ROW 
BEGIN
    if( new.`phone` NOT LIKE '+[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]')
    hen signal sqlstate "45000" set message_text = 'wrong phone format, required is +XXX-XXX-XX-XX';
    end if;
END$$


-- ------------------------------
-- Town
-- ------------------------------
DROP TRIGGER IF EXISTS `university`.`pharmacy_has_cure_BEFORE_INSERT`;

CREATE DEFINER=`root`@`localhost` TRIGGER `university`.`Town_cure_BEFORE_INSERT` BEFORE INSERT ON `Town` FOR EACH ROW
BEGIN
CREATE TABLE IF NOT EXISTS `mydb`.`timestamp` (
  `time` DATETIME NOT NULL,
  PRIMARY KEY (`time`));
  INSERT INTO `mydb`.`timestamp` (time) VALUES (CURRENT_TIMESTAMP)
END$$

DELIMITER ;