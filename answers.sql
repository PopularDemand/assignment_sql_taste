year  month month_name  south west  midwest northeast

-- 1
SELECT *
  FROM tutorial.us_housing_units
  LIMIT 10

-- 2
SELECT midwest
  FROM tutorial.us_housing_units

-- 3
SELECT south, west, midwest, northeast
  FROM tutorial.us_housing_units
  WHERE month = 12 AND year >= 1985

-- 4
SELECT south, west, midwest, northeast
  FROM tutorial.us_housing_units
  WHERE month > 6 AND year >= 1990

-- 5
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > 30

-- 6
SELECT year, month, month_name,
       south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units

-- 7
SELECT year, month, month_name,
       south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast > 70

-- 8
SELECT year, month, month_name,
       south + west + midwest + northeast AS total
  FROM tutorial.us_housing_units
  WHERE south + west + midwest + northeast BETWEEN 50 AND 80

-- 9
SELECT year, month, month_name,
       (south + west + midwest + northeast) / 4 AS average
  FROM tutorial.us_housing_units

-- 10
SELECT *
  FROM tutorial.us_housing_units
  WHERE south > (west + northeast + midwest)

-- 11
SELECT
  west / (west + south + midwest + northeast) AS west_percentage,
  south / (west + south + midwest + northeast) AS south_percentage,
  midwest / (west + south + midwest + northeast) AS midwest_percentage,
  northeast / (west + south + midwest + northeast) AS northeast_percentage
  FROM tutorial.us_housing_units
  WHERE year >= 1990


############################
-- BILLBOARD TOP 100

-- 1
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%elvis%'
        OR "artist" ILIKE '%elvis%'
