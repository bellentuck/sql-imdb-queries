Find actors that played five or more roles in the same movie after the year 1990. Notice that ROLES may have occasional duplicates, but we are not interested in these: we want actors that had five or more distinct (cough cough) roles in the same movie. Write a query that returns the actors' names, the movie name, and the number of distinct roles that they played in that movie (which will be ≥ 5).

actors' names, the movie name, # roles

roles -> actors
actor_id = actors.id
roles -> movies
movie_id = movies.id

A single movie has many roles.
Of the set of these roles, keep only the ones with actor_id that appear more than once (that are not unique)





SELECT
  first_name || " " || last_name AS actor_name,
  name as movie_name, COUNT(

    SELECT actor_id FROM roles
    GROUP BY movie_id
    HAVING COUNT(actor_id) >= 2

  ) as num_roles
  FROM actors
  JOIN roles ON actors.id = actor_id
  JOIN movies ON movie_id = movies.id;




SELECT
  first_name || " " || last_name AS actor_name,
  name as movie_name, role, COUNT(*)
  FROM actors
  JOIN roles ON actors.id = actor_id
  JOIN movies ON movie_id = movies.id
  GROUP BY movie_id
  HAVING COUNT(actor_name) > 1;


  SELECT idA, COUNT(*) FROM XXX GROUP BY idA HAVING COUNT(*) > 1






SOLUTION:

actors
roles
movies

SELECT COUNT(DISTINCT roles.role) as num_roles_in_movies, *
FROM actors
  INNER JOIN roles ON roles.actor_id = actors.id
  INNER JOIN movies ON roles.movie_id = movies.id
WHERE movies.year > 1990
GROUP BY actors.id, movies.id
HAVING num_roles_in_movies > 4;
