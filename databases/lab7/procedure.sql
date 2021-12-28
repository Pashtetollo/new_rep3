USE university;
DELIMITER $$


DROP procedure IF EXISTS `insert_student`;

CREATE DEFINER=`root`@`localhost` 
PROCEDURE insert_student(
 in  name VARCHAR(45),
 in  surname VARCHAR(45),
 in  father_name VARCHAR(45),
 in  student_rank INT,
 in  birthday DATETIME,
 in  join_date DATETIME,
 in  student_ticket_number INT,
 in  email VARCHAR(30),
 in  Town_town_name VARCHAR(45),
 in  group_number INT,
)
BEGIN
    INSERT INTO university.student 
        ('surname', 'father_name', 'student_rank', 'birthday', 'join_date', 'student_ticket_number',
         'email', 'Town_town_name', 'group_number') 
    VALUES 
        (surname, father_name, student_rank, birthday, join_date, student_ticket_number, email,
         Town_town_name, group_number);
END$$

DROP procedure IF EXISTS `fill_town`;

CREATE DEFINER=`root`@`localhost`
PROCEDURE fill_town()
BEGIN
    declare counter int default 0;
    declare town_num int;
    declare expected_new_town varchar(9);

    while counter < 10 do
        set expected_new_town = concat("Noname", counter);
        if (not exists(select * from Town where town.name = expected_new_town))
            then 
            insert into Town('town_name') values (expected_new_town);
            set counter = counter + 1;
        end if;
    end while;
END$$