USE theater; 


DROP PROCEDURE IF EXISTS rolee;
delimiter $$
CREATE PROCEDURE rolee(IN t TEXT)
	BEGIN
		DECLARE r, a, h INT DEFAULT 0; 
		DECLARE s, tembr TEXT DEFAULT '';
		SELECT id_role INTO r FROM rolee
        WHERE rolee.name_ = t; 
		SELECT sex INTO s FROM rolee
        WHERE rolee.name_ = t; 
		SELECT age INTO a FROM rolee
        WHERE rolee.name_ = t; 
		SELECT height INTO h FROM rolee
        WHERE rolee.name_ = t;
		SELECT voice INTO tembr FROM rolee
        WHERE rolee.name_ = t;
		SELECT t as 'name' , a, s, tembr, h
        UNION
		SELECT staff.full_name, staff.age, staff.sex, actors.voice, actors.height  FROM staff, actors 
		WHERE staff.id_staff = actors.id_staff AND staff.sex = s AND staff.age = a
				AND actors.voice = tembr AND (actors.height BETWEEN h-5 AND h+5);
		END$$
delimiter ;      
CALL rolee('Pablo'); 