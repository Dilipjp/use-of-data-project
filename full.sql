-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Mar 05, 2024 at 09:05 PM
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
(31, 'Dr. White', 'drwhite@example.com', 1),
(32, 'Prof. Brown', 'profbrown@example.com', 2),
(33, 'Ms. Green', 'msgreen@example.com', 3),
(34, 'Dr. Black', 'drblack@example.com', 1),
(35, 'Prof. Gray', 'profgray@example.com', 2),
(36, 'Dr. Davis', 'drdavis@example.com', 3),
(37, 'Prof. Martinez', 'profmartinez@example.com', 1),
(38, 'Ms. Thomas', 'msthomas@example.com', 2),
(39, 'Dr. Garcia', 'drgarcia@example.com', 3),
(40, 'Prof. Rodriguez', 'profrodriguez@example.com', 1),
(41, 'Ms. Hernandez', 'mshernandez@example.com', 2),
(42, 'Dr. King', 'drking@example.com', 3),
(43, 'Prof. Adams', 'profadams@example.com', 1),
(44, 'Ms. Campbell', 'mscampbell@example.com', 2),
(45, 'Dr. Wilson', 'drwilson@example.com', 3);

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
  MODIFY `advisor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instructors`
--
ALTER TABLE `instructors`
  MODIFY `instructor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
