-- CREATE DATABASE theater;
-- USE theater;
DROP TABLE theater.staff;


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