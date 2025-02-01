# Training Management System

The **Training Management System** is a MySQL-based database designed to manage courses, subjects, students, and enrollments efficiently. It includes:

- **Predefined schema** for structured data management.
- **Sample data** for quick setup.
- **Docker support** for simplified deployment.
- **SQL queries** for common learning operations.

---

## Features

- **Tables:**
  - `course` - Stores course details.
  - `subject` - Stores subject details.
  - `course_subject` - Maps subjects to courses.
  - `student` - Stores student information.
  - `auth` - Stores authentication details.
  - `enrollment` - Tracks student enrollments.

---

## Setup Guide

### Prerequisites

Ensure you have the following installed:
- **Docker** (for containerized deployment)
- **MySQL Client** (DBeaver, MySQL Workbench, or CLI)

### Installation Steps

1. **Clone the repository:**
   ```bash
   git clone git@github.com:WhiteboxHub/classroom-databases-mysql.git
   cd classroom-databases-mysql
   ```

2. **Build and run the Docker container:**
   ```bash
   docker build -t training-management-db .
   docker run -d -p 3306:3306 --name training-management-db training-management-db
   ```

3. **Connect to the database using a MySQL client:**
   - **Host:** `localhost`
   - **Port:** `3306`
   - **Username:** `root`
   - **Password:** `root`

---

## SQL Query Examples

### Basic Queries

#### Retrieve all records
```sql
-- Get all courses
SELECT * FROM course;

-- Get all students
SELECT * FROM student;
```

#### Fetch specific fields
```sql
-- Get the names of all students
SELECT first_name, last_name FROM student;
```

### Filtering Data (`WHERE` Clause)
```sql
-- Find students enrolled after March 2024
SELECT * FROM student WHERE enrolled_date > '2024-03-01';

-- Get courses with "Machine" in the name
SELECT * FROM course WHERE name LIKE '%Machine%';
```

### Sorting and Limiting Results
```sql
-- Get the latest 3 enrolled students
SELECT * FROM student ORDER BY enrolled_date DESC LIMIT 3;

-- Get courses sorted alphabetically
SELECT * FROM course ORDER BY name ASC;
```

### Joining Tables (`INNER JOIN`)
```sql
-- Get student names and their enrolled courses
SELECT s.first_name, s.last_name, c.name AS course_name
FROM student s
JOIN enrollment e ON s.id = e.student_id
JOIN course c ON e.course_id = c.id;

-- Get all subjects linked to courses
SELECT c.name AS course_name, sub.name AS subject_name
FROM course c
JOIN course_subject cs ON c.id = cs.course_id
JOIN subject sub ON cs.subject_id = sub.id;
```

### Aggregation (`COUNT`, `AVG`, `SUM`)
```sql
-- Count total number of students
SELECT COUNT(*) AS total_students FROM student;

-- Count students enrolled in each course
SELECT c.name, COUNT(e.student_id) AS student_count
FROM course c
LEFT JOIN enrollment e ON c.id = e.course_id
GROUP BY c.name;
```

### Grouping and Filtering (`GROUP BY` & `HAVING`)
```sql
-- Find courses with more than 1 student enrolled
SELECT c.name, COUNT(e.student_id) AS student_count
FROM course c
LEFT JOIN enrollment e ON c.id = e.course_id
GROUP BY c.name
HAVING student_count > 1;
```

### Subqueries
```sql
-- Get students enrolled in "Data Science"
SELECT first_name, last_name
FROM student
WHERE id IN (
    SELECT student_id FROM enrollment
    WHERE course_id = (SELECT id FROM course WHERE name = 'Data Science')
);
```

### Updating and Deleting Records
```sql
-- Update a student’s email
UPDATE student SET email = 'newemail@example.com' WHERE id = 1;

-- Delete a student by ID
DELETE FROM student WHERE id = 5;
```

---

## License
This project is licensed under the MIT License.

## Contributors
- Whitebox Learning
