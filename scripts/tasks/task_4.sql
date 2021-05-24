USE theater; 


DROP PROCEDURE IF EXISTS author;
delimiter $$
CREATE PROCEDURE author()
	BEGIN
		SELECT full_name FROM authors; 
	END$$
delimiter ;
CALL author();


DROP PROCEDURE IF EXISTS author_century;
delimiter $$
CREATE PROCEDURE author_century(IN n TEXT) 
	BEGIN
		SELECT full_name FROM authors
        WHERE century = n; 
	END$$
delimiter ;    
CALL author_century('20 century');


DROP PROCEDURE IF EXISTS author_country;
delimiter $$
CREATE PROCEDURE author_country(IN n TEXT) 
	BEGIN
		SELECT full_name FROM authors
        WHERE country = n; 
	END$$
delimiter ;    
CALL author_country('America');


DROP PROCEDURE IF EXISTS author_genre;
delimiter $$
CREATE PROCEDURE author_genre(IN t TEXT) 
	BEGIN
		SELECT DISTINCT authors.full_name FROM authors, stagings
		WHERE stagings.id_author = authors.id_author AND stagings.genre = t; 
	END$$
delimiter ; 
CALL author_genre('Tragedy');


DROP PROCEDURE IF EXISTS author_genre_played;
delimiter $$
CREATE PROCEDURE author_genre_played(IN t TEXT) 
	BEGIN
		SELECT DISTINCT authors.full_name FROM authors, stagings, performances
		WHERE stagings.id_author = authors.id_author AND stagings.genre = t AND stagings.id_staging = performances.id_staging 
				AND to_days(now())- to_days(performances.date_) >=0;
	END$$
delimiter ; 
CALL author_genre_played('Tragedy');


DROP PROCEDURE IF EXISTS author_period;
delimiter $$
CREATE PROCEDURE author_period(IN b DATE, IN e DATE)
	BEGIN
		SELECT DISTINCT authors.full_name FROM authors, stagings, performances
		WHERE stagings.id_author = authors.id_author AND stagings.id_staging = performances.id_staging 
			AND (performances.date_ BETWEEN b AND e);
	END$$
CALL author_period('2021-01-01','2021-04-29'); 