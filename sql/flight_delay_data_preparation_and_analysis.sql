DROP TABLE IF EXISTS flights_raw;

CREATE TABLE flights_raw (
    fl_date DATE,
    airline TEXT,
    airline_dot TEXT,
    airline_code TEXT,
    dot_code INTEGER,
    fl_number INTEGER,
    origin TEXT,
    origin_city TEXT,
    dest TEXT,
    dest_city TEXT,
    crs_dep_time INTEGER,
    dep_time FLOAT,
    dep_delay FLOAT,
    taxi_out FLOAT,
    wheels_off FLOAT,
    wheels_on FLOAT,
    taxi_in FLOAT,
    crs_arr_time INTEGER,
    arr_time FLOAT,
    arr_delay FLOAT,
    cancelled FLOAT,
    cancellation_code TEXT,
    diverted FLOAT,
    crs_elapsed_time FLOAT,
    elapsed_time FLOAT,
    air_time FLOAT,
    distance FLOAT,
    delay_due_carrier FLOAT,
    delay_due_weather FLOAT,
    delay_due_nas FLOAT,
    delay_due_security FLOAT,
    delay_due_late_aircraft FLOAT
);
SELECT * FROM flights_raw fr  LIMIT 5;

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT fl_number) AS unique_flight_numbers,
       MIN(fl_date) AS first_date,
       MAX(fl_date) AS last_date
FROM flights_raw;

SELECT 
    COUNT(*) AS total_rows,
    COUNT(*) - COUNT(dep_time) AS missing_dep_time,
    COUNT(*) - COUNT(arr_time) AS missing_arr_time,
    COUNT(*) - COUNT(dep_delay) AS missing_dep_delay,
    COUNT(*) - COUNT(arr_delay) AS missing_arr_delay,
    COUNT(*) - COUNT(distance) AS missing_distance
FROM flights_raw;

DROP TABLE IF EXISTS flights_cleaned;

CREATE TABLE flights_cleaned AS
SELECT *
FROM flights_raw
WHERE 
    cancelled = 0
    AND diverted = 0
    AND dep_time IS NOT NULL
    AND arr_time IS NOT NULL
    AND dep_delay IS NOT NULL
    AND arr_delay IS NOT NULL
    AND distance IS NOT NULL;

SELECT COUNT(*) AS cleaned_rows FROM flights_cleaned;
--4: EDA в SQL и подготовка визуализаций для Looker Studio / Google Sheets
--📊 4.1. Средняя задержка по авиакомпаниям
SELECT
    airline,
    COUNT(*) AS total_flights,
    ROUND(AVG(dep_delay)::numeric, 2) AS avg_dep_delay,
    ROUND(AVG(arr_delay)::numeric, 2) AS avg_arr_delay
FROM flights_cleaned
GROUP BY airline
ORDER BY avg_arr_delay DESC;

--📊 4.2. Количество рейсов по месяцам

SELECT
    EXTRACT(MONTH FROM fl_date) AS month,
    COUNT(*) AS total_flights
FROM flights_cleaned
GROUP BY month
ORDER BY month;


--📊 4.3. Средняя задержка по часам вылета

SELECT
    FLOOR(crs_dep_time / 100) AS dep_hour,
    COUNT(*) AS total_flights,
    ROUND(AVG(dep_delay)::numeric, 2) AS avg_dep_delay,
    ROUND(AVG(arr_delay)::numeric, 2) AS avg_arrival_delay
FROM flights_cleaned
GROUP BY dep_hour
ORDER BY dep_hour;

--📊 4.4. Топ-10 маршрутов с наибольшей средней задержкой прилёта

SELECT
    origin || ' - ' || dest AS route,
    COUNT(*) AS total_flights,
    ROUND(AVG(arr_delay)::numeric, 2) AS avg_arr_delay
FROM flights_cleaned
GROUP BY route
ORDER BY avg_arr_delay DESC
LIMIT 50;

--Aggregated Analytics Data for Pivot Tables and KPIs

SELECT
    airline AS "Airline",
    EXTRACT(MONTH FROM fl_date) AS "Month",
    EXTRACT(HOUR FROM TO_TIMESTAMP(LPAD(CAST(crs_dep_time AS TEXT), 4, '0'), 'HH24MI')) AS "Departure_Hour",
    COUNT(*) AS "Total_Flights",
    ROUND(AVG(dep_delay)::numeric, 2) AS "Average_Departure_Delay",
    ROUND(AVG(arr_delay)::numeric, 2) AS "Average_Arrival_Delay",
    SUM(CASE WHEN dep_delay > 0 THEN dep_delay ELSE 0 END) AS "Total_Departure_Delay_Time",
    SUM(CASE WHEN arr_delay > 0 THEN arr_delay ELSE 0 END) AS "Total_Arrival_Delay_Time"
FROM
    flights_raw
WHERE
    cancelled = 0 AND diverted = 0
GROUP BY
    airline,
    EXTRACT(MONTH FROM fl_date),
    EXTRACT(HOUR FROM TO_TIMESTAMP(LPAD(CAST(crs_dep_time AS TEXT), 4, '0'), 'HH24MI'))
ORDER BY
    airline,
    "Month",
    "Departure_Hour";
