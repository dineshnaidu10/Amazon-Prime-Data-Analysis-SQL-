CREATE DATABASE Amazon_Prime;
USE Amazon_Prime;
CREATE TABLE actors(
	actor_id INT(11) PRIMARY KEY,
	name CHAR(50)
);

CREATE TABLE titles(
	titles_id VARCHAR(25) PRIMARY KEY,
	title CHAR(200)
);

CREATE TABLE acting_credits(
	acredits_id INT(25) AUTO_INCREMENT PRIMARY KEY,
    actor_id INT(11),
    titles_id VARCHAR(25),
    character_name LONGTEXT,
    role_name CHAR(50),
	FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (titles_id) REFERENCES titles(titles_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE titles_info(
	titles_info_id INT(25) AUTO_INCREMENT PRIMARY KEY,
    titles_id VARCHAR(25),
    type_name CHAR(5),
    descr LONGTEXT,
    release_year INT(4),
    age_certification VARCHAR(10),
    runtime INT(3),
    genres VARCHAR(100),
    production_countries CHAR(50),
    seasons INT(2),
    FOREIGN KEY (titles_id) REFERENCES titles(titles_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE imdb_rating(
	imdb_rating_id INT(25) AUTO_INCREMENT PRIMARY KEY,
    imdb_id VARCHAR(15),
    titles_id VARCHAR(25),
    imdb_score DECIMAL(2,1),
    imdb_votes INT(7),
    FOREIGN KEY (titles_id) REFERENCES titles(titles_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE tmdb_rating(
	tmdb_id INT(25) AUTO_INCREMENT PRIMARY KEY,
    titles_id VARCHAR(25),
    tmdb_popularity DOUBLE,
    tmdb_score DOUBLE,
    FOREIGN KEY (titles_id) REFERENCES titles(titles_id) ON DELETE CASCADE ON UPDATE CASCADE
);

