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

-- Data exporting was unselected.

-- Dumping structure for table enrollment_system.tbl_admission
CREATE TABLE IF NOT EXISTS `tbl_admission` (
  `admission_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
  `status` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admission_id`),
  KEY `id` (`id`),
  CONSTRAINT `tbl_admission_ibfk_1` FOREIGN KEY (`id`) REFERENCES `tbl_student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table enrollment_system.tbl_course
CREATE TABLE IF NOT EXISTS `tbl_course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `course_description` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table enrollment_system.tbl_reports
CREATE TABLE IF NOT EXISTS `tbl_reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `report_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `year` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `Semester` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `section` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table enrollment_system.tbl_requirements
CREATE TABLE IF NOT EXISTS `tbl_requirements` (
  `requirement_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `requirement_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`requirement_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `tbl_requirements_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student_info` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table enrollment_system.tbl_schedule
CREATE TABLE IF NOT EXISTS `tbl_schedule` (
  `schedule_id` int NOT NULL AUTO_INCREMENT,
  `schedule_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

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

-- Data exporting was unselected.

-- Dumping structure for table enrollment_system.tbl_section
CREATE TABLE IF NOT EXISTS `tbl_section` (
  `section_id` int NOT NULL AUTO_INCREMENT,
  `schedule_id` int NOT NULL,
  `section_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `room` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table enrollment_system.tbl_subject
CREATE TABLE IF NOT EXISTS `tbl_subject` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `subject_description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject_unit` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
