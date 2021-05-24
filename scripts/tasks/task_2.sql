USE theater; 


DROP PROCEDURE IF EXISTS performance;
delimiter $$
CREATE PROCEDURE performance()
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_staging) INTO c FROM stagings;
		SELECT name_ FROM stagings
		UNION
        SELECT CONCAT('Total:', CONVERT(c, CHAR));
	END$$
delimiter ;
CALL performance();


DROP PROCEDURE IF EXISTS season;
delimiter $$
CREATE PROCEDURE season(IN t TEXT)
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_performance) INTO c FROM performances
		WHERE performances.season = t;
		SELECT stagings.name_ , performances.date_ FROM stagings, performances
		WHERE performances.season = t AND stagings.id_staging = performances.id_staging
		UNION
        SELECT 'Total:', c; 
	END$$
delimiter ;
CALL season('spring');


DROP PROCEDURE IF EXISTS played;
delimiter $$
CREATE PROCEDURE played()
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_performance) INTO c FROM performances
        WHERE to_days(now())-to_days(performances.date_) >=0;
		SELECT stagings.name_ , performances.date_ FROM stagings, performances
		WHERE stagings.id_staging = performances.id_staging AND to_days(now())- to_days(performances.date_) >=0
		UNION
        SELECT 'Total:', c;
	END$$
delimiter ;
CALL played();


DROP PROCEDURE IF EXISTS genre;
delimiter $$
CREATE PROCEDURE genre(IN t TEXT) 
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(stagings.id_staging) INTO c FROM stagings, performances
		WHERE stagings.id_staging = performances.id_staging AND stagings.genre = t;
		SELECT name_ AS 'name' FROM stagings, performances
		WHERE stagings.id_staging = performances.id_staging AND stagings.genre = t
		UNION
        SELECT CONCAT('Total:', CONVERT(c, CHAR)); 
	END$$
delimiter ;  
CALL genre('Tragedy');


DROP PROCEDURE IF EXISTS played_period;
delimiter $$
CREATE PROCEDURE played_period(IN b DATE, in e DATE) 
	BEGIN
		DECLARE c INT DEFAULT 0;
		SELECT COUNT(id_performance) into c FROM performances
        WHERE date_ BETWEEN b and e; 
		SELECT stagings.name_ AS 'name', performances.date_ AS 'date' FROM stagings, performances
		WHERE (performances.date_ BETWEEN b AND e) AND stagings.id_staging = performances.id_staging
		UNION
        SELECT 'Total:', c;
	END$$
delimiter ;
CALL played_period('2021.01.01', '2021.06.01'); 