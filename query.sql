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
    location VARCHAR(255),
    attendance INT
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
    prerequisite VARCHAR(255),
    credits INT,
    semester VARCHAR(255),
    capacity INT,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dob DATE,
    gender VARCHAR(255),
    class_level VARCHAR(255),
    department_id INT,
    previous_department_id INT,
    advisor_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (previous_department_id) REFERENCES departments(department_id),
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
('Welcome Party', '2024-09-10', 'Student Union Building', 75),
('Career Fair', '2024-10-05', 'Main Campus Lawn', 100),
('Alumni Reunion', '2024-11-20', 'Alumni Hall', 150),
('Spring Festival', '2024-04-15', 'Recreation Center', 60),
('Academic Conference', '2024-05-10', 'Science Building', 50),
('Art Exhibition', '2024-10-05', 'Art Building', 750),
('Music Concert', '2024-11-05', 'Music Hall', 100),
('Economics Symposium', '2024-02-15', 'Economics Building', 25),
('Psychology Workshop', '2024-03-10', 'Psychology Building', 10),
('Sociology Conference', '2024-10-05', 'Sociology Building', 40),
('Political Science Debate', '2024-05-20', 'Political Science Building', 7),
('Geography Field Trip', '2024-10-15', 'Various Locations', 100),
('Physical Education Tournament', '2024-03-20', 'Recreation Center', 30),
('Chess Competition', '2024-10-05', 'Student Union Building', 5),
('Dance Performance', '2024-11-15', 'Performing Arts Center', 125);

INSERT INTO instructors (name, email, department_id) VALUES
('Dr. White', 'drwhite@gmail.com', 1),
('Prof. Brown', 'profbrown@gmail.com', 2),
('Ms. Silviya Paskaleva', 'silvia@gmail.com', 3),
('Dr. Black', 'drblack@gmail.com', 1),
('Prof. Gray', 'profgray@gmail.com', 2),
('Ms. Pargol Poshtare', 'pargol@gmail.com', 3),
('Prof. Martinez', 'profmartinez@gmail.com', 1),
('Ms. Thomas', 'msthomas@gmail.com', 2),
('Dr. Garcia', 'drgarcia@gmail.com', 3),
('Prof. Rodriguez', 'profrodriguez@gmail.com', 1),
('Ms. Hernandez', 'mshernandez@gmail.com', 2),
('Dr. King', 'drking@gmail.com', 3),
('Prof. Adams', 'profadams@gmail.com', 1),
('Ms. Campbell', 'mscampbell@gmail.com', 2),
('Dr. Wilson', 'drwilson@gmail.com', 3);

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

INSERT INTO courses (name, prerequisite, credits, semester, capacity, department_id) VALUES
('Math 101', 'Math 100', 3, 'Spring 2023', 0, 1),
('History 101', 'History 100', 4, 'Fall 2023', 20, 2),
('Computer Science 101', 'Computer Science 100', 3, 'Winter 2023', 30, 3),
('English Literature 101', 'English Literature 100', 3, 'Spring 2023', 45, 7),
('Physics 101', 'Physics 100', 4, 'Summer 2023', 40, 4),
('Chemistry 101', 'Chemistry 100', 3, 'Fall 2023', 30, 5),
('Biology 101', 'Biology 100', 4, 'Winter 2023', 20, 6),
('Art 101', 'Art 100', 3, 'Fall 2023', 25, 14),
('Music 101', 'Music 100', 3, 'Spring 2023', 100, 15),
('Economics 101', 'Economics 100', 4, 'Winter 2023', 60, 8),
('Psychology 101', 'Psychology 100', 3, 'Fall 2023', 100, 9),
('Sociology 101', 'Sociology 100', 4, 'Summer 2023', 200, 10),
('Political Science 101', 'Political Science 100', 3, 'Spring 2023', 25, 11),
('Geography 101', 'Geography 100', 3, 'Fall 2023', 150, 12),
('Physical Education 101', 'Physical Education 100', 4, 'Winter 2023', 200, 13);



INSERT INTO academic_advisors (name, email, department_id) VALUES
('Dr. White', 'drwhite@gmail.com', 1),
('Prof. Brown', 'profbrown@gmail.com', 2),
('Ms. Green', 'msgreen@gmail.com', 3),
('Dr. Black', 'drblack@gmail.com', 1),
('Prof. Gray', 'profgray@gmail.com', 2),
('Dr. Davis', 'drdavis@gmail.com', 3),
('Prof. Martinez', 'profmartinez@gmail.com', 1),
('Ms. Thomas', 'msthomas@gmail.com', 2),
('Dr. Garcia', 'drgarcia@gmail.com', 3),
('Prof. Rodriguez', 'profrodriguez@gmail.com', 1),
('Ms. Hernandez', 'mshernandez@gmail.com', 2),
('Dr. King', 'drking@gmail.com', 3),
('Prof. Adams', 'profadams@gmail.com', 1),
('Ms. Campbell', 'mscampbell@gmail.com', 2),
('Dr. Wilson', 'drwilson@gmail.com', 3);

INSERT INTO students (name, email, dob, gender, class_level, department_id, previous_department_id, advisor_id) VALUES
('Dilip Kumara', 'dilip@gmail.com', '2000-01-01','M', 'senior', 1, 1, 1),
('Suhas', 'suhas@gmail.com', '2000-02-01','M', 'freshman',2, 2, 2),
('Shawani', 'shawani@gmail.com', '2000-03-01','F', 'junior', 3, 3, 3),
('Suman', 'suman@gmail.com', '2000-04-01','F', 'freshman', 4, 3, 4),
('Mahee', 'mahee@gmail.com', '2000-05-01','F', 'senior', 5, 5, 5),
('Subash', 'subash@gmail.com', '2000-06-01','M', 'freshman', 6, 6, 6),
('Fedric', 'fedric@gmail.com', '2000-07-01','M', 'junior', 7, 7,7),
('Erica', 'erika@gmail.com', '2000-08-01','F', 'sophomores', 8,6, 8),
('Osmari', 'osmary@gmail.com', '2000-09-01','F', 'senior', 9, 9,9),
('Barsha', 'barsha@gmail.com', '2000-10-01','F', 'freshman', 10,10, 10),
('Kurpa', 'kurpa@gmail.com', '2000-11-01','F', 'senior', 11,11, 11),
('Mothit', 'mothit@gmail.com', '2000-12-01','M', 'sophomores', 12,12, 12),
('Nabeel', 'nabeel@gmail.com', '2001-01-01','M', 'senior', 13, 1,13),
('Rithika', 'rithika@gmail.com', '2001-02-01','F', 'freshman', 14,14, 14),
('Shing', 'singh@gmail.com', '2001-03-01','M', 'sophomores', 15, 15,15);


INSERT INTO enrollments (student_id, course_id, enrollment_date) VALUES
(1, 1, '2024-09-01'),
(1, 2, '2024-09-02'),
(3, 2, '2024-09-03'),
(4, 4, '2024-09-04'),
(5, 5, '2024-09-05'),
(6, 6, '2024-09-06'),
(7, 7, '2024-09-07'),
(8, 8, '2024-09-08'),
(9, 9, '2024-09-09'),
(10, 10, '2024-09-10'),
(11, 11, '2024-09-11'),
(12, 12, '2024-09-12'),
(13, 13, '2024-09-13'),
(14, 14, '2024-09-14'),
(15, 15, '2024-09-15');



INSERT INTO assignments (course_id, name, due_date) VALUES
(1, 'Assignment 1', '2024-09-20'),
(2, 'Assignment 2', '2024-09-21'),
(3, 'Assignment 3', '2024-09-22'),
(4, 'Assignment 4', '2024-09-23'),
(5, 'Assignment 5', '2024-09-24'),
(6, 'Assignment 6', '2024-09-25'),
(7, 'Assignment 7', '2024-09-26'),
(8, 'Assignment 8', '2024-09-27'),
(9, 'Assignment 9', '2024-09-28'),
(10, 'Assignment 10', '2024-09-29'),
(11, 'Assignment 11', '2024-09-30'),
(12, 'Assignment 12', '2024-10-01'),
(13, 'Assignment 13', '2024-10-02'),
(14, 'Assignment 14', '2024-10-03'),
(15, 'Assignment 15', '2024-10-04');

INSERT INTO grades (enrollment_id, assignment_id, grade_value) VALUES
(1, 1, 'A'),
(2, 1, NULL),
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
    (5, NULL),
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
    semester = 'Spring 2024';

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
    s.name,
    s.email,
    s.gender,
    s.class_level
FROM
    students s
LEFT JOIN enrollments e ON
    e.student_id = s.student_id
WHERE
    e.student_id IS NULL;

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
LEFT JOIN grades g ON
    e.enrollment_id = g.enrollment_id
WHERE
    g.grade_value IS NULL AND g.assignment_id = 1;
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
-- To this we need extra table called student_events    
    
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
-- 28 Find the student with the most assignments submitted.
SELECT
    s.student_id,
    s.name AS student_name,
    COUNT(DISTINCT g.assignment_id) AS num_assignments
FROM
    students s
JOIN enrollments e ON
    s.student_id = e.student_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
GROUP BY
    s.student_id,
    s.name
ORDER BY
    num_assignments
DESC
LIMIT 1;
-- 29 List all assignments that have not been graded yet.

SELECT
    a.assignment_id,
    a.name AS assignment_name
FROM
    assignments a
LEFT JOIN grades g ON
    a.assignment_id = g.assignment_id
WHERE
    g.grade_id IS NULL;
-- 30 Calculate the average number of assignments submitted by students in each department.
SELECT
    d.department_id,
    d.name AS department_name,
    COUNT(DISTINCT g.assignment_id) / COUNT(DISTINCT e.enrollment_id) AS avg_assignments_per_student
FROM
    departments d
JOIN academic_advisors a ON
    d.department_id = a.department_id
JOIN students s ON
    a.advisor_id = s.advisor_id
JOIN enrollments e ON
    s.student_id = e.student_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
GROUP BY
    d.department_id,
    d.name;
-- 31 Retrieve the list of courses where the number of enrolled students exceeds the capacity of the classroom.

   SELECT
    c.course_id,
    c.name AS course_name,
    c.capacity AS classroom_capacity,
    COUNT(e.student_id) AS num_students_enrolled
FROM
    courses c
JOIN enrollments e ON
    c.course_id = e.course_id
GROUP BY
    c.course_id,
    c.name,
    c.capacity
HAVING
    COUNT(e.student_id) > c.capacity;
-- 32 Find the department with the lowest average GPA.
SELECT
    s.department_id,
    d.name AS department_name,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) AS average_gpa
FROM
    students s
JOIN
    enrollments e ON s.student_id = e.student_id
JOIN
    grades g ON e.enrollment_id = g.enrollment_id
JOIN
    departments d ON s.department_id = d.department_id
GROUP BY
    s.department_id, d.name
ORDER BY
    average_gpa
LIMIT 1;
    
-- 33 List all courses with their prerequisites.
SELECT name AS
    course_name,
    prerequisite
FROM
    courses;
-- 34 Calculate the total number of credits offered by each department.
SELECT
    d.department_id,
    d.name AS department_name,
    SUM(c.credits) AS total_credits
FROM
    courses c
JOIN
    departments d ON c.department_id = d.department_id
GROUP BY
    d.department_id, d.name;

-- 35 Retrieve the list of students who have changed their major.
SELECT
    s.student_id,
    s.name AS student_name,
    s.email AS student_email,
    d1.name AS previous_department,
    d2.name AS current_department
FROM
    students s
JOIN departments d1 ON
    s.previous_department_id = d1.department_id
JOIN departments d2 ON
    s.department_id = d2.department_id
WHERE
    s.previous_department_id IS NOT NULL AND s.department_id != s.previous_department_id;
-- 36 Find the course with the highest percentage of students who received an A grade.
SELECT
    c.course_id,
    c.name AS course_name,
    COUNT(
        CASE WHEN g.grade_value = 'A' THEN 1
    END
) / COUNT(g.grade_id) AS percentage_a_grade
FROM
    courses c
JOIN assignments a ON
    c.course_id = a.course_id
LEFT JOIN grades g ON
    a.assignment_id = g.assignment_id
GROUP BY
    c.course_id,
    c.name
ORDER BY
    percentage_a_grade
DESC
LIMIT 1;
-- 37 List all campus facilities with their respective event schedules.
SELECT
    f.facility_id,
    f.name AS facility_name,
    e.event_id,
    e.name AS event_name,
    e.date AS event_date
FROM
    campus_facilities f
LEFT JOIN campus_events e ON
    f.location = e.location
ORDER BY
    f.facility_id,
    e.date;
-- 38 Calculate the average GPA for male and female students separately.
SELECT
    s.gender,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4 WHEN g.grade_value = 'B' THEN 3 WHEN g.grade_value = 'C' THEN 2 WHEN g.grade_value = 'D' THEN 1 ELSE 0
    END
) AS average_gpa
FROM
    students s
JOIN enrollments e ON
    s.student_id = e.student_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
GROUP BY
    s.gender;
-- 39 Retrieve the list of courses where the average grade is below a certain threshold.
SELECT
    c.course_id,
    c.name AS course_name,
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) AS average_grade
FROM
    courses c
JOIN assignments a ON
    c.course_id = a.course_id
JOIN grades g ON
    a.assignment_id = g.assignment_id
GROUP BY
    c.course_id,
    c.name
HAVING
    AVG(
        CASE WHEN g.grade_value = 'A' THEN 4.0 WHEN g.grade_value = 'B' THEN 3.0 WHEN g.grade_value = 'C' THEN 2.0 WHEN g.grade_value = 'D' THEN 1.0 ELSE 0.0
    END
) < 4;
-- 40 Find the instructor who has the highest percentage of students receiving A grades in their courses. 
SELECT
    i.instructor_id,
    i.name AS instructor_name,
    d.name AS department_name,
    COUNT(
        CASE WHEN g.grade_value = 'A' THEN 1
    END
) / COUNT(DISTINCT e.student_id) AS percentage_a_grades
FROM
    instructors i
JOIN departments d ON
    i.department_id = d.department_id
JOIN courses c ON
    d.department_id = c.department_id
JOIN assignments a ON
    c.course_id = a.course_id
JOIN enrollments e ON
    a.course_id = e.course_id
JOIN grades g ON
    e.enrollment_id = g.enrollment_id
GROUP BY
    i.instructor_id,
    i.name,
    d.name
ORDER BY
    percentage_a_grades
DESC
LIMIT 1;
--41 List all assignments along with their submission deadlines.
SELECT
    a.assignment_id,
    a.name AS assignment_name,
    a.due_date,
    c.name AS course_name
FROM
    assignments a
JOIN courses c ON
    a.course_id = c.course_id;       

      










