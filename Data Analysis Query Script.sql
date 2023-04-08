#1. The list of movies title released between year 2010 to 2020?
SELECT title, titles_info.release_year as release_year 
FROM titles JOIN titles_info
ON (titles.titles_id = titles_info.titles_id)
WHERE release_year BETWEEN 2010 AND 2020
ORDER BY release_year;

#2. Which movies has the highest imdb score
SELECT title, imdb_rating.imdb_score as Max_imdb_score
FROM titles JOIN imdb_rating 
ON (titles.titles_id = imdb_rating.titles_id)
WHERE imdb_rating.imdb_score =
(
SELECT MAX(imdb_score)
FROM imdb_rating
);

#3. Which movie has the highest tmdb score
SELECT title, tmdb_rating.tmdb_score as Max_tmdb_score
FROM titles JOIN tmdb_rating 
ON (titles.titles_id = tmdb_rating.titles_id)
WHERE tmdb_rating.tmdb_score = 
(
SELECT MAX(tmdb_score)
FROM tmdb_rating
);

#4. Which movie has the highest imdb and tmdb score
SELECT title, MAX(imdb_rating.imdb_score), MAX(tmdb_rating.tmdb_score)
FROM titles JOIN imdb_rating JOIN tmdb_rating
ON (titles.titles_id = imdb_rating.titles_id) AND (titles.titles_id = tmdb_rating.titles_id);

# 5) List of actors that played in the movie named 'The Terrible Adventure'?
SELECT name AS Actors_Name, title AS Movies_Title
FROM acting_credits JOIN actors JOIN titles
ON (acting_credits.actor_id = actors.actor_id) AND (acting_credits.titles_id = titles.titles_id)
WHERE titles.title = 'The Terrible Adventure' AND acting_credits.role_name = 'ACTOR';

# 6) List of directors
Select name AS Directors_Name, acting_credits.role_name AS Roles
FROM actors JOIN acting_credits
ON (actors.actor_id = acting_credits.actor_id)
WHERE acting_credits.role_name = 'DIRECTOR';

# 7) How many movies and shows are in the database?
SELECT COUNT(titles_id) AS Number_of_Type, type_name AS Type_Name
FROM titles_info
GROUP BY Type_Name
ORDER BY Number_of_Type;

# 8) Which year has the highest and lowest movie production?
(SELECT COUNT(titles_id) AS Number_of_Production,release_year AS Years
FROM titles_info
GROUP BY Years
ORDER BY Number_of_Production ASC
LIMIT 1)
UNION ALL
(SELECT COUNT(titles_id) AS Number_of_Production,release_year AS Years
FROM titles_info
GROUP BY Years
ORDER BY Number_of_Production DESC
LIMIT 1);

# 9) What are the movies/shows that William Wyler directed?
SELECT name AS Director_Name, title AS Titles, type_name AS Type_Name
FROM actors JOIN titles JOIN acting_credits JOIN titles_info
ON (actors.actor_id = acting_credits.actor_id) AND (titles.titles_id = acting_credits.titles_id) AND (acting_credits.titles_id = titles_info.titles_id)
WHERE actors.actor_id = 
(
SELECT actors.actor_id
FROM actors
WHERE name LIKE 'William Wyler%'
);

# 10) What are the movies with genres comedy, drama and romance?
SELECT title AS Movies_Title, genres AS Movies_Genres
FROM titles JOIN titles_info
ON (titles.titles_id = titles_info.titles_id)
WHERE genres = "['comedy', 'drama', 'romance']";

# 11) What are the most popular movies and shows?
SELECT title AS Movies_Title, tmdb_rating.tmdb_popularity AS Most_tmdb_popularity
FROM titles JOIN tmdb_rating 
ON (titles.titles_id = tmdb_rating.titles_id)
WHERE tmdb_rating.tmdb_popularity = (SELECT MAX(tmdb_popularity) FROM tmdb_rating);

# 12) What are the movies that have the runtime > 100 minutes and the production is in the US?
SELECT title, titles_info.runtime AS Runtime, titles_info.production_countries AS Prouduction
FROM titles JOIN titles_info
ON (titles.titles_id = titles_info.titles_id)
WHERE runtime > 100 AND production_countries = "['US']" AND type_name = 'MOVIE'
ORDER BY runtime ASC;

# 13) What are the movies and shows in 2020 where the imdb_score is more than 7.5?
SELECT title, titles_info.release_year AS Release_Year, imdb_score
FROM titles JOIN titles_info JOIN imdb_rating
ON (titles.titles_id = titles_info.titles_id) AND (titles.titles_id = imdb_rating.titles_id)
WHERE release_year = 2020 AND imdb_score > 7.5
ORDER BY imdb_score ASC;

# 14) What are the PG classified movies from 2020 to 2021? age_certification
SELECT title, titles_info.age_certification AS Age_Classified, titles_info.release_year AS Release_Year
FROM titles JOIN titles_info
ON (titles.titles_id = titles_info.titles_id)
WHERE age_certification = 'PG' AND release_year BETWEEN 2020 AND 2021
ORDER BY release_year ASC;