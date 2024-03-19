-- Hacker_rank 
--EASY, SQL BASIC 
--Problem 1
--Query all columns for all American cities in the CITY table with populations larger than 100000. 
--The CountryCode for America is USA.
--The CITY table is described as follows:

select*from CITY where population>100000 and countrycode="USA";

-- Problem 2
-- Query the NAME field for all American cities in the CITY table with populations larger than 120000. 
-- The CountryCode for America is USA.

select name from city where population>120000 and countrycode="USA";

--problem 3
--Query all columns (attributes) for every row in the CITY table.
select*from city;

--problem 4
-- Query all columns for a city in CITY with the ID 1661.
select*from city where id="1661";

--problem 5
--Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is JPN.
select*from city where countrycode="JPN";

--problem 6
--Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is JPN.
select name from city where countrycode="JPN";

--problem 7
-- Query a list of CITY and STATE from the STATION table.
select city,state as state_desc from station;

-- problem 8
-- Query a list of CITY names from STATION for cities that have an even ID number. 
-- Print the results in any order, 
-- but exclude duplicates from the answer.
select distinct city from station where id%2=0;

--problem 9
-- Find the difference between the total number of CITY entries in the table 
-- and the number of distinct CITY entries in the table.
select count(city)-count(distinct city)from station;

--problem 10 
-- Query the list of CITY names 
-- starting with vowels (i.e., a, e, i, o, or u) from STATION. 
-- Your result cannot contain duplicates.
select distinct city from station where left(city,1) in ('a','e','i','o','u');
--0r 
SELECT DISTINCT city 
FROM station WHERE city REGEXP '^[aeiouAEIOU]';
--or 



-- Problem 11
--Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
--Your result cannot contain duplicates.
select distinct city from station where right(city,1) in ('a','e','i','o', 'u');
--or
SELECT DISTINCT city 
FROM station WHERE city REGEXP '[aeiouAEIOU]$';


--problem 12
--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) 
--as both their first and last characters. 
--Your result cannot contain duplicates.
select distinct city from station where (left(city,1) in ('a','e','i','o','u') and
right(city,1) in ('a','e','i','o', 'u'));
-- or
SELECT DISTINCT city FROM station WHERE city REGEXP '^[aeiouAEIOU].*[aeiouAEIOU]$';

--problem 13
--Query the list of CITY names from STATION that do not start with vowels. 
--Your result cannot contain duplicates.
select distinct city from station where
left(city,1) not in ('a','e','i','o','u');
--or 
select distinct city from station where city not regexp '^[aeiou]';

--problem 14
--Query the list of CITY names from STATION that do not end with vowels. 
--Your result cannot contain duplicates.
select distinct city from station where
right(city,1) not in ('a','e','i','o','u');
--or
select distinct city from station where city not regexp '[aeiou]$';

--problem 15
--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. 
--Your result cannot contain duplicates.
select distinct city from station where (city not regexp '^[aeiou]' or city not regexp '[aeiou]$');