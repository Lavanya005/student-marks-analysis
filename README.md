# Student Marks Analysis Using SQL

## Project Overview
This project analyzes student marks using MySQL to understand student performance, calculate subject averages, and compare results across departments.

## Objective
- Analyze student marks using SQL queries.
- Identify the highest and lowest marks.
- Compare average marks by subject and department.
- Summarize the results using data analysis.

## Tools Used
- Microsoft Excel
- MySQL
- GitHub

## Dataset Description
The dataset contains 15 records representing 5 students across 3 subjects.

**Columns:**
- `Student_ID`
- `Name`
- `Subject`
- `Marks`
- `Department`

## SQL Concepts Used
- SELECT
- WHERE
- ORDER BY
- Aggregate Functions: AVG, MAX, MIN, COUNT
- GROUP BY
- DISTINCT

## Analysis Performed
1. Displayed all student records.
2. Identified students who scored more than 80 marks.
3. Sorted marks from highest to lowest.
4. Calculated overall average marks.
5. Identified the highest and lowest marks.
6. Calculated average marks for each subject.
7. Compared average marks across departments.
8. Identified students who scored 75 or more.
9. Counted distinct students in each subject.

## Key Findings
1. **Overall Average:** 80.4 marks.
2. **Highest Mark:** 95, scored by Priya in Science.
3. **Lowest Mark:** 60, scored by Ravi in English.
4. **Highest Subject Average:** Science, with 83 marks.
5. **Lowest Subject Average:** Maths, with 78 marks.
6. **Department Comparison:** CSE averaged 86 marks, while ECE averaged 72 marks.
7. **Student Count:** 5 distinct students across 3 subjects.

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
This project demonstrates the use of SQL for data analysis, including filtering, sorting, aggregation, and grouping. The results provide insights into subject performance and differences between departments.
