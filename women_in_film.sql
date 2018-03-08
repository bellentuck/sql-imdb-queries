For each year, count the number of movies in that year that had only female actors. You might start by including movies with no cast, but your ultimate goal is to narrow your query to only movies that have a cast.


Each movie has a year. Movies have roles, and roles are played by actors. Actors have genders.

We are looking for - first - all movies in a given year whose roles were played only by actors who were women.

We want - second - a count of how many movies there are in each given year fulfilling the above criteria.


SELECT year, COUNT(*) FROM movies
  JOIN roles ON movies.id = movie_id
  JOIN actors ON actor_id = actors.id
  WHERE gender LIKE 'F'
  GROUP BY year
  ORDER BY year LIMIT 10;



--


SELECT movies.year, COUNT(*) as movies_in_year
FROM movies
WHERE movies.id NOT IN (

  SELECT DISTINCT movies.id
  FROM movies
    INNER JOIN roles ON movies.id = roles.movie_id
    INNER JOIN actors
      ON roles.actor_id = actors.id
      AND actors.gender = 'M'

)

AND movies.id IN (

  SELECT DISTINCT movies.id
    FROM movies
    INNER JOIN roles ON movies.id = roles.movie_id
    INNER JOIN actors
      ON roles.actor_id = actors.id
      AND actors.gender = 'F'

)

GROUP BY movies.year;




This returns (rather oddly considering the last two years - somehow not reported yet - or perhaps the particular stat source has been deprecated - in any event)
1894|14
1895|4
1896|9
1897|16
1898|12
1899|17
1900|10
1901|8
1902|10
1903|17
1904|1
1906|3
1907|10
1908|23
1909|56
1910|115
1911|174
1912|238
1913|208
1914|209
1915|158
1916|115
1917|90
1918|71
1919|79
1920|85
1921|67
1922|53
1923|46
1924|42
1925|51
1926|65
1927|49
1928|51
1929|54
1930|47
1931|46
1932|67
1933|50
1934|65
1935|73
1936|68
1937|74
1938|55
1939|47
1940|38
1941|46
1942|42
1943|42
1944|27
1945|36
1946|59
1947|53
1948|66
1949|63
1950|56
1951|63
1952|70
1953|74
1954|72
1955|55
1956|73
1957|66
1958|75
1959|80
1960|90
1961|61
1962|74
1963|80
1964|90
1965|92
1966|108
1967|117
1968|125
1969|139
1970|128
1971|134
1972|137
1973|129
1974|118
1975|167
1976|168
1977|168
1978|173
1979|185
1980|185
1981|174
1982|174
1983|250
1984|279
1985|321
1986|354
1987|374
1988|374
1989|359
1990|401
1991|407
1992|463
1993|577
1994|657
1995|668
1996|638
1997|679
1998|686
1999|811
2000|840
2001|778
2002|784
2003|701
2004|449
2005|77
2006|5
2007|1
