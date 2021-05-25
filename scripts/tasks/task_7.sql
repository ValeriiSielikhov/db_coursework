USE theater; 


DROP PROCEDURE IF EXISTS rankk;
delimiter $$
CREATE PROCEDURE rankk()
	BEGIN
		DECLARE  c INT DEFAULT 0;
        SELECT COUNT(id_actor) INTO c FROM contest;
		SELECT staff.full_name, contest.name_, contest.place FROM staff, actors, contest
		WHERE contest.id_actor = actors.id_actor AND actors.id_staff = staff.id_staff;
	END$$
delimiter ;
CALL rankk();


DROP PROCEDURE IF EXISTS rank_period;
delimiter $$
CREATE PROCEDURE rank_period(IN b DATE, IN e DATE) 
	BEGIN
		SELECT staff.full_name, contest.name_, contest.place FROM staff, actors, contest
        WHERE contest.id_actor = actors.id_actor AND actors.id_staff = staff.id_staff AND (contest.date_ BETWEEn b AND e);
	END$$
delimiter ;
CALL rank_period('2020-01-01', '2021-01-01');


DROP PROCEDURE IF EXISTS rank_getted;
delimiter $$
CREATE PROCEDURE rank_getted(IN t TEXT) 
	BEGIN
		SELECT staff.full_name, contest.name_, contest.place FROM staff, actors, contest
		WHERE contest.id_actor = actors.id_actor AND actors.id_staff = staff.id_staff AND contest.name_ = t;
	END$$
delimiter ;
CALL rank_getted('Theatrical Talents');


DROP PROCEDURE IF EXISTS sex_rank;
delimiter $$
CREATE PROCEDURE sex_rank(IN t TEXT) 
	BEGIN
		SELECT staff.full_name, contest.name_, contest.place FROM staff, actors, contest
		WHERE contest.id_actor = actors.id_actor AND actors.id_staff = staff.id_staff AND staff.sex = t; 
	END$$
delimiter ;   
CALL sex_rank('m');


DROP PROCEDURE IF EXISTS rank_age;
delimiter $$
CREATE PROCEDURE rank_age(IN n INT)
	BEGIN
		SELECT staff.full_name, contest.name_, contest.place FROM staff, actors, contest
        WHERE contest.id_actor = actors.id_actor AND actors.id_staff = staff.id_staff AND staff.age = n; 
	END$$
delimiter ; 
CALL rank_age(35);