--Dataset : Cyclistic ride-share (educational dataset)
--Tool used : Google BigQuery
--Objective : Analyze ride duration by user type on weekly basis

SELECT
  EXTRACT(DAYOFWEEK FROM DATE(started_at)) AS day_number,
  FORMAT_DATE('%A', DATE(started_at)) AS day_name,
  member_casual,
  COUNT(*) AS total_trips,
  ROUND(AVG(TIMESTAMP_DIFF(ended_at, started_at, MINUTE)),2) AS avg_trip_duration_minutes,
  APPROX_QUANTILES(TIMESTAMP_DIFF(ended_at, started_at, MINUTE),2)[OFFSET(1)] AS median_trip_duration_minutes
FROM `bike_data.bike_trips`
GROUP BY
  day_number,day_name,member_casual
ORDER BY
  day_number,member_casual;
