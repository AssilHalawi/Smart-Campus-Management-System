-- Smart Campus System Data Insert Statements
-- Generated from JSON data files in /backend/data/
-- Ordered by dependency to avoid foreign key violations

USE smartcampus;

-- ============================================
-- Level 0: Base Tables (No Dependencies)
-- ============================================

-- Departments
INSERT INTO departments (department_id, name) VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Engineering'),
(4, 'Business'),
(5, 'Arts');

-- System Configuration (empty in JSON, no inserts needed)

-- ============================================
-- Level 1: Tables that depend on departments
-- ============================================

-- Users
INSERT INTO users (user_id, first_name, last_name, email, phone_number, role, subrole, department_id, university_id, password_hash, created_at, status) VALUES
(1, 'assil', 'halawi', 'assil.halawi01@lau.edu', '+96176460926', 'maintenance', NULL, 1, '202300403', '$2a$10$JHgYSuS.AmrwxqUbhnEkLeqlMb7lJ7/PFcfR7BPwclR0s9Gy8soU6', '2025-11-30 11:05:49', 'active'),
(2, 'Assil', 'Halawi', 'assilhalawi1@gmail.com', '+96176460926', 'faculty', NULL, 1, '202312345', '$2a$10$qpWrdgkyLNSUpRlGgQdUi.Y64dOPPEhzN69ol42wrM9OWGJ.1TdI.', '2025-11-30 12:42:37', 'active'),
(3, 'Sarah', 'ITSupport', 'sarah.it@lau.edu', '+96112345679', 'maintenance', 'it_support', NULL, 'IT001', '$2a$10$JHgYSuS.AmrwxqUbhnEkLeqlMb7lJ7/PFcfR7BPwclR0s9Gy8soU6', '2025-11-30 12:00:00', 'active'),
(4, 'Maria', 'Cleaning', 'maria.cleaning@lau.edu', '+96112345680', 'maintenance', 'cleaning', NULL, 'CLEAN001', '$2a$10$JHgYSuS.AmrwxqUbhnEkLeqlMb7lJ7/PFcfR7BPwclR0s9Gy8soU6', '2025-11-30 12:00:00', 'active'),
(8, 'abdallah', 'elrizz', 'abdallah@hotmail.com', '71120670', 'maintenance', 'cleaning', 1, '202301345', '$2a$10$IXRMJvg6lpFh2BI/QDcbAO7JbxiloDWBN6bUBE6P7sZT.UqE8/Nfy', '2025-11-30 15:38:30', 'active'),
(9, 'abdallah', 'elrizz', 'abdallah2@hotmail.com', '01235478', 'maintenance', 'cleaning', 1, '20001234', '$2a$10$zWg7edZQriBQEzdfNyiJHOiyfwzEYSUalaTqtMOoiQuc0hkhbwkXa', '2025-11-30 15:48:58', 'suspended'),
(10, 'it', 'staff', 'itstaff1@hotmail.com', '12345678', 'maintenance', 'it_support', 1, '123456789', '$2a$10$x7nVVzcGli7tLrTRQZO2yeLgZAIT3P6W.YyW0WSkrJYRkZh8uhX7O', '2025-11-30 16:15:15', 'active'),
(11, 'admin', 'admin', 'admin@hotmail.com', '98765432', 'admin', NULL, 1, '987654321', '$2a$10$Pgcr13ZGebXranUIanq1VuXGq8iPnNgXLQwtcxWPgH6RBh6a23qDe', '2025-11-30 16:38:41', 'active'),
(12, 'Abdallah', 'test1', 'test1@fake.com', '71120670', 'student', NULL, 1, '12345678', '$2a$10$7VdwjRR4ao/SZ1F2nPaT9uTjbbvbQh3.zt8QY5KxDQpaMt7.0bhIS', '2025-12-01 17:01:22', 'active'),
(13, 'abdallah', 'test2', 'test2@fake.com', '71120670', 'student', NULL, 1, '12b345677', '$2a$10$Jh.xhrUjb7A486trKFR24.Dtj5BjELzDAh5s1ssfyP6I77gXqnXny', '2025-12-01 17:08:21', 'active'),
(14, 'abdallah', 'test3', 'test3@fake.com', '71120670', 'faculty', NULL, 1, '12345666', '$2a$10$gDmhcBk8k0eclFDWrUCm0.Qqa8he0iaVKP29/xXgOwf9w2v1iZF36', '2025-12-01 17:15:20', 'active'),
(15, 'Abdallah', 'test4', 'test4@fake.com', '71120670', 'maintenance', 'it_support', 1, '12345555', '$2a$10$5o.yx4ith4PTKnuxMTjrxOV8Tnq3K0gaYF7jZqt9Umhy4tu0OokIa', '2025-12-01 17:52:36', 'active'),
(16, 'Abdallah', 'test5', 'test5@fake.com', '71120670', 'maintenance', 'cleaning', 2, '12344444', '$2a$10$xAsR4kDzc/.wQvpYH56ndeI4H7c1bnCyGJ9BtHnK7TtqjKaJHHT/y', '2025-12-01 18:00:53', 'active'),
(17, 'Abdallah', 'test6', 'test6@fake.com', '71120670', 'admin', NULL, 3, '12333333', '$2a$10$nY9JS/ZWLkz0z588jMcu0.w/ZAcsq1hjufkYnxBuMthRy5rzRZEw.', '2025-12-01 18:17:54', 'active');

-- Courses
INSERT INTO courses (course_id, course_code, course_name, department_id) VALUES
(1, 'CS101', 'Introduction to Computer Science', 1),
(2, 'CS201', 'Data Structures', 1),
(3, 'CS301', 'Algorithms', 1),
(4, 'MATH101', 'Calculus I', 2),
(5, 'MATH201', 'Linear Algebra', 2),
(6, 'ENG101', 'Introduction to Engineering', 3),
(7, 'BUS101', 'Introduction to Business', 4),
(8, 'BUS201', 'Business Ethics', 4),
(9, 'ART101', 'Introduction to Arts', 5);

-- ============================================
-- Level 2: Tables that depend on users
-- ============================================

-- Transportation Routes
INSERT INTO transportationRoutes (route_id, route_name, start_point, end_point, capacity, reserved_seats, status) VALUES
(1, 'LAU to Downtown Beirut', 'LAU Main Gate', 'Downtown Beirut', 50, 2, 'active'),
(2, 'Campus Shuttle - Gezaeri to AKSOB', 'Gezaeri Campus', 'AKSOB Building', 25, 0, 'active'),
(3, 'LAU to Hamra', 'LAU Main Gate', 'Hamra', 40, 0, 'active');

-- Resources
INSERT INTO resources (resource_id, resource_type, name, building, room_number, capacity, status, maintenance_set_by, maintenance_set_at) VALUES
(1, 'lab', 'Nicol 520 - Computer Lab', 'Nicol Hall', 'Nicol 520', 30, 'under_maintenance', 15, '2025-12-01 17:54:22'),
(2, 'lab', 'AKSOB 1301 - Business Lab', 'AKSOB Building', 'AKSOB 1301', 25, 'active', NULL, NULL),
(3, 'lab', 'Nicol 307 - Engineering Lab', 'Nicol Hall', 'Nicol 307', 20, 'active', NULL, NULL),
(4, 'study_room', 'Gezaeri 201 - Classroom', 'Gezaeri Campus', 'Gezaeri 201', 40, 'active', NULL, NULL),
(5, 'study_room', 'Gezaeri 205 - Classroom', 'Gezaeri Campus', 'Gezaeri 205', 35, 'active', NULL, NULL),
(6, 'study_room', 'Gezaeri 301 - Seminar Room', 'Gezaeri Campus', 'Gezaeri 301', 25, 'active', NULL, NULL),
(7, 'study_room', 'AKSOB 1205 - Classroom', 'AKSOB Building', 'AKSOB 1205', 45, 'active', NULL, NULL),
(8, 'study_room', 'AKSOB 1101 - Lecture Hall', 'AKSOB Building', 'AKSOB 1101', 80, 'active', NULL, NULL),
(9, 'study_room', 'AKSOB 1402 - Study Room', 'AKSOB Building', 'AKSOB 1402', 15, 'active', NULL, NULL),
(10, 'sports_hall', 'Main Sports Hall', 'Sports Complex', 'SC-001', 100, 'active', NULL, NULL),
(11, 'sports_hall', 'Basketball Court', 'Sports Complex', 'SC-002', 50, 'active', NULL, NULL),
(12, 'library_seat', 'Library Seat L-042', 'Library', 'L-042', 1, 'active', NULL, NULL),
(13, 'library_seat', 'Library Seat L-103', 'Library', 'L-103', 1, 'active', NULL, NULL),
(14, 'library_seat', 'Library Seat L-205', 'Library', 'L-205', 1, 'closed', 10, '2025-11-30 18:16:10'),
(15, 'computer', 'Library Computer LC-15', 'Library', 'LC-15', 1, 'active', NULL, NULL),
(16, 'computer', 'Library Computer LC-22', 'Library', 'LC-22', 1, 'active', NULL, NULL),
(17, 'study_room', 'AKSOB 903 - Classroom', 'AKSOB', NULL, 50, 'active', NULL, NULL);

-- Events
INSERT INTO events (event_id, title, description, event_type, location, event_date, start_time, end_time, capacity, available_tickets, ticket_price, status, created_by, organizer_user_id, organizer_role, reviewed_by, reviewed_at, created_at) VALUES
(1, 'Career Fair 2025', 'Annual career fair featuring top companies and organizations. Network with employers and explore job opportunities.', NULL, 'AKSOB Building - Main Hall', '2025-12-13 12:34:22', NULL, NULL, 200, 200, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2025-11-29 12:34:22'),
(2, 'Tech Innovation Summit', 'Join us for a day of tech talks, workshops, and networking. Featuring industry leaders and cutting-edge technology demonstrations.', NULL, 'Nicol Hall - Auditorium', '2025-12-20 12:34:22', NULL, NULL, 150, 150, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2025-11-29 12:34:22'),
(3, 'Business Ethics Seminar', 'Interactive seminar on business ethics and corporate responsibility. Open to all students and faculty.', NULL, 'AKSOB 1101 - Lecture Hall', '2025-12-06 12:34:22', NULL, NULL, 80, 80, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2025-11-29 12:34:22'),
(4, 'Engineering Project Showcase', 'Showcase of student engineering projects and innovations. See what your peers have been working on!', NULL, 'Gezaeri Campus - Main Hall', '2025-12-27 12:34:22', NULL, NULL, 100, 100, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2025-11-29 12:34:22'),
(5, 'Cultural Night', 'Celebrate diversity with food, music, and performances from different cultures represented at LAU.', NULL, 'Sports Complex - Main Hall', '2026-01-03 12:34:22', NULL, NULL, 300, 300, 0, 'active', NULL, NULL, NULL, NULL, NULL, '2025-11-29 12:34:22'),
(8, 'ai ', 'ai workshop', 'workshop', 'aksob 903', NULL, '2025-12-06 13:30:00', '2025-12-06 14:30:00', 50, NULL, NULL, 'published', NULL, 2, NULL, NULL, NULL, '2025-11-30 17:36:25'),
(9, 'intro to ml', 'this is an introduction', 'academic', 'aksob 903', NULL, '2025-12-10 10:00:00', '2025-12-10 11:00:00', 50, NULL, NULL, 'approved', NULL, 2, 'faculty', 11, '2025-11-30 18:39:44', '2025-11-30 18:38:51'),
(10, 'Test Event', 'This is only a system test', 'academic', 'AKSOB 904', NULL, '2025-12-02 20:27:00', '2025-12-03 20:27:00', 78, NULL, NULL, 'approved', NULL, 14, 'faculty', 17, '2025-12-01 18:28:36', '2025-12-01 18:27:53');

-- Student Employment
INSERT INTO studentEmployment (job_id, job_title, department_id, description, salary, hours_per_week, status, posted_at, application_deadline, supervisor_id) VALUES
(1, 'Library Assistant', 1, 'Assist with library operations and help students find resources. Must be available during library hours.', 15, 10, 'active', '2025-11-29 12:34:22', '2025-12-29 12:34:22', NULL),
(2, 'Computer Science Tutor', 1, 'Provide tutoring services to students in Computer Science courses. Must have strong programming background.', 20, 8, 'active', '2025-11-29 12:34:22', '2025-12-29 12:34:22', NULL),
(3, 'Lab Monitor - Nicol 520', 1, 'Monitor computer lab operations and assist students with technical issues in Nicol 520.', 12, 12, 'active', '2025-11-29 12:34:22', '2025-12-29 12:34:22', NULL),
(4, 'Campus Tour Guide', 4, 'Lead campus tours for prospective students and visitors. Must be friendly and knowledgeable about LAU.', 18, 6, 'active', '2025-11-29 12:34:22', '2025-12-29 12:34:22', NULL);

-- Announcements
INSERT INTO announcements (announcement_id, title, message, content, priority, created_by, created_by_user_id, created_at, status) VALUES
(1, 'Library Extended Hours', 'The library will have extended hours during finals week. Open until 11 PM Monday through Thursday.', NULL, NULL, NULL, NULL, '2025-11-29 12:34:22', 'active'),
(2, 'New Study Rooms Available', 'New study rooms have been added in AKSOB Building. Book your study space now!', NULL, NULL, NULL, NULL, '2025-11-27 12:34:22', 'active'),
(3, 'Parking Lot Maintenance', 'Main parking lot will be under maintenance this weekend. Please use alternative parking areas.', NULL, NULL, NULL, NULL, '2025-11-28 12:34:22', 'active'),
(4, 'Campus-Wide Message', 'testtt', 'testtt', 'normal', NULL, 11, '2025-11-30 17:10:59', NULL),
(5, 'TEST', 'this is an anouncement from faculty', NULL, 'high', NULL, 2, '2025-11-30 17:48:24', NULL),
(6, 'Campus-Wide Message', 'SALAMATTTTT YA HALAWLAW', 'SALAMATTTTT YA HALAWLAW', 'normal', NULL, 17, '2025-12-01 18:36:59', NULL);

-- Issue Reports
INSERT INTO issueReports (issue_id, reporter_user_id, category, location, description, priority, file_url, status, created_at, assigned_user_id, assigned_at, resolved_at) VALUES
(1, 1, 'maintenance', 'Gezaeri, 1101', 'The LCD is not displaying', 'high', NULL, 'closed', '2025-11-29 13:45:01', 8, '2025-11-30 15:39:57', '2025-11-30 15:41:07'),
(2, 2, 'maintenance', 'Sage Bathroom', 'there was a broken mirror in sage bathrrom', 'low', '/api/uploads/1764508736153.jpg', 'in_progress', '2025-11-30 13:18:56', 8, '2025-11-30 15:41:38', NULL),
(3, 1, 'IT', 'to the left of the fountain near cs room', 'there is a broken bench', 'low', '/api/uploads/1764523671074.jpg', 'closed', '2025-11-30 17:27:51', 10, '2025-11-30 18:14:47', '2025-11-30 18:15:24'),
(4, 1, 'IT', 'nicol', 'a cat jumped on the laptop and ruined it', 'medium', NULL, 'pending', '2025-11-30 18:24:49', NULL, NULL, NULL),
(5, 12, 'IT', 'Testroom', 'This is a test', 'high', '/api/uploads/1764609641033.png', 'closed', '2025-12-01 17:20:41', 15, '2025-12-01 17:52:52', '2025-12-01 17:53:53');

-- Classroom Change Requests
INSERT INTO classroomChangeRequests (request_id, faculty_user_id, current_classroom, new_classroom, course_code, reason, details, issue_id, status, created_at, reviewed_by, reviewed_at, rejection_reason) VALUES
(1, 2, NULL, NULL, NULL, 'capacity', NULL, NULL, 'rejected', '2025-11-30 18:03:22', 11, '2025-11-30 18:32:12', 'no'),
(2, 2, NULL, NULL, NULL, 'capacity', NULL, NULL, 'pending', '2025-11-30 18:08:52', NULL, NULL, NULL),
(3, 2, 'Gezaeri 201 - Classroom', 'Gezaeri 205 - Classroom', 'MATH101', 'capacity', 'we need a bigger room', NULL, 'approved', '2025-11-30 18:12:46', 11, '2025-11-30 18:32:08', NULL);

-- Dorm Units
INSERT INTO dormUnits (dorm_id, assigned_user_id, building, unit_number, capacity, gender_policy, status, price_per_semester, start_date, end_date, semester) VALUES
(1, 1, 'Dormitory A', 'A-101', 2, 'male', 'occupied', 2500, '2025-08-31', '2025-12-30', 'fall'),
(2, 2, 'Dormitory B', 'B-205', 2, 'female', 'occupied', 2500, '2024-12-31', '2025-05-30', 'spring');

-- Notifications
INSERT INTO notifications (notification_id, user_id, `type`, message, notification_method, sent_at, `read`) VALUES
(1, 1, 'event', 'You have reserved a ticket for event #1', 'in-app', '2025-11-29 12:55:56', 0),
(2, 1, 'transport', 'Seat reserved on LAU to Downtown Beirut for null at null', 'in-app', '2025-11-29 12:56:10', 0),
(3, 1, 'transport', 'Seat reserved on LAU to Downtown Beirut for null at null', 'in-app', '2025-11-29 12:56:49', 0),
(4, 1, 'event', 'You have reserved a ticket for event #2', 'in-app', '2025-11-29 13:35:45', 0),
(5, 1, 'employment', 'Application submitted for Library Assistant', 'in-app', '2025-11-29 13:35:59', 0),
(6, 1, 'employment', 'Application submitted for Computer Science Tutor', 'in-app', '2025-11-29 13:36:01', 0),
(7, 1, 'employment', 'Application submitted for Lab Monitor - Nicol 520', 'in-app', '2025-11-29 13:36:05', 0),
(8, 1, 'employment', 'Application submitted for Campus Tour Guide', 'in-app', '2025-11-29 13:36:08', 0),
(9, 1, 'booking', 'Your booking has been confirmed', 'in-app', '2025-11-29 14:01:08', 0),
(10, 1, 'booking', 'Your booking has been cancelled', 'in-app', '2025-11-29 14:38:55', 0),
(11, 1, 'booking', 'Your booking has been confirmed', 'in-app', '2025-11-29 14:39:24', 0),
(12, 1, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-11-30 11:05:49', 0),
(13, 1, 'booking', 'Your booking has been confirmed', 'in-app', '2025-11-30 11:17:57', 0),
(14, 1, 'booking', 'Your booking has been cancelled', 'in-app', '2025-11-30 11:26:16', 0),
(15, 1, 'system', 'Email: Booking Cancelled', 'email', '2025-11-30 11:26:16', 0),
(16, 1, 'transport', 'Seat reserved on LAU to Hamra for 2025-12-05 at 12:00', 'in-app', '2025-11-30 11:33:42', 0),
(17, 1, 'event', 'You have reserved a ticket for event #3', 'in-app', '2025-11-30 11:37:52', 0),
(18, 1, 'dorm', 'Dorm A-101 booked successfully for fall semester', 'in-app', '2025-11-30 12:04:14', 0),
(19, 1, 'parking', 'Parking space N-101 reserved for fall semester', 'in-app', '2025-11-30 12:22:13', 0),
(20, 2, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-11-30 12:42:37', 0),
(21, 1, 'booking', 'Your booking has been overridden by faculty', 'in-app', '2025-11-30 12:49:40', 0),
(22, 2, 'event', 'You have reserved a ticket for event #6', 'in-app', '2025-11-30 13:16:19', 0),
(23, 2, 'parking', 'Parking space A-002 reserved for spring semester', 'in-app', '2025-11-30 13:19:14', 0),
(24, 2, 'dorm', 'Dorm B-205 booked successfully for spring semester', 'in-app', '2025-11-30 13:19:51', 0),
(25, 1, 'booking', 'Your booking has been confirmed', 'in-app', '2025-11-30 13:28:13', 0),
(26, 1, 'booking', 'Your booking has been overridden by faculty', 'in-app', '2025-11-30 13:37:10', 0),
(27, 8, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-11-30 15:38:30', 0),
(28, 1, 'issue', 'Your issue #1 has been resolved', 'in-app', '2025-11-30 15:40:56', 0),
(29, 1, 'system', 'Email: Issue #1 resolved', 'email', '2025-11-30 15:40:56', 0),
(30, 1, 'issue', 'Your issue #1 has been closed', 'in-app', '2025-11-30 15:41:07', 0),
(31, 1, 'system', 'Email: Issue #1 closed', 'email', '2025-11-30 15:41:07', 0),
(32, 1, 'booking', 'Your booking has been confirmed', 'in-app', '2025-11-30 15:43:58', 0),
(33, 1, 'booking', 'Your booking has been cancelled', 'in-app', '2025-11-30 15:46:27', 0),
(34, 1, 'system', 'Email: Booking Cancelled', 'email', '2025-11-30 15:46:27', 0),
(35, 9, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-11-30 15:48:58', 0),
(36, 10, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-11-30 16:15:15', 0),
(37, 11, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-11-30 16:38:41', 0),
(38, 1, 'booking', 'Your booking request has been approved', 'in-app', '2025-11-30 17:00:22', 0),
(39, 1, 'system', 'Email: Booking Confirmation - Smart Campus System', 'email', '2025-11-30 17:00:22', 0),
(40, 1, 'booking', 'Your booking request has been approved', 'in-app', '2025-11-30 17:00:26', 0),
(41, 1, 'system', 'Email: Booking Confirmation - Smart Campus System', 'email', '2025-11-30 17:00:26', 0),
(42, 1, 'booking', 'Your booking request has been approved', 'in-app', '2025-11-30 17:00:28', 0),
(43, 1, 'system', 'Email: Booking Confirmation - Smart Campus System', 'email', '2025-11-30 17:00:28', 0),
(44, 1, 'booking', 'Your booking request has been approved', 'in-app', '2025-11-30 17:00:31', 0),
(45, 1, 'system', 'Email: Booking Confirmation - Smart Campus System', 'email', '2025-11-30 17:00:31', 0),
(46, 1, 'admin', 'hello this is a test', 'in-app', '2025-11-30 17:02:42', 0),
(47, 2, 'admin', 'hello this is a test', 'in-app', '2025-11-30 17:02:42', 0),
(48, 3, 'admin', 'hello this is a test', 'in-app', '2025-11-30 17:02:42', 0),
(49, 4, 'admin', 'hello this is a test', 'in-app', '2025-11-30 17:02:42', 0),
(50, 8, 'admin', 'hello this is a test', 'in-app', '2025-11-30 17:02:42', 0),
(51, 10, 'admin', 'hello this is a test', 'in-app', '2025-11-30 17:02:42', 0),
(52, 11, 'admin', 'hello this is a test', 'in-app', '2025-11-30 17:02:42', 0),
(53, 1, 'admin', 'hi this is another test', 'in-app', '2025-11-30 17:06:30', 0),
(54, 2, 'admin', 'hi this is another test', 'in-app', '2025-11-30 17:06:30', 0),
(55, 3, 'admin', 'hi this is another test', 'in-app', '2025-11-30 17:06:30', 0),
(56, 4, 'admin', 'hi this is another test', 'in-app', '2025-11-30 17:06:30', 0),
(57, 8, 'admin', 'hi this is another test', 'in-app', '2025-11-30 17:06:30', 0),
(58, 10, 'admin', 'hi this is another test', 'in-app', '2025-11-30 17:06:30', 0),
(59, 11, 'admin', 'hi this is another test', 'in-app', '2025-11-30 17:06:30', 0),
(60, 1, 'admin', 'testtt', 'in-app', '2025-11-30 17:10:59', 0),
(61, 2, 'admin', 'testtt', 'in-app', '2025-11-30 17:10:59', 0),
(62, 3, 'admin', 'testtt', 'in-app', '2025-11-30 17:10:59', 0),
(63, 4, 'admin', 'testtt', 'in-app', '2025-11-30 17:10:59', 0),
(64, 8, 'admin', 'testtt', 'in-app', '2025-11-30 17:10:59', 0),
(65, 10, 'admin', 'testtt', 'in-app', '2025-11-30 17:10:59', 0),
(66, 11, 'admin', 'testtt', 'in-app', '2025-11-30 17:10:59', 0),
(67, 1, 'booking', 'Your booking has been cancelled', 'in-app', '2025-11-30 17:24:44', 0),
(68, 1, 'system', 'Email: Booking Cancelled', 'email', '2025-11-30 17:24:44', 0),
(69, 1, 'booking', 'Your booking has been cancelled', 'in-app', '2025-11-30 17:24:52', 0),
(70, 1, 'system', 'Email: Booking Cancelled', 'email', '2025-11-30 17:24:52', 0),
(71, 1, 'booking', 'Your booking has been confirmed', 'in-app', '2025-11-30 17:26:00', 0),
(72, 11, 'booking', 'New booking from assil.halawi01@lau.edu (auto-approved)', 'in-app', '2025-11-30 17:26:00', 0),
(73, 3, 'issue', 'New IT issue reported at to the left of the fountain near cs room', 'in-app', '2025-11-30 17:27:51', 0),
(74, 4, 'issue', 'New IT issue reported at to the left of the fountain near cs room', 'in-app', '2025-11-30 17:27:51', 0),
(75, 8, 'issue', 'New IT issue reported at to the left of the fountain near cs room', 'in-app', '2025-11-30 17:27:51', 0),
(76, 9, 'issue', 'New IT issue reported at to the left of the fountain near cs room', 'in-app', '2025-11-30 17:27:51', 0),
(77, 10, 'issue', 'New IT issue reported at to the left of the fountain near cs room', 'in-app', '2025-11-30 17:27:51', 0),
(78, 1, 'event', 'You have reserved a ticket for event #6', 'in-app', '2025-11-30 17:28:39', 0),
(79, 1, 'transport', 'Seat reserved on Campus Shuttle - Gezaeri to AKSOB for 2025-12-05 at 11:55', 'in-app', '2025-11-30 17:29:11', 0),
(80, 1, 'parking', 'Parking space S-201 reserved for spring semester', 'in-app', '2025-11-30 17:29:29', 0),
(81, 1, 'event', 'You have reserved a ticket for event #1', 'in-app', '2025-11-30 17:34:15', 0),
(82, 1, 'event', 'You have reserved a ticket for event #7', 'in-app', '2025-11-30 17:34:26', 1),
(83, 1, 'event', 'Event "christmas event" has been cancelled. Your ticket has been refunded.', 'in-app', '2025-11-30 17:36:31', 1),
(84, 2, 'booking', 'Your booking has been confirmed', 'in-app', '2025-11-30 17:41:52', 0),
(85, 11, 'booking', 'New booking from assilhalawi1@gmail.com (auto-approved)', 'in-app', '2025-11-30 17:41:52', 0),
(86, 1, 'admin', 'New announcement: TEST', 'in-app', '2025-11-30 17:48:24', 0),
(87, 11, 'admin', 'Classroom change request from assilhalawi1@gmail.com', 'in-app', '2025-11-30 18:03:22', 0),
(88, 11, 'admin', 'Classroom change request from assilhalawi1@gmail.com', 'in-app', '2025-11-30 18:08:52', 0),
(89, 11, 'admin', 'Classroom change request from assilhalawi1@gmail.com', 'in-app', '2025-11-30 18:12:46', 0),
(90, 1, 'issue', 'Your issue #3 has been resolved', 'in-app', '2025-11-30 18:15:21', 0),
(91, 1, 'system', 'Email: Issue #3 resolved', 'email', '2025-11-30 18:15:21', 0),
(92, 1, 'issue', 'Your issue #3 has been closed', 'in-app', '2025-11-30 18:15:24', 0),
(93, 1, 'system', 'Email: Issue #3 closed', 'email', '2025-11-30 18:15:24', 0),
(94, 1, 'employment', 'Your application for Library Assistant has been rejected.', 'in-app', '2025-11-30 18:21:08', 0),
(95, 1, 'employment', 'Your application for Computer Science Tutor has been approved!', 'in-app', '2025-11-30 18:21:14', 1),
(96, 1, 'employment', 'Your application for Lab Monitor - Nicol 520 has been approved!', 'in-app', '2025-11-30 18:21:22', 1),
(97, 1, 'employment', 'Your application for Campus Tour Guide has been rejected.', 'in-app', '2025-11-30 18:21:33', 0),
(98, 3, 'issue', 'New IT issue reported at nicol', 'in-app', '2025-11-30 18:24:49', 0),
(99, 4, 'issue', 'New IT issue reported at nicol', 'in-app', '2025-11-30 18:24:49', 0),
(100, 8, 'issue', 'New IT issue reported at nicol', 'in-app', '2025-11-30 18:24:49', 0),
(101, 9, 'issue', 'New IT issue reported at nicol', 'in-app', '2025-11-30 18:24:49', 0),
(102, 10, 'issue', 'New IT issue reported at nicol', 'in-app', '2025-11-30 18:24:49', 0),
(103, 2, 'admin', 'Your classroom change request (Gezaeri 201 - Classroom → Gezaeri 205 - Classroom) has been approved.', 'in-app', '2025-11-30 18:32:08', 0),
(104, 2, 'admin', 'Your classroom change request (Current → New) has been rejected. Reason: no', 'in-app', '2025-11-30 18:32:12', 0),
(105, 11, 'admin', 'New event "intro to ml" requires approval from assilhalawi1@gmail.com', 'in-app', '2025-11-30 18:38:51', 0),
(106, 2, 'event', 'Your event "intro to ml" has been approved and is now visible to students.', 'in-app', '2025-11-30 18:39:44', 0),
(107, 12, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-12-01 17:01:22', 1),
(108, 12, 'event', 'You have reserved a ticket for event #8', 'in-app', '2025-12-01 17:01:44', 0),
(109, 12, 'transport', 'Seat reserved on LAU to Downtown Beirut for 2025-12-05 at 04:00', 'in-app', '2025-12-01 17:03:01', 0),
(110, 13, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-12-01 17:08:21', 0),
(111, 13, 'booking', 'Your booking has been confirmed', 'in-app', '2025-12-01 17:12:37', 0),
(112, 11, 'booking', 'New booking from test2@fake.com (auto-approved)', 'in-app', '2025-12-01 17:12:37', 0),
(113, 13, 'parking', 'Parking space A-001 reserved for spring semester', 'in-app', '2025-12-01 17:14:06', 0),
(114, 14, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-12-01 17:15:20', 0),
(115, 3, 'issue', 'New IT issue reported at Testroom', 'in-app', '2025-12-01 17:20:41', 0),
(116, 3, 'system', 'Email: Urgent IT Issue Reported', 'email', '2025-12-01 17:20:41', 0),
(117, 4, 'issue', 'New IT issue reported at Testroom', 'in-app', '2025-12-01 17:20:41', 0),
(118, 4, 'system', 'Email: Urgent IT Issue Reported', 'email', '2025-12-01 17:20:41', 0),
(119, 8, 'issue', 'New IT issue reported at Testroom', 'in-app', '2025-12-01 17:20:41', 0),
(120, 8, 'system', 'Email: Urgent IT Issue Reported', 'email', '2025-12-01 17:20:41', 0),
(121, 9, 'issue', 'New IT issue reported at Testroom', 'in-app', '2025-12-01 17:20:41', 0),
(122, 9, 'system', 'Email: Urgent IT Issue Reported', 'email', '2025-12-01 17:20:41', 0),
(123, 10, 'issue', 'New IT issue reported at Testroom', 'in-app', '2025-12-01 17:20:41', 0),
(124, 10, 'system', 'Email: Urgent IT Issue Reported', 'email', '2025-12-01 17:20:41', 0),
(125, 12, 'employment', 'Application submitted for Library Assistant', 'in-app', '2025-12-01 17:21:39', 0),
(126, 14, 'booking', 'Your booking has been confirmed', 'in-app', '2025-12-01 17:32:21', 0),
(127, 11, 'booking', 'New booking from test3@fake.com (auto-approved)', 'in-app', '2025-12-01 17:32:21', 0),
(128, 15, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-12-01 17:52:36', 0),
(129, 12, 'issue', 'Your issue #5 has been resolved', 'in-app', '2025-12-01 17:53:48', 0),
(130, 12, 'system', 'Email: Issue #5 resolved', 'email', '2025-12-01 17:53:48', 0),
(131, 12, 'issue', 'Your issue #5 has been closed', 'in-app', '2025-12-01 17:53:53', 0),
(132, 12, 'system', 'Email: Issue #5 closed', 'email', '2025-12-01 17:53:53', 0),
(133, 16, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-12-01 18:00:53', 0),
(134, 17, 'system', 'Welcome to Smart Campus System!', 'in-app', '2025-12-01 18:17:54', 0),
(135, 12, 'employment', 'Your application for Library Assistant has been approved!', 'in-app', '2025-12-01 18:25:35', 0),
(136, 11, 'admin', 'New event "Test Event" requires approval from test3@fake.com', 'in-app', '2025-12-01 18:27:53', 0),
(137, 17, 'admin', 'New event "Test Event" requires approval from test3@fake.com', 'in-app', '2025-12-01 18:27:53', 0),
(138, 14, 'event', 'Your event "Test Event" has been approved and is now visible to students.', 'in-app', '2025-12-01 18:28:36', 0),
(139, 1, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(140, 2, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(141, 3, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(142, 4, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(143, 8, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(144, 10, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(145, 11, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(146, 12, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(147, 13, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(148, 14, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(149, 15, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(150, 16, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0),
(151, 17, 'admin', 'SALAMATTTTT YA HALAWLAW', 'in-app', '2025-12-01 18:36:59', 0);

-- Parking Spaces
INSERT INTO parkingSpaces (parking_space_id, lot_name, spot_number, user_id, `type`, status, price_per_semester, semester, start_date, end_date, reserved_at) VALUES
(1, 'Main Parking Lot', 'A-001', 13, 'student', 'reserved', 500, 'spring', '2024-12-31', '2025-05-30', '2025-12-01 17:14:06'),
(2, 'Main Parking Lot', 'A-002', 2, 'faculty', 'reserved', 600, 'spring', '2024-12-31', '2025-05-30', '2025-11-30 13:19:14'),
(3, 'Main Parking Lot', 'A-003', NULL, 'student', 'available', 500, NULL, NULL, NULL, NULL),
(4, 'North Parking Lot', 'N-101', 1, 'student', 'reserved', 450, 'fall', '2025-08-31', '2025-12-30', '2025-11-30 12:22:13'),
(5, 'South Parking Lot', 'S-201', 1, 'student', 'reserved', 450, 'spring', '2024-12-31', '2025-05-30', '2025-11-30 17:29:29');

-- Tutoring Sessions
INSERT INTO tutoringSessions (session_id, created_by_user_id, organizer_user_id, course_code, course_name, tutor, room, start_date, day_of_week, time, duration, start_time, end_time, capacity, description, recurring, frequency, created_at) VALUES
(1, 2, 2, 'CS101', 'Introduction to Computer Science', '202201235', 'AKSOB 1301 - Business Lab', '2025-12-05', 'Monday', '17:00', 1, '2025-12-08 15:00:00', '2025-12-08 16:00:00', 50, 'the topics covered are the ones on the syllabus of the course', 1, 'weekly', '2025-11-30 15:11:37');

-- ============================================
-- Level 3: Tables that depend on resources
-- ============================================

-- Booking Requests
INSERT INTO bookingRequests (request_id, user_id, resource_id, start_time, end_time, purpose, priority, status, created_at, reviewed_by_admin_id, reviewed_at) VALUES
(1, 1, 1, NULL, NULL, 'General use', 'student', 'approved', '2025-11-29 12:54:49', 11, '2025-11-30 17:00:31'),
(2, 1, 1, '2026-01-01 15:43:00', '2026-01-01 17:45:00', 'Lecture on AI', 'student', 'approved', '2025-11-29 13:43:48', 11, '2025-11-30 17:00:28'),
(3, 1, 1, '2025-12-01 16:00:00', '2025-12-01 17:00:00', 'Lecture on AI', 'student', 'approved', '2025-11-29 13:51:37', 11, '2025-11-30 17:00:26'),
(4, 1, 1, '2025-12-01 15:00:00', '2025-12-01 16:00:00', 'Lecture on AI', 'student', 'approved', '2025-11-29 13:56:27', 11, '2025-11-30 17:00:22'),
(5, 1, 1, '2025-12-01 17:00:00', '2025-12-01 19:00:00', 'Lecture on AI', 'student', 'approved', '2025-11-29 14:01:08', 1, '2025-11-29 14:01:08'),
(6, 1, 1, '2025-12-01 17:40:00', '2025-12-01 18:40:00', 'Lecture on AI', 'student', 'approved', '2025-11-29 14:39:24', 1, '2025-11-29 14:39:24'),
(7, 1, 12, '2025-12-03 16:00:00', '2025-12-03 17:30:00', 'studying for SE', 'student', 'approved', '2025-11-30 11:17:57', 1, '2025-11-30 11:17:57'),
(8, 1, 4, '2025-12-05 14:00:00', '2025-12-05 15:00:00', 'studying for SE', 'student', 'approved', '2025-11-30 13:28:13', 1, '2025-11-30 13:28:13'),
(9, 1, 1, '2025-12-05 17:00:00', '2025-12-05 19:00:00', 'stdy', 'student', 'approved', '2025-11-30 15:43:58', 1, '2025-11-30 15:43:58'),
(10, 1, 14, '2025-12-05 19:25:00', '2025-12-05 21:00:00', 'exam studying', 'student', 'approved', '2025-11-30 17:26:00', 1, '2025-11-30 17:26:00'),
(11, 2, 10, '2025-12-10 10:00:00', '2025-12-10 12:00:00', 'basketball game', 'faculty', 'approved', '2025-11-30 17:41:52', 2, '2025-11-30 17:41:52'),
(12, 13, 1, '2026-01-01 19:00:00', '2026-01-01 20:00:00', 'test', 'student', 'approved', '2025-12-01 17:12:37', 13, '2025-12-01 17:12:37'),
(13, 14, 1, '2025-12-05 19:31:00', '2025-12-05 21:32:00', 'test', 'faculty', 'approved', '2025-12-01 17:32:21', 14, '2025-12-01 17:32:21');

-- Bookings
INSERT INTO bookings (booking_id, request_id, resource_id, user_id, start_time, end_time, status, override, created_at, cancelled_at, completed_at) VALUES
(1, 5, 1, 1, '2025-12-01 17:00:00', '2025-12-01 19:00:00', 'cancelled', NULL, '2025-11-29 14:01:08', '2025-11-29 14:38:55', NULL),
(2, 6, 1, 1, '2025-12-01 17:40:00', '2025-12-01 18:40:00', 'cancelled', NULL, '2025-11-29 14:39:24', '2025-11-30 12:49:40', NULL),
(3, 7, 12, 1, '2025-12-03 16:00:00', '2025-12-03 17:30:00', 'cancelled', NULL, '2025-11-30 11:17:57', '2025-11-30 11:26:16', NULL),
(4, NULL, 1, 2, '2025-12-01 17:40:00', '2025-12-01 18:40:00', 'completed', 1, '2025-11-30 12:49:40', NULL, '2025-12-01 17:01:24'),
(5, 8, 4, 1, '2025-12-05 14:00:00', '2025-12-05 15:00:00', 'cancelled', NULL, '2025-11-30 13:28:13', '2025-11-30 13:37:10', NULL),
(6, NULL, 4, 2, '2025-12-05 14:00:00', '2025-12-05 15:00:00', 'active', 1, '2025-11-30 13:37:10', NULL, NULL),
(7, 9, 1, 1, '2025-12-05 17:00:00', '2025-12-05 19:00:00', 'cancelled', NULL, '2025-11-30 15:43:58', '2025-11-30 15:46:27', NULL),
(8, 4, 1, 1, '2025-12-01 15:00:00', '2025-12-01 16:00:00', 'cancelled', NULL, '2025-11-30 17:00:22', '2025-11-30 17:24:44', NULL),
(9, 3, 1, 1, '2025-12-01 16:00:00', '2025-12-01 17:00:00', 'completed', NULL, '2025-11-30 17:00:26', NULL, '2025-12-01 17:01:24'),
(10, 2, 1, 1, '2026-01-01 15:43:00', '2026-01-01 17:45:00', 'cancelled', NULL, '2025-11-30 17:00:28', '2025-11-30 17:24:52', NULL),
(11, 1, 1, 1, NULL, NULL, 'completed', NULL, '2025-11-30 17:00:31', NULL, '2025-11-30 17:02:50'),
(12, 10, 14, 1, '2025-12-05 19:25:00', '2025-12-05 21:00:00', 'active', NULL, '2025-11-30 17:26:00', NULL, NULL),
(13, 11, 10, 2, '2025-12-10 10:00:00', '2025-12-10 12:00:00', 'active', NULL, '2025-11-30 17:41:52', NULL, NULL),
(14, 12, 1, 13, '2026-01-01 19:00:00', '2026-01-01 20:00:00', 'active', NULL, '2025-12-01 17:12:37', NULL, NULL),
(15, 13, 1, 14, '2025-12-05 19:31:00', '2025-12-05 21:32:00', 'active', NULL, '2025-12-01 17:32:21', NULL, NULL);

-- Cleaning Tasks
INSERT INTO cleaningTasks (task_id, resource_id, assigned_to, scheduled_for, status, notes, created_at, completed_at) VALUES
(1, 4, NULL, '2025-12-01 08:00:00', 'completed', 'Daily cleaning - Gezaeri 201', '2025-11-30 12:00:00', '2025-11-30 16:12:04'),
(2, 5, NULL, '2025-12-01 09:00:00', 'completed', 'Daily cleaning - Gezaeri 205', '2025-11-30 12:00:00', '2025-12-01 18:01:55'),
(3, 7, NULL, '2025-12-01 10:00:00', 'completed', 'Daily cleaning - AKSOB 1205', '2025-11-30 12:00:00', '2025-12-01 18:02:18');

-- ============================================
-- Level 4: Tables with multiple dependencies
-- ============================================

-- Employment Applications
INSERT INTO employmentApplications (application_id, job_id, user_id, semester, application_date, status, reviewed_by, reviewed_at, rejection_reason) VALUES
(1, 1, 1, 'fall', '2025-11-29 13:35:59', 'rejected', 11, '2025-11-30 18:21:08', 'not fit'),
(2, 2, 1, 'fall', '2025-11-29 13:36:01', 'approved', 11, '2025-11-30 18:21:14', NULL),
(3, 3, 1, 'fall', '2025-11-29 13:36:05', 'approved', 11, '2025-11-30 18:21:22', NULL),
(4, 4, 1, 'fall', '2025-11-29 13:36:08', 'rejected', 11, '2025-11-30 18:21:33', 'Application rejected'),
(5, 1, 12, 'fall', '2025-12-01 17:21:39', 'approved', 17, '2025-12-01 18:25:35', NULL);

-- Event Tickets
-- NOTE: Tickets 4, 5, and 7 are excluded because they reference event_id 6 and 7,
-- which don't exist in the events table. Add them manually if those events are created.
INSERT INTO eventTickets (ticket_id, event_id, user_id, reserved_at, status) VALUES
(1, 1, 1, '2025-11-29 12:55:56', 'cancelled'),
(2, 2, 1, '2025-11-29 13:35:45', 'reserved'),
(3, 3, 1, '2025-11-30 11:37:52', 'reserved'),
(6, 1, 1, '2025-11-30 17:34:15', 'reserved'),
(8, 8, 12, '2025-12-01 17:01:44', 'reserved');

-- Issue Activities
INSERT INTO issueActivities (activity_id, issue_id, actor_user_id, action, note, time_of_activity) VALUES
(1, 1, 1, 'create', 'Issue reported', '2025-11-29 13:45:01'),
(2, 2, 2, 'create', 'Issue reported', '2025-11-30 13:18:56'),
(3, 1, 8, 'assign', 'Issue assigned to maintenance staff', '2025-11-30 15:39:57'),
(4, 1, 8, 'add_note', 'i will fix it', '2025-11-30 15:40:16'),
(5, 1, 8, 'update', 'Status changed to resolved', '2025-11-30 15:40:56'),
(6, 1, 8, 'update', 'Status changed to closed', '2025-11-30 15:41:07'),
(7, 2, 8, 'assign', 'Issue assigned to maintenance staff', '2025-11-30 15:41:38'),
(8, 3, 1, 'create', 'Issue reported', '2025-11-30 17:27:51'),
(9, 3, 10, 'assign', 'Issue assigned to maintenance staff', '2025-11-30 18:14:47'),
(10, 3, 10, 'update', 'Status changed to resolved', '2025-11-30 18:15:21'),
(11, 3, 10, 'update', 'Status changed to closed', '2025-11-30 18:15:24'),
(12, 4, 1, 'create', 'Issue reported', '2025-11-30 18:24:49'),
(13, 5, 12, 'create', 'Issue reported', '2025-12-01 17:20:41'),
(14, 5, 15, 'assign', 'Issue assigned to maintenance staff', '2025-12-01 17:52:52'),
(15, 5, 15, 'add_note', 'Coming\n', '2025-12-01 17:53:04'),
(16, 5, 15, 'update', 'Status changed to resolved', '2025-12-01 17:53:48'),
(17, 5, 15, 'update', 'Status changed to closed', '2025-12-01 17:53:53');

-- Transportation Route Schedule
INSERT INTO transportationRouteSchedule (schedule_id, route_id, time, day_of_week) VALUES
(1, 1, '08:00', 'Monday'),
(2, 1, '08:00', 'Tuesday'),
(3, 1, '08:00', 'Wednesday'),
(4, 1, '08:00', 'Thursday'),
(5, 1, '08:00', 'Friday'),
(6, 1, '12:00', 'Monday'),
(7, 1, '12:00', 'Tuesday'),
(8, 1, '12:00', 'Wednesday'),
(9, 1, '12:00', 'Thursday'),
(10, 1, '12:00', 'Friday'),
(11, 1, '16:00', 'Monday'),
(12, 1, '16:00', 'Tuesday'),
(13, 1, '16:00', 'Wednesday'),
(14, 1, '16:00', 'Thursday'),
(15, 1, '16:00', 'Friday'),
(16, 2, '09:00', 'Monday'),
(17, 2, '09:00', 'Tuesday'),
(18, 2, '09:00', 'Wednesday'),
(19, 2, '09:00', 'Thursday'),
(20, 2, '09:00', 'Friday'),
(21, 2, '11:00', 'Monday'),
(22, 2, '11:00', 'Tuesday'),
(23, 2, '11:00', 'Wednesday'),
(24, 2, '11:00', 'Thursday'),
(25, 2, '11:00', 'Friday'),
(26, 2, '14:00', 'Monday'),
(27, 2, '14:00', 'Tuesday'),
(28, 2, '14:00', 'Wednesday'),
(29, 2, '14:00', 'Thursday'),
(30, 2, '14:00', 'Friday'),
(31, 3, '10:00', 'Monday'),
(32, 3, '10:00', 'Tuesday'),
(33, 3, '10:00', 'Wednesday'),
(34, 3, '10:00', 'Thursday'),
(35, 3, '10:00', 'Friday'),
(36, 3, '15:00', 'Monday'),
(37, 3, '15:00', 'Tuesday'),
(38, 3, '15:00', 'Wednesday'),
(39, 3, '15:00', 'Thursday'),
(40, 3, '15:00', 'Friday');

-- Transportation Reservations
INSERT INTO transportationReservations (reservation_id, route_id, user_id, date, time, reserved_at, status) VALUES
(1, 3, 1, '2025-12-05', '12:00', '2025-11-30 11:33:42', 'reserved'),
(2, 2, 1, '2025-12-05', '11:55', '2025-11-30 17:29:11', 'reserved'),
(3, 1, 12, '2025-12-05', '04:00', '2025-12-01 17:03:01', 'reserved');

-- Cleaning Task Checklist
INSERT INTO cleaningTaskChecklist (checklist_id, task_id, task, completed) VALUES
(1, 1, 'Clean bathroom', 1),
(2, 1, 'Sweep and mop floors', 1),
(3, 1, 'Wipe down desks and chairs', 1),
(4, 1, 'Empty trash bins', 1),
(5, 1, 'Clean whiteboard', 1),
(6, 2, 'Clean bathroom', 1),
(7, 2, 'Sweep and mop floors', 1),
(8, 2, 'Wipe down desks and chairs', 1),
(9, 2, 'Empty trash bins', 1),
(10, 3, 'Clean bathroom', 1),
(11, 3, 'Sweep and mop floors', 1),
(12, 3, 'Wipe down desks and chairs', 1),
(13, 3, 'Empty trash bins', 0),
(14, 3, 'Clean windows', 0);

-- ============================================
-- End of Inserts
-- ============================================

