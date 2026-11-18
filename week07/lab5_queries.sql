-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Vin-Ekpo Anthonia Idiongo
-- Matric: VUG/SEN/24/11273
-- ============================================

USE sen307_vug_sen_24_11273;


-- Task 1: Students in one department, sorted A-Z
-- Explanation: This query retrieves all students in the
-- Software Engineering department and sorts their names
-- alphabetically using ORDER BY.

SELECT s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d
ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;


-- Task 2: Courses with their lecturers (INNER JOIN)
-- Explanation: This query retrieves each course with the
-- name of the lecturer assigned to teach it. It joins
-- Course, CourseAllocation and Lecturer using their IDs.

SELECT c.course_title, l.full_name
FROM Course c
INNER JOIN CourseAllocation ca
ON c.course_id = ca.course_id
INNER JOIN Lecturer l
ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_title;

-- Task 3: Students and their courses (LEFT JOIN)
-- Explanation: This query displays every student and their
-- enrolled courses. LEFT JOIN ensures students without
-- enrolments are also included, with NULL for course_title.

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e
ON s.student_id = e.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
ORDER BY s.full_name;

--Show only students without courses
SELECT s.student_id, s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e
ON s.student_id = e.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;


-- Task 4: Filtering with AND, IN and BETWEEN
-- Explanation: This query retrieves female students in
-- Software Engineering or Artificial Intelligence who
-- were born between 2006 and 2007.(The date range was adjusted to match the available sample data.)

SELECT s.student_id, s.full_name, s.gender,
       s.date_of_birth, d.dept_name
FROM Student s
INNER JOIN Department d
ON s.dept_id = d.dept_id
WHERE s.gender = 'F'
AND s.dept_id IN (1, 5)
AND s.date_of_birth BETWEEN '2006-01-01' AND '2007-12-31'
ORDER BY s.full_name ASC;


-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Explanation: LIMIT restricts the result to 10 records.
-- OFFSET determines how many records to skip.
-- ORDER BY ensures a consistent ordering.

-- Page 1: Rows 1–10
SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;

-- Page 2: Rows 11–20
SELECT *
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;

-- Optional Task: RIGHT JOIN version of Task 3
-- Explanation: This query returns every student and their
-- courses using RIGHT JOIN. The LEFT JOIN version is easier
-- to read because Student is the starting table.

SELECT s.full_name, c.course_title
FROM Enrolment e
RIGHT JOIN Student s
ON e.student_id = s.student_id
LEFT JOIN Course c
ON e.course_id = c.course_id
ORDER BY s.full_name;