############################## BASIC

############################
HOUSING

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
BILLBOARD

-- 1
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE "group" ILIKE '%elvis%'
        OR "artist" ILIKE '%elvis%'

-- 2
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%tony%'

--3
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE song_name ILIKE '%love%'

--4
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist LIKE 'A%'

--5

SELECT song_name
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1960 AND 1969 AND
  year_rank IN (1, 2, 3)

--6
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE 'Elvis %' OR
  artist ILIKE 'The Rolling Stones' OR
  artist ILIKE 'Van Halen'

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Van Halen', 'The Rolling Stones', 'Elvis Presley')

--7

SELECT "artist", COUNT(*)
  FROM tutorial.billboard_top_100_year_end
  GROUP BY "artist" ORDER BY COUNT(*) DESC
  LIMIT 3

--8

SELECT "artist", COUNT(*)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  GROUP BY "artist" ORDER BY COUNT(*) DESC

--9
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1970 AND
  year_rank BETWEEN 10 AND 20


--10
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year BETWEEN 1990 AND 1999
  AND NOT (artist = 'Madonna' AND year_rank BETWEEN 10 AND 100)

--11
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year = 1985
  AND "group" NOT ILIKE '%madonna%'
  AND "group" NOT ILIKE '%phil collins%'

--12
SELECT song_name
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1

--13
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IS NULL

--14
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%madonna%'
  ORDER BY year_rank

--15
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%madonna%'
  ORDER BY year, year_rank

--16
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1990 AND year_rank IN (1, 2, 3)
  ORDER BY year_rank, year

############################## INTERMEDIATE

############################
-- BILLBOARD

--1
SELECT MIN(year_rank)
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%phil collins%'

--2
SELECT AVG(year_rank)
  FROM tutorial.billboard_top_100_year_end
  WHERE artist ILIKE '%michael jackson%'

--3
SELECT AVG(year_rank)
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 10 AND
   artist ILIKE '%madonna%'

--4
SELECT artist, COUNT(*) AS count
  FROM tutorial.billboard_top_100_year_end
  WHERE year >= 1985
  GROUP BY artist
  ORDER BY COUNT(*) DESC
  LIMIT 10

--5
SELECT artist, COUNT(*) AS count
  FROM tutorial.billboard_top_100_year_end
  WHERE artist IN ('Elvis Presley', 'Madonna', 'Beatles', 'Elton John')
  AND year_rank <= 10
  GROUP BY artist

############################
-- APPLE
-- date  year  month open  high  low close volume  id

-- 1
SELECT *
  FROM tutorial.aapl_historical_stock_price
  WHERE high - low > 5

-- 2
SELECT MAX (high - low)
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012

-- 3
SELECT AVG(((high + low) / 2))
  FROM tutorial.aapl_historical_stock_price
  WHERE volume > 10000000 

-- 4
SELECT COUNT(date), month
  FROM tutorial.aapl_historical_stock_price
  WHERE year = 2012
  GROUP BY month
  ORDER BY month -- optional

-- 5
SELECT MAX(high), year
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year
  ORDER BY year -- optional

-- 6
SELECT AVG((high + low) / 2) AS price, AVG(volume) AS volume, month
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  ORDER BY month

-- 7
SELECT AVG((high + low) / 2) AS price, month, year
  FROM tutorial.aapl_historical_stock_price
  GROUP BY year, month
  ORDER BY year DESC, month ASC

--8
SELECT AVG((high + low) / 2) AS price
  FROM tutorial.aapl_historical_stock_price
WHERE volume > 25000000

--9
SELECT AVG(volume) AS volume, AVG((low + high) /2) AS average, month
  FROM tutorial.aapl_historical_stock_price
  GROUP BY month
  HAVING AVG(volume) > 10000000
  ORDER BY month

--10
SELECT MAX(high) AS highest, MIN(low) AS lowest, year
  FROM tutorial.aapl_historical_stock_price
  WHERE year BETWEEN 2005 AND 2010
  GROUP BY year
  ORDER BY year

--11

--12