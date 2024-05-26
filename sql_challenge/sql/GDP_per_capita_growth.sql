SELECT
    RANK() OVER (ORDER BY ((p2012.gdp_per_capita - p2011.gdp_per_capita) / p2011.gdp_per_capita) DESC) AS Rank,
    c.country_name AS Country_Name,
    p2012.country_code AS Country_Code,
    (SELECT continent_name FROM continents cont WHERE cont.continent_code = cm.continent_code) AS Continent,
    ((p2012.gdp_per_capita - p2011.gdp_per_capita) / p2011.gdp_per_capita) * 100 AS Growth_Percent
FROM
    per_capita p2012
JOIN
    per_capita p2011 ON p2012.country_code = p2011.country_code AND p2011.year = 2011
JOIN
    countries c ON p2012.country_code = c.country_code
JOIN
    continent_map cm ON c.country_code = cm.country_code
WHERE
    p2012.year = 2012
ORDER BY
    Growth_Percent DESC
FETCH FIRST 10 ROWS ONLY;
