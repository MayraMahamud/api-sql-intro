CREATE TABLE films (
    filmID serial Primary KEY,
    title VARCHAR,
    genre VARCHAR,
    release_year int,
    score int
    );

insert into films (title, genre, release_year, score) VALUES 
('The Shawshank Redemption', 'Drama', 1994, 9),
('The Godfather', 'Crime', 1972, 9),
('The Dark Knight', 'Action', 2008, 9),
('Alien', 'SciFi', 1979, 9),
('Total Recall', 'SciFi', 1990, 8),
('The Matrix', 'SciFi', 1999, 8),
('The Matrix Resurrections', 'SciFi', 2021, 5),
('The Matrix Reloaded', 'SciFi', 2003, 6),
('The Hunt for Red October', 'Thriller', 1990, 7),
('Misery', 'Thriller', 1990, 7),
('The Power Of The Dog', 'Western', 2021, 6),
('Hell or High Water', 'Western', 2016, 8),
('The Good the Bad and the Ugly', 'Western', 1966, 9),
('Unforgiven', 'Western', 1992, 7);

--All films
SELECT * from films 

--All films ordered by rating descending
select * from films order by score ASC;

--All films ordered by release year ascending
select * from films order by release_year ASC;

--All films with a rating of 8 or higher
select * from films where score >= 8;

--All films with a rating of 7 or lower
SELECT * from films where score <= 7;

--films released in 1990
SELECT * from films where release_year = 1990;

--films released before 2000
select * from films where release_year < 2000;

--films released after 1990
select * from films where release_year > 1990;

--films released between 1990 and 1999
SELECT * from films where release_year BETWEEN 1990 and 1999;

--films with the genre of "SciFi"
 SELECT * from films where genre = ('SciFi');

--films with the genre of "Western" or "SciFi"
SELECT * from films where genre = 'Western' or genre = 'SciFi';

--films with any genre apart from "SciFi"
SELECT * from films where genre != ('SciFi');

--films with the genre of "Western" released before 2000
select * from films where genre = ('Western') and release_year < 2000;

-- films that have the world "Matrix" in their title
SELECT * from films where title LIKE '%Matrix%';

--EXTENSION 1
--Return the average film rating
SELECT AVG (score) from films;

--Return the total number of films
SELECT count (title) from films;

--Return the average film rating by genre
SELECT avg (score)  from films GROUP by genre;


--EXTENSTION 2
--Create a new directors table. Each director should have a name and a unique director id. Recreate your films table and add a directorId column. Insert a few director records (the data does not need to be real, you can just make directors up). Re-insert your film data, updating each film ao it will have a directorId. Using an SQL JOIN, write a SELECT statement that returns a list of films with their director.

CREATE TABLE director (
    directorID serial Primary KEY,
    name VARCHAR
 );


CREATE TABLE films2 (
    filmID serial Primary KEY,
    title VARCHAR,
    genre VARCHAR,
    release_year int,
    score int,
    directorID int,
    FOREIGN KEY (directorID) REFERENCES director (directorID)
    );


insert into director (name) VALUES 
('Spike Lee'),
('Tarantino'),
('Steven Spielberg'),
('Akira Kurosawa'),
('Martin Scorsese');

insert into films2 (title, genre, release_year, score, directorID) VALUES 
('The Shawshank Redemption', 'Drama', 1994, 9, 1),
('The Godfather', 'Crime', 1972, 9, 2),
('The Dark Knight', 'Action', 2008, 9, 3),
('Alien', 'SciFi', 1979, 9, 4),
('Total Recall', 'SciFi', 1990, 8, 5),
('The Matrix', 'SciFi', 1999, 8, 1),
('The Matrix Resurrections', 'SciFi', 2021, 5, 2),
('The Matrix Reloaded', 'SciFi', 2003, 6, 3),
('The Hunt for Red October', 'Thriller', 1990, 7, 4),
('Misery', 'Thriller', 1990, 7, 5),
('The Power Of The Dog', 'Western', 2021, 6, 1),
('Hell or High Water', 'Western', 2016, 8, 2),
('The Good the Bad and the Ugly', 'Western', 1966, 9, 3),
('Unforgiven', 'Western', 1992, 7, 4);


UPDATE films2 set directorID = (4) where release_year = 1990;


--Using an SQL JOIN, write a SELECT statement that returns a list of films with their director.

select title, name from films2 join director on films2.directorid = director.directorid;

--EXTENSION 3
--Write a SQL SELECT statement that returns a lists of directors along with the number of films they have directed.
SELECT director.name, count (films2.filmid) as numberOfFilms from films2 join director on films2.directorid = director.directorid group by director.directorid, director.name;
