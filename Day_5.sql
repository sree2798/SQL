-- problem 46 
/*A median is defined as a number separating the higher half of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N) from STATION and round your answer to  decimal places.*/

select round((k),4) from (
select Lat_n as k, 
 row_number()over(order by lat_n asc) as rn
 ,count(1)over() as n
 from station group by lat_n
order by Lat_n asc)
kkk
where rn between (n/2) and ((n/2)+1)

-- problem 47
/* Ketty gives Eve a task to generate a report containing three columns: 
Name, Grade and Mark. 
Ketty doesn't want the NAMES of those students who received a grade lower than 8. 
The report must be in descending order by grade -- i.e. higher grades are entered first. 
If there is more than one student with the same grade (8-10) assigned to them, 
order those particular students by their name alphabetically. 
inally, if the grade is lower than 8, use "NULL" as their name and list them by their grades in descending order. 
If there is more than one student with the same grade (1-7) assigned to them, 
order those particular students by their marks in ascending order.
Write a query to help Eve.*/
select
case 
when g.grade>=8 then s.name
else NULL 
end as name, g.grade,s.marks
from students s join grades g on s.marks between g.min_mark and g.max_mark order by g.grade desc, s.name asc;

--problem 48
/*Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.*/

select h.hacker_id, h.name from hackers h 
join submissions s on s.hacker_id=h.hacker_id
join challenges c on c.challenge_id=s.challenge_id
join difficulty d on c.difficulty_level=d.difficulty_level
where d.score=s.score
group by h.hacker_id,h.name having count(c.challenge_id)>1 order by count(c.challenge_id) desc , h.hacker_id asc;


--problem 49
/*Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. 
Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
Input Format
The following tables contain data on the wands in Ollivander's inventory:
Wands: The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is).*/

select w.id, p.age, w.coins_needed, w.power as power1 from wands w

join Wands_Property p on p.code = w.code

where p.is_evil = '0'

and w.coins_needed in

(select min(w1.coins_needed) from wands w1

join Wands_Property p1 on w1.code = p1.code

where p.age = p1.age

and w.power = w1.power)

ORDER BY w.power DESC, p.age DESC;

/*problem 50*/
/*Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.*/
WITH ChallengeCounts AS (
    SELECT
        h.hacker_id,
        h.name,
        COUNT(c.challenge_id) AS NumChallenges
    FROM Hackers h
    JOIN Challenges c ON h.hacker_id = c.hacker_id
    GROUP BY h.hacker_id, h.name
),
MaxChallengeCount AS (
    SELECT MAX(NumChallenges) AS MaxNumChallenges
    FROM ChallengeCounts
),
NonUniqueCounts AS (
    SELECT NumChallenges
    FROM ChallengeCounts
    GROUP BY NumChallenges
    HAVING COUNT(*) > 1 AND NumChallenges < (SELECT MaxNumChallenges FROM MaxChallengeCount)
)
SELECT
    cc.hacker_id,
    cc.name,
    cc.NumChallenges
FROM ChallengeCounts cc
WHERE cc.NumChallenges NOT IN (SELECT NumChallenges FROM NonUniqueCounts)
ORDER BY cc.NumChallenges DESC, cc.hacker_id;

