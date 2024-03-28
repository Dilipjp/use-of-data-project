CREATE TABLE campus_facilities (
    facility_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    capacity INT,
    location VARCHAR(255)
);
CREATE TABLE campus_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date DATE,
    location VARCHAR(255)
);
CREATE TABLE instructors (
    instructor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    department_id INT
);

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    head_of_department_id INT,
    FOREIGN KEY (head_of_department_id) REFERENCES instructors(instructor_id)
);
ALTER TABLE instructors ADD INDEX department_id_index (department_id);

CREATE TABLE academic_advisors (
    advisor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    credits INT,
    semester VARCHAR(255),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dob DATE,
    class_level VARCHAR(255),
    department_id INT,
    advisor_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (advisor_id) REFERENCES academic_advisors(advisor_id)
);
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    name VARCHAR(255) NOT NULL,
    due_date DATE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
CREATE TABLE grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    assignment_id INT,
    grade_value VARCHAR(2),
    FOREIGN KEY (enrollment_id) REFERENCES enrollments(enrollment_id),
    FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id)
);
CREATE TABLE student_events (
    student_event_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    event_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (event_id) REFERENCES campus_events(event_id)
);


INSERT INTO campus_facilities (name, capacity, location) VALUES
('Library', 200, 'Main Building, Floor 2'),
('Gymnasium', 100, 'Recreation Center'),
('Computer Lab', 400, 'Science Building, Room 101'),
('Cafeteria', 200, 'Student Union Building'),
('Auditorium', 200, 'Performing Arts Center'),
('Football Field', 300, 'Campus Stadium'),
('Swimming Pool', 30, 'Recreation Center'),
('Art Studio', 10, 'Art Building, Room 102'),
('Music Hall', 100, 'Music Building, Room 201'),
('Economics Lab', 15, 'Economics Building, Room 103'),
('Psychology Research Center', 50, 'Psychology Building, Room 301'),
('Sociology Seminar Room', 300, 'Sociology Building, Room 202'),
('Political Science Lecture Hall', 100, 'Political Science Building, Room 101'),
('Geography Classroom', 40, 'Geography Building, Room 301'),
('Fitness Center', 150, 'Recreation Center');


INSERT INTO campus_events (name, date, location, attendance) VALUES
('Welcome Party', '2023-09-10', 'Student Union Building', 75),
('Career Fair', '2023-10-05', 'Main Campus Lawn', 100),
('Alumni Reunion', '2023-11-20', 'Alumni Hall', 150),
('Spring Festival', '2024-04-15', 'Recreation Center', 60),
('Academic Conference', '2024-05-10', 'Science Building', 50),
('Art Exhibition', '2023-10-05', 'Art Building', 750),
('Music Concert', '2023-11-05', 'Music Hall', 100),
('Economics Symposium', '2024-02-15', 'Economics Building', 25),
('Psychology Workshop', '2024-03-10', 'Psychology Building', 10),
('Sociology Conference', '2023-10-05', 'Sociology Building', 40),
('Political Science Debate', '2024-05-20', 'Political Science Building', 7),
('Geography Field Trip', '2023-10-15', 'Various Locations', 100),
('Physical Education Tournament', '2024-03-20', 'Recreation Center', 30),
('Chess Competition', '2023-10-05', 'Student Union Building', 5),
('Dance Performance', '2023-11-15', 'Performing Arts Center', 125);

INSERT INTO instructors (name, email, department_id) VALUES
('Dr. White', 'drwhite@example.com', 1),
('Prof. Brown', 'profbrown@example.com', 2),
('Ms. Green', 'msgreen@example.com', 3),
('Dr. Black', 'drblack@example.com', 1),
('Prof. Gray', 'profgray@example.com', 2),
('Dr. Davis', 'drdavis@example.com', 3),
('Prof. Martinez', 'profmartinez@example.com', 1),
('Ms. Thomas', 'msthomas@example.com', 2),
('Dr. Garcia', 'drgarcia@example.com', 3),
('Prof. Rodriguez', 'profrodriguez@example.com', 1),
('Ms. Hernandez', 'mshernandez@example.com', 2),
('Dr. King', 'drking@example.com', 3),
('Prof. Adams', 'profadams@example.com', 1),
('Ms. Campbell', 'mscampbell@example.com', 2),
('Dr. Wilson', 'drwilson@example.com', 3);

INSERT INTO departments (name, head_of_department_id) VALUES
('Mathematics', 1),
('History', 2),
('Computer Science', 3),
('Physics', 4),
('Chemistry', 5),
('Biology', 6),
('English', 7),
('Economics', 8),
('Psychology', 9),
('Sociology', 10),
('Political Science', 11),
('Geography', 12),
('Physical Education', 13),
('Art', 14),
('Music', 15);

INSERT INTO courses (name, credits, semester, department_id) VALUES
('Math 101', 3,'Spring 2023', 1),
('History 101', 4, 'Fall 2023', 2),
('Computer Science 101', 3, 'Winter 2023', 3),
('English Literature 101', 3,'Spring 2023', 4),
('Physics 101', 4, 'Summer 2023', 5),
('Chemistry 101', 3, 'Fall 2023', 6),
('Biology 101', 4, 'Winter 2023', 7),
('Art 101', 3, 'Fall 2023', 8),
('Music 101', 3,'Spring 2023', 9),
('Economics 101', 4, 'Winter 2023', 10),
('Psychology 101', 3, 'Fall 2023', 11),
('Sociology 101', 4, 'Summer 2023', 12),
('Political Science 101', 3, 'Spring 2023', 13),
('Geography 101', 3, 'Fall 2023', 14),
('Physical Education 101', 4, 'Winter 2023', 15);

INSERT INTO academic_advisors (name, email, department_id) VALUES
('Dr. White', 'drwhite@example.com', 1),
('Prof. Brown', 'profbrown@example.com', 2),
('Ms. Green', 'msgreen@example.com', 3),
('Dr. Black', 'drblack@example.com', 1),
('Prof. Gray', 'profgray@example.com', 2),
('Dr. Davis', 'drdavis@example.com', 3),
('Prof. Martinez', 'profmartinez@example.com', 1),
('Ms. Thomas', 'msthomas@example.com', 2),
('Dr. Garcia', 'drgarcia@example.com', 3),
('Prof. Rodriguez', 'profrodriguez@example.com', 1),
('Ms. Hernandez', 'mshernandez@example.com', 2),
('Dr. King', 'drking@example.com', 3),
('Prof. Adams', 'profadams@example.com', 1),
('Ms. Campbell', 'mscampbell@example.com', 2),
('Dr. Wilson', 'drwilson@example.com', 3);

INSERT INTO students (name, email, dob, class_level, department_id, advisor_id) VALUES
('Dilip Kumara', 'dilip@example.com', '2000-01-01', 'senior', 1, 1),
('Muththu', 'muththu@example.com', '2000-02-01', 'freshman',2, 2),
('Shawani', 'shawani@example.com', '2000-03-01', 'junior', 3, 3),
('Suman', 'suman@example.com', '2000-04-01', 'freshman', 4, 4),
('Mahee', 'mahee@example.com', '2000-05-01', 'senior', 5, 5),
('Subash', 'subash@example.com', '2000-06-01', 'freshman', 6, 6),
('Fedric', 'fedric@example.com', '2000-07-01', 'junior', 7, 7),
('Erica', 'erika@example.com', '2000-08-01', 'sophomores', 8, 8),
('Osmari', 'osmary@example.com', '2000-09-01', 'senior', 9, 9),
('Barsha', 'barsha@example.com', '2000-10-01', 'freshman', 10, 10),
('Kurpa', 'kurpa@example.com', '2000-11-01', 'senior', 11, 11),
('Mothit', 'mothit@example.com', '2000-12-01', 'sophomores', 12, 12),
('Nabeel', 'nabeel@example.com', '2001-01-01', 'senior', 13, 13),
('Rithika', 'rithika@example.com', '2001-02-01', 'freshman', 14, 14),
('Shing', 'singh@example.com', '2001-03-01', 'sophomores', 15, 15);


INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2023-09-01'),
(2, 2, '2023-09-02'),
(3, 3, '2023-09-03'),
(4, 4, '2023-09-04'),
(5, 5, '2023-09-05'),
(6, 6, '2023-09-06'),
(7, 7, '2023-09-07'),
(8, 8, '2023-09-08'),
(9, 9, '2023-09-09'),
(10, 10, '2023-09-10'),
(11, 11, '2023-09-11'),
(12, 12, '2023-09-12'),
(13, 13, '2023-09-13'),
(14, 14, '2023-09-14'),
(15, 15, '2023-09-15');



INSERT INTO assignments (course_id, name, due_date) VALUES
(1, 'Assignment 1', '2023-09-20'),
(2, 'Assignment 2', '2023-09-21'),
(3, 'Assignment 3', '2023-09-22'),
(4, 'Assignment 4', '2023-09-23'),
(5, 'Assignment 5', '2023-09-24'),
(6, 'Assignment 6', '2023-09-25'),
(7, 'Assignment 7', '2023-09-26'),
(8, 'Assignment 8', '2023-09-27'),
(9, 'Assignment 9', '2023-09-28'),
(10, 'Assignment 10', '2023-09-29'),
(11, 'Assignment 11', '2023-09-30'),
(12, 'Assignment 12', '2023-10-01'),
(13, 'Assignment 13', '2023-10-02'),
(14, 'Assignment 14', '2023-10-03'),
(15, 'Assignment 15', '2023-10-04');

INSERT INTO grades (enrollment_id, assignment_id, grade_value) VALUES
(1, 1, 'A'),
(2, 2, 'B'),
(3, 3, 'A'),
(4, 4, 'B'),
(5, 5, 'A'),
(6, 6, 'B'),
(7, 7, 'A'),
(8, 8, 'B'),
(9, 9, 'A'),
(10, 10, 'B'),
(11, 11, 'A'),
(12, 12, 'B'),
(13, 13, 'A'),
(14, 14, 'B'),
(15, 15, 'A');

INSERT INTO student_events (student_id, event_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 3),
    (6, 3),
    (7, 4),
    (8, 4),
    (9, 5),
    (10, 5),
    (11, 6),
    (12, 6),
    (13, 7),
    (14, 7),
    (15, 8);



-- 01 Retrieve the list of students enrolled in a specific course along with their grades.
SELECT
    s.name AS student_name,
    g.grade_value
FROM
    students s
JOIN enrollments e ON
    s.student_id = e.student_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
WHERE
    e.course_id = 1;

-- 02 List all instructors along with the courses they teach.
SELECT
    i.name AS instructor_name,
    c.name AS course_name,
    d.name AS department_name
FROM
    instructors i
JOIN courses c ON
    i.department_id = c.department_id
JOIN departments d ON
    i.department_id = d.department_id;

-- 03 Calculate the average GPA of students in each department.

    SELECT
    d.name AS department_name,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) AS average_gpa
FROM
    students s
JOIN enrollments e ON
    s.student_id = e.student_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
JOIN courses c ON
    e.course_id = c.course_id
JOIN departments d ON
    s.department_id = d.department_id
GROUP BY
    d.name;

-- 04 Retrieve the list of courses offered in a specific semester.

SELECT NAME AS
    course_name,
    semester
FROM
    courses
WHERE
    semester = 'Spring 2023';

-- 05 Find the top 5 students with the highest GPA.
SELECT
    s.name AS student_name,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) AS gpa
FROM
    students s
JOIN enrollments e ON
    s.student_id = e.student_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
GROUP BY
    s.name
ORDER BY
    gpa
DESC
LIMIT 5;    
-- 06 List all assignments along with the course they belong to.
SELECT
    a.name AS assignment_name,
    c.name AS course_name
FROM
    assignments a
JOIN courses c ON
    a.course_id = c.course_id;

 -- 07 Calculate the total number of students enrolled in each course.
SELECT
    c.name AS course_name,
    COUNT(DISTINCT e.student_id) AS total_students
FROM
    courses c
JOIN enrollments e ON
    c.course_id = e.course_id
GROUP BY
    c.name;

 -- 08 Retrieve the list of campus facilities along with their capacities.
 SELECT
    name AS facility_name,
    capacity
FROM
    campus_facilities;

-- 09 Find the busiest day for campus events.
SELECT
    DATE AS busiest_day,
    COUNT(*) AS event_count
FROM
    campus_events
GROUP BY
    DATE
ORDER BY
    event_count
DESC
LIMIT 1;
--  10 List all academic advisors along with the students they advise.
SELECT
    aa.name AS advisor_name,
    s.name AS student_name
FROM
    academic_advisors aa
JOIN students s ON
    aa.department_id = s.department_id
ORDER BY
    aa.name,
    s.name;
-- 11 Certainly! Here are additional queries for the university management system database project:

-- 12 Retrieve the list of students who have not enrolled in any courses.
SELECT
    s.student_id,
    s.name AS student_name
FROM
    students s
WHERE NOT
    EXISTS(
    SELECT
        1
    FROM
        enrollments e
    WHERE
        s.student_id = e.student_id
);

-- 13 List all courses that have no enrolled students.
SELECT
    c.course_id,
    c.name AS course_name
FROM
    courses c
LEFT JOIN enrollments e ON
    c.course_id = e.course_id
WHERE
    e.course_id IS NULL;

-- 14 Calculate the average grade for each assignment in a specific course.
SELECT
    a.name AS assignment_name,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) AS average_grade
FROM
    assignments a
JOIN grades g ON
    a.assignment_id = g.assignment_id
JOIN enrollments e ON
    g.enrollment_id = e.enrollment_id
WHERE
    e.course_id = 1 
GROUP BY
    a.name;    
-- 15 Find the course with the highest average grade.


SELECT
    c.name AS course_name,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) AS average_grade
FROM
    courses c
JOIN enrollments e ON
    c.course_id = e.course_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
GROUP BY
    c.name
ORDER BY
    average_grade
DESC
LIMIT 1;

-- 16 Retrieve the list of students who have not submitted a specific assignment.
SELECT
    s.name AS student_name
FROM
    students s
JOIN enrollments e ON
    s.student_id = e.student_id
JOIN courses c ON
    e.course_id = c.course_id
LEFT JOIN grades g ON
    e.enrollment_id = g.enrollment_id AND g.assignment_id = 1
WHERE
    g.grade_id IS NULL AND c.course_id = 1;
-- 17  List all instructors who have taught courses in multiple departments.
SELECT
    i.name AS instructor_name
FROM
    instructors i
JOIN
    courses c ON i.instructor_id = c.department_id
JOIN
    departments d ON c.department_id = d.head_of_department_id
GROUP BY
    i.instructor_id
HAVING
    COUNT(DISTINCT c.department_id) > 1;

-- 18  Calculate the total number of assignments submitted by each student.
SELECT
    s.student_id,
    s.name AS student_name,
    COUNT(g.assignment_id) AS total_assignments
FROM
    students s
JOIN
    enrollments e ON s.student_id = e.student_id
JOIN
    grades g ON e.enrollment_id = g.enrollment_id
GROUP BY
    s.student_id, s.name;   
-- 19 Retrieve the list of courses that have not been assigned an instructor yet.
SELECT
    c.course_id,
    c.name AS course_name
FROM
    courses c
LEFT JOIN instructors i ON
    c.course_id = i.department_id
WHERE
    i.instructor_id IS NULL;
-- 20 Find the department with the highest number of enrolled students.

SELECT
    d.department_id,
    d.name AS department_name,
    COUNT(DISTINCT e.student_id) AS total_students
FROM
    departments d
JOIN courses c ON
    d.department_id = c.department_id
JOIN enrollments e ON
    c.course_id = e.course_id
GROUP BY
    d.department_id,
    d.name
ORDER BY
    total_students
DESC
LIMIT 1;       
-- 21 List all campus facilities that have not been used for any events.
SELECT
    cf.facility_id,
    cf.name AS facility_name
FROM
    campus_facilities cf
LEFT JOIN campus_events ce ON
    cf.location = ce.location
WHERE
    ce.event_id IS NULL;
-- 22 Calculate the average attendance rate for campus events.
SELECT
    AVG(attendance) AS average_attendance_rate
FROM
    campus_events;

-- 23 Retrieve the list of students who are enrolled in courses but have not attended any events.
    
    
  SELECT
    s.student_id,
    s.name AS student_name
FROM
    students s
JOIN enrollments e ON
    s.student_id = e.student_id
LEFT JOIN student_events se ON
    e.student_id = se.student_id
WHERE
    se.event_id IS NULL;

-- 24 Find the course with the lowest average GPA.
SELECT
    c.course_id,
    c.name AS course_name,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) AS average_gpa
FROM
    courses c
JOIN assignments a ON
    c.course_id = a.course_id
JOIN grades g ON
    a.assignment_id = g.assignment_id
GROUP BY
    c.course_id,
    c.name
ORDER BY
    average_gpa
LIMIT 1;
-- 25 List all instructors along with the number of courses they teach.
SELECT
    i.instructor_id,
    i.name AS instructor_name,
    COUNT(*) AS num_courses
FROM
    instructors i
JOIN
    courses c ON i.instructor_id = c.course_id  
GROUP BY
    i.instructor_id, i.name;
-- 26  Calculate the percentage of enrolled students who are freshmen, sophomores, juniors, and seniors.   
SELECT
    class_level,
    COUNT(*) AS num_students,
    ROUND(
        COUNT(*) * 100.0 /(
    SELECT
        COUNT(*)
    FROM
        students
    ),
    2
    ) AS percentage
FROM
    students
GROUP BY
    class_level;
-- 27 Retrieve the list of courses with the highest enrollment.
    SELECT
    c.course_id,
    c.name AS course_name,
    COUNT(*) AS enrollment_count
FROM
    courses c
JOIN
    enrollments e ON c.course_id = e.course_id
GROUP BY
    c.course_id, c.name
ORDER BY
    enrollment_count DESC
LIMIT 1;
-- 29
   


      










