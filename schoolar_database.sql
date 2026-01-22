CREATE DATABASE students;

CREATE TABLE students.students();
CREATE TABLE students.courses();
CREATE TABLE students.majors();
CREATE TABLE students.majors_courses();

ALTER TABLE students.students ADD COLUMN student_id SERIAL;
ALTER TABLE students.students ADD PRIMARY KEY (student_id);
ALTER TABLE students.students ADD COLUMN first_name VARCHAR(30) NOT NULL;

ALTER TABLE students.students ADD FOREIGN KEY (major_id) REFERENCES students.majors(major_id);

ALTER TABLE students.majors ADD COLUMN major_id SERIAL;
ALTER TABLE students.majors ADD PRIMARY KEY (major_id);
ALTER TABLE students.majors ADD COLUMN major VARCHAR(50) NOT NULL;

ALTER TABLE students.students ADD FOREIGN KEY(major_id) REFERENCES students.majors(major_id);

ALTER TABLE students.courses ADD COLUMN course_id SERIAL PRIMARY KEY;