List the first and last names of all the actors who played in the 1995 movie 'Braveheart', arranged alphabetically by last name.

SELECT first_name, last_name FROM actors
JOIN roles
ON actors.id = actor_id
JOIN movies
ON movie_id = movies.id
WHERE name = 'Braveheart' AND year = 1995
ORDER BY last_name ASC;
