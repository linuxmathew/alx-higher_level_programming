-- This script calculates the average temperature for JULY and AUGUST
-- and lists the top 3 cities with the highest average temperature

SELECT city, AVG(temperature) AS avg_temp
FROM temperatures
WHERE MONTH(date) IN (7, 8)
GROUP BY city
ORDER BY avg_temp DESC
LIMIT 3;
