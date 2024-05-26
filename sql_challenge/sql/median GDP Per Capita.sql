WITH ranked_gdp AS (
    SELECT
        p.year AS Year,
        c.continent_name AS Continent,
        p.gdp_per_capita,
        ROW_NUMBER() OVER (PARTITION BY p.year, c.continent_name ORDER BY p.gdp_per_capita) AS rn,
        COUNT(*) OVER (PARTITION BY p.year, c.continent_name) AS cnt
    FROM
        per_capita p
    JOIN
        continent_map cm ON p.country_code = cm.country_code
    JOIN
        continents c ON cm.continent_code = c.continent_code
    WHERE
        p.year BETWEEN 2004 AND 2012
)
SELECT
    Year,
    Continent,
    AVG(gdp_per_capita) AS Median_GDP_Per_Capita
FROM
    ranked_gdp
WHERE
    rn IN (FLOOR((cnt + 1) / 2.0), CEIL((cnt + 1) / 2.0))
GROUP BY
    Year, Continent
ORDER BY
    Year, Continent;
