# Student Marks Analysis Using SQL

## Project Overview
This project analyzes student marks using MySQL. It helps identify student performance, calculate average marks, and compare academic performance across subjects and departments.

## Tools Used
- MySQL
- SQL

## Dataset
The dataset contains 15 records with the following columns:
- Student_ID
- Name
- Subject
- Marks
- Department

## SQL Concepts Used
- SELECT
- WHERE
- ORDER BY
- Aggregate Functions (AVG, MAX, MIN, COUNT)
- GROUP BY
- DISTINCT

## Analysis Performed
1. Displayed all student records.
2. Identified students who scored more than 80 marks.
3. Sorted student marks in descending order.
4. Calculated overall average marks.
5. Identified the highest and lowest marks.
6. Calculated average marks by subject.
7. Compared average marks across departments.
8. Counted unique students in each subject.

## Key Findings
- Total records: 15
- Unique students: 5
- Overall average marks: 80.4
- Highest mark: 95
- Lowest mark: 60
- Highest subject average: Science (83)
- Lowest subject average: Maths (78)
- CSE average marks: 86
- ECE average marks: 72

## Project Structure
```text
student-marks-analysis/
├── dataset/
│   ├── README.md
│   └── student_marks.csv
├── sql/
│   └── student_analysis.sql
└── README.md
```

## Conclusion
This project demonstrates basic SQL data analysis skills by examining student marks, comparing subject averages, and evaluating department performance.
