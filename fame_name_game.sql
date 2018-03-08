.schema table

SELECT id, first_name FROM actors
GROUP BY first_name
ORDER BY count(*)
DESC LIMIT 10;

SELECT (first_name || ' ' || last_name) AS full_name,
COUNT(*) AS count
FROM actors
GROUP BY full_name
ORDER BY count(full_name)
DESC LIMIT 10;
