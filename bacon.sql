List all the actors that have worked with Kevin Bacon in Drama movies (include the movie name). Please exclude Mr. Bacon himself from the results.


SELECT name, first_name, last_name
FROM actors
JOIN roles
ON actors.id = actor_id
JOIN movies
ON roles.movie_id = movies.id
WHERE name IN (
  SELECT name
  FROM actors
  JOIN roles
  ON actors.id = actor_id
  JOIN movies
  ON roles.movie_id = movies.id
  JOIN movies_genres
  ON movies.id = movies_genres.movie_id
  WHERE genre LIKE 'Drama' AND first_name LIKE 'Kevin' AND last_name LIKE 'Bacon'
) AND first_name NOT LIKE 'Kevin' AND last_name NOT LIKE 'Bacon';
