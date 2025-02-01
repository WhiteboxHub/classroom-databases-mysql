-- Create database
CREATE DATABASE IF NOT EXISTS training_management;

USE training_management;

-- Create tables
-- 1. Course Table
CREATE TABLE course (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Name of the course',
    description TEXT COMMENT 'Description of the course'
);

-- 2. Subject Table
CREATE TABLE subject (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'Name of the subject',
    description TEXT COMMENT 'Description of the subject'
);

-- 3. Course-Subject Table
CREATE TABLE course_subject (
    id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject(id) ON DELETE CASCADE
);

-- 4. Student Table
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrolled_date DATE COMMENT 'Date the student enrolled'
);

-- 5. Auth Table
CREATE TABLE auth (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE
);

-- 6. Enrollment Table
CREATE TABLE enrollment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES course(id) ON DELETE CASCADE
);

-- Insert data into Course Table
INSERT INTO course (name, description) VALUES 
('Data Science', 'Introduction to Data Science concepts'),
('Web Development', 'Learn frontend and backend development'),
('Machine Learning', 'Deep dive into ML algorithms'),
('Cybersecurity', 'Protecting digital assets from attacks'),
('Cloud Computing', 'Managing infrastructure on the cloud');

-- Insert data into Subject Table
INSERT INTO subject (name, description) VALUES 
('Python', 'Programming with Python'),
('JavaScript', 'Frontend & Backend with JS'),
('Machine Learning', 'ML techniques and algorithms'),
('Cybersecurity Basics', 'Fundamentals of security'),
('AWS Cloud', 'AWS services and deployment');

-- Insert data into Course-Subject Table
INSERT INTO course_subject (course_id, subject_id) VALUES 
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- Insert data into Student Table
INSERT INTO student (first_name, last_name, email, enrolled_date) VALUES 
('Alice', 'Johnson', 'alice@example.com', '2024-01-10'),
('Bob', 'Smith', 'bob@example.com', '2024-02-15'),
('Charlie', 'Brown', 'charlie@example.com', '2024-03-20'),
('David', 'Williams', 'david@example.com', '2024-04-25'),
('Eve', 'Miller', 'eve@example.com', '2024-05-30');

-- Insert data into Auth Table
INSERT INTO auth (student_id, username, password_hash) VALUES 
(1, 'alicej', 'password123'),
(2, 'bobsmith', 'securepass'),
(3, 'charlieb', 'mypassword'),
(4, 'davidw', 'davidpass'),
(5, 'evem', 'evepassword');

-- Insert data into Enrollment Table
INSERT INTO enrollment (student_id, course_id, enrollment_date) VALUES 
(1, 1, '2024-01-12'),
(2, 2, '2024-02-18'),
(3, 3, '2024-03-22'),
(4, 4, '2024-04-28'),
(5, 5, '2024-06-01');
