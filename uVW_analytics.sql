SELECT 
  A.VendorID,
  CAST(B.tpep_dropoff_datetime AS DATE) AS tpep_dropoff_datetime,
  CAST(B.tpep_pickup_datetime AS DATE) AS tpep_pickup_datetime,
  D.passenger_count,
  H.trip_distance,
  G.rate_code_name,
  F.pickup_latitude,
  F.pickup_longitude,
  C.dropoff_latitude,
  C.dropoff_longitude,
  E.payment_type_name,
  A.fare_amount,
  A.extra,
  A.mta_tax,
  A.tip_amount,
  A.tolls_amount,
  A.improvement_surcharge
FROM `data-with-leo.uber_data_engineering.fact_table`               AS A
  JOIN `data-with-leo.uber_data_engineering.dim_datetime`           AS B
      ON A.datetime_id = A.datetime_id
  JOIN `data-with-leo.uber_data_engineering.dim_dropoff_location`   AS C
      ON A.dropoff_location_id = C.dropoff_location_id
  JOIN `data-with-leo.uber_data_engineering.dim_passenger_count`    AS D
      ON A.passenger_count_id = D.passenger_count_id 
  JOIN `data-with-leo.uber_data_engineering.dim_payment_type`       AS E
      ON A.payment_type_id = E.payment_type_id
  JOIN `data-with-leo.uber_data_engineering.dim_pickup_location`    AS F
      ON A.pickup_location_id = F.pickup_location_id 
  JOIN `data-with-leo.uber_data_engineering.dim_rate_code`          AS G
      ON A.rate_code_id = G.rate_code_id
  JOIN `data-with-leo.uber_data_engineering.dim_trip_distance`      AS H
      ON A.trip_distance_id = H.trip_distance_id
