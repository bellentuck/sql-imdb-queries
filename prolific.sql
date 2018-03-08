List the top 100 most active actors and the number of roles they have starred in.

SELECT (first_name || ' ' || last_name) AS full_name,
COUNT(role)
FROM actors
JOIN roles
ON id = actor_id
GROUP BY full_name
ORDER BY COUNT(role)
DESC LIMIT 100;
