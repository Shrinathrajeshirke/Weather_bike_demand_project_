SELECT * FROM dbo.bike_sharing_systems$;
SELECT * FROM dbo.cities_weather_forecast$;
SELECT * FROM dbo.seoul_bike_sharing1$;
SELECT * FROM dbo.world_cities$;

--Number of records in seoul_bike_sharing dataset--

SELECT COUNT(*) as num_records FROM dbo.seoul_bike_sharing1$;

--Number of hours had non-zero rented bike count--

SELECT COUNT(HOUR) as non_zero_num  FROM dbo.seoul_bike_sharing1$ 
WHERE RENTED_BIKE_COUNT <> 0;
 
 --weather forecast for Seoul for next 3 hours--

SELECT TOP 1 * FROM dbo.cities_weather_forecast$ 
where CITY = 'Seoul';

--seasons included in the seoul bike sharing dataset--

SELECT DISTINCT(SEASONS) FROM dbo.seoul_bike_sharing1$;

--first and last dates in the Seoul Bike Sharing dataset-

SELECT MIN(DATE) as first_date, MAX(DATE) as last_date
FROM dbo.seoul_bike_sharing1$;

--date and hour had the most bike rentals--

SELECT DATE,RENTED_BIKE_COUNT FROM dbo.seoul_bike_sharing1$
WHERE RENTED_BIKE_COUNT = (SELECT MAX(RENTED_BIKE_COUNT) FROM dbo.seoul_bike_sharing1$);

--average hourly temperature and the average number of bike rentals per hour over each season--

SELECT TOP 10 SEASONS as season, HOUR as hour, AVG(TEMPERATURE) as avg_temp, AVG(RENTED_BIKE_COUNT) as avg_bike FROM dbo.seoul_bike_sharing1$
GROUP BY SEASONS, HOUR;

--average hourly bike count during each season--

SELECT SEASONS, AVG(RENTED_BIKE_COUNT) as avg_bike FROM dbo.seoul_bike_sharing1$
GROUP BY SEASONS;

--Weather Seasonality--
SELECT SEASONS, AVG(RENTED_BIKE_COUNT) as avg_bike, AVG(TEMPERATURE) as avg_temp, AVG(HUMIDITY) as avg_humidity,
AVG(WIND_SPEED) as avg_wind, AVG(VISIBILITY) as avg_visibility, AVG(DEW_POINT_TEMPERATURE) as avg_temp, AVG(SOLAR_RADIATION) as avg_solar, 
AVG(RAINFALL) as avg_rain, AVG(SNOWFALL) as avg_snow
FROM dbo.seoul_bike_sharing1$
GROUP BY SEASONS
ORDER BY avg_bike;

--Total Bike Count and City Info for Seoul--

SELECT bike.CITY, world.COUNTRY, world.LAT, world.LNG, world.POPULATION, bike.BICYCLES 
INTO new
FROM dbo.bike_sharing_systems$ as bike
INNER JOIN dbo.world_cities$ as world
ON bike.CITY = world.CITY;


--total bike counts between 15000 and 20000--
SELECT * FROM new 
WHERE BICYCLES BETWEEN 15000 and 20000;



