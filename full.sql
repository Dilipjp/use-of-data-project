-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Mar 26, 2024 at 07:57 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `university_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_advisors`
--

CREATE TABLE `academic_advisors` (
  `advisor_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `academic_advisors`
--

INSERT INTO `academic_advisors` (`advisor_id`, `name`, `email`, `department_id`) VALUES
(1, 'Dr. White', 'drwhite@example.com', 1),
(2, 'Prof. Brown', 'profbrown@example.com', 2),
(3, 'Ms. Green', 'msgreen@example.com', 3),
(4, 'Dr. Black', 'drblack@example.com', 1),
(5, 'Prof. Gray', 'profgray@example.com', 2),
(6, 'Dr. Davis', 'drdavis@example.com', 3),
(7, 'Prof. Martinez', 'profmartinez@example.com', 1),
(8, 'Ms. Thomas', 'msthomas@example.com', 2),
(9, 'Dr. Garcia', 'drgarcia@example.com', 3),
(10, 'Prof. Rodriguez', 'profrodriguez@example.com', 1),
(11, 'Ms. Hernandez', 'mshernandez@example.com', 2),
(12, 'Dr. King', 'drking@example.com', 3),
(13, 'Prof. Adams', 'profadams@example.com', 1),
(14, 'Ms. Campbell', 'mscampbell@example.com', 2),
(15, 'Dr. Wilson', 'drwilson@example.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `assignment_id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assignments`
--

INSERT INTO `assignments` (`assignment_id`, `course_id`, `name`, `due_date`) VALUES
(1, 1, 'Assignment 1', '2023-09-20'),
(2, 2, 'Assignment 2', '2023-09-21'),
(3, 3, 'Assignment 3', '2023-09-22'),
(4, 4, 'Assignment 4', '2023-09-23'),
(5, 5, 'Assignment 5', '2023-09-24'),
(6, 6, 'Assignment 6', '2023-09-25'),
(7, 7, 'Assignment 7', '2023-09-26'),
(8, 8, 'Assignment 8', '2023-09-27'),
(9, 9, 'Assignment 9', '2023-09-28'),
(10, 10, 'Assignment 10', '2023-09-29'),
(11, 11, 'Assignment 11', '2023-09-30'),
(12, 12, 'Assignment 12', '2023-10-01'),
(13, 13, 'Assignment 13', '2023-10-02'),
(14, 14, 'Assignment 14', '2023-10-03'),
(15, 15, 'Assignment 15', '2023-10-04');

-- --------------------------------------------------------

--
-- Table structure for table `campus_events`
--

CREATE TABLE `campus_events` (
  `event_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campus_events`
--

INSERT INTO `campus_events` (`event_id`, `name`, `date`, `location`) VALUES
(1, 'Welcome Party', '2023-09-10', 'Student Union Building'),
(2, 'Career Fair', '2023-10-05', 'Main Campus Lawn'),
(3, 'Alumni Reunion', '2023-11-20', 'Alumni Hall'),
(4, 'Spring Festival', '2024-04-15', 'Recreation Center'),
(5, 'Academic Conference', '2024-05-10', 'Science Building'),
(6, 'Art Exhibition', '2023-10-20', 'Art Building'),
(7, 'Music Concert', '2023-11-05', 'Music Hall'),
(8, 'Economics Symposium', '2024-02-15', 'Economics Building'),
(9, 'Psychology Workshop', '2024-03-10', 'Psychology Building'),
(10, 'Sociology Conference', '2024-04-25', 'Sociology Building'),
(11, 'Political Science Debate', '2024-05-20', 'Political Science Building'),
(12, 'Geography Field Trip', '2023-10-15', 'Various Locations'),
(13, 'Physical Education Tournament', '2024-03-20', 'Recreation Center'),
(14, 'Chess Competition', '2023-12-01', 'Student Union Building'),
(15, 'Dance Performance', '2023-11-15', 'Performing Arts Center');

-- --------------------------------------------------------

--
-- Table structure for table `campus_facilities`
--

CREATE TABLE `campus_facilities` (
  `facility_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `campus_facilities`
--

INSERT INTO `campus_facilities` (`facility_id`, `name`, `location`) VALUES
(1, 'Library', 'Main Building, Floor 2'),
(2, 'Gymnasium', 'Recreation Center'),
(3, 'Computer Lab', 'Science Building, Room 101'),
(4, 'Cafeteria', 'Student Union Building'),
(5, 'Auditorium', 'Performing Arts Center'),
(6, 'Football Field', 'Campus Stadium'),
(7, 'Swimming Pool', 'Recreation Center'),
(8, 'Art Studio', 'Art Building, Room 102'),
(9, 'Music Hall', 'Music Building, Room 201'),
(10, 'Economics Lab', 'Economics Building, Room 103'),
(11, 'Psychology Research Center', 'Psychology Building, Room 301'),
(12, 'Sociology Seminar Room', 'Sociology Building, Room 202'),
(13, 'Political Science Lecture Hall', 'Political Science Building, Room 101'),
(14, 'Geography Classroom', 'Geography Building, Room 301'),
(15, 'Fitness Center', 'Recreation Center');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credits` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`course_id`, `name`, `credits`, `department_id`) VALUES
(1, 'Math 101', 3, 1),
(2, 'History 101', 4, 2),
(3, 'Computer Science 101', 3, 3),
(4, 'English Literature 101', 3, 4),
(5, 'Physics 101', 4, 5),
(6, 'Chemistry 101', 3, 6),
(7, 'Biology 101', 4, 7),
(8, 'Art 101', 3, 8),
(9, 'Music 101', 3, 9),
(10, 'Economics 101', 4, 10),
(11, 'Psychology 101', 3, 11),
(12, 'Sociology 101', 4, 12),
(13, 'Political Science 101', 3, 13),
(14, 'Geography 101', 3, 14),
(15, 'Physical Education 101', 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `head_of_department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `name`, `head_of_department_id`) VALUES
(1, 'Mathematics', 1),
(2, 'History', 2),
(3, 'Computer Science', 3),
(4, 'Physics', 4),
(5, 'Chemistry', 5),
(6, 'Biology', 6),
(7, 'English', 7),
(8, 'Economics', 8),
(9, 'Psychology', 9),
(10, 'Sociology', 10),
(11, 'Political Science', 11),
(12, 'Geography', 12),
(13, 'Physical Education', 13),
(14, 'Art', 14),
(15, 'Music', 15);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `enrollment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollments`
--

INSERT INTO `enrollments` (`enrollment_id`, `student_id`, `course_id`, `enrollment_date`) VALUES
(1, 1, 1, '2023-09-01'),
(2, 2, 2, '2023-09-02'),
(3, 3, 3, '2023-09-03'),
(4, 4, 4, '2023-09-04'),
(5, 5, 5, '2023-09-05'),
(6, 6, 6, '2023-09-06'),
(7, 7, 7, '2023-09-07'),
(8, 8, 8, '2023-09-08'),
(9, 9, 9, '2023-09-09'),
(10, 10, 10, '2023-09-10'),
(11, 11, 11, '2023-09-11'),
(12, 12, 12, '2023-09-12'),
(13, 13, 13, '2023-09-13'),
(14, 14, 14, '2023-09-14'),
(15, 15, 15, '2023-09-15');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `assignment_id` int(11) DEFAULT NULL,
  `grade_value` varchar(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`grade_id`, `enrollment_id`, `assignment_id`, `grade_value`) VALUES
(16, 1, 1, 'A'),
(17, 2, 2, 'B'),
(18, 3, 3, 'A'),
(19, 4, 4, 'B'),
(20, 5, 5, 'A'),
(21, 6, 6, 'B'),
(22, 7, 7, 'A'),
(23, 8, 8, 'B'),
(24, 9, 9, 'A'),
(25, 10, 10, 'B'),
(26, 11, 11, 'A'),
(27, 12, 12, 'B'),
(28, 13, 13, 'A'),
(29, 14, 14, 'B'),
(30, 15, 15, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` (
  `instructor_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instructors`
--

INSERT INTO `instructors` (`instructor_id`, `name`, `email`, `department_id`) VALUES
(1, 'Dr. White', 'drwhite@example.com', 1),
(2, 'Prof. Brown', 'profbrown@example.com', 2),
(3, 'Ms. Green', 'msgreen@example.com', 3),
(4, 'Dr. Black', 'drblack@example.com', 1),
(5, 'Prof. Gray', 'profgray@example.com', 2),
(6, 'Dr. Davis', 'drdavis@example.com', 3),
(7, 'Prof. Martinez', 'profmartinez@example.com', 1),
(8, 'Ms. Thomas', 'msthomas@example.com', 2),
(9, 'Dr. Garcia', 'drgarcia@example.com', 3),
(10, 'Prof. Rodriguez', 'profrodriguez@example.com', 1),
(11, 'Ms. Hernandez', 'mshernandez@example.com', 2),
(12, 'Dr. King', 'drking@example.com', 3),
(13, 'Prof. Adams', 'profadams@example.com', 1),
(14, 'Ms. Campbell', 'mscampbell@example.com', 2),
(15, 'Dr. Wilson', 'drwilson@example.com', 3);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `advisor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `email`, `dob`, `department_id`, `advisor_id`) VALUES
(1, 'Alice Johnson', 'alice@example.com', '2000-01-01', 1, 1),
(2, 'Bob Smith', 'bob@example.com', '2000-02-01', 2, 2),
(3, 'Charlie Brown', 'charlie@example.com', '2000-03-01', 3, 3),
(4, 'David Davis', 'david@example.com', '2000-04-01', 4, 4),
(5, 'Emma Wilson', 'emma@example.com', '2000-05-01', 5, 5),
(6, 'Frank Miller', 'frank@example.com', '2000-06-01', 6, 6),
(7, 'Grace Taylor', 'grace@example.com', '2000-07-01', 7, 7),
(8, 'Henry Anderson', 'henry@example.com', '2000-08-01', 8, 8),
(9, 'Ivy Thomas', 'ivy@example.com', '2000-09-01', 9, 9),
(10, 'Jack Roberts', 'jack@example.com', '2000-10-01', 10, 10),
(11, 'Kevin Brown', 'kevin@example.com', '2000-11-01', 11, 11),
(12, 'Lily Moore', 'lily@example.com', '2000-12-01', 12, 12),
(13, 'Mia Wilson', 'mia@example.com', '2001-01-01', 13, 13),
(14, 'Noah Taylor', 'noah@example.com', '2001-02-01', 14, 14),
(15, 'Olivia Lee', 'olivia@example.com', '2001-03-01', 15, 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_advisors`
--
ALTER TABLE `academic_advisors`
  ADD PRIMARY KEY (`advisor_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `campus_events`
--
ALTER TABLE `campus_events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `campus_facilities`
--
ALTER TABLE `campus_facilities`
  ADD PRIMARY KEY (`facility_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `head_of_department_id` (`head_of_department_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `enrollment_id` (`enrollment_id`),
  ADD KEY `assignment_id` (`assignment_id`);

--
-- Indexes for table `instructors`
--
ALTER TABLE `instructors`
  ADD PRIMARY KEY (`instructor_id`),
  ADD KEY `department_id_index` (`department_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `advisor_id` (`advisor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_advisors`
--
ALTER TABLE `academic_advisors`
  MODIFY `advisor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `campus_events`
--
ALTER TABLE `campus_events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `campus_facilities`
--
ALTER TABLE `campus_facilities`
  MODIFY `facility_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `academic_advisors`
--
ALTER TABLE `academic_advisors`
  ADD CONSTRAINT `academic_advisors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`head_of_department_id`) REFERENCES `instructors` (`instructor_id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_ibfk_1` FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`),
  ADD CONSTRAINT `grades_ibfk_2` FOREIGN KEY (`assignment_id`) REFERENCES `assignments` (`assignment_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`advisor_id`) REFERENCES `academic_advisors` (`advisor_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
