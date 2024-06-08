# Case Study: How does a bike-share navigate speedy success?

## Introduction
"In this case study, I will carry out various real-world tasks of a junior data analyst at a fictional company called Cyclistic. To address the main business questions, I will follow the steps of the data analysis process: Ask, Prepare, Process, Analyze, Share, and Act."

### Business Task
How do annual members and casual riders use Cyclistic bikes differently?

### Objectives 
* Analyze Cyclistic's bike trip data to understand how annual members and casual riders utilize the service differently.
* Develop marketing strategies to convert casual riders into annual members based on data insights.
* Utilize Power BI for visualizations to present key findings and support decision-making processes.

## Prepare
### Data source
I plan to analyze Cyclistic’s historical trip data from May 2023 to April 2024, which can be downloaded from divvy_tripdata. The data has been made available by Motivate International Inc. under this license	 

## Process
1.	Data imported from GCS to BigQuery for combining, exploration, cleaning, and analysis. 
2.	Checked datatypes and made it consistent, and easy to read. 
3.	To assist the analysis, 4 new columns were created (day_of_week, month, and ride_duration).

### Data manipulation process
  •	Data Combining: ([Query](https://github.com/Mooo99/Google-Case-Study/blob/main/1.%20Data%20Combining.sql))
  •	Data Exploration: [Query](https://github.com/Mooo99/Google-Case-Study/blob/main/2.%20Data%20Exploration.sql)
  •	Data Cleaning: ([Query](https://github.com/Mooo99/Google-Case-Study/blob/main/3.%20Data%20Cleaning.sql))

## Analyze 
I have analyzed the data to understand how Cyclistic riders use bikes differently.
Data Analysis: ([Query](https://github.com/Mooo99/Google-Case-Study/blob/main/4.%20Data%20Analysis.sql))

## Share

![](https://github.com/Mooo99/Google-Case-Study/blob/main/Screenshot%202024-06-08%20054906.png)

## Insights:

### Rides By User_type
-	There are significantly more members riding (2.8 million) than casual riders (1.5 million).

### Rides By Bike_type
-	Classic bikes were the clear favorite, accounting for around two-thirds (64.46%) of all rides, totaling nearly 2,743,251 rides. Electric bikes were a distant second at 34.12%, with ridership around 1,452,167. Docked bikes were the least popular option, making up only 1.41% of rides, or roughly 60,080.

### Rides By Bike_type and User_type 
-	Member and casual riders mostly used classic rather than electric bikes, while docked bikes were only used by casual riders.

### Rides By Season
-	The summer season (June, July, and August) had the highest number of rides by season, with 1,662,000 rides. This was followed by the autumn season (September, October, and November) with 1,165,000 rides, the spring season (March, April, and May) with 972,000 rides, and finally the winter season (December, January, and February) with 457,000 rides.

### Total Rides By Day_of_week
-	Ridership is highest on Saturdays, followed by weekdays (Tuesday through Friday). There is a significant drop in ridership on Sundays and Mondays.

### Rides By Time of Day And User_type
-	Member riders take most of their rides in the afternoon. Casual riders also tend to take more rides in the afternoon compared to other times of the day.

### Rides By day_of_week
-	During the weekdays (Monday to Friday), there were more rides compared to weekends.

## Recommendations

* Implement marketing strategies to convert casual users to members. This can include offering discounts on annual membership or highlighting the benefits of becoming a member.
*   Increase the number of Classic bikes to meet demand and ensure they are available at high-traffic stations.
*   Introduce winter promotions or incentives to encourage more rides during the colder months. Consider offering heated bike seats or special winter riding gear.
*   Ensure bike availability and maintenance are prioritized during these peak times. Consider dynamic pricing to manage demand and availability.


