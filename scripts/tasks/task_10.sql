USE theater; 


DROP PROCEDURE IF EXISTS role_actor;
delimiter $$
CREATE PROCEDURE role_actor(IN t TEXT) 
	BEGIN
		DECLARE r, k INT DEFAULT 0;
		SELECT id_staff INTO r FROM staff
        WHERE full_name = t;
		SELECT id_actor INTO k FROM actors
        WHERE actors.id_staff = r; 
		SELECT rolee.name_ AS 'role' FROM played_plays, rolee
		WHERE played_plays.id_actor = k AND played_plays.id_role = rolee.id_role; 
	END$$
delimiter ;    
CALL role_actor('Joy Barr');


DROP PROCEDURE IF EXISTS role_period;
delimiter $$
CREATE PROCEDURE role_period(IN t TEXT, IN b DATE, IN e DATE) 
	BEGIN
		DECLARE r, k INT DEFAULT 0;
		SELECT id_staff INTO r FROM staff
        WHERE full_name = t;
		SELECT id_actor INTO k FROM actors
        WHERE actors.id_staff = r;
		SELECT rolee.name_ AS 'role' FROM played_plays, rolee, performances
        WHERE played_plays.id_actor = k AND played_plays.id_role = rolee.id_role 
			AND played_plays.id_performance = performances.id_performance AND (performances.date_ BETWEEN b AND e);
	END$$
delimiter ; 
CALL role_period('Joy Barr', '2021-05-01', '2021-06-01');


DROP PROCEDURE IF EXISTS role_genre;
delimiter $$
CREATE PROCEDURE role_genre(IN t TEXT, IN g TEXT) 
	BEGIN
		DECLARE r, k INT DEFAULT 0;
		SELECT id_staff INTO r FROM staff
        WHERE full_name = t;
		SELECT id_actor INTO k FROM actors
        WHERE actors.id_staff = r;
		SELECT rolee.name_ AS 'role' FROM played_plays, rolee, performances, stagings
		WHERE played_plays.id_actor = k AND played_plays.id_role = rolee.id_role AND played_plays.id_performance = performances.id_performance
        AND performances.id_staging = stagings.id_staging AND stagings.genre = g;
	END$$
delimiter ;
CALL role_genre('Joy Barr', 'Comedy');


DROP PROCEDURE IF EXISTS actor_regiser;
delimiter $$
CREATE PROCEDURE actor_regiser(IN t TEXT, IN g TEXT) 
	BEGIN
		DECLARE k INT DEFAULT 0;
		SELECT id_actor INTO k FROM actors, staff
		WHERE staff.full_name = t AND actors.id_staff = staff.id_staff;
		SELECT DISTINCT (rolee.name_) AS 'role' FROM played_plays, rolee , performances, stagings, stagedirectors, staff
		WHERE staff.full_name = g AND stagedirectors.id_staff = staff.id_staff
			AND stagings.id_director = stagedirectors.id_director AND played_plays.id_actor = k
			AND played_plays.id_performance = performances.id_performance AND performances.id_staging = stagings.id_staging
			AND played_plays.id_role = rolee.id_role;
	END$$
delimiter ;
CALL actor_regiser('Joy Barr','Matt Montes');