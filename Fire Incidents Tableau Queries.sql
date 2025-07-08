-- 1

SELECT 
    incident_name,
    incident_date_created,
    incident_date_extinguished,
    incident_acres_burned,
    DATEDIFF(DAY, incident_date_created, incident_date_extinguished) AS duration_days
FROM FireIncident
WHERE incident_date_created IS NOT NULL
  AND incident_date_extinguished IS NOT NULL;


-- 2

SELECT 
    incident_name,
    incident_date_created,
    incident_acres_burned,
    incident_latitude,
    incident_longitude
FROM FireIncident
WHERE incident_latitude IS NOT NULL AND incident_longitude IS NOT NULL;


-- 3

SELECT 
    YEAR(incident_date_created) AS fire_year,
    COUNT(*) AS total_fires,
    SUM(incident_acres_burned) AS total_acres_burned
FROM FireIncident
GROUP BY YEAR(incident_date_created)
ORDER BY fire_year ASC;


-- 4

SELECT TOP 10
    incident_name,
    incident_date_created,
    incident_acres_burned
FROM FireIncident
WHERE incident_acres_burned IS NOT NULL
ORDER BY incident_acres_burned DESC;

