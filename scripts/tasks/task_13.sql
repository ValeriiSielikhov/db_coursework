USE theater; 


DROP PROCEDURE IF EXISTS place;
delimiter $$
CREATE PROCEDURE place()
	BEGIN
		SELECT stagings.name_ AS 'name', (20 - COUNT(tickets.id_performance)) AS 'free place', performances.date_ AS 'date'
		FROM tickets, performances, stagings
		WHERE performances.id_staging = stagings.id_staging AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance
        UNION
		SELECT 'Total:' , (COUNT(DISTINCT date_)*20-COUNT(id_ticket)),'' FROM tickets; 
	END$$
delimiter ;
CALL place();


DROP PROCEDURE IF EXISTS place_performance;
delimiter $$
CREATE PROCEDURE place_performance(IN t TEXT) 
	BEGIN
		SELECT t as 'name', (20 - COUNT(tickets.id_performance)) AS 'free place',
		performances.date_ AS 'date' FROM tickets, performances, stagings
		WHERE stagings.name_ = t AND performances.id_staging = stagings.id_staging AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance;
	END$$
delimiter ;
CALL place_performance('A Streetcar Named Desire');


DROP PROCEDURE IF EXISTS place_premiere;
delimiter $$
CREATE PROCEDURE place_premiere() 
	BEGIN
		SELECT stagings.name_ as 'name', (20 - COUNT(tickets.id_performance)) AS 'free place',
		performances.date_ AS 'premiere' FROM tickets, performances, stagings
		WHERE tickets.date_ = performances.premiere AND performances.id_staging = stagings.id_staging AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance;
	END$$
delimiter ;
CALL place_premiere();