-- Make sure foreign keys are turned on before inserting data
PRAGMA foreign_keys = ON;

-- 1. Insert sample students (5 rows)
INSERT INTO Students (first_name, last_name, email, academic_level) VALUES
('Jennifer', 'Peterson', 'jennifer.peterson@live.lagcc.cuny.edu', 'College'),
('Jermany', 'Colon', 'jcolon@georgeschool.org', 'High School'),
('Maya', 'Angelou', 'mangelou@lagcc.cuny.edu', 'College'),
('Marcus', 'Garvey', 'mgarvey@codepath.org', 'Bootcamp'),
('Aaliyah', 'Stewart', 'astewart@oliverscholars.org', 'High School');

-- 2. Insert platforms where assignments live (5 rows)
INSERT INTO Platforms (platform_name, platform_url, is_digital) VALUES
('Brightspace', 'https://brightspace.cuny.edu', 1),
('MyOpenMath', 'https://www.myopenmath.com', 1),
('CodePath', 'https://courses.codepath.org', 1),
('Paper Handout', NULL, 0),
('Google Classroom', 'https://classroom.google.com', 1);

-- 3. Insert study tags (5 rows)
INSERT INTO Tags (tag_name) VALUES
('Exam Prep'),
('Coding Lab'),
('Paper Worksheet'),
('Group Project'),
('Urgent');

-- 4. Insert courses linked to students and their main platform (5 rows)
INSERT INTO Courses (student_id, default_platform_id, course_code, course_name, institution, term) VALUES
(1, 1, 'MAC 250', 'Relational Databases', 'LaGuardia CC', 'Fall 2026'),
(1, 2, 'MAT 201', 'Calculus I', 'LaGuardia CC', 'Fall 2026'),
(1, 3, 'TIP 102', 'Technical Interview Prep', 'CodePath', 'Fall 2026'),
(2, 5, 'HIST 301', 'AP World History', 'George School', 'Fall 2026'),
(2, 4, 'CHEM 201', 'Honors Chemistry', 'George School', 'Fall 2026');

-- 5. Insert digital and paper assignments (6 rows)
INSERT INTO Assignments (course_id, platform_id, title, description, due_date, submission_format, status, priority) VALUES
(1, 1, '3NF Normalization & ERD Diagram', 'Export DBML and PDF diagram for final project', '2026-11-19 23:59:00', 'Digital', 'Submitted', 'High'),
(2, 2, 'Derivatives & Chain Rule Set 4', 'Complete online problem set on MyOpenMath', '2026-11-21 23:59:00', 'Digital', 'In Progress', 'High'),
(2, 4, 'Related Rates Practice Worksheet', 'Printed packet handed out in class by Prof. Adames-Ng', '2026-11-24 10:30:00', 'Paper', 'Pending', 'Medium'),
(3, 3, 'Linked Lists & Two Pointers Lab', 'Pass all unit tests in CodePath portal', '2026-11-22 20:00:00', 'Digital', 'In Progress', 'High'),
(4, 5, 'DBQ Essay Outline: Industrial Revolution', 'Upload Google Doc outline before seminar', '2026-11-20 15:00:00', 'Digital', 'Pending', 'Medium'),
(5, 4, 'Stoichiometry Lab Report Packet', 'Handwritten calculations on physical lab sheet', '2026-11-25 14:00:00', 'Paper', 'Pending', 'High');

-- 6. Link assignments to tags in the junction table (7 rows)
INSERT INTO Assignment_Tags (assignment_id, tag_id) VALUES
(1, 4), -- 3NF ERD -> Group Project / Final Project
(2, 1), -- Calculus Set 4 -> Exam Prep
(3, 3), -- Related Rates -> Paper Worksheet
(3, 1), -- Related Rates -> Exam Prep
(4, 2), -- Linked Lists -> Coding Lab
(4, 5), -- Linked Lists -> Urgent
(6, 3); -- Stoichiometry -> Paper Worksheet