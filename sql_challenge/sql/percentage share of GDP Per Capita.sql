SELECT
    region,
    SUM(gdp_per_capita) / world_total_gdp * 100 AS percentage_share
FROM (
    SELECT
        CASE
            WHEN cm.continent_code = 'NA' THEN 'North America'
            WHEN cm.continent_code = 'EU' THEN 'Europe'
            ELSE 'Rest of the World'
        END AS region,
        p.gdp_per_capita,
        (SELECT SUM(gdp_per_capita) FROM per_capita WHERE year = 2012) AS world_total_gdp
    FROM
        per_capita p
    JOIN
        continent_map cm ON p.country_code = cm.country_code
    WHERE
        p.year = 2012
) subquery
GROUP BY
    region, world_total_gdp
ORDER BY
    region;
