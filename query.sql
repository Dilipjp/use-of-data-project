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
    department_id INT,
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




