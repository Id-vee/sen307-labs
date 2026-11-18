-- VUA-SEN307 WEEK 6 PRACTICAL
-- Lab 4: Data Manipulation Language (DML)

-- PART 1: INSERT RECORDS
-- Department INSERT statements
INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');


-- Course INSERT statements
INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using
MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software
systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model
evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));
SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;


-- Lecturer INSERT statements

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng', 1),
('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng', 1),
('VUA/ST/103', 'Dr Chinedu Eze', 'c.eze@vua.edu.ng', 2),
('VUA/ST/104', 'Dr Fatima Yusuf', 'f.yusuf@vua.edu.ng', 2),
('VUA/ST/105', 'Dr Grace Nwosu', 'g.nwosu@vua.edu.ng', 6),
('VUA/ST/106', 'Dr Ibrahim Sani', 'i.sani@vua.edu.ng', 6),
('VUA/ST/107', 'Dr Esther James', 'e.james@vua.edu.ng', 7),
('VUA/ST/108', 'Dr David Okoro', 'd.okoro@vua.edu.ng', 7),
('VUA/ST/109', 'Dr Blessing Adeyemi', 'b.adeyemi@vua.edu.ng', 5),
('VUA/ST/110', 'Dr Samuel Obi', 's.obi@vua.edu.ng', 5);


-- Student INSERT statements
INSERT INTO Student
(matric_no, full_name, gender, date_of_birth, dept_id)
VALUES
-- Your own record
('VUG/SEN/24/11273', 'Vin-Ekpo Anthonia Idiongo','F' ,'2007-05-03', 1),

-- Software Engineering
('VUG/SEN/24/10001', 'Ada Obi', 'F', '2005-03-14', 1),
('VUG/SEN/24/10002', 'Samuel Okoro', 'M', '2004-11-02', 1),
('VUG/SEN/24/10003', 'Chiamaka Eze', 'F', '2006-07-19', 1),

-- Computer Science
('VUG/COS/24/10004', 'John Musa', 'M', '2004-05-21', 4),
('VUG/COS/24/10005', 'Fatima Bello', 'F', '2005-09-12', 4),
('VUG/COS/24/10006', 'Daniel James', 'M', '2003-12-08', 4),
('VUG/COS/24/10007', 'Grace Nwosu', 'F', '2007-02-17', 4),

-- Artificial Intelligence
('VUG/AIN/24/10008', 'Ibrahim Sani', 'M', '2005-04-23', 5),
('VUG/AIN/24/10009', 'Esther David', 'F', '2006-08-11', 5),
('VUG/AIN/24/10010', 'Peter Chukwu', 'M', '2004-01-30', 5),
('VUG/AIN/24/10011', 'Maryam Aliyu', 'F', '2007-06-15', 5),

-- Data Science
('VUG/DTS/24/10012', 'David Okafor', 'M', '2003-10-09', 6),
('VUG/DTS/24/10013', 'Blessing Adeyemi', 'F', '2005-12-20', 6),
('VUG/DTS/24/10014', 'Emmanuel Udo', 'M', '2006-03-05', 6),
('VUG/DTS/24/10015', 'Precious Ojo', 'F', '2004-07-27', 6),

-- Cybersecurity
('VUG/CYB/24/10016', 'Michael Adebayo', 'M', '2005-02-14', 7),
('VUG/CYB/24/10017', 'Ruth Okeke', 'F', '2006-11-18', 7),
('VUG/CYB/24/10018', 'Joseph Danjuma', 'M', '2003-08-25', 7),
('VUG/CYB/24/10019', 'Hauwa Ibrahim', 'F', '2007-04-03', 7);

-- Enrolment INSERT statements
INSERT INTO Enrolment (student_id, course_id) VALUES
(2, 2), (2, 3), (3, 1),  (3, 2), (3, 4), (4, 2),
(4, 3), (4, 5), (5, 3), (5, 4), (5, 6), (6, 4),
(6, 5), (7, 5), (7, 6),  (8, 6),  (8, 7),  (9, 7),
(9, 8), (10, 8), (10, 9), (11, 9),(11, 10),
(12, 10), (12, 1), (13, 1), (13, 3), (14, 2),(14, 4),
(15, 3), (15, 5), (16, 4),(16, 6),(17, 5),(17, 7),
(18, 6),(18, 8),(19, 7), (19, 9);

-- CourseAllocation INSERT statements
INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),
(6, 6),(7, 7),(8, 8),(9, 9),(10, 10);

-- PART 3: UPDATE A RECORD
UPDATE Student
SET dept_id = 4
WHERE student_id = 3;


-- PART 4: REFERENTIAL INTEGRITY

-- Create a new department
INSERT INTO Department (dept_name)
VALUES ('Library and Information Science');

-- Add a student to the new department
INSERT INTO Student (matric_no, full_name, dept_id)
VALUES (
    '20239999',
    'Transfer Student',
    (SELECT dept_id
     FROM Department
     WHERE dept_name = 'Library and Information Science')
);

-- Reassign the student
UPDATE Student
SET dept_id = (
    SELECT dept_id
    FROM Department
    WHERE dept_name = 'Software Engineering'
)
WHERE matric_no = '20239999';

-- Delete the department
DELETE FROM Department
WHERE dept_name = 'Library and Information Science';