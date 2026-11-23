-- TASK 1: Count students enrolled in each course
-- Include courses with zero students

SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
ORDER BY total_students DESC;

-- TASK 2: Filter courses using HAVING
-- Test thresholds of 3, 5 and 7

SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 3
ORDER BY total_students DESC;


SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 5
ORDER BY total_students DESC;


SELECT c.course_title, COUNT(e.student_id) AS total_students
FROM Course c
LEFT JOIN Enrolment e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_title
HAVING COUNT(e.student_id) > 7
ORDER BY total_students DESC;


-- TASK 3: Calculate average courses per student
-- Include students with zero courses
SELECT ROUND(AVG(course_count), 2) AS average_courses_per_student
FROM (
    SELECT s.student_id,
           COUNT(e.course_id) AS course_count
    FROM Student s
    LEFT JOIN Enrolment e ON s.student_id = e.student_id
    GROUP BY s.student_id
) AS per_student;


-- TASK 4: Find students not enrolled in any course
-- Non-correlated subquery using NOT IN
SELECT s.student_id, s.full_name
FROM Student s
WHERE s.student_id NOT IN (
    SELECT e.student_id
    FROM Enrolment e
)
ORDER BY s.student_id;


-- TASK 5: Find students with the highest enrolment
-- count in each department
-- Correlated subquery; ties are allowed
SELECT d.dept_name, s.full_name,
       (SELECT COUNT(*)
        FROM Enrolment e
        WHERE e.student_id = s.student_id) AS courses
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE (SELECT COUNT(*)
       FROM Enrolment e
       WHERE e.student_id = s.student_id)
      =
      (SELECT MAX(
          (SELECT COUNT(*)
           FROM Enrolment e2
           WHERE e2.student_id = s2.student_id)
       )
       FROM Student s2
       WHERE s2.dept_id = s.dept_id)
ORDER BY d.dept_name;