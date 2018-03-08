Which actors have acted in a film before 1900 and also in a film after 2000? NOTE: we are not asking you for all the pre-1900 and post-2000 actors — we are asking for each actor who worked in both eras!


Using 'Intersect':

SELECT first_name || " " || last_name AS full_name, actors.id FROM actors
JOIN roles
ON actors.id = actor_id
JOIN movies
ON movie_id = movies.id
WHERE year < 1900
INTERSECT
SELECT first_name || " " || last_name AS full_name, actors.id FROM actors
JOIN roles
ON actors.id = actor_id
JOIN movies
ON movie_id = movies.id
WHERE year > 2000
ORDER BY actors.id;



Using 'In':

SELECT DISTINCT first_name, last_name
FROM actors, roles, movies
WHERE movies.year > 2000 AND roles.movie_id = movies.id AND actors.id = roles.actor_id AND roles.actor_id
IN (SELECT roles.actor_id
FROM roles, movies
WHERE movies.year < 1900
AND roles.movie_id=movies.id)



Start with everybody who has been in a film before 1900, filter on how many were in post-2000 films. At least this is how I might do it in JS.

I.e., drawing this out,
all actors from these movies:
roles -> actors
actors.id = actor_id
roles -> movies
movie_id = movie.id
movies -> year < 1900
and
these movies:
roles -> actors
actors.id = actor_id
roles -> movies
movie_id = movie.id
movies -> year > 2000

I.e., intersection of set of pre-1900 & post-2000 movies actors.

SQL implementation of INTERSECT: https://www.techonthenet.com/sql/intersect.php

Running the above query eventually returned the following:
Kofi Amankwah|9884
Willy Christiaens|85803
Thomas A. Edison|135342
Pat Kinevane|248171
The King Cole Trio|248172
Woodie King Jr.|248183
Lord Kitchener|249997
Petr Lenícek|274448
Victor Prince II|382791
Phillip Prinoth|382921
Theodore Roosevelt|406691
Constantine Tsapralis|480607
Sandorne Czar|590937
Sussan Deyhim|601820
Joan Drott|606836
Füsun Fatih|616881
Monica Irimia|661791
Annabelle Moore|727125
Gina Prince-Bythewood|759273
Desiree Prinsenberg|759315
Rosemarie Quednau|760909
Rosa (II) Ros|773298
Marianna Tsaregradskaya|816959



