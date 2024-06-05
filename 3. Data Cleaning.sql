    -- Data Cleaning -- 
      
      -- Data Formatting 
    SELECT 
    a.ride_id, 
    rideable_type AS bike_type,
    started_at AS start_time,
    ended_at AS end_time,
      -- Calculated 2 timestamps to extract Ride Duration 
    TIMESTAMP_DIFF(ended_at, started_at, SECOND) AS ride_duration,
      -- Day Extracting 
    CASE EXTRACT (DAYOFWEEK FROM started_at)
    WHEN 1 THEN 'Sun'
    WHEN 2 THEN 'Mon'
    WHEN 3 THEN 'Tue'
    WHEN 4 THEN 'Wed'
    WHEN 5 THEN 'Thu'
    WHEN 6 THEN 'Fri'
    WHEN 7 THEN 'Sat'
    END AS day_of_week,
      -- Month Extracting 
    CASE EXTRACT(MONTH FROM started_at)
    WHEN 1 THEN 'Jan'
    WHEN 2 THEN 'Feb'
    WHEN 3 THEN 'Mar'
    WHEN 4 THEN 'Apr'
    WHEN 5 THEN 'May'
    WHEN 6 THEN 'Jun'
    WHEN 7 THEN 'Jul'
    WHEN 8 THEN 'Aug'
    WHEN 9 THEN 'Sep'
    WHEN 10 THEN 'Oct'
    WHEN 11 THEN 'Nov'
    WHEN 12 THEN 'Dec'
    END AS month, 
      -- Formatting data AND calculating the Ride Duration 
    start_station_name AS start_station, end_station_name AS end_station,
    start_lat, start_lng, end_lat, end_lng, member_casual AS user_type
    FROM `Analysis.Combined_data` AS a  
    JOIN (
      SELECT ride_id, (
      EXTRACT(HOUR FROM (ended_at - started_at)) * 60 + 
      EXTRACT(MINUTE FROM (ended_at - started_at)) + 
      EXTRACT(SECOND FROM (ended_at - started_at)) / 60) AS ride_duration
      FROM `Analysis.Combined_data` 
    ) b 
    ON a.ride_id = b.ride_id
      -- Removing NULL VALUES 
    WHERE 
      start_station_name IS NOT NULL AND
      end_station_name IS NOT NULL AND 
      start_station_id IS NOT NULL AND 
      end_station_id IS NOT NULL AND 
      start_lat IS NOT NULL AND
      start_lng IS NOT NULL AND  
      end_lat IS NOT NULL AND 
      end_lng IS NOT NULL AND 
      ride_duration > 1 AND ride_duration < 1440;

      -- Returned 4,255,498 of clean ROWS -- 

