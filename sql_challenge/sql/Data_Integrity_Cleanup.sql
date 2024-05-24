--Data Integrity & Cleanup
--Alphabetically list all the country codes in the continent map table that appear more than once. For countries with no country code make them display as "N/A" and display them first in the list.

SELECT 
    COALESCE(country_code, 'N/A') AS country_code
FROM 
    continent_map
GROUP BY 
    country_code
HAVING 
    COUNT(*) > 1
ORDER BY 
    CASE WHEN country_code IS NULL THEN 0 ELSE 1 END,
    country_code ASC;
