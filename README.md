# SQL
This repository contains my SQL exposure and my hands-on with SQL problems from various platforms

19th March - I started off to practice basic SQL queries to refresh my basics in SQL 

20th March - Practiced few more queries on hackerrank

Learnt new functions like substring(), replace(), truncate(), round(), avg(), count(), sum()

Got familiar with  CASE statement syntax and learnt how to write conditions using CASE statement 

21st march - Went through theory concepts on how subqueries work and learnt about virtual tables 

22nd march - got hands on with functions such as round(), floor(), truncate() and understood how they are different
from each other after seeing a couple of failed test cases 

23rd march- leveled up to medium level problems on hackerrank and got hands dirty with concepts like 

window functions such as rank(), dense_rank(), row_number()

learnt the syntax of the above function

Joins and functions such as sqrt(), pow()

25th march:
learnt CTEs and how to use them in panning out complex queries , it was a rough patch but I managed to understand things

26th , got confident on using CTEs and Sub queries with some of the best problems in hackerrank medium level

learnt about lead() and lag() functions and how do they help to access the consecutive row values 


27th - Spent the whole time today on single hard level problem from hackerrank. the problem mainly
focused on Joins, Subquery, Group by, Having

28th - started doing leetcode easy level problems , learnt how to 

29th- SQL 50  interview list

April 15th - after a rough week (literally went broke and stopped having sleep and food on time), 

I gathered myself together and did couple pf leetcode problems on self join.

April 18th - back to the track and did 5 leetcode problems. learnt coalesce() function and how it replaces "null" with zeros 

substring_index() opened my eyes really wide today

GROUP_CONCAT() solved all my confusion while using group by()

Also, learnt about using 
MATCH  column_name  AGAINST ('+keyword  +keyword' IN BOOLEAN MODE)  in   WHERE conditions
(this is for searching for different keywords in the content of a single row)

April 20th - realized that if we don't use ` ` in aliases while using joins, there is a chance that these names 
are detected by mysql  as table names that are to be used to joins

Also, I learnt how to use CAST() function to change the data type of a column and cast as a required data type

And, when I am trying to write queries with CTE, I am often confused with the syntax. just faced a run time errror for a simple problem using CTE s



April 20th, - One more concept I learned today was, when using Group By() and we are grouping on the basis of a column ,
if the corresponding values in another column are integers, we can compare those values and extract minimum or maximum. 
After extracting the maximum or minimum,we can compare the minimum or maximum to a value to check a condition. 


Also, when I am trying to compare the values of a column with the values of another column in the same table , 
it is not always mandatory to use self join , we can us the IN operator and a Subquery (refer to the problem 
"Employees whose managers left the company"


few problems on date time functions and also timestampdiff() function, need to invest time on this and understand 
learn to write conditions using time stamps correctly

after a rough patch of 3 days with no github contributions, started again doing the rest of the leetcode easy level problems

April 27th - Learnt about IFNULL() function and how it can replace null value with a numerical value, had a rough patch of 5 wrong submissions 
just because I am not aware of this function. 

April 30th - Learnt how to use CASE statement while using group by to filter values in each single group

learnt how to use procedures and their syntax. solved a leetcode problem using procedures. 

DATEFORMAT() function to format the date into required format

applied the concept of running scores using sum() over function while solving game play analysis 3 problem

DATEDIFF() function to find the difference between two dates , difference is 1 if the first date is greater than second date 
difference is -1 if the first date is less than second date 

learnt and got clarity on the rank() function in MySQL, particularly on the partition by syntax, earlier i was skeptical on this

learnt about dayofweek() function while solving a leetcode problem

DATE_SUB() function, 
let's take a closer look at this, DATE_SUB("2024-05-05",INTERVAL 10 DAY)
this function essentially subtracts the interval from the given date and returns the final date, in this case, the final date would be 
"2024-04-25"
similar flavours of this function:
DATE_SUB("2023-06-15 10:34:28", INTERVAL 15 MINUTE)
output: "2023-06-15 10:19:28"
DATE_SUB("2023-06-15", INTERVAL -2 MONTH)
output: "2023-08-15"
