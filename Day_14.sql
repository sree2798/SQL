/*
Table: Salaries

+-------------+---------+ 
| Column Name | Type    | 
+-------------+---------+ 
| emp_name    | varchar | 
| department  | varchar | 
| salary      | int     |
+-------------+---------+
(emp_name, department) is the primary key (combination of unique values) for this table.
Each row of this table contains emp_name, department and salary. There will be at least one entry for the engineering and marketing departments.
Write a solution to calculate the difference between the highest salaries in the marketing and engineering department. Output the absolute difference in salaries.

Return the result table.

The result format is in the following example.

 

Example 1:

Input: 
Salaries table:
+----------+-------------+--------+
| emp_name | department  | salary |
+----------+-------------+--------+
| Kathy    | Engineering | 50000  |
| Roy      | Marketing   | 30000  |
| Charles  | Engineering | 45000  |
| Jack     | Engineering | 85000  | 
| Benjamin | Marketing   | 34000  |
| Anthony  | Marketing   | 42000  |
| Edward   | Engineering | 102000 |
| Terry    | Engineering | 44000  |
| Evelyn   | Marketing   | 53000  |
| Arthur   | Engineering | 32000  |
+----------+-------------+--------+
Output: 
+-------------------+
| salary_difference | 
+-------------------+
| 49000             | 
+-------------------+
Explanation: 
- The Engineering and Marketing departments have the highest salaries of 102,000 and 53,000, respectively.
 Resulting in an absolute difference of 49,000.*/
select ( abs((select max(salary) from salaries group by department
having department = "Engineering")
-
(select max(salary) from salaries group by department
having department = "Marketing"))) as salary_difference;

/*
Table: Users

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| user_id     | int     |
| name        | varchar |
+-------------+---------+
user_id is the column with unique values for this table.
Each row of this table contains user id and name.
Table: Rides

+--------------+------+
| Column Name  | Type |
+--------------+------+
| ride_id      | int  |
| user_id      | int  | 
| distance     | int  |
+--------------+------+
ride_id is the column of unique values for this table.
Each row of this table contains ride id, user id, and traveled distance.
Write a solution to calculate the distance traveled by each user. If there is a user who hasn't completed any rides, then their distance should be considered as 0. Output the user_id, name and total traveled distance.

Return the result table ordered by user_id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Users table:
+---------+---------+
| user_id | name    |
+---------+---------+
| 17      | Addison |
| 14      | Ethan   |
| 4       | Michael |
| 2       | Avery   |
| 10      | Eleanor |
+---------+---------+
Rides table:
+---------+---------+----------+
| ride_id | user_id | distance |
+---------+---------+----------+
| 72      | 17      | 160      |
| 42      | 14      | 161      |
| 45      | 4       | 59       |
| 32      | 2       | 197      |
| 15      | 4       | 357      |
| 56      | 2       | 196      |
| 10      | 14      | 25       |
+---------+---------+----------+
Output: 
+---------+---------+-------------------+
| user_id | name    | traveled distance |
+---------+---------+-------------------+
| 2       | Avery   | 393               |
| 4       | Michael | 416               |
| 10      | Eleanor | 0                 |
| 14      | Ethan   | 186               |
| 17      | Addison | 160               |
+---------+---------+-------------------+
Explanation: 
-  User id 2 completed two journeys of 197 and 196, resulting in a combined travel distance of 393.
-  User id 4 completed two journeys of 59 and 357, resulting in a combined travel distance of 416.
-  User id 14 completed two journeys of 161 and 25, resulting in a combined travel distance of 186.
-  User id 16 completed only one journey of 160.
-  User id 10 did not complete any journeys, thus the total travel distance remains at 0.
Returning the table orderd by user_id in ascending order.
*/
select u.user_id, u.name, 
coalesce(sum(r.distance),0)as `traveled distance` from Users u left join 
Rides r on u.user_id=r.user_id group by u.user_id order by 
user_id asc;
/*
