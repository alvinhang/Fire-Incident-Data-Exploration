SELECT *
FROM FireIncident



-- Fires that burned over 1000 acres
SELECT incident_name, incident_acres_burned
FROM FireIncident
WHERE incident_acres_burned > 1000
ORDER BY incident_acres_burned DESC;



-- Fires that lasted more than 7 days
SELECT 
    incident_name,
    incident_date_created,
    incident_date_extinguished,
    DATEDIFF(DAY, incident_date_created, incident_date_extinguished) AS duration_days
FROM FireIncident
WHERE incident_date_extinguished IS NOT NULL
  AND DATEDIFF(DAY, incident_date_created, incident_date_extinguished) > 7;



-- Fires with no Extinguished date
SELECT incident_name, incident_date_created
FROM FireIncident
WHERE incident_date_extinguished IS NULL;



-- Fires grouped by year
SELECT 
    YEAR(incident_date_created) AS fire_year,
    COUNT(*) AS total_fires,
    SUM(incident_acres_burned) AS total_acres
FROM FireIncident
GROUP BY YEAR(incident_date_created)
ORDER BY fire_year;



-- Wildfires only
SELECT 
    incident_name, 
    incident_date_created, 
    incident_date_extinguished, 
    incident_acres_burned
FROM FireIncident
WHERE incident_type = 'Wildfire'
ORDER BY incident_date_created ASC;



-- Fires with missing type or location
SELECT 
    incident_name, 
    incident_date_created, 
    incident_acres_burned
FROM FireIncident
WHERE incident_type IS NULL OR incident_location IS NULL
ORDER BY incident_date_created ASC;



-- Top 10 Longest lasting fires
SELECT TOP 10
    incident_name,
    DATEDIFF(DAY, incident_date_created, incident_date_extinguished) AS duration_days
FROM FireIncident
WHERE incident_date_extinguished IS NOT NULL
ORDER BY duration_days DESC;