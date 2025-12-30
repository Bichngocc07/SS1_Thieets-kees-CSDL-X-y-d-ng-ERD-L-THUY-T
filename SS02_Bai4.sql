-- Tạo database (nếu chưa có)
CREATE DATABASE IF NOT EXISTS school_management;
USE school_management;

-- Xóa bảng nếu tồn tại
DROP TABLE IF EXISTS Subject;
DROP TABLE IF EXISTS Student;

-- Tạo bảng Student
CREATE TABLE Student (
    student_id INT NOT NULL,
    full_name VARCHAR(150) NOT NULL,
    PRIMARY KEY (student_id),
    UNIQUE (student_id)
);

-- Tạo bảng Subject
CREATE TABLE Subject (
    subject_id INT NOT NULL,
    subject_name VARCHAR(150) NOT NULL,
    credit INT NOT NULL,
    PRIMARY KEY (subject_id),
    UNIQUE (subject_id),
    CHECK (credit > 0)
);
