--table schemas
SELECT * 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';

-- table 
SELECT * FROM earthquake_events_gold
--Describe table schema:
EXEC sp_columns 'earthquake_events_gold';

--Total number of earthquakes, min, max, and average magnitude
SELECT COUNT(*) AS total_earthquakes,
       MIN(mag) AS min_magnitude,
       MAX(mag) AS max_magnitude,
       AVG(mag) AS avg_magnitude
FROM earthquake_events_gold; 

--Check for missing data per column:
SELECT 
    SUM(CASE WHEN id IS NULL THEN 1 ELSE 0 END) AS missing_id,
    SUM(CASE WHEN place_description IS NULL THEN 1 ELSE 0 END) AS missing_place,
    SUM(CASE WHEN mag IS NULL THEN 1 ELSE 0 END) AS missing_magnitude
FROM earthquake_events_gold;

--Number of earthquakes per region (most active first):
SELECT country_code, COUNT(*) AS total_events
FROM earthquake_events_gold
GROUP BY country_code
ORDER BY total_events DESC;

--Filter by magnitude:
SELECT id, place_description, mag
FROM earthquake_events_gold
WHERE mag >= 5
ORDER BY mag DESC;
--Magnitude distribution:
SELECT 
    CASE 
        WHEN mag < 2 THEN 'Micro (<2)'
        WHEN mag < 4 THEN 'Minor (2-3.9)'
        WHEN mag < 6 THEN 'Moderate (4-5.9)'
        ELSE 'Strong (6+)' 
    END AS magnitude_category,
    COUNT(*) AS count
FROM earthquake_events_gold
GROUP BY 
    CASE 
        WHEN mag < 2 THEN 'Micro (<2)'
        WHEN mag < 4 THEN 'Minor (2-3.9)'
        WHEN mag < 6 THEN 'Moderate (4-5.9)'
        ELSE 'Strong (6+)' 
    END
ORDER BY count DESC;
--Regions with the highest average magnitude:
SELECT country_code, AVG(mag) AS avg_ma, COUNT(*) AS total_events
FROM earthquake_events_gold
GROUP BY country_code
ORDER BY avg_magnitude DESC;

--Top 10 strongest earthquake
SELECT *
FROM earthquake_events_gold
ORDER BY mag DESC;

--Earthquakes per year:
SELECT YEAR(time) AS year, COUNT(*) AS total_events
FROM earthquake_events_gold
GROUP BY YEAR(time)
ORDER BY year;
select * from earthquake_events_gold
--Earthquakes per month:
SELECT MONTH(time) AS month, COUNT(*) AS total_events
FROM earthquake_events_gold
GROUP BY MONTH(time)
ORDER BY month;
--Strongest earthquake per region:
SELECT *
FROM earthquake_events_gold
WHERE time >= DATEADD(day, -30, GETDATE())
ORDER BY time DESC;

--Earthquakes near a specific location:
SELECT *
FROM earthquake_events_silver
WHERE latitude BETWEEN 37 AND 38
  AND longitude BETWEEN -122 AND -121
ORDER BY mag DESC;

--Average magnitude by coordinates grid:
SELECT 
    FLOOR(latitude) AS lat_bin,
    FLOOR(longitude) AS lon_bin,
    AVG(mag) AS avg_magnitude,
    COUNT(*) AS total_events
FROM earthquake_events_silver
GROUP BY FLOOR(latitude), FLOOR(longitude)
ORDER BY total_events DESC;



