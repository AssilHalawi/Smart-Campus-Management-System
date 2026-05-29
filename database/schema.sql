-- Smart Campus System Database Schema
-- Generated from JSON data files in /backend/data/
-- All tables use ENGINE=InnoDB for foreign key support

USE smartcampus;

-- ============================================
-- Level 0: Base Tables (No Dependencies)
-- ============================================

-- Departments Table
CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- System Configuration Table
CREATE TABLE IF NOT EXISTS systemConfig (
    config_key VARCHAR(255) PRIMARY KEY,
    config_value TEXT,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Level 1: Tables that depend on departments
-- ============================================

-- Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone_number VARCHAR(50),
    role VARCHAR(50) NOT NULL,
    subrole VARCHAR(50),
    department_id INT,
    university_id VARCHAR(100),
    password_hash VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'active',
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Courses Table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_code VARCHAR(50) NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Level 2: Tables that depend on users only
-- ============================================

-- Transportation Routes Table (no dependencies)
CREATE TABLE IF NOT EXISTS transportationRoutes (
    route_id INT PRIMARY KEY AUTO_INCREMENT,
    route_name VARCHAR(255) NOT NULL,
    start_point VARCHAR(255) NOT NULL,
    end_point VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    reserved_seats INT DEFAULT 0,
    status VARCHAR(50) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Resources Table (depends on users for maintenance_set_by)
CREATE TABLE IF NOT EXISTS resources (
    resource_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_type VARCHAR(100) NOT NULL,
    name VARCHAR(255) NOT NULL,
    building VARCHAR(255),
    room_number VARCHAR(100),
    capacity INT,
    status VARCHAR(50) NOT NULL DEFAULT 'active',
    maintenance_set_by INT,
    maintenance_set_at DATETIME,
    FOREIGN KEY (maintenance_set_by) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Events Table (depends on users)
CREATE TABLE IF NOT EXISTS events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_type VARCHAR(100),
    location VARCHAR(255),
    event_date DATETIME,
    start_time DATETIME,
    end_time DATETIME,
    capacity INT,
    available_tickets INT,
    ticket_price DECIMAL(10, 2) DEFAULT 0,
    status VARCHAR(50) NOT NULL,
    created_by INT,
    organizer_user_id INT,
    organizer_role VARCHAR(50),
    reviewed_by INT,
    reviewed_at DATETIME,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (created_by) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (organizer_user_id) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (reviewed_by) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Student Employment (Jobs) Table (depends on departments, users)
CREATE TABLE IF NOT EXISTS studentEmployment (
    job_id INT PRIMARY KEY AUTO_INCREMENT,
    job_title VARCHAR(255) NOT NULL,
    department_id INT,
    description TEXT,
    salary DECIMAL(10, 2),
    hours_per_week INT,
    status VARCHAR(50) NOT NULL,
    posted_at DATETIME NOT NULL,
    application_deadline DATETIME,
    supervisor_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE SET NULL,
    FOREIGN KEY (supervisor_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Announcements Table (depends on users)
CREATE TABLE IF NOT EXISTS announcements (
    announcement_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    message TEXT,
    content TEXT,
    priority VARCHAR(50),
    created_by INT,
    created_by_user_id INT,
    created_at DATETIME NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (created_by) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (created_by_user_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Issue Reports Table (depends on users)
CREATE TABLE IF NOT EXISTS issueReports (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    reporter_user_id INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    description TEXT,
    priority VARCHAR(50),
    file_url VARCHAR(500),
    status VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL,
    assigned_user_id INT,
    assigned_at DATETIME,
    resolved_at DATETIME,
    FOREIGN KEY (reporter_user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_user_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Classroom Change Requests Table (depends on users, issueReports)
CREATE TABLE IF NOT EXISTS classroomChangeRequests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_user_id INT NOT NULL,
    current_classroom VARCHAR(255),
    new_classroom VARCHAR(255),
    course_code VARCHAR(50),
    reason VARCHAR(255),
    details TEXT,
    issue_id INT,
    status VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL,
    reviewed_by INT,
    reviewed_at DATETIME,
    rejection_reason TEXT,
    FOREIGN KEY (faculty_user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_by) REFERENCES users(user_id) ON DELETE SET NULL,
    FOREIGN KEY (issue_id) REFERENCES issueReports(issue_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dorm Units Table (depends on users)
CREATE TABLE IF NOT EXISTS dormUnits (
    dorm_id INT PRIMARY KEY AUTO_INCREMENT,
    assigned_user_id INT,
    building VARCHAR(255) NOT NULL,
    unit_number VARCHAR(100) NOT NULL,
    capacity INT NOT NULL,
    gender_policy VARCHAR(50),
    status VARCHAR(50) NOT NULL,
    price_per_semester DECIMAL(10, 2),
    start_date DATE,
    end_date DATE,
    semester VARCHAR(50),
    FOREIGN KEY (assigned_user_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Notifications Table (depends on users)
CREATE TABLE IF NOT EXISTS notifications (
    notification_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    `type` VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    notification_method VARCHAR(50) NOT NULL,
    sent_at DATETIME NOT NULL,
    `read` BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Nursing Appointments Table (depends on users)
CREATE TABLE IF NOT EXISTS nursingAppointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    notes TEXT,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Parking Spaces Table (depends on users)
CREATE TABLE IF NOT EXISTS parkingSpaces (
    parking_space_id INT PRIMARY KEY AUTO_INCREMENT,
    lot_name VARCHAR(255) NOT NULL,
    spot_number VARCHAR(100) NOT NULL,
    user_id INT,
    `type` VARCHAR(50) NOT NULL,
    status VARCHAR(50) NOT NULL,
    price_per_semester DECIMAL(10, 2),
    semester VARCHAR(50),
    start_date DATE,
    end_date DATE,
    reserved_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tutoring Sessions Table (depends on users)
CREATE TABLE IF NOT EXISTS tutoringSessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    created_by_user_id INT NOT NULL,
    organizer_user_id INT NOT NULL,
    course_code VARCHAR(50),
    course_name VARCHAR(255),
    tutor VARCHAR(100),
    room VARCHAR(255),
    start_date DATE,
    day_of_week VARCHAR(20),
    time VARCHAR(10),
    duration INT,
    start_time DATETIME,
    end_time DATETIME,
    capacity INT,
    description TEXT,
    recurring BOOLEAN DEFAULT FALSE,
    frequency VARCHAR(50),
    created_at DATETIME NOT NULL,
    FOREIGN KEY (created_by_user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (organizer_user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Access Logs Table (depends on users)
CREATE TABLE IF NOT EXISTS accessLogs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action VARCHAR(255),
    resource VARCHAR(255),
    ip_address VARCHAR(50),
    timestamp DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Lost and Found Table (depends on users)
CREATE TABLE IF NOT EXISTS lostFound (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    item_name VARCHAR(255) NOT NULL,
    description TEXT,
    location_found VARCHAR(255),
    location_lost VARCHAR(255),
    status VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Level 3: Tables that depend on resources
-- ============================================

-- Booking Requests Table (depends on users, resources)
CREATE TABLE IF NOT EXISTS bookingRequests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    resource_id INT NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    purpose TEXT,
    priority VARCHAR(50),
    status VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL,
    reviewed_by_admin_id INT,
    reviewed_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_by_admin_id) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Waitlist Table (depends on users, resources)
CREATE TABLE IF NOT EXISTS waitlist (
    waitlist_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_id INT NOT NULL,
    user_id INT NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cleaning Tasks Table (depends on users, resources)
CREATE TABLE IF NOT EXISTS cleaningTasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_id INT NOT NULL,
    assigned_to INT,
    scheduled_for DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    notes TEXT,
    created_at DATETIME NOT NULL,
    completed_at DATETIME,
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_to) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Preventive Maintenance Table (depends on users, resources)
CREATE TABLE IF NOT EXISTS preventiveMaintenance (
    maintenance_id INT PRIMARY KEY AUTO_INCREMENT,
    resource_id INT NOT NULL,
    maintenance_type VARCHAR(100),
    scheduled_date DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    notes TEXT,
    assigned_to INT,
    completed_at DATETIME,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE,
    FOREIGN KEY (assigned_to) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- Level 4: Tables that depend on multiple tables
-- ============================================

-- Bookings Table (depends on bookingRequests, users, resources)
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    request_id INT,
    resource_id INT NOT NULL,
    user_id INT NOT NULL,
    start_time DATETIME,
    end_time DATETIME,
    status VARCHAR(50) NOT NULL,
    override BOOLEAN DEFAULT FALSE,
    created_at DATETIME NOT NULL,
    cancelled_at DATETIME,
    completed_at DATETIME,
    FOREIGN KEY (request_id) REFERENCES bookingRequests(request_id) ON DELETE SET NULL,
    FOREIGN KEY (resource_id) REFERENCES resources(resource_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Employment Applications Table (depends on users, studentEmployment)
CREATE TABLE IF NOT EXISTS employmentApplications (
    application_id INT PRIMARY KEY AUTO_INCREMENT,
    job_id INT NOT NULL,
    user_id INT NOT NULL,
    semester VARCHAR(50),
    application_date DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    reviewed_by INT,
    reviewed_at DATETIME,
    rejection_reason TEXT,
    FOREIGN KEY (job_id) REFERENCES studentEmployment(job_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (reviewed_by) REFERENCES users(user_id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Event Tickets Table (depends on events, users)
CREATE TABLE IF NOT EXISTS eventTickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    event_id INT NOT NULL,
    user_id INT NOT NULL,
    reserved_at DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Issue Activities Table (depends on issueReports, users)
CREATE TABLE IF NOT EXISTS issueActivities (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT NOT NULL,
    actor_user_id INT NOT NULL,
    action VARCHAR(100) NOT NULL,
    note TEXT,
    time_of_activity DATETIME NOT NULL,
    FOREIGN KEY (issue_id) REFERENCES issueReports(issue_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Transportation Route Schedule Table (depends on transportationRoutes)
CREATE TABLE IF NOT EXISTS transportationRouteSchedule (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    route_id INT NOT NULL,
    time VARCHAR(10) NOT NULL,
    day_of_week VARCHAR(20) NOT NULL,
    FOREIGN KEY (route_id) REFERENCES transportationRoutes(route_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Transportation Reservations Table (depends on transportationRoutes, users)
CREATE TABLE IF NOT EXISTS transportationReservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    route_id INT NOT NULL,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    time VARCHAR(10) NOT NULL,
    reserved_at DATETIME NOT NULL,
    status VARCHAR(50) NOT NULL,
    FOREIGN KEY (route_id) REFERENCES transportationRoutes(route_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Cleaning Task Checklist Table (depends on cleaningTasks)
CREATE TABLE IF NOT EXISTS cleaningTaskChecklist (
    checklist_id INT PRIMARY KEY AUTO_INCREMENT,
    task_id INT NOT NULL,
    task VARCHAR(255) NOT NULL,
    completed BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (task_id) REFERENCES cleaningTasks(task_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================
-- End of Schema
-- ============================================
