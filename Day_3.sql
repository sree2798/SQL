/*-- problem 31
-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
--(i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, 
-- choose the one that comes first when ordered alphabetically.*/
(select city, length(city) as name_length from station
order by name_length, city asc LIMIT 1)
UNION 
(select city, length(city) as name_length from station
order by name_length desc, city asc LIMIT 1);

/*--problem 32
-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION 
--that is less than 137.2345. 
-- Round your answer to 4 decimal places.*/
select round(long_w,4) from station where lat_n<137.2345 order by lat_n desc limit 1;

/*--problem 33
-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 . 
-- Round your answer to 4 decimal places.*/

select round(lat_n,4) from station where lat_n>38.7780 order by lat_n limit 1;

/*--problem 34
-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION 
-- is greater than 38.7780.*/
select round(long_w,4) from station where lat_n>38.7780 order by lat_n
limit 1;

/*--problem 35
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities 
-- where the CONTINENT is 'Asia'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
select sum(city.population) from city join country on city.countrycode=country.code where continent="Asia";

/*--problem 36
-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.*/
select city.name from city join country on city.countrycode=country.code
where continent="Africa";

/*--problem 37
-- Given the CITY and COUNTRY tables, 
-- query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) 
-- rounded down to the nearest integer.*/
select country.continent, truncate(avg(city.population),0) from city join
country on city.countrycode=country.code group by country.continent;

/*-- important topics to be covered 
-- round(), floor(), truncate()

-- problem 38 
-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
-- Truncate your answer to 4 decimal places.*/


select truncate(lat_n,4) from station where lat_n<137.2345 order by lat_n desc limit 1;











