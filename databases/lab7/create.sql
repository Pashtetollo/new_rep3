
CREATE SCHEMA IF NOT EXISTS university DEFAULT CHARACTER SET utf8 ;
USE university ;

CREATE TABLE IF NOT EXISTS university.`district` (
  `district_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`district_name`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS university.`Town` (
  `town_name` VARCHAR(45) NOT NULL,
  `district_district_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`town_name`, `district_district_name`),
  INDEX `fk_Town_district1_idx` (`district_district_name` ASC) VISIBLE,
  CONSTRAINT `fk_Town_district1`
    FOREIGN KEY (`district_district_name`)
    REFERENCES `university
`.`district` (`district_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS university.`group` (
  `name` VARCHAR(45) NOT NULL,
  `number` INT NOT NULL,
  `join_year` DATETIME NULL,
  PRIMARY KEY (`number`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS university.`student` (
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `father_name` VARCHAR(45) NOT NULL,
  `student_rank` INT NULL,
  `birthday` DATETIME NULL,
  `join_date` DATETIME NULL,
  `student_ticket_number` INT NOT NULL,
  `email` VARCHAR(30) NULL,
  `Town_town_name` VARCHAR(45) NOT NULL,
  `group_number` INT NOT NULL,
  PRIMARY KEY (`student_ticket_number`, `Town_town_name`, `group_number`),
  INDEX `fk_student_Town_idx` (`Town_town_name` ASC) VISIBLE,
  INDEX `fk_student_group1_idx` (`group_number` ASC) VISIBLE,
  CONSTRAINT `fk_student_Town`
    FOREIGN KEY (`Town_town_name`)
    REFERENCES university.`Town` (`town_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_group1`
    FOREIGN KEY (`group_number`)
    REFERENCES `university
`.`group` (`number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS university.`debts` (
  `subject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`subject`))
ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS university.`middle_school` (
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `Schoo_ head_credentials` VARCHAR(45) NULL,
  `Town_town_name` VARCHAR(45) NOT NULL,
  `Town_district_district_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`name`, `Town_town_name`, `Town_district_district_name`),
  INDEX `fk_middle_school_Town1_idx` (`Town_town_name` ASC, `Town_district_district_name` ASC) VISIBLE,
  CONSTRAINT `fk_middle_school_Town1`
    FOREIGN KEY (`Town_town_name` , `Town_district_district_name`)
    REFERENCES `university
`.`Town` (`town_name` , `district_district_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS university.`student_has_debts` (
  `student_student_ticket_number` INT NOT NULL,
  `debts_subject` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_student_ticket_number`, `debts_subject`),
  INDEX `fk_student_has_debts_debts1_idx` (`debts_subject` ASC) VISIBLE,
  INDEX `fk_student_has_debts_student1_idx` (`student_student_ticket_number` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_debts_student1`
    FOREIGN KEY (`student_student_ticket_number`)
    REFERENCES `university
`.`student` (`student_ticket_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_has_debts_debts1`
    FOREIGN KEY (`debts_subject`)
    REFERENCES `university
`.`debts` (`subject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;