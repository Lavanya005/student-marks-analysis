-- ============================================================
-- PROJECT: STUDENT MARKS ANALYSIS
-- TOOLS: Excel, MySQL, GitHub
-- DATABASE: student_analysis
-- TABLE: student_marks
--
-- OBJECTIVE:
-- Analyze student performance, calculate subject averages,
-- compare department results, and identify top scores.
-- ============================================================


-- ============================================================
-- STEP 1: ENABLE LOCAL INFILE
-- PURPOSE: Allow MySQL to import data from a local CSV file.
-- Run this command in MySQL before importing the dataset.
-- ============================================================

SET GLOBAL local_infile = 1;

-- Exit the MySQL client if necessary:
-- EXIT;

-- Restart the MySQL command-line client from Windows CMD:
-- mysql --local-infile=1 -u root -p


-- ============================================================
-- STEP 2: SELECT THE EXISTING PRACTICE DATABASE
-- PURPOSE: Select the practice database as in the original
-- setup. The project will use a separate database below.
-- ============================================================

USE practice;


-- ============================================================
-- STEP 3: CREATE AND SELECT THE PROJECT DATABASE
-- PURPOSE: Create a separate database for Student Marks Analysis.
-- ============================================================

CREATE DATABASE student_analysis;

USE student_analysis;


-- ============================================================
-- STEP 4: CREATE THE STUDENT MARKS TABLE
-- PURPOSE: Store student IDs, names, subjects, marks,
-- and department information.
-- ============================================================

CREATE TABLE student_marks (
    Student_ID INT,
    Name VARCHAR(50),
    Subject VARCHAR(30),
    Marks INT,
    Department VARCHAR(20)
);


-- ============================================================
-- STEP 5: IMPORT DATA FROM CSV
-- FILE: student_marks.csv
-- PURPOSE: Import 15 student-subject records into the table.
-- NOTE: Change the file path if your CSV is stored elsewhere.
-- ============================================================

LOAD DATA LOCAL INFILE
'C:/Users/Lavanya/Desktop/github_prj/prj1/student_marks.csv'
INTO TABLE student_marks
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;


-- ============================================================
-- TASK 1: DISPLAY ALL STUDENT RECORDS
-- PURPOSE: View all records imported into the table.
-- RESULT: 15 records.
-- ============================================================

SELECT *
FROM student_marks;

-- OUTPUT:
-- +------------+-------+---------+-------+------------+
-- | Student_ID | Name  | Subject | Marks | Department |
-- +------------+-------+---------+-------+------------+
-- |        101 | Anu   | Maths   |    85 | CSE        |
-- |        102 | Banu  | Maths   |    72 | ECE        |
-- |        103 | Priya | Maths   |    90 | CSE        |
-- |        104 | Ravi  | Maths   |    65 | ECE        |
-- |        105 | Divya | Maths   |    78 | CSE        |
-- |        101 | Anu   | Science |    88 | CSE        |
-- |        102 | Banu  | Science |    80 | ECE        |
-- |        103 | Priya | Science |    95 | CSE        |
-- |        104 | Ravi  | Science |    70 | ECE        |
-- |        105 | Divya | Science |    82 | CSE        |
-- |        101 | Anu   | English |    76 | CSE        |
-- |        102 | Banu  | English |    85 | ECE        |
-- |        103 | Priya | English |    89 | CSE        |
-- |        104 | Ravi  | English |    60 | ECE        |
-- |        105 | Divya | English |    91 | CSE        |
-- +------------+-------+---------+-------+------------+
-- 15 rows in set.


-- ============================================================
-- TASK 2: FIND RECORDS WITH MARKS ABOVE 80
-- PURPOSE: Identify records where marks are greater than 80.
-- RESULT: 8 records.
-- ============================================================

SELECT *
FROM student_marks
WHERE Marks > 80;

-- OUTPUT:
-- Anu   | Maths   | 85 | CSE
-- Priya | Maths   | 90 | CSE
-- Anu   | Science | 88 | CSE
-- Priya | Science | 95 | CSE
-- Divya | Science | 82 | CSE
-- Banu  | English | 85 | ECE
-- Priya | English | 89 | CSE
-- Divya | English | 91 | CSE


-- ============================================================
-- TASK 3: SORT MARKS FROM HIGHEST TO LOWEST
-- PURPOSE: Display records in descending order of marks.
-- RESULT: Highest = 95; Lowest = 60.
-- ============================================================

SELECT *
FROM student_marks
ORDER BY Marks DESC;

-- OUTPUT SUMMARY:
-- Priya | Science | 95
-- Divya | English | 91
-- Priya | Maths   | 90
-- Priya | English | 89
-- Anu   | Science | 88
-- Anu   | Maths   | 85
-- Banu  | English | 85
-- Divya | Science | 82
-- Banu  | Science | 80
-- Divya | Maths   | 78
-- Anu   | English | 76
-- Banu  | Maths   | 72
-- Ravi  | Science | 70
-- Ravi  | Maths   | 65
-- Ravi  | English | 60


-- ============================================================
-- TASK 4: CALCULATE OVERALL AVERAGE MARKS
-- PURPOSE: Find the average across all 15 records.
-- RESULT: Average marks = 80.4000.
-- ============================================================

SELECT AVG(Marks) AS Average_Marks
FROM student_marks;

-- OUTPUT:
-- +---------------+
-- | Average_Marks |
-- +---------------+
-- |       80.4000 |
-- +---------------+


-- ============================================================
-- TASK 5: FIND HIGHEST AND LOWEST MARKS
-- PURPOSE: Identify the maximum and minimum marks.
-- RESULT: Highest = 95; Lowest = 60.
-- ============================================================

SELECT
    MAX(Marks) AS Highest_Mark,
    MIN(Marks) AS Lowest_Mark
FROM student_marks;

-- OUTPUT:
-- +--------------+-------------+
-- | Highest_Mark | Lowest_Mark |
-- +--------------+-------------+
-- |           95 |          60 |
-- +--------------+-------------+


-- ============================================================
-- TASK 6: COUNT RECORDS BY DEPARTMENT
-- PURPOSE: Count student-subject records in each department.
-- RESULT: CSE = 9; ECE = 6.
-- NOTE: This counts records, not distinct students.
-- ============================================================

SELECT
    Department,
    COUNT(*) AS Total_Records
FROM student_marks
GROUP BY Department;

-- OUTPUT:
-- +------------+---------------+
-- | Department | Total_Records |
-- +------------+---------------+
-- | CSE        |             9 |
-- | ECE        |             6 |
-- +------------+---------------+


-- ============================================================
-- TASK 7: CALCULATE AVERAGE MARKS FOR EACH SUBJECT
-- PURPOSE: Compare average marks across subjects.
-- RESULT:
-- Maths   = 78.0000
-- Science = 83.0000
-- English = 80.2000
-- HIGHEST SUBJECT AVERAGE: Science.
-- LOWEST SUBJECT AVERAGE: Maths.
-- ============================================================

SELECT
    Subject,
    AVG(Marks) AS Average_Marks
FROM student_marks
GROUP BY Subject;

-- OUTPUT:
-- +---------+---------------+
-- | Subject | Average_Marks |
-- +---------+---------------+
-- | Maths   |       78.0000 |
-- | Science |       83.0000 |
-- | English |       80.2000 |
-- +---------+---------------+


-- ============================================================
-- TASK 8: FIND RECORDS WITH MARKS OF 75 OR MORE
-- PURPOSE: Identify records where marks are >= 75.
-- RESULT: 11 records.
-- CORRECTION: The original query used Marks > 75.
-- The project requirement says 75 or more, so >= 75 is correct.
-- ============================================================

SELECT *
FROM student_marks
WHERE Marks >= 75;

-- OUTPUT SUMMARY:
-- Anu   | Maths   | 85 | CSE
-- Priya | Maths   | 90 | CSE
-- Divya | Maths   | 78 | CSE
-- Anu   | Science | 88 | CSE
-- Banu  | Science | 80 | ECE
-- Priya | Science | 95 | CSE
-- Divya | Science | 82 | CSE
-- Anu   | English | 76 | CSE
-- Banu  | English | 85 | ECE
-- Priya | English | 89 | CSE
-- Divya | English | 91 | CSE


-- ============================================================
-- TASK 9: CALCULATE AVERAGE MARKS BY DEPARTMENT
-- PURPOSE: Compare average performance between departments.
-- RESULT: CSE = 86.0000; ECE = 72.0000.
-- ============================================================

SELECT
    Department,
    AVG(Marks) AS Department_Marks
FROM student_marks
GROUP BY Department;

-- OUTPUT:
-- +------------+------------------+
-- | Department | Department_Marks |
-- +------------+------------------+
-- | CSE        |          86.0000 |
-- | ECE        |          72.0000 |
-- +------------+------------------+


-- ============================================================
-- TASK 10: COUNT DISTINCT STUDENTS BY SUBJECT
-- PURPOSE: Count unique students with marks in each subject.
-- RESULT: 5 students per subject.
-- ============================================================

SELECT
    Subject,
    COUNT(DISTINCT Student_ID) AS Total_Students
FROM student_marks
GROUP BY Subject;

-- OUTPUT:
-- +---------+---------------+
-- | Subject | Total_Students|
-- +---------+---------------+
-- | English |             5 |
-- | Maths   |             5 |
-- | Science |             5 |
-- +---------+---------------+


-- ============================================================
-- ADDITIONAL ANALYSIS: COUNT DISTINCT STUDENTS IN THE DATASET
-- PURPOSE: Identify the number of unique students.
-- RESULT: 5 distinct students.
-- ============================================================

SELECT COUNT(DISTINCT Student_ID) AS Total_Students
FROM student_marks;


-- ============================================================
-- PROJECT FINDINGS
--
-- 1. Science has the highest subject average: 83.00.
-- 2. Maths has the lowest subject average: 78.00.
-- 3. Priya achieved the highest individual score: 95 in Science.
-- 4. CSE average = 86.00; ECE average = 72.00.
--    CSE's average is 14 marks higher than ECE's.
-- 5. The dataset contains 5 distinct students.
--
-- ADDITIONAL FINDINGS:
-- Overall average marks = 80.40.
-- Highest mark = 95.
-- Lowest mark = 60.
-- CSE contains 9 records; ECE contains 6 records.
-- Each subject contains marks for 5 distinct students.
-- ============================================================


-- ============================================================
-- END OF STUDENT MARKS ANALYSIS PROJECT
-- ============================================================
