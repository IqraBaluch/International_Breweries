SELECT DISTINCT COUNTRIES FROM International_Breweries


--1 Within the space of the last three years, what was the profit worth of the breweries, inclusive of 
-- the anglophone and the francophone territories

SELECT DISTINCT COUNTRIES, SUM(PROFIT) AS total_profit
FROM International_Breweries
GROUP BY COUNTRIES
ORDER BY total_profit;

-- 2.  Compare the total profit between these two territories in order for the territory manager, Mr.
-- Stone make strategic decision that will aid profit maximization in 2020.
SELECT YEARS, COUNTRIES, SUM(PROFIT) AS total_profit
FROM International_Breweries
GROUP BY YEARS, COUNTRIES
ORDER BY total_profit;



-- 3 Country that generated the highest profit in 2019

SELECT TOP 1 COUNTRIES, PROFIT, YEARS
FROM International_Breweries
WHERE YEARS = 2019 
ORDER BY PROFIT DESC;


-- 4 Help him find the year with the highest profit

SELECT TOP 1 YEARS, SUM(PROFIT) AS highest_profit
FROM International_Breweries
GROUP BY YEARS
ORDER BY highest_profit DESC;

--5 Which month in the three years were the least profit generated

SELECT TOP 1 MONTHS, YEARS, SUM(PROFIT) AS least_profit
FROM International_Breweries
WHERE YEARS IN(2017, 2018, 2019)
GROUP BY YEARS, MONTHS
ORDER BY least_profit ASC;



--6  What was the minimum profit in the month of December 2018?

SELECT MIN(PROFIT) AS min_profit
FROM International_Breweries
WHERE MONTHS = 'December' AND YEARS = 2018;

--7 Compare the profit in percentage for each of the month in 2019 
SELECT DISTINCT MONTHS, SUM(PROFIT) AS profit,
SUM(PROFIT) * 100/(SELECT SUM(PROFIT) FROM International_Breweries WHERE years = 2019) as profit_percentage2019_BY_month
FROM International_Breweries
WHERE YEARS =  '2019'
GROUP BY MONTHS
ORDER BY MONTHS ASC;

-- 8. Which particular brand generated the highest profit in Senegal?

SELECT DISTINCT BRANDS, SUM(PROFIT) AS profit
FROM International_Breweries
WHERE COUNTRIES = 'Senegal'
GROUP BY BRANDS
ORDER BY profit DESC

-- PART B BRAND ANALYSIS

--1. Within the last two years, the brand manager wants to know the top three brands consumed in 
--the francophone countries

SELECT TOP 3 BRANDS, SUM(QUANTITY) as quantity
FROM International_Breweries
WHERE YEARS IN (2018, 2017)
AND COUNTRIES IN('Senegal','Togo','Benin')
GROUP BY BRANDS
ORDER BY quantity DESC;


SELECT TOP 3 BRANDS, SUM(QUANTITY) as top_brands
FROM International_Breweries
WHERE COUNTRIES IN('Senegal','Togo','Benin')
	AND YEARS IN (2018, 2019)
GROUP BY BRANDS
ORDER BY top_brands;


-- 2. Find out the top two choice of consumer brands in Ghana

SELECT TOP 2 BRANDS, COUNT(BRANDS), SUM(QUANTITY) as choice
FROM International_Breweries
WHERE COUNTRIES = 'Ghana'
GROUP BY BRANDS
ORDER BY choice DESC;


-- 3. Find out the details of beers consumed in the past three years in the most oil reach country in 
-- West Africa.
SELECT DISTINCT YEARS, BRANDS, SUM(QUANTITY) as beers_consumed
FROM International_Breweries
WHERE COUNTRIES = 'Nigeria'
AND BRANDS NOT LIKE '%malt%'
GROUP BY BRANDS, YEARS
ORDER BY YEARS;

-- 4 Favorites malt brand in Anglophone region between 2018 and 2019 

SELECT DISTINCT BRANDS, YEARS, COUNTRIES
FROM International_Breweries
WHERE COUNTRIES IN('Ghana','Nigeria')
AND BRANDS like '%malt%'
AND YEARS IN(2018,2019);


-- 5.Which brands sold the highest in 2019 in Nigeria?
SELECT BRANDS, SUM(QUANTITY) as highest_sold_2019
FROM International_Breweries
WHERE YEARS = 2019 AND COUNTRIES = 'Nigeria'
GROUP BY BRANDS
ORDER BY highest_sold_2019 DESC;

-- 6. Favorites brand in South_South region in Nigeria

SELECT BRANDS,REGION, SUM(QUANTITY) as Favorites_brand
FROM International_Breweries
WHERE REGION = 'southsouth' AND COUNTRIES = 'Nigeria'
GROUP BY BRANDS, REGION
ORDER BY Favorites_brand DESC;

--7. Bear consumption in Nigeria
SELECT DISTINCT BRANDS
FROM International_Breweries
WHERE COUNTRIES = 'Nigeria' AND BRANDS NOT LIKE '%malt%';



--8. Level of consumption of Budweiser in the regions in Nigeria
SELECT BRANDS, REGION, SUM(QUANTITY) as consumption
FROM International_Breweries
WHERE COUNTRIES = 'Nigeria' AND BRANDS  = 'budweiser'
GROUP BY BRANDS, REGION
ORDER BY consumption;

--9. Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo)
SELECT BRANDS, YEARS, REGION, SUM(QUANTITY) as consumption_2019
FROM International_Breweries
WHERE YEARS = '2019' AND BRANDS = 'budweiser' AND COUNTRIES = 'Nigeria'
GROUP BY BRANDS, REGION, YEARS
ORDER BY consumption_2019;


-- C- COUNTRIES ANALYSIS
-- 1. Country with the highest consumption of beer
SELECT DISTINCT COUNTRIES, BRANDS, SUM(QUANTITY) as highest_consumption
FROM International_Breweries
GROUP BY COUNTRIES, BRANDS
ORDER BY highest_consumption DESC;

-- 2. Highest sales personnel of Budweiser in Senegal
SELECT TOP 1 SALES_REP, BRANDS, SUM(QUANTITY) AS  Highest_sales_personnel
FROM International_Breweries
WHERE COUNTRIES = 'Senegal' AND BRANDS = 'Budweiser'
GROUP BY SALES_REP, BRANDS
ORDER BY Highest_sales_personnel DESC;
-- 2
SELECT SALES_REP, BRANDS, SUM(QUANTITY) AS  Highest_sales_personnel
FROM International_Breweries
WHERE COUNTRIES = 'Senegal' AND BRANDS = 'Budweiser'
GROUP BY SALES_REP, BRANDS
ORDER BY Highest_sales_personnel DESC;


-- 3. Country with the highest profit of the fourth quarter in 2019

SELECT TOP 1 COUNTRIES, YEARS, MONTHS, SUM(PROFIT) as highest_profit 
FROM International_Breweries
WHERE YEARS = 2019 AND MONTHS IN('October','November', 'December')
GROUP BY COUNTRIES, YEARS, MONTHS
ORDER BY highest_profit DESC;