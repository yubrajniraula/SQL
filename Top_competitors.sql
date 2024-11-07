-- Solution to Top Competitors problem in HackerRank

-- tables: hackers, difficulty, challenges, submissions
-- task: find respective hacker_id and name of hackers who achieved full scores for more than one challenge
-- Working Platform: MySQL, MS SQL Server

select h.hacker_id, h.name
from hackers h
join submissions s on h.hacker_id = s.hacker_id
join challenges c on s.challenge_id = c.challenge_id
join difficulty d on c.difficulty_level = d.difficulty_level
where s.score = d.score
group by h.hacker_id, h.name
having count(s.hacker_id) > 1
order by count(s.hacker_id) desc, h.hacker_id;
