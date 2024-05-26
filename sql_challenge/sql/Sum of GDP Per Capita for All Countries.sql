SELECT
    p.year AS Year,
    c.continent_name AS Continent,
    SUM(p.gdp_per_capita) / COUNT(DISTINCT cm.country_code) AS Average_GDP_Per_Capita
FROM
    per_capita p
JOIN
    continent_map cm ON p.country_code = cm.country_code
JOIN
    continents c ON cm.continent_code = c.continent_code
WHERE
    p.year BETWEEN 2004 AND 2012
GROUP BY
    p.year, c.continent_name
ORDER BY
    p.year, c.continent_name;
