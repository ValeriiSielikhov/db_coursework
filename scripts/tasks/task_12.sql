USE theater; 


DROP PROCEDURE IF EXISTS money_for_performance;
delimiter $$
CREATE PROCEDURE money_for_performance(IN t TEXT) 
	BEGIN
		SELECT stagings.name_ AS 'name', COUNT(tickets.id_performance) AS 'number of tickets sold',
        SUM(tickets.price) AS 'sum', performances.date_ FROM tickets, performances, stagings
        WHERE stagings.name_  = t AND performances.id_staging = stagings.id_staging AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance
        UNION
		SELECT 'Total:', COUNT(tickets.id_performance) AS 'number of tickets sold', SUM(tickets.price) , '' FROM tickets, performances, stagings
		where stagings.name_  = t AND performances.id_staging = stagings.id_staging AND performances.id_performance = tickets.id_performance;
	END$$
delimiter ;
CALL money_for_performance('Oedipus the King');


DROP PROCEDURE IF EXISTS money_for_period;
delimiter $$
CREATE PROCEDURE money_for_period(IN b DATE, IN e DATE) 
	BEGIN
		SELECT stagings.name_ AS 'name', SUM(tickets.price) AS 'sum', performances.date_ FROM  tickets, performances, stagings
		WHERE (tickets.date_ BETWEEN b AND e) AND performances.id_staging = stagings.id_staging AND performances.id_performance = tickets.id_performance
		GROUP BY tickets.id_performance
        UNION
		SELECT 'Total:', SUM(tickets.price) AS 'sum', ' ' FROM  tickets
		WHERE (tickets.date_ BETWEEN b AND e);
	END$$
delimiter ;
CALL money_for_period('2021-03-01', '2021-05-31');