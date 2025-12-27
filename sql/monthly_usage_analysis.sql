--Dataset : Cyclistic ride-share (educational dataset)
--Tool : Google BigQuery
--Objective : Analyze ride duration by user type across the months

SELECT
 FORMAT_DATE("%Y-%m",DATE(started_at)) AS Month,
 member_casual,
 Round(AVG(TIMESTAMP_DIFF(ended_at,started_at,MINUTE)),2) AS avg_trip_duration_minutes,
 APPROX_QUANTILES(TIMESTAMP_DIFF(ended_at, started_at, MINUTE),2)[OFFSET(1)] AS median_trip_duration_minutes
FROM `bike_data.bike_trips`
GROUP BY
 Month,member_casual
ORDER BY
 Month,member_casual;
