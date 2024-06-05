-- Data Exploration -- 
  -- Chceking for number of null values in all columns
SELECT COUNT(*) - COUNT (ride_id),
COUNT(*) - COUNT (rideable_type),
COUNT(*) - COUNT (started_at),
COUNT(*) - COUNT (ended_at),
COUNT(*) - COUNT (start_station_name),
COUNT(*) - COUNT (start_station_id),
COUNT(*) - COUNT (end_station_name),
COUNT(*) - COUNT (end_station_id),
COUNT(*) - COUNT (start_lat),
COUNT(*) - COUNT (start_lng),
COUNT(*) - COUNT (end_lat),
COUNT(*) - COUNT (end_lng),
COUNT(*) - COUNT (member_casual)
FROM `Analysis.Combined_data`

-- Checking for duplicates in Rows
SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `Analysis.Combined_data`

-- Ride_id - All have length of 16 
SELECT LENGTH(ride_id) AS Length_ride_id, COUNT(ride_id) AS Number_of_rows
FROM `Analysis.Combined_data`
GROUP BY Length_ride_id

-- Rideable_type - 3 Unique bikes
SELECT DISTINCT rideable_type, COUNT (rideable_type) AS Number_of_trips
FROM `Analysis.Combined_data`
GROUP BY rideable_type

-- Started_at, Ended_at TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC
SELECT started_at, ended_at
FROM `Analysis.Combined_data`
LIMIT 10;

-- Longer than a day - Returned 7,321 of total Rows
SELECT COUNT(*) AS Longer_than_day
FROM `Analysis.Combined_data`
WHERE(
  EXTRACT(HOUR FROM(ended_at - started_at)) * 60 + 
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >=1440;
)

-- Less than a minute - Returned 138,466 of total Rows
SELECT COUNT(*) AS Less_than_minute
FROM `Analysis.Combined_data`
WHERE(
EXTRACT(HOUR FROM (ended_at - started_at)) * 60 + 
EXTRACT(MINUTE FROM (ended_at - started_at))+
EXTRACT(SECOND FROM (ended_at - started_at) / 60) <=1
)

-- Start_station_name, Start_station_id
SELECT DISTINCT start_station_name
FROM `Analysis.Combined_data`
GROUP BY start_station_name;

--Counting NULL values in start_station_neme and start_station_id - Returned 885,429 of NULL values
SELECT COUNT(ride_id) AS Start_station_nulls
FROM `Analysis.Combined_data`
WHERE start_station_name IS NULL OR start_station_id IS NULL; 

-- End_station_name, End_station_id
SELECT DISTINCT end_station_name
FROM `Analysis.Combined_data`
GROUP BY end_station_name;

--Counting NULL values in end_station_neme and end_station_id - Returned 939,115 of NULL values
SELECT COUNT (ride_id) AS End_station_nulls
FROM `Analysis.Combined_data`
WHERE end_station_name IS NULL OR end_station_id IS NULL

-- End_lat, End_lng - Returned 7,610 of NULL values
SELECT COUNT (ride_id) AS Null_end_Location
FROM `Analysis.Combined_data`
WHERE end_lat IS NULL OR end_lng IS NULL

-- Member_casual - 2 Unique values (Member and Casual) - Member = 3,685,960 AND Casual = 2,0522,652
SELECT DISTINCT member_casual, COUNT(member_casual) AS Number_of_trips
FROM `Analysis.Combined_data`
GROUP BY member_casual 


