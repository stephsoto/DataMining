-- 1 & 2. view the table ( SELECT,FROM)

SELECT * 
FROM students;

SELECT student_name, gpa , school_lunch
FROM students;

-- 3. show students who get school lunch ( WHERE)
SELECT student_name, gpa , school_lunch
FROM students
WHERE school_lunch = "Yes";


-- 4.sort the students by gpa > 3.3( ORDER BY)
SELECT student_name, gpa , school_lunch
FROM students
WHERE school_lunch = "Yes" and gpa > 3.3
ORDER BY gpa DESC;



-- 5. show the average gpa for each grade level (GROUP BY)
SELECT grade_level,  AVG(gpa) 
FROM students
GROUP BY grade_level
ORDER BY grade_level DESC;



-- 6. show the grade levels with and average gpa vbelow 3.3 (HAVING)

SELECT grade_level,  AVG(gpa) as av
FROM students
GROUP BY grade_level
HAVING av < 3.3
ORDER BY grade_level DESC;


-- we want to see 5 of the list LIMIT
SELECT * 
FROM students
LIMIT 5;


-- we want just to know the # of student who gets school lunch and have a gpa>3.3 COUNT
SELECT COUNT(*)
FROM students
WHERE school_lunch = "Yes" and gpa > 3.3;


-- you want to look only at the UNIQUE gpa values NO DUPLICATES DISTINCT
SELECT DISTINCT gpa
FROM students
ORDER BY gpa DESC;


-- 8.show the final grades for each student : LEFT JOIN

SELECT * 
FROM students;


SELECT *
FROM student_grades;

SELECT students.id, students.student_name, student_grades.class_name, student_grades.final_grade
FROM students LEFT JOIN student_grades
    ON students.id = student_grades.student_id;



