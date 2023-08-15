-- 1. Create a database called house_price_regression.

create database house_price_regression;

-- 2. Create a table house_price_data with the same columns as given in the csv file.

CREATE TABLE house_price_data (
  id bigint,
  date DATE,
  bedrooms bigint,
  bathrooms FLOAT,
  sqft_living bigint,
  sqft_lot bigint,
  floors FLOAT,
  waterfront bigint,
  view bigint,
  `condition` bigint,
  grade bigint,
  sqft_above bigint,
  sqft_basement bigint,
  yr_built bigint,
  yr_renovated bigint,
  zipcode bigint,
  lat FLOAT,
  `long` FLOAT,
  sqft_living15 bigint,
  sqft_lot15 bigint,
  price bigint
 );


-- 3. Import the data from the csv file into the table

SHOW VARIABLES LIKE 'secure_file_priv';
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;


-- 4. Select all the data from table house_price_data to check if the data was imported correctly

SELECT *
FROM house_price_data;

-- 5. Use the alter table command to drop the column date from the database

alter table house_price_data
drop column date;

-- 6. Use sql query to find how many rows of data you have.

select count(*) as row_count
from house_price_data;

-- 7. Now we will try to find the unique values in some of the categorical columns:

-- What are the unique values in the column bedrooms?
SELECT DISTINCT bedrooms FROM house_price_data;
-- What are the unique values in the column bathrooms?
SELECT DISTINCT bathrooms FROM house_price_data;
-- What are the unique values in the column floors?
SELECT DISTINCT floors FROM house_price_data;
-- What are the unique values in the column condition?
SELECT DISTINCT `condition` FROM house_price_data;
-- What are the unique values in the column grade?
SELECT DISTINCT grade FROM house_price_data;

-- 8. Data arrenged in a decreasing order by the price of the house. Only returned the IDs of the top 10 most expensive houses in your data.

select id
from house_price_data
order by price desc
limit 10;

-- 9. What is the average price of all the properties in the data?

select avg(price) as average_price
from house_price_data;

-- 10. In this exercise we will use simple group by to check the properties of some of the categorical variables in our data

-- What is the average price of the houses grouped by bedrooms?
SELECT bedrooms, AVG(price) AS average_price
FROM house_price_data
GROUP BY bedrooms;
-- What is the average sqft_living of the houses grouped by bedrooms?
SELECT bedrooms, AVG(sqft_living) AS average_sqft_living
FROM house_price_data
GROUP BY bedrooms;
-- What is the average price of the houses with a waterfront and without a waterfront?
SELECT waterfront, AVG(price) AS average_price
FROM house_price_data
GROUP BY waterfront;
-- Is there any correlation between the columns condition and grade?
SELECT `condition`, AVG(grade) AS average_grade
FROM house_price_data
GROUP BY `condition`
ORDER BY `condition`;

-- we can see that the average grade increases from condition level 1 to 3, but then there is a slight drop for condition levels 4 and 5. 
-- This indicates a complex relationship between the columns condition and grade, and the correlation is not strictly linear.


-- 11. One of the customers is only interested in the following houses:
	-- Number of bedrooms either 3 or 4
    -- Bathrooms more than 3
    -- One Floor
    -- No waterfront
    -- Condition should be 3 at least
    -- Grade should be 5 at least
    -- Price less than 300000

select *
from house_price_data
where (bedrooms = 3 or bedrooms = 4)
  and bathrooms > 3
  and floors = 1
  and waterfront = 0
  and `condition` >= 3
  and grade >= 5
  and price < 300000;
  
  
-- 12. manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database.

SELECT *
FROM house_price_data
WHERE price > (SELECT AVG(price) * 2 FROM house_price_data)
order by price;

-- 13.  create a view of the same query.

 CREATE VIEW expensive_properties AS
 SELECT *
 FROM house_price_data
 WHERE price > (SELECT AVG(price) * 2 FROM house_price_data);

-- 14. What is the difference in average prices of the properties with three and four bedrooms?

SELECT
    AVG(CASE WHEN bedrooms = 3 THEN price END) AS avg_price_3_bedrooms, -- The CASE statement is used to filter properties with three and four bedrooms separately.
    AVG(CASE WHEN bedrooms = 4 THEN price END) AS avg_price_4_bedrooms,
    ABS(AVG(CASE WHEN bedrooms = 3 THEN price END) - AVG(CASE WHEN bedrooms = 4 THEN price END)) AS price_difference -- The ABS() function is used to get the absolute value of the price difference, so it will be a positive value regardless of which average is higher.
FROM
    house_price_data
WHERE
    bedrooms IN (3, 4);
    

-- 15. What are the different locations where properties are available in your database?

select distinct zipcode
from house_price_data;

-- 16. List of all the properties that were renovated.

select *
from house_price_data
where yr_renovated > 0;

-- 17. Details of the property that is the 11th most expensive property in your database.

select *
from house_price_data
order by price desc
LIMIT 1 OFFSET 10; -- The LIMIT 1 OFFSET 10 part selects one row starting from the 11th row (OFFSET 10) in the sorted result, which corresponds to the 11th most expensive property.





















