How many movies does IMDB have of each genre, ordered by least popular genre?

genre     count
-----     ------


SELECT genre, count(genre) FROM movies_genres
GROUP BY genre
ORDER BY count(genre)
ASC;
