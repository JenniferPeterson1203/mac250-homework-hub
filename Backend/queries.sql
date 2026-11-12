-- Query 1: Main Assignment Dashboard (4-Table INNER JOIN)
-- Shows each student's upcoming work, which class it is for, and where to turn it in
SELECT 
    s.first_name || ' ' || s.last_name AS student_name,
    c.course_code,
    c.institution,
    a.title AS assignment_title,
    p.platform_name,
    a.submission_format,
    a.due_date,
    a.status,
    a.priority
FROM Assignments a
INNER JOIN Courses c ON a.course_id = c.course_id
INNER JOIN Students s ON c.student_id = s.student_id
INNER JOIN Platforms p ON a.platform_id = p.platform_id
WHERE a.status != 'Submitted'
ORDER BY a.due_date ASC;


-- Query 2: Workload Breakdown by Platform & Format (JOIN + GROUP BY + COUNT)
-- Counts how many digital vs. paper assignments exist on each platform
SELECT 
    p.platform_name,
    a.submission_format,
    COUNT(a.assignment_id) AS total_assignments
FROM Platforms p
LEFT JOIN Assignments a ON p.platform_id = a.platform_id
GROUP BY p.platform_name, a.submission_format
ORDER BY total_assignments DESC;


-- Query 3: Tagged Assignments & Study Categories (Many-to-Many Junction JOIN)
-- Uses the junction table to show all tags attached to each assignment
SELECT 
    a.title AS assignment_title,
    c.course_code,
    a.priority,
    GROUP_CONCAT(t.tag_name, ', ') AS tags
FROM Assignments a
INNER JOIN Courses c ON a.course_id = c.course_id
INNER JOIN Assignment_Tags at ON a.assignment_id = at.assignment_id
INNER JOIN Tags t ON at.tag_id = t.tag_id
GROUP BY a.assignment_id, a.title, c.course_code, a.priority
ORDER BY a.priority ASC;