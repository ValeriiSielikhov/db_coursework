USE theater; 


DROP PROCEDURE IF EXISTS performance_list;
delimiter $$
CREATE PROCEDURE performance_list(IN t TEXT) 
	BEGIN
		DECLARE n , p INT DEFAULT 0;
		SELECT id_staging INTO n FROM stagings
		WHERE stagings.name_ = t;
        SELECT id_performance INTO p FROM performances 
		WHERE id_staging = n limit 1;
        SELECT "premiere", premiere FROM stagings
		WHERE stagings.name_ = t
        UNION
		SELECT "director", staff.full_name FROM stagedirectors, staff, stagings
		WHERE stagedirectors.id_staff = staff.id_staff AND  stagings.id_director = stagedirectors.id_director
		AND stagings.id_staging = n
        UNION
        SELECT "artist", staff.full_name FROM stagedirectors, staff, stagings
		WHERE stagedirectors.id_staff = staff.id_staff AND  stagings.id_artist = stagedirectors.id_director
		AND stagings.id_staging = n
        UNION
		SELECT "conductor", staff.full_name FROM stagedirectors, staff, stagings
		WHERE stagedirectors.id_staff = staff.id_staff AND  stagings.id_conductor = stagedirectors.id_director
		AND stagings.id_staging = n
        UNION
		SELECT rolee.name_, staff.full_name FROM rolee, played_plays, actors, staff
		WHERE played_plays.id_performance = p AND played_plays.understudy = 'yes' AND played_plays.id_role = rolee.id_role 
		AND played_plays.id_actor = actors.id_actor AND actors.id_staff = staff.id_staff;
	END$$
delimiter ;
CALL performance_list('Oedipus the King'); 