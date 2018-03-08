List all the directors who directed a 'Film-Noir'-genre movie in a leap year (for the sake of this challenge, pretend that all years divisible by 4 are leap years — which is not true in real life). Your query should return director name, the movie name, and the year, sorted by movie name.



SELECT (first_name || ' ' || last_name) AS director_name,
name AS movie_name, year
FROM directors
JOIN movies
ON directors.id = movies.id
JOIN directors_genres
ON directors.id = director_id
WHERE genre LIKE 'Film-Noir' AND year % 4 = 0
ORDER BY movie_name ASC;
