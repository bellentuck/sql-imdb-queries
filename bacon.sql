List all the actors that have worked with Kevin Bacon in Drama movies (include the movie name). Please exclude Mr. Bacon himself from the results.


Optimized query:

SELECT m.name, a.first_name || " " || a.last_name AS full_name
  FROM actors AS a
  INNER JOIN roles AS r
    ON r.actor_id = a.id
  INNER JOIN movies AS m
    ON r.movie_id = m.id
  INNER JOIN movies_genres AS mg
    ON mg.movie_id = m.id
    AND mg.genre = 'Drama'
  WHERE m.id IN (
    SELECT bacon_m.id
    FROM movies AS bacon_m
    INNER JOIN roles AS bacon_r
      ON bacon_r.movie_id = bacon_m.id
    INNER JOIN actors AS bacon_a
      ON bacon_r.actor_id = bacon_a.id
    WHERE bacon_a.first_name = 'Kevin'
      AND bacon_a.last_name = 'Bacon'
    )
    AND full_name != 'Kevin Bacon'
  ORDER BY m.name ASC;



First try, unoptimized query:

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
