USE theater; 


DROP PROCEDURE IF EXISTS personal; 
delimiter $$
CREATE PROCEDURE personal()
	BEGIN
		SELECT id_staff AS'id' , full_name AS 'full name' FROM staff
		UNION
        SELECT 'Total', COUNT(id_staff) FROM  staff;
	END$$
delimiter ;
CALL personal();


DROP PROCEDURE IF EXISTS actors;
delimiter $$
CREATE PROCEDURE actors()
	BEGIN
		SELECT actors.id_actor as 'id', staff.full_name from actors, staff
		WHERE actors.id_staff = staff.id_staff
		UNION
        SELECT 'Total', COUNT(id_actor) from actors;
	END$$
delimiter ;
CALL actors();


DROP PROCEDURE IF EXISTS musicians;
delimiter $$
CREATE PROCEDURE musicians()
	BEGIN 
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_musicians) INTO c FROM musicians;
		SELECT staff.full_name, musicians.musical_instrument FROM staff, musicians
        WHERE staff.id_staff = musicians.id_musicians
		UNION
        SELECT CONCAT('Total: ', CONVERT(c, CHAR)), ''; 
	END$$
delimiter ;
CALL musicians();


DROP PROCEDURE IF EXISTS experience;
delimiter $$
CREATE PROCEDURE experience()
	BEGIN
		SELECT full_name, experience FROM staff; 
	END$$
 delimiter ;   
CALL experience();


DROP PROCEDURE IF EXISTS sex;
delimiter $$
CREATE PROCEDURE sex(IN s TEXT) 
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_staff) INTO c FROM staff 
		WHERE staff.sex = s;
        SELECT full_name, sex FROM staff
		WHERE staff.sex = s
		UNION
        SELECT 'Total', c;
	END$$
delimiter ;
CALL sex('f');


DROP PROCEDURE IF EXISTS year_of_birth;
delimiter $$
CREATE PROCEDURE year_of_birth(IN n INT) 
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_staff) INTO c FROM  staff
        WHERE staff.year_of_birth = n;
		SELECT full_name, year_of_birth FROM staff
        WHERE staff.year_of_birth = n
		UNION
        SELECT 'Total', c;
	END$$
delimiter ;  
CALL year_of_birth(2000);


DROP PROCEDURE IF EXISTS age;
delimiter $$
CREATE PROCEDURE age(IN n INT) 
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_staff) INTO c FROM  staff
        WHERE staff.age = n;
		SELECT full_name, age FROM staff
        WHERE staff.age = n
		UNION
        SELECT 'Total', c;
	END$$
delimiter ;  
CALL age(24);


DROP PROCEDURE IF EXISTS children;
delimiter $$
CREATE PROCEDURE children(IN s TEXT) 
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_staff) INTO c FROM staff 
		WHERE staff.children = s;
        SELECT full_name, children FROM staff
		WHERE staff.children = s
		UNION
        SELECT 'Total', c;
	END$$
delimiter ;
CALL children('no');


DROP PROCEDURE IF EXISTS salary;
delimiter $$
CREATE PROCEDURE salary(IN n INT) 
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_staff) INTO c FROM staff
        WHERE staff.salary = n; 
		SELECT full_name, salary from staff
        WHERE staff.salary = n
		UNION
        SELECT 'Total', c;
	END$$
delimiter ;
CALL salary(1000);
