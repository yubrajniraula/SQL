-- Solution to The Report problem in HackerRank

-- tables: Students and Grades
-- task: 
        -- Omit names for grades < 8, replacing with "NULL".
        -- Sort by Grade (descending).
        -- For Grades 8-10:
            -- Sort names alphabetically.
        -- For Grades 1-7:
            -- Sort marks ascending.
-- Working Platform: MySQL, MS SQL Server

SELECT 
    CASE 
        WHEN g.grade < 8 THEN NULL
        ELSE s.name
    END AS Name,
    g.grade AS Grade, 
    s.marks AS Marks
FROM students s
JOIN grades g 
ON s.marks BETWEEN g.min_mark AND g.max_mark
ORDER BY 
    g.grade DESC,                 -- Primary ordering by grade in descending order
    s.name,                       -- Alphabetical order by name
    s.marks                       -- Ascending order by marks 
