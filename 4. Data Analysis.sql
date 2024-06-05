    
        -- Counting Total Ride by Bike Type 
        SELECT bike_type,COUNT(ride_id) AS number_of_rides
        FROM `Analysis.Cleaned_data`
        GROUP BY 
        bike_type

        -- Rides by Bike_Type and User_Type
        SELECT bike_type,COUNT(ride_id) AS number_of_rides, user_type
        FROM `Analysis.Cleaned_data`
        GROUP BY 
            bike_type, user_type

        -- Counting Total Rides for both Member and Casual 
        SELECT user_type,count(*) as number_of_rides
        FROM `Analysis.Cleaned_data`    
		GROUP BY user_type
		ORDER BY 1

        -- Counting Casual rides by Weekday and Weekend

        SELECT day_of_week, COUNT(day_of_week) AS number_of_rides,
        case when day_of_week in ('Mon','Tue','Wed','Thu','Fri') then 'Weekday'
        else 'Weekend'
        end AS week_dayCategory
        from `Analysis.Cleaned_data`
        WHERE user_type = 'casual'
        GROUP BY day_of_week,case when day_of_week in ('Mon','Tue','Wed','Thu','Fri') then 'Weekday'
        else 'Weekend'
        end
      

        -- Counting Member rides by Weekday and Weekend

        SELECT day_of_week, COUNT(day_of_week) AS number_of_rides,
        case when day_of_week in ('Mon','Tue','Wed','Thu','Fri') then 'Weekday'
        else 'Weekend'
        end AS week_dayCategory 
        from `Analysis.Cleaned_data`
        WHERE user_type = 'member'
        GROUP BY day_of_week,case when day_of_week in ('Mon','Tue','Wed','Thu','Fri') then 'Weekday' 
        else 'Weekend'
        end
        
            
        -- Counting Monthly Rides for both "member" and "casual" riders
        SELECT 
        DISTINCT COUNT(*) as Rides_num,
        CONCAT(EXTRACT(MONTH FROM start_time), '/', EXTRACT(YEAR FROM start_time)) AS Month_of_Year 
        FROM `Analysis.Cleaned_data`
        WHERE user_type = 'member'
        GROUP BY CONCAT (EXTRACT(MONTH FROM start_time), '/', EXTRACT(YEAR FROM start_time)) 
        
        SELECT 
        DISTINCT COUNT(*) as Rides_num,
        CONCAT(EXTRACT(MONTH FROM start_time), ' ', EXTRACT(YEAR FROM start_time)) AS Month_of_Year 
        FROM `Analysis.Cleaned_data`
        WHERE user_type = 'casual'
        GROUP BY CONCAT (EXTRACT(MONTH FROM start_time), ' ', EXTRACT(YEAR FROM start_time)) 

        -- Counting Total Rides by week 
        select day_of_week, COUNT(*) AS Total_rides_by_week
        FROM `Analysis.Cleaned_data`
        GROUP BY day_of_week
      
        -- Counting Total Rides in Weekday and Weekend
        SELECT day_of_week, COUNT(day_of_week) AS number_of_rides,
        CASE WHEN day_of_week IN ('Mon','Tue','Wed','Thu','Fri') THEN 'Weekday'
        ELSE 'Weekend'
        END AS Weekday
        FROM `Analysis.Cleaned_data`
        GROUP BY day_of_week 
      

        -- Counting Daily Rides for both "member" and "casual" riders

		SELECT day_of_week,count(*) as Total_rides_by_weekday
		FROM `Analysis.Cleaned_data`
		WHERE user_type = 'member'
		GROUP BY day_of_week
		ORDER BY 1

		SELECT day_of_week,count(*) as Total_rides_by_weekday
		FROM `Analysis.Cleaned_data`
		WHERE user_type = 'casual'
		GROUP BY day_of_week
		ORDER BY 1

        -- Rides By Time of day and Week Day 
        SELECT DISTINCT day_of_week, COUNT(day_of_week) AS number_of_rides, user_type,
        CASE
        WHEN CAST(start_time AS TIME) >= '06:00:00' AND CAST(start_time AS TIME) < '12:00:00' THEN 'Morning'
        WHEN CAST(start_time AS TIME) >= '12:00:00' AND CAST(start_time AS TIME) < '17:00:00' THEN 'Afternoon'
        WHEN CAST(start_time AS TIME) >= '17:00:00' AND CAST(start_time AS TIME) < '20:00:00' THEN 'Evening'
        ELSE 'Night'
        END AS Time_of_day
        FROM `Analysis.Cleaned_data`
        GROUP BY day_of_week, user_type,  
        CASE
        WHEN CAST(start_time AS TIME) >= '06:00:00' AND CAST(start_time AS TIME) < '12:00:00' THEN 'Morning'
        WHEN CAST(start_time AS TIME) >= '12:00:00' AND CAST(start_time AS TIME) < '17:00:00' THEN 'Afternoon'
        WHEN CAST(start_time AS TIME) >= '17:00:00' AND CAST(start_time AS TIME) < '20:00:00' THEN 'Evening'
        ELSE 'Night'
        END
        ORDER BY day_of_week;

        -- Rides By Season
        SELECT 
        EXTRACT(MONTH FROM start_time) AS Month_Number,
        CASE 
        WHEN EXTRACT(MONTH FROM start_time) = 1 THEN 'Jan'
        WHEN EXTRACT(MONTH FROM start_time) = 2 THEN 'Feb'
        WHEN EXTRACT(MONTH FROM start_time) = 3 THEN 'Mar'
        WHEN EXTRACT(MONTH FROM start_time) = 4 THEN 'Apr'
        WHEN EXTRACT(MONTH FROM start_time) = 5 THEN 'May'
        WHEN EXTRACT(MONTH FROM start_time) = 6 THEN 'Jun'
        WHEN EXTRACT(MONTH FROM start_time) = 7 THEN 'Jul'
        WHEN EXTRACT(MONTH FROM start_time) = 8 THEN 'Aug'
        WHEN EXTRACT(MONTH FROM start_time) = 9 THEN 'Sep'
        WHEN EXTRACT(MONTH FROM start_time) = 10 THEN 'Oct'
        WHEN EXTRACT(MONTH FROM start_time) = 11 THEN 'Nov'
        WHEN EXTRACT(MONTH FROM start_time) = 12 THEN 'Dec'
        ELSE '' || EXTRACT(MONTH FROM start_time) -- Concatinating to convert to string
        END AS Month_Name,
        COUNT(start_time) AS Number_of_Rides,
        user_type,
        CASE
        WHEN EXTRACT(MONTH FROM start_time) IN (12, 1, 2) THEN 'Winter'
        WHEN EXTRACT(MONTH FROM start_time) IN (3, 4, 5) THEN 'Spring'
        WHEN EXTRACT(MONTH FROM start_time) IN (6, 7, 8) THEN 'Summer'
        WHEN EXTRACT(MONTH FROM start_time) IN (9, 10, 11) THEN 'Autumn'
        ELSE 'Unknown'
        END AS Season 
        FROM `Analysis.Cleaned_data`
        GROUP BY start_time, user_type, Season
        ORDER BY Month_Name;


