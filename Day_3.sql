-- problem 31
-- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths 
--(i.e.: number of characters in the name). 
-- If there is more than one smallest or largest city, 
-- choose the one that comes first when ordered alphabetically.
(select city, length(city) as name_length from station
order by name_length, city asc LIMIT 1)
UNION 
(select city, length(city) as name_length from station
order by name_length desc, city asc LIMIT 1);

--problem 32
-- Query the Western Longitude (LONG_W) for the largest Northern Latitude (LAT_N) in STATION 
--that is less than 137.2345. 
-- Round your answer to 4 decimal places.
select round(long_w,4) from station where lat_n<137.2345 order by lat_n desc limit 1;

--problem 33
-- Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780 . 
-- Round your answer to 4 decimal places.

select round(lat_n,4) from station where lat_n>38.7780 order by lat_n limit 1;

--problem 34
-- Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) in STATION 
-- is greater than 38.7780.
select round(long_w,4) from station where lat_n>38.7780 order by lat_n
limit 1;

--problem 35
-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities 
-- where the CONTINENT is 'Asia'.
-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
select sum(city.population) from city join country on city.countrycode=country.code where continent="Asia";

--problem 36
-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
--Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
select city.name from city join country on city.countrycode=country.code
where continent="Africa";

--problem 37
-- Given the CITY and COUNTRY tables, 
-- query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) 
-- rounded down to the nearest integer.
select country.continent, truncate(avg(city.population),0) from city join
country on city.countrycode=country.code group by country.continent;

-- important topics to be covered 
-- round(), floor(), truncate()

-- problem 38 
-- Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than 137.2345. 
-- Truncate your answer to 4 decimal places.


select truncate(lat_n,4) from station where lat_n<137.2345 order by lat_n desc limit 1;

--problem 39
-- Generate the following two result sets:

/* problem 40
Query an alphabetically ordered list of all names in OCCUPATIONS, 
immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, 
and output them in the following format:
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] 
is the lowercase occupation name.
If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.*/
SELECT CONCAT(Name,'(',LEFT(Occupation,1),')')
FROM OCCUPATIONS
ORDER BY Name ASC;

SELECT CONCAT ('There are a total of ',COUNT(Occupation),' ',LOWER(Occupation),'s.')
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(Occupation), Occupation;

/* problem 41
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
and displayed underneath its corresponding Occupation. 
The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
Note: Print NULL when there are no more names corresponding to an occupation.*/
select 
max(case when occupation = 'Doctor' then name else null end) as Doctor,
max(case when occupation = 'Professor' then name else null end) as Professor,
max(case when occupation = 'Singer' then name else null end) as Singer,
max(case when occupation = 'Actor' then name else null end) as Actor
from (select name, occupation,row_number() over (partition by occupation order by name) as row_n from occupations) as sub
group by sub.row_n;

/*problem 42
You are given a table, BST, containing two columns: N and P, 
where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.*/
select n, 
case 
 when p is null then "Root"
 when n in (select distinct p from bst) then "Inner"
 else "Leaf"
end
from BST order by n;

/* problem 43
Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy:
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

Note:

The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. 
For example, if the company_codes are C_1, C_2, and C_10, 
then the ascending company_codes will be C_1, C_10, and C_2.*/
SELECT 
    c.company_code, 
    c.founder, 
    COUNT(DISTINCT lm.lead_manager_code), 
    COUNT(DISTINCT sm.senior_manager_code), 
    COUNT(DISTINCT m.manager_code), 
    COUNT(DISTINCT e.employee_code)
FROM company c
JOIN  lead_manager lm ON c.company_code = lm.company_code
JOIN senior_manager sm ON lm.lead_manager_code = sm.lead_manager_code
JOIN manager m ON sm.senior_manager_code = m.senior_manager_code
JOIN  employee e ON e.manager_code = m.manager_code
GROUP BY c.founder, c.company_code
order by c.company_code;

/* problem 44

Consider p1(a,b) and p2(c,d) to be two points on a 2D plane.

a happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
b happens to equal the minimum value in Western Longitude (LONG_W in STATION).
c happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
d happens to equal the maximum value in Western Longitude (LONG_W in STATION).

Query the Manhattan Distance between points p1 and p2 and round it to a scale of 4 decimal places.*/

select round((max(lat_n)-min(lat_n))+(max(long_w)-min(long_w)),4)from station;

/* problem 45
Consider p1 and p2 to be two points on a 2D plane where (a,b)  
are the respective minimum and maximum values of Northern Latitude (LAT_N) and  
(c,d) are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
Query the Euclidean Distance between points p1 and p2 and format your answer to display 4 decimal digits.*/

select truncate( sqrt( pow(max(lat_n)-min(lat_n),2)+ pow(max(long_w)-min(long_w),2)),4)from station;










