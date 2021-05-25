-- CREATE DATABASE theater;
-- USE theater;
-- DROP TABLE theater.staff;
-- DROP TABLE theater.actors;
-- DROP TABLE theater.contest;
-- DROP TABLE theater.students;
-- DROP TABLE theater.stageDirectors;
-- DROP TABLE theater.otherstaff;
-- DROP TABLE theater.musicians;
-- DROP TABLE theater.tours;
-- DROP TABLE theater.authors;
-- DROP TABLE theater.stagings;
-- DROP TABLE theater.performances;
-- DROP TABLE theater.tickets;
-- DROP TABLE theater.rolee;
-- DROP TABLE theater.played_plays;



CREATE TABLE theater.staff(
	id_staff INT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    sex VARCHAR(1) NOT NULL,
    age INT NOT NULL,
    year_of_birth INT NOT NULL,
    children VARCHAR(3) DEFAULT 'no',
    experience VARCHAR(15) NOT NULL,
    salary INT NOT NULL,
    
    CONSTRAINT sex_check CHECK ((sex = 'm') or (sex ='f')),
    CONSTRAINT age_check CHECK ((age >=15) and (age <=100)),
    CONSTRAINT year_check CHECK ((year_of_birth >=1920) and (year_of_birth <=2005)),
    CONSTRAINT salary_check CHECK (salary > 0)
);


CREATE TABLE theater.actors(
	id_actor INT PRIMARY KEY,
    height INT NOT NULL,
    voice VARCHAR(20) NOT NULL,
	id_staff INT,
    
    CONSTRAINT height_check CHECK ((height >=50) and (height <=250)),
    CONSTRAINT actors_staff FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);


CREATE TABLE theater.contest(
	name_ VARCHAR(50) NOT NULL,
    date_ DATE NOT NULL,
	place INT, CHECK(place > 0) ,
    id_actor INT,
    
    CONSTRAINT contest_actors FOREIGN KEY (id_actor) REFERENCES actors(id_actor)
);


CREATE TABLE theater.students(
	universuty VARCHAR(50) NOT NULL,
    id_actor INT,
    
    CONSTRAINT students_actors FOREIGN KEY (id_actor) REFERENCES actors(id_actor)
);


CREATE TABLE theater.stageDirectors(
	id_director INT PRIMARY KEY,
	specialization VARCHAR(50) NOT NULL,
    id_staff INT,
    
    CONSTRAINT director_staff FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);


CREATE TABLE theater.otherstaff(
	id_otherstaff INT PRIMARY KEY,
	specialization VARCHAR(50) NOT NULL,
    id_staff INT,
    
    CONSTRAINT otherstaff_staff FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);


CREATE TABLE theater.musicians(
	id_musicians INT PRIMARY KEY,
	musical_instrument VARCHAR(50) NOT NULL,
    id_staff INT,
    
    CONSTRAINT musician_staff FOREIGN KEY (id_staff) REFERENCES staff(id_staff)
);


CREATE TABLE theater.tours(
	start_ DATE NOT NULL,
    end_ DATE NOT NULL,
    id_staff INT,
    id_staging INT,
    
	CONSTRAINT tour_staff FOREIGN KEY (id_staff) REFERENCES staff(id_staff),
    CONSTRAINT tour_staging FOREIGN KEY (id_staging) REFERENCES stagings(id_staging)
);


CREATE TABLE theater.authors(
	id_author INT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    century VARCHAR(10) DEFAULT 'unknow'
);


CREATE TABLE theater.stagings(
	id_staging INT PRIMARY KEY,
    name_ VARCHAR(50) NOT NULL,
    genre VARCHAR(20) NOT NULL,
    age VARCHAR(5) NOT NULL,
    year_ INT NOT NULL,
    premiere DATE NOT NULL,
    id_author INT,
    id_director INT, 
    id_artist INT, 
    id_conductor INT, 
    
	CONSTRAINT stagings_author FOREIGN KEY (id_author) REFERENCES authors(id_author),
    CONSTRAINT stagings_director FOREIGN KEY (id_director) REFERENCES stageDirectors(id_director),
    CONSTRAINT stagings_artist FOREIGN KEY (id_artist) REFERENCES stageDirectors(id_director),
    CONSTRAINT stagings_conductor FOREIGN KEY (id_conductor) REFERENCES stageDirectors(id_director)
);


CREATE TABLE theater.performances(
	id_performance INT PRIMARY KEY,
    date_ DATE NOT NULL,
    time_ VARCHAR(10) NOT NULL,
    premiere DATE NOT NULL,
    season VARCHAR(10) NOT NULL,
    id_staging INT ,
    
	CONSTRAINT performances_stagings FOREIGN KEY (id_staging) REFERENCES stagings(id_staging)
);


CREATE TABLE theater.tickets(
	id_ticket INT PRIMARY KEY,
    row_ INT NOT NULL, CHECK(row_ > 0),
    place INT NOT NULL, CHECK(place > 0),
    price INT NOT NULL, CHECK(price > 0),
    date_ DATE NOT NULL,
    id_performance INT,
    
    CONSTRAINT ticket_performances FOREIGN KEY (id_performance) REFERENCES performances(id_performance)
);


CREATE TABLE theater.rolee(
	id_role INT PRIMARY KEY,
    name_ VARCHAR(50) NOT NULL,
    main_role VARCHAR(50) NOT NULL,
	height INT NOT NULL,
    voice VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
    age INT NOT NULL,
    id_staging INT,
    
    CONSTRAINT role_stagings FOREIGN KEY (id_staging) REFERENCES stagings(id_staging)
);


CREATE TABLE theater.played_plays(
	understudy VARCHAR(40) NOT NULL,
    id_performance INT,
    id_role INT, 
    id_actor INT, 
    
	CONSTRAINT played_performance FOREIGN KEY (id_performance) REFERENCES performances(id_performance),
    CONSTRAINT played_role FOREIGN KEY (id_role) REFERENCES rolee(id_role),
    CONSTRAINT played_actor FOREIGN KEY (id_actor) REFERENCES actors(id_actor)
);