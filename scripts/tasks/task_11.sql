USE theater; 


DROP PROCEDURE IF EXISTS tickets;
delimiter $$
CREATE PROCEDURE tickets()
	BEGIN
		SELECT stagings.name_ AS 'name', COUNT(tickets.id_performance) AS 'number of tickets sold',
        performances.date_ AS 'date' FROM tickets, performances, stagings
		WHERE performances.id_performance = tickets.id_performance AND performances.id_staging = stagings.id_staging
		GROUP BY tickets.id_performance; 
	END$$
delimiter ;   
CALL tickets();


DROP PROCEDURE IF EXISTS tickets_performance;
delimiter $$
CREATE PROCEDURE tickets_performance(IN t TEXT) 
	BEGIN
		SELECT t AS 'name', COUNT(tickets.id_performance) AS 'number of tickets sold',
        performances.date_ AS 'date' FROM tickets, performances, stagings
        WHERE stagings.name_ = t AND performances.id_staging = stagings.id_staging AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance; 
	END$$
delimiter ; 
CALL tickets_performance('Oedipus the King');


DROP PROCEDURE IF EXISTS tickets_premiere
delimiter $$
CREATE PROCEDURE tickets_premiere() 
	BEGIN
		SELECT stagings.name_ AS 'name', COUNT(tickets.id_performance) AS 'number of tickets sold',
		performances.premiere AS 'premiere' FROM tickets, performances, stagings 
		WHERE tickets.date_ = performances.premiere AND performances.id_staging = stagings.id_staging 
		AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance; 
	END$$
delimiter ;
CALL tickets_premiere();


DROP PROCEDURE IF EXISTS tickets_period;
delimiter $$
CREATE PROCEDURE tickets_period(IN b DATE, IN e DATE) 
	BEGIN
		SELECT stagings.name_ AS 'name', COUNT(tickets.id_performance) AS 'number of tickets sold',
		performances.premiere AS 'premiere' FROM tickets, performances, stagings 
		WHERE (tickets.date_ between b and e) AND performances.id_staging = stagings.id_staging 
		AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance; 
	END$$
delimiter ;
CALL tickets_period('2021-03-01', '2021-05-30');