USE theater; 


-- the same 
DROP PROCEDURE IF EXISTS played;
delimiter $$
CREATE PROCEDURE played()
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_performance) INTO c FROM performances
        WHERE to_days(now())-to_days(date_) >=0;
		SELECT stagings.name_ AS 'name' , performances.date_ AS 'date' FROM stagings, performances
		WHERE stagings.id_staging = performances.id_staging AND to_days(now())- to_days(performances.date_) >=0
		UNION
        SELECT 'Total:', c;
	END$$
delimiter ;
CALL played();


DROP PROCEDURE IF EXISTS played_genre;
delimiter $$
CREATE PROCEDURE played_genre(IN t TEXT) 
	BEGIN
		SELECT stagings.name_ AS 'name', performances.date_ AS 'date' FROM stagings, performances
        WHERE stagings.id_staging = performances.id_staging AND stagings.genre = t AND to_days(now())-to_days(performances.date_) >=0;
	END$$
delimiter ;
CALL played_genre('Tragedy');


DROP PROCEDURE IF EXISTS played_period_genre;
delimiter $$
CREATE PROCEDURE played_period_genre(IN b DATE, IN e DATE, IN t TEXT) 
	BEGIN
		SELECT stagings.name_ AS 'name', performances.date_ AS 'date' FROM stagings, performances
		WHERE (performances.date_ BETWEEN b and e) AND stagings.id_staging = performances.id_staging AND stagings.genre = t;
	END$$
delimiter ;
CALL played_period_genre('2020-01-01', '2021-05-01', 'Comedy');