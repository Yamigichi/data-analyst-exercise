CREATE TABLE continent_map (
    continent_code VARCHAR(10),
    continent_name VARCHAR(255)
);

CREATE TABLE continents (
    continent_code VARCHAR(10),
    continent_name VARCHAR(255)
);

CREATE TABLE countries (
    country_code VARCHAR(10),
    country_name VARCHAR(255),
    continent_code VARCHAR(10)
);

CREATE TABLE per_capita (
    country_code VARCHAR(10),
    year INT,
    gdp_per_capita DECIMAL(15, 2)
);

BULK INSERT continent_map
FROM 'C:\Users\Yamigichi\OneDrive\Desktop\Yamigichi\data\continent_map.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT continents
FROM 'C:\Users\Yamigichi\OneDrive\Desktop\Yamigichi\data\continents.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT countries
FROM 'C:\Users\Yamigichi\OneDrive\Desktop\Yamigichi\data\countries.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT per_capita
FROM 'C:\Users\Yamigichi\OneDrive\Desktop\Yamigichi\data\per_capita.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
