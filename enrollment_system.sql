-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for enrollment_system
CREATE DATABASE IF NOT EXISTS `enrollment_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `enrollment_system`;

-- Dumping structure for table enrollment_system.tbl_account
CREATE TABLE IF NOT EXISTS `tbl_account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `user_type` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `admission_status` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_account: ~7 rows (approximately)
REPLACE INTO `tbl_account` (`id`, `username`, `password`, `status`, `user_type`, `admission_status`) VALUES
	(1, 'admin', 'a', 'Enable', 'Admin', ''),
	(3, 'a', 'a', 'Enable', 'Student', ''),
	(7, 'client', 'client', 'Enable', 'Client', ''),
	(12, 'ejhaygofredo@gmail.com', '2', 'Enable', 'Client', 'Off'),
	(17, 'test@gmail.com', '12345', 'Enable', 'Client', 'Off'),
	(18, 'head', 'head', 'Enable', 'Head_Admin', ''),
	(19, 'b', '5', 'Enable', 'Head_Admin', '');

-- Dumping structure for table enrollment_system.tbl_admission
CREATE TABLE IF NOT EXISTS `tbl_admission` (
  `admission_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `date` date NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`admission_id`),
  KEY `id` (`id`),
  CONSTRAINT `tbl_admission_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbl_student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_admission: ~14 rows (approximately)
REPLACE INTO `tbl_admission` (`admission_id`, `id`, `date`, `status`) VALUES
	(62, 58, '2024-03-19', 'Read'),
	(63, 59, '2024-03-20', 'Read'),
	(64, 60, '2024-03-20', 'Read'),
	(65, 61, '2024-03-20', 'Read'),
	(66, 62, '2024-03-20', 'Read'),
	(67, 63, '2024-03-20', 'Read'),
	(68, 64, '2024-03-20', 'Read'),
	(69, 65, '2024-03-20', 'Read'),
	(70, 66, '2024-03-20', 'Read'),
	(71, 67, '2024-03-20', 'Read'),
	(72, 68, '2024-03-20', 'Read'),
	(75, 71, '2024-03-20', 'Pending');

-- Dumping structure for table enrollment_system.tbl_course
CREATE TABLE IF NOT EXISTS `tbl_course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `course_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_course: ~10 rows (approximately)
REPLACE INTO `tbl_course` (`course_id`, `course_name`, `course_description`) VALUES
	(2, 'BSIT', 'Information technology (IT) is the use of any computers, storage, networking and other physical devices, infrastructure and processes to create, process, store, secure and exchange all forms of electronic data.'),
	(3, 'BSTM', 'Bachelor of Science in Tourism Management, this program equips students for careers in hospitality and travel'),
	(4, 'BSED', 'Bachelor of Secondary Education (BSEd) is a four-year program that prepares its students for the art and science of teaching.'),
	(5, 'BSCS', 'Bachelor of Science in Computer Science (BSCS) is a four-year program that includes the study of computing concepts and theories, algorithmic foundations, and new developments in computing.'),
	(6, 'BSIS', 'he Bachelor of Science in Information Systems (BSIS) program is a four-year degree program which focuses on the design and implementation of computer-based information systems and other ICT solutions to address the demands in existing business processes.'),
	(7, 'BSHM', 'The Bachelor of Science in Hospitality Management (BS HM) is a four-year degree program that covers the process of planning, development, human resource management of the different aspects of the hotel, restaurant, and resorts operations. The program also'),
	(8, 'BSOAD', 'he Bachelor of Science in Information Systems (BSIS) program is a four-year degree program which focuses on the design and implementation of computer-based information systems and other ICT solutions to address the demands in existing business processes.'),
	(9, 'BSchem', 'Bachelor of Science in Chemistry (BSChem) is a four-year program that aims to produce graduates who comply with the current qualification requirements of professional chemists for local and overseas employment and entrepreneurship.'),
	(10, 'BSCE', '(Bachelor of Science in Civil Engineering) BSCE Course Meaning. Bachelor of Science in Civil Engineering is a unique course that covers a wide range of specialities, including construction, transportation, structural, geotechnical, hydrology & hydrodynami'),
	(11, 'BSEE', 'The accredited program leading to the degree of Bachelor of Science in Electrical Engineering is intended to qualify students to begin a professional career in electrical engineering or to proceed to advanced study.');

-- Dumping structure for table enrollment_system.tbl_enrollment
CREATE TABLE IF NOT EXISTS `tbl_enrollment` (
  `enrollment_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `Section` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Year` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Sem` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cor` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`enrollment_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_enrollment_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_enrollment: ~10 rows (approximately)
REPLACE INTO `tbl_enrollment` (`enrollment_id`, `student_id`, `Section`, `Year`, `Sem`, `Remark`, `Cor`, `date`) VALUES
	(58, 58, '7', 'Fourth Year', 'Second Semester', 'Completed', 'Generated', '2024-11-04 16:04:13'),
	(59, 59, '7', 'First Year', 'First Semester', 'Completed', 'Generated', '2024-12-04 16:04:13'),
	(60, 60, '7', 'First Year', 'First Semester', 'Completed', 'Not Generated', '2024-10-04 16:04:13'),
	(61, 61, '7', 'First Year', 'First Semester', 'Incomplete', 'Not Generated', '2024-06-04 16:04:13'),
	(63, 67, '7', 'First Year', 'First Semester', 'Completed', 'Not Generated', '2024-04-04 16:04:13'),
	(64, 65, '8', 'Second Year', 'First Semester', 'Completed', 'Not Generated', '2024-04-04 16:04:13'),
	(65, 68, '8', 'Second Year', 'Second Semester', 'Incomplete', 'Not Generated', '2024-09-04 16:04:13'),
	(67, 64, '7', 'Fourth Year', 'First Semester', 'Completed', 'Not Generated', '2024-10-04 16:04:13'),
	(68, 62, '8', 'Third Year', 'Second Semester', 'Incomplete', 'Not Generated', '2024-12-04 16:04:13'),
	(69, 63, '7', 'First Year', 'First Semester', 'Form 137', 'Not Generated', '2024-12-04 16:04:13');

-- Dumping structure for table enrollment_system.tbl_inquiry
CREATE TABLE IF NOT EXISTS `tbl_inquiry` (
  `id_inquiry` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `messages` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `contact` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `inquiry_status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `date_inquiry` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_inquiry`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_inquiry: ~10 rows (approximately)
REPLACE INTO `tbl_inquiry` (`id_inquiry`, `name`, `email`, `messages`, `contact`, `inquiry_status`, `date_inquiry`) VALUES
	(6, 'John Erick Langub Gofredo', 'johnerick.gofredo@yahoo.com', 'test 1', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(7, 'Roland a Mangulabnan', 'roland.mangulabnan@yahoo.com', 'test 2', '09626341248', 'Read', '2024-12-04 18:21:53'),
	(8, 'Faye C Tubale', 'faye@yahoo.com', 'test 3', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(9, 'Miguel V Lamano', 'miguel.lamano@yahoo.com', 'test 4', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(10, 'Karl L Cabuguas', 'karl.Cabuguas@yahoo.com', 'test 5', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(11, 'Merlita Q Delacruz', 'merlita@yahoo.com', 'test 7', '09626341248', 'Read', '2024-12-04 18:21:53'),
	(12, 'Nicolaine N Perez', 'nicollaine.perez@yahoo.com', 'test 8', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(13, 'Faye C Tubale', 'faye@yahoo.com', 'test 9', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(14, 'Miguel V Lamano', 'miguel.lamano@yahoo.com', 'test 10', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(15, 'John Erick Gofredo', 'ejhaygofredo@gmail.com', 'I hope this message finds you well. My name is [Your Full Name], and I am writing to inquire about the admission process for the [Program Name] at [University/College Name] for the upcoming academic year [Year].', '09616341248', 'Read', '2024-12-04 18:21:53'),
	(16, 'John Doe', 'johndoe@gmail.com', 'I hope this message finds you well. I am writing to inquire about the admission process for the [specific grade/academic year] at [School\'s Name]. I am particularly interested in learning more about the academic programs and extracurricular activities offered at your school', '09616341248', 'Pending', '2024-12-06 17:08:09');

-- Dumping structure for table enrollment_system.tbl_public
CREATE TABLE IF NOT EXISTS `tbl_public` (
  `public_id` int NOT NULL AUTO_INCREMENT,
  `public_img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `posted_date` datetime(6) NOT NULL,
  `public_content` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`public_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_public: ~2 rows (approximately)
REPLACE INTO `tbl_public` (`public_id`, `public_img`, `posted_date`, `public_content`, `title`, `status`) VALUES
	(16, '../../Image-Container/65f9e695d5c147.67433083.jpg', '2024-03-20 03:25:09.909507', 'Attention everyone! Save the date - our school-wide event is set to take place on [insert specific date], promising a day filled with excitement and camaraderie. Get ready to join in on the fun and make lasting memories together.', 'Incoming School Year', ''),
	(17, '../../Image-Container/65f9e6b35ee441.59961021.jpg', '2024-03-20 03:25:39.390808', 'Dear graduating class of [Year],\r\n\r\nWe are thrilled to announce the upcoming graduation ceremony scheduled for [specific date]. This momentous occasion marks the culmination of your hard work, dedication, and achievements throughout your academic journey.', 'Graduation', '');

-- Dumping structure for table enrollment_system.tbl_reports
CREATE TABLE IF NOT EXISTS `tbl_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `year` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Semester` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `section` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_reports: ~9 rows (approximately)
REPLACE INTO `tbl_reports` (`report_id`, `report_title`, `year`, `Semester`, `section`, `gender`, `date`) VALUES
	(41, 'Admission Student', 'First Year', 'First Semester', 'ALL', 'ALL', '2024-03-20'),
	(42, 'Admission Student', 'First Year', 'First Semester', 'ALL', 'Male', '2024-03-20'),
	(43, 'Admission Student', 'First Year', 'First Semester', 'ALL', 'Female', '2024-03-20'),
	(44, 'Enrolled Student', 'First Year', 'First Semester', '7', 'ALL', '2024-03-20'),
	(45, 'Enrolled Student', 'First Year', 'First Semester', '8', 'ALL', '2024-03-20'),
	(46, 'Enrolled Student', 'Second Year', 'First Semester', '8', 'ALL', '2024-03-20'),
	(47, 'Enrolled Student', 'Second Year', 'First Semester', 'ALL', 'ALL', '2024-03-20'),
	(48, 'Enrolled Student', 'Second Year', 'Second Semester', 'ALL', 'ALL', '2024-03-20'),
	(49, 'Enrolled Student', 'Fourth Year', 'First Semester', 'ALL', 'ALL', '2024-03-20');

-- Dumping structure for table enrollment_system.tbl_requirements
CREATE TABLE IF NOT EXISTS `tbl_requirements` (
  `requirement_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `requirement_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`requirement_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_requirements_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_requirements: ~32 rows (approximately)
REPLACE INTO `tbl_requirements` (`requirement_id`, `student_id`, `requirement_name`) VALUES
	(168, 58, 'PSA Authenticated Birth Certificate'),
	(169, 58, 'Passport Size ID Picture'),
	(170, 58, 'Barangay Clearance'),
	(171, 58, 'Transcript of Records from Previous School'),
	(172, 58, 'Honorable Dismissal'),
	(173, 59, 'Form 138 (Report Card)'),
	(174, 59, 'Form 137'),
	(175, 59, 'Certificate of Good Moral'),
	(176, 59, 'PSA Authenticated Birth Certificate'),
	(177, 59, 'Passport Size ID Picture'),
	(178, 59, 'Barangay Clearance'),
	(179, 59, 'Transcript of Records from Previous School'),
	(180, 59, 'Honorable Dismissal'),
	(181, 60, 'PSA Authenticated Birth Certificate'),
	(182, 60, 'Passport Size ID Picture'),
	(183, 60, 'Barangay Clearance'),
	(184, 60, 'Transcript of Records from Previous School'),
	(185, 60, 'Honorable Dismissal'),
	(186, 61, 'Barangay Clearance'),
	(187, 61, 'Transcript of Records from Previous School'),
	(188, 61, 'Honorable Dismissal'),
	(194, 67, 'Barangay Clearance'),
	(195, 67, 'Transcript of Records from Previous School'),
	(196, 67, 'Honorable Dismissal'),
	(197, 65, 'Passport Size ID Picture'),
	(198, 65, 'Barangay Clearance'),
	(199, 65, 'Transcript of Records from Previous School'),
	(200, 68, 'Passport Size ID Picture'),
	(201, 68, 'Barangay Clearance'),
	(205, 64, 'Certificate of Good Moral'),
	(206, 64, 'PSA Authenticated Birth Certificate'),
	(207, 64, 'Passport Size ID Picture'),
	(208, 58, 'Form 137'),
	(209, 63, 'Form 137'),
	(210, 63, 'Transcript of Records from Previous School'),
	(211, 63, 'Honorable Dismissal'),
	(212, 58, 'Form 138 (Report Card)');

-- Dumping structure for table enrollment_system.tbl_schedule
CREATE TABLE IF NOT EXISTS `tbl_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_schedule: ~1 rows (approximately)
REPLACE INTO `tbl_schedule` (`schedule_id`, `schedule_name`) VALUES
	(26, 'IT 101'),
	(27, 'IT-102');

-- Dumping structure for table enrollment_system.tbl_schedule_day
CREATE TABLE IF NOT EXISTS `tbl_schedule_day` (
  `schedule_day_id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `subject` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `day` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `time_in` time(6) NOT NULL,
  `time_out` time(6) NOT NULL,
  PRIMARY KEY (`schedule_day_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_schedule_day: ~15 rows (approximately)
REPLACE INTO `tbl_schedule_day` (`schedule_day_id`, `schedule_id`, `subject`, `day`, `time_in`, `time_out`) VALUES
	(62, 26, '7', 'Monday', '07:30:00.000000', '09:00:00.000000'),
	(63, 26, 'Recess', 'Monday', '09:00:00.000000', '09:30:00.000000'),
	(64, 26, '10', 'Monday', '09:30:00.000000', '11:00:00.000000'),
	(65, 26, '6', 'Monday', '11:00:00.000000', '12:00:00.000000'),
	(66, 26, 'Lunch Break', 'Monday', '12:00:00.000000', '13:00:00.000000'),
	(67, 26, '4', 'Monday', '13:00:00.000000', '15:00:00.000000'),
	(68, 26, '8', 'Wednesday', '07:00:00.000000', '09:00:00.000000'),
	(69, 26, 'Recess', 'Wednesday', '09:00:00.000000', '09:30:00.000000'),
	(70, 26, '10', 'Wednesday', '09:30:00.000000', '12:00:00.000000'),
	(71, 26, 'Lunch Break', 'Wednesday', '12:00:00.000000', '13:00:00.000000'),
	(72, 26, '9', 'Wednesday', '13:00:00.000000', '15:00:00.000000'),
	(73, 26, '5', 'Friday', '10:30:00.000000', '12:30:00.000000'),
	(74, 26, '9', 'Friday', '12:30:00.000000', '14:30:00.000000'),
	(75, 26, 'Lunch Break', 'Friday', '14:30:00.000000', '15:00:00.000000'),
	(76, 26, '9', 'Friday', '15:00:00.000000', '16:00:00.000000'),
	(77, 27, '5', 'Monday', '07:00:00.000000', '09:00:00.000000'),
	(78, 27, 'Recess', 'Monday', '09:00:00.000000', '09:30:00.000000'),
	(79, 27, '4', 'Monday', '09:30:00.000000', '11:30:00.000000'),
	(80, 27, '13', 'Monday', '11:30:00.000000', '13:00:00.000000'),
	(81, 27, '9', 'Friday', '13:00:00.000000', '15:00:00.000000');

-- Dumping structure for table enrollment_system.tbl_section
CREATE TABLE IF NOT EXISTS `tbl_section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `section_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `room` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_section: ~2 rows (approximately)
REPLACE INTO `tbl_section` (`section_id`, `schedule_id`, `section_name`, `room`) VALUES
	(7, 26, 'IT-102', '302'),
	(8, 26, 'IT-103', '206'),
	(9, 26, 'IT-101', '302');

-- Dumping structure for table enrollment_system.tbl_student_info
CREATE TABLE IF NOT EXISTS `tbl_student_info` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `middleName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `lastName` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Suffix` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `street` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `province` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `zipCode` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `number` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `civilStatus` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fatherFirstname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fatherMiddlename` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fatherLastname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fatherSuffix` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `fatherOccupation` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `motherFirstname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `motherMiddlename` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `motherLastname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `motherSuffix` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `MotherOccupation` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `course` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Bod` date NOT NULL,
  `admissionType` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Student_Type` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `pri-name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `pri-year` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `sec` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `sec-year` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `last` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `last-year` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `gnumber` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_student_info: ~12 rows (approximately)
REPLACE INTO `tbl_student_info` (`student_id`, `firstName`, `middleName`, `lastName`, `Suffix`, `gender`, `street`, `city`, `province`, `country`, `zipCode`, `email`, `number`, `civilStatus`, `fatherFirstname`, `fatherMiddlename`, `fatherLastname`, `fatherSuffix`, `fatherOccupation`, `motherFirstname`, `motherMiddlename`, `motherLastname`, `motherSuffix`, `MotherOccupation`, `course`, `Bod`, `admissionType`, `Student_Type`, `pri-name`, `pri-year`, `sec`, `sec-year`, `last`, `last-year`, `gnumber`) VALUES
	(58, 'John Erick', 'Gofredo', 'Langub', '', 'Male', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'johnerick.gofredo@yahoo.com', 'Bulacan', 'Single', 'Roderick', 'Mariano', 'Gofredo', 'Sr', 'Police', 'Mariala', 'Pardillo', 'Langub', '', 'OFW', 'BSTM', '2024-03-06', 'Freshmen', 'E', 'SES', '2000', 'PNHS', '2000', 'BestLink', '2000', '0928-234-1242'),
	(59, 'Roland', 'a', 'Mangulabnan', 'jr', 'Male', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'roland.mangulabnan@yahoo.com', '09626341248', 'Single', 'Roband', 'S', 'Mangulabnan', 'Sr', 'Programmer', 'Maria', 'S', 'Mangulabnan', '', 'OFW', 'BSIT', '2024-03-08', 'Freshmen', 'E', 'SES', '2012', 'PNHS', '2018', 'BestLink', '2024', '0923-231-3142'),
	(60, 'Robin', 'a', 'Guingab', 'jr', 'Male', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'robin.guingab@yahoo.com', '09626341248', 'Single', 'Robert', 'A', 'Guingab', 'Sr', 'Designer', 'Teresa', 'S', 'Guingab', '', 'Designer', 'BSED', '2024-03-08', 'Freshmen', 'E', 'SES', '2012', 'PNHS', '2018', 'BestLink', '2024', '0923-231-3142'),
	(61, 'Kristians', 'Cordero', 'S', '', 'Male', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'kristian.cordero@yahoo.com', 'Bulacan', 'Single', 'Kris', 'V', 'Cordero', '', 'Programmer', 'Lina', 'C', 'Cordero', '', 'OFW', 'BSIT', '2024-02-29', 'Returnee', 'E', 'SES', '2000', 'PNHS', '2000', 'BestLink', '2000', '0923-231-3142'),
	(62, 'Karl', 'L', 'Cabuguas', '', 'Male', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'karl.Cabuguas@yahoo.com', '09616341248', 'Single', 'kiel', 'W', 'Cabuguas', '', 'Programmer', 'Pauline', 'Z', 'Cabuguas', '', 'OFW', 'BSIT', '2024-03-02', 'Returnee', 'E', 'SES', '2012', 'PNHS', '2018', 'BestLink', '2024', '0923-231-3142'),
	(63, 'Alberto', 'B', 'Luceno', '', 'Male', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'alberto.luceno@yahoo.com', '09616341248', 'Single', 'albert', 'A', 'Luceno', '', 'Programmer', 'Lita', 'A', 'Luceno', '', 'Designer', 'BSIT', '2024-03-08', 'Transferee', 'E', 'SES', '2018', 'PNHS', '2023', 'BestLink', '2024', '0923-231-3142'),
	(64, 'Miguel', 'V', 'Lamano', '', 'Male', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'miguel.lamano@yahoo.com', '09616341248', 'Single', 'Migs', 'N', 'Lamano', '', 'Networking', 'Mila', 'C', 'Lamano', '', 'House\'wife', 'BSIT', '2024-03-06', 'Transferee', 'E', 'SES', '2010', 'PNHS', '2016', 'PDM', '2024', '0923-231-3142'),
	(65, 'Andrea', 'N', 'Puria', '', 'Female', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'andrea.puria@yahoo.com', '09616341248', 'Single', 'Dreu', 'N', 'Puria', '', 'Engineering', 'Melo', 'N', 'Puria', '', 'House\'wife', 'BSIT', '2024-03-07', 'Freshmen', 'E', 'SES', '2012', 'PNHS', '2018', 'PDM', '2024', '0923-231-3142'),
	(66, 'Nicolaine', 'N', 'Perez', '', 'Female', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'nicollaine.perez@yahoo.com', '09616341248', 'Devorced', 'Nicky', 'N', 'Pereze', '', 'Programmer', 'Nick', 'C', 'Perez', '', 'Designer', 'BSIT', '2024-03-15', 'Freshmen', 'NE', 'SES', '2012', 'PNHS', '2018', 'BestLink', '2024', '0923-231-3142'),
	(67, 'Cheska', 'M', 'Bartolome', '', 'Female', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'cheska.bartolome@yahoo.com', '09626341248', 'Single', 'Chester', 'K', 'Bartolome', '', 'Networking', 'Chesk', 'L', 'Bartolome', '', 'OFW', 'BSIT', '2024-03-08', 'Freshmen', 'E', 'SES', '2012', '', '2018', 'PDM', '2024', '0923-231-3142'),
	(68, 'Faye', 'C', 'Tubale', '', 'Female', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'faye@yahoo.com', '09616341248', 'Married', 'Fer', 'N', 'Tubale', '', 'Programmer', 'Fayer', 'N', 'Tubale', '', 'Designer', 'BSIT', '2024-03-02', 'Transferee', 'E', 'SES', '2010', 'PNHS', '2016', 'BestLink', '2022', '0923-231-3142'),
	(71, 'Angelica', 'Q', 'Del Valle', '', 'Female', 'San Miguel St', 'San Jose', 'Bulacan', 'Philippines', '2030', 'angelica@yahoo.com', '09616341248', 'Single', 'andew', 'q', 'Del valle', 'Sr', 'Police', 'Angela', 'V', 'Del Valle', '', 'Designer', 'BSIT', '2024-03-01', 'Freshmen', 'NE', 'SES', '2004', 'PNHS', '2012', 'PDM', '2024', '0923-231-3142');

-- Dumping structure for table enrollment_system.tbl_subject
CREATE TABLE IF NOT EXISTS `tbl_subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject_unit` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table enrollment_system.tbl_subject: ~8 rows (approximately)
REPLACE INTO `tbl_subject` (`subject_id`, `subject_name`, `subject_code`, `subject_description`, `subject_unit`) VALUES
	(4, 'OOP', '213', 'Object-oriented programming (OOP)', '3'),
	(5, 'Gen-Math', 'BSIT-Math', 'General Mathematics aims to develop learners\' unde', '3'),
	(6, 'DB1', 'BSIT-DB', 'A database is an organized collection of structure', '3'),
	(7, 'Web Programming.', 'BSIT-2', 'Web developers design, maintain, and optimize webs', '3'),
	(8, 'Digital Electronics.', 'BSIT', 'What is meant by digital electronics?\r\nDigital ele', '2'),
	(9, 'Advance and Data Structure.', 'BSIT', 'Advanced Data structures are one of the essential ', '2'),
	(10, 'Life and Works of Rizal', 'Gen', 'What is Rizal\'s life and works subject?\r\nSummary o', '2'),
	(11, 'Programming with JAVA.', 'BSIT-1', 'Java is a multi-platform, object-oriented, and net', '2'),
	(12, 'Recess', '0', 'Recess is a scheduled break in the school day that allows students to take a break from academic', '0'),
	(13, 'Lunch Break', '0', 'Lunch is a midday meal during the school day, providing students with a break to eat, socialize', '0');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
