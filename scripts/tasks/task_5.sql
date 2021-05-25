USE theater; 


DROP PROCEDURE IF EXISTS performance_genre;
delimiter $$
CREATE PROCEDURE performance_genre(IN t TEXT) 
	BEGIN
		SELECT name_ AS 'name' FROM stagings
		WHERE stagings.genre = t; 
	END$$
delimiter ;
CALL performance_genre('Drama');


DROP PROCEDURE IF EXISTS performance_author;
delimiter $$
CREATE PROCEDURE performance_author(IN a TEXT) 
	BEGIN
		SELECT stagings.name_ AS 'name' FROM  stagings, authors 
		WHERE stagings.id_author = authors.id_author AND authors.full_name = a;
	END$$
delimiter ;    
CALL performance_author('Noel Coward');


DROP PROCEDURE IF EXISTS performance_country;
 delimiter $$
CREATE PROCEDURE performance_country(IN t TEXT) 
	BEGIN
		SELECT stagings.name_ AS 'name' FROM  stagings, authors 
		WHERE stagings.id_author = authors.id_author AND authors.country = t; 
	END$$
delimiter ; 
CALL performance_country('England');


DROP PROCEDURE IF EXISTS performance_century;
delimiter $$
CREATE PROCEDURE performance_century(IN t TEXT) 
	BEGIN
		SELECT stagings.name_ AS 'name' FROM  stagings, authors 
		WHERE stagings.id_author = authors.id_author AND authors.century = t; 
	END$$
delimiter ; 
CALL performance_century('20 century');


DROP PROCEDURE IF EXISTS first_performance;
delimiter $$
CREATE PROCEDURE first_performance(IN b DATE, IN e DATE) 
	BEGIN
		SELECT name_ AS 'name', premiere FROM stagings
		WHERE stagings.premiere BETWEEn b AND e;
	END$$
delimiter ;
CALL first_performance('2021-03-01','2021-05-31'); 