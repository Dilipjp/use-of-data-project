CREATE TABLE campus_facilities (
    facility_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
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
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dob DATE,
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


INSERT INTO campus_facilities (name, location) VALUES
('Library', 'Main Building, Floor 2'),
('Gymnasium', 'Recreation Center'),
('Computer Lab', 'Science Building, Room 101'),
('Cafeteria', 'Student Union Building'),
('Auditorium', 'Performing Arts Center'),
('Football Field', 'Campus Stadium'),
('Swimming Pool', 'Recreation Center'),
('Art Studio', 'Art Building, Room 102'),
('Music Hall', 'Music Building, Room 201'),
('Economics Lab', 'Economics Building, Room 103'),
('Psychology Research Center', 'Psychology Building, Room 301'),
('Sociology Seminar Room', 'Sociology Building, Room 202'),
('Political Science Lecture Hall', 'Political Science Building, Room 101'),
('Geography Classroom', 'Geography Building, Room 301'),
('Fitness Center', 'Recreation Center');


INSERT INTO campus_events (name, date, location) VALUES
('Welcome Party', '2023-09-10', 'Student Union Building'),
('Career Fair', '2023-10-05', 'Main Campus Lawn'),
('Alumni Reunion', '2023-11-20', 'Alumni Hall'),
('Spring Festival', '2024-04-15', 'Recreation Center'),
('Academic Conference', '2024-05-10', 'Science Building'),
('Art Exhibition', '2023-10-20', 'Art Building'),
('Music Concert', '2023-11-05', 'Music Hall'),
('Economics Symposium', '2024-02-15', 'Economics Building'),
('Psychology Workshop', '2024-03-10', 'Psychology Building'),
('Sociology Conference', '2024-04-25', 'Sociology Building'),
('Political Science Debate', '2024-05-20', 'Political Science Building'),
('Geography Field Trip', '2023-10-15', 'Various Locations'),
('Physical Education Tournament', '2024-03-20', 'Recreation Center'),
('Chess Competition', '2023-12-01', 'Student Union Building'),
('Dance Performance', '2023-11-15', 'Performing Arts Center');

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

INSERT INTO courses (name, credits, department_id) VALUES
('Math 101', 3, 1),
('History 101', 4, 2),
('Computer Science 101', 3, 3),
('English Literature 101', 3, 4),
('Physics 101', 4, 5),
('Chemistry 101', 3, 6),
('Biology 101', 4, 7),
('Art 101', 3, 8),
('Music 101', 3, 9),
('Economics 101', 4, 10),
('Psychology 101', 3, 11),
('Sociology 101', 4, 12),
('Political Science 101', 3, 13),
('Geography 101', 3, 14),
('Physical Education 101', 4, 15);

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

INSERT INTO students (name, email, dob, department_id, advisor_id) VALUES
('Alice Johnson', 'alice@example.com', '2000-01-01', 1, 1),
('Bob Smith', 'bob@example.com', '2000-02-01', 2, 2),
('Charlie Brown', 'charlie@example.com', '2000-03-01', 3, 3),
('David Davis', 'david@example.com', '2000-04-01', 4, 4),
('Emma Wilson', 'emma@example.com', '2000-05-01', 5, 5),
('Frank Miller', 'frank@example.com', '2000-06-01', 6, 6),
('Grace Taylor', 'grace@example.com', '2000-07-01', 7, 7),
('Henry Anderson', 'henry@example.com', '2000-08-01', 8, 8),
('Ivy Thomas', 'ivy@example.com', '2000-09-01', 9, 9),
('Jack Roberts', 'jack@example.com', '2000-10-01', 10, 10),
('Kevin Brown', 'kevin@example.com', '2000-11-01', 11, 11),
('Lily Moore', 'lily@example.com', '2000-12-01', 12, 12),
('Mia Wilson', 'mia@example.com', '2001-01-01', 13, 13),
('Noah Taylor', 'noah@example.com', '2001-02-01', 14, 14),
('Olivia Lee', 'olivia@example.com', '2001-03-01', 15, 15);


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










