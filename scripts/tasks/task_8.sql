USE theater; 


DROP PROCEDURE IF EXISTS tour_coming;
delimiter $$
CREATE PROCEDURE tour_coming(IN b DATE, IN e DATE) 
	BEGIN
		SELECT staff.full_name, "Actor" FROM staff, actors , tours
		WHERE tours.id_staff = staff.id_staff AND staff.id_staff = actors.id_staff AND (start_ BETWEEN b AND e)
        AND (end_ BETWEEN b AND e)
        UNION
		SELECT staff.full_name, "Stagedirectors" FROM staff, stagedirectors, tours
		WHERE tours.id_staff = staff.id_staff AND staff.id_staff = stagedirectors.id_staff AND (start_ BETWEEN b AND e)
        AND (end_ BETWEEN b AND e);
	END$$
delimiter ;
CALL tour_coming('2021-01-01', '2021-05-30');


DROP PROCEDURE IF EXISTS tour_outcoming;
delimiter $$
CREATE PROCEDURE tour_outcoming(IN b DATE, IN e DATE, IN t TEXT) 
	BEGIN
		DECLARE l INT DEFAULT 0;
		SELECT id_staging INTO l FROM stagings
		WHERE stagings.name_ = t;
        SELECT DISTINCT(staff.full_name), start_, end_ FROM staff, actors, tours, stagings
		WHERE tours.id_staff = staff.id_staff AND staff.id_staff = actors.id_staff AND tours.id_staging = l
        AND (start_ BETWEEN b AND e) AND (end_ BETWEEN b AND e);
	END$$
delimiter ;   
CALL tour_outcoming('2021-01-01', '2021-12-30', 'Doctor Faustus'); 