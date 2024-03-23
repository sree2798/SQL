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










