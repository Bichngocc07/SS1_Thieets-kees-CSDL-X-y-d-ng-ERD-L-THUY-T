CREATE DATABASE IF NOT EXISTS school_management;
USE school_management;

DROP TABLE IF EXISTS Subject;
DROP TABLE IF EXISTS Teacher;

CREATE TABLE Subject (
    subject_id INT NOT NULL,
    subject_name VARCHAR(150) NOT NULL,
    credit INT NOT NULL,
    PRIMARY KEY (subject_id),
    CHECK (credit > 0)
);
CREATE TABLE Teacher (
    teacher_id INT NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    PRIMARY KEY (teacher_id),
    UNIQUE (email)
);
ALTER TABLE Subject
ADD COLUMN teacher_id INT NOT NULL;

ALTER TABLE Subject
ADD CONSTRAINT fk_subject_teacher
FOREIGN KEY (teacher_id)
REFERENCES Teacher(teacher_id);
