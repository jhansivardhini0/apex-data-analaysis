CREATE DATABASE covid_analysis;

USE covid_analysis;
CREATE TABLE covid_cases (
    date_reported DATE,
    country_code VARCHAR(10),
    country VARCHAR(100),
    who_region VARCHAR(50),
    new_cases INT,
    cumulative_cases BIGINT,
    new_deaths INT,
    cumulative_deaths BIGINT
);
SELECT * FROM covid_cleaned
LIMIT 10;
SELECT COUNT(*)
FROM covid_cleaned;
SELECT COUNT(DISTINCT country)
FROM covid_cleaned;
SELECT DISTINCT who_region
FROM covid_cleaned;
SELECT country,
       MAX(cumulative_cases) AS total_cases
FROM covid_cleaned
GROUP BY country
ORDER BY total_cases DESC
LIMIT 10;
SELECT country,
       MAX(cumulative_deaths) AS total_deaths
FROM covid_cleaned
GROUP BY country
ORDER BY total_deaths DESC
LIMIT 10;
SELECT who_region,
       MAX(cumulative_cases) AS total_cases
FROM covid_cleaned
GROUP BY who_region
ORDER BY total_cases DESC;
SELECT who_region,
       MAX(cumulative_deaths) AS total_deaths
FROM covid_cleaned
GROUP BY who_region
ORDER BY total_deaths DESC;
SELECT AVG(new_cases) AS average_daily_cases
FROM covid_cleaned;
SELECT AVG(new_deaths) AS average_daily_deaths
FROM covid_cleaned;
SELECT country,
       date_reported,
       new_cases
FROM covid_cleaned
ORDER BY new_cases DESC
LIMIT 10;
SELECT country,
       date_reported,
       new_deaths
FROM covid_cleaned
ORDER BY new_deaths DESC
LIMIT 10;
SELECT country,
       MAX(cumulative_cases) AS total_cases
FROM covid_cleaned
GROUP BY country
HAVING MAX(cumulative_cases) > 1000000
ORDER BY total_cases DESC;
SELECT DISTINCT country
FROM covid_cleaned
WHERE cumulative_deaths = 0;
SELECT MAX(date_reported)
FROM covid_cleaned;
SELECT date_reported,
       SUM(new_cases) AS global_cases
FROM covid_cleaned
GROUP BY date_reported
ORDER BY date_reported;