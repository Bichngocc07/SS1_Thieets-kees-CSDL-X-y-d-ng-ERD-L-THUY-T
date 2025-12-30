DROP DATABASE IF EXISTS OnlineLearning;
CREATE DATABASE OnlineLearning;
USE OnlineLearning;

-- BẢNG STUDENT (SINH VIÊN)
CREATE TABLE Student (
    student_id VARCHAR(10) PRIMARY KEY,
    full_name  VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    email      VARCHAR(100) NOT NULL UNIQUE
);

-- BẢNG INSTRUCTOR (GIẢNG VIÊN)
CREATE TABLE Instructor (
    instructor_id VARCHAR(10) PRIMARY KEY,
    full_name     VARCHAR(100) NOT NULL,
    email         VARCHAR(100) NOT NULL UNIQUE
);

-- BẢNG COURSE (KHÓA HỌC)
CREATE TABLE Course (
    course_id      VARCHAR(10) PRIMARY KEY,
    course_name    VARCHAR(100) NOT NULL,
    description    VARCHAR(255),
    total_lessons  INT CHECK (total_lessons > 0),
    instructor_id  VARCHAR(10) NOT NULL,

    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

-- BẢNG ENROLLMENT (ĐĂNG KÝ HỌC)
CREATE TABLE Enrollment (
    student_id  VARCHAR(10),
    course_id   VARCHAR(10),
    enroll_date DATE NOT NULL,

    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);

-- BẢNG RESULT (KẾT QUẢ HỌC TẬP)
CREATE TABLE Result (
    student_id   VARCHAR(10),
    course_id    VARCHAR(10),
    mid_score    DECIMAL(3,1) CHECK (mid_score BETWEEN 0 AND 10),
    final_score  DECIMAL(3,1) CHECK (final_score BETWEEN 0 AND 10),

    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id, course_id)
        REFERENCES Enrollment(student_id, course_id)
);

-- PHẦN II – NHẬP DỮ LIỆU BAN ĐẦU (INSERT)

-- DỮ LIỆU SINH VIÊN
INSERT INTO Student VALUES
('SV01', 'Nguyen Van A', '2003-01-10', 'a@gmail.com'),
('SV02', 'Tran Thi B', '2003-02-15', 'b@gmail.com'),
('SV03', 'Le Van C', '2003-03-20', 'c@gmail.com'),
('SV04', 'Pham Thi D', '2003-04-25', 'd@gmail.com'),
('SV05', 'Ha Bich Ngoc', '2003-05-30', 'ngoc@gmail.com');

-- DỮ LIỆU GIẢNG VIÊN
INSERT INTO Instructor VALUES
('GV01', 'Nguyen Van Thay', 'thay@gmail.com'),
('GV02', 'Tran Thi Co', 'co@gmail.com'),
('GV03', 'Le Van Giang', 'giang@gmail.com'),
('GV04', 'Pham Thi Dao', 'dao@gmail.com'),
('GV05', 'Hoang Van Son', 'son@gmail.com');

-- DỮ LIỆU KHÓA HỌC
INSERT INTO Course VALUES
('KH01', 'Co so du lieu', 'Hoc ve CSDL', 15, 'GV01'),
('KH02', 'Lap trinh Web', 'HTML CSS JS', 20, 'GV02'),
('KH03', 'Lap trinh Java', 'Java co ban', 18, 'GV03'),
('KH04', 'Mang may tinh', 'Mang can ban', 16, 'GV04'),
('KH05', 'Cong nghe phan mem', 'Quy trinh phan mem', 14, 'GV05');

-- DỮ LIỆU ĐĂNG KÝ HỌC
INSERT INTO Enrollment VALUES
('SV01', 'KH01', '2024-08-01'),
('SV02', 'KH02', '2024-08-02'),
('SV03', 'KH03', '2024-08-03'),
('SV04', 'KH04', '2024-08-04'),
('SV05', 'KH05', '2024-08-05');

-- DỮ LIỆU KẾT QUẢ HỌC TẬP
INSERT INTO Result VALUES
('SV01', 'KH01', 7.5, 8.0),
('SV02', 'KH02', 6.5, 7.0),
('SV03', 'KH03', 8.0, 8.5),
('SV04', 'KH04', 7.0, 7.5),
('SV05', 'KH05', 9.0, 9.5);

-- PHẦN III – CẬP NHẬT DỮ LIỆU (UPDATE)

-- Cập nhật email sinh viên
UPDATE Student
SET email = 'sv01_new@gmail.com'
WHERE student_id = 'SV01';

-- Cập nhật mô tả khóa học
UPDATE Course
SET description = 'Lap trinh Web nang cao'
WHERE course_id = 'KH02';

-- Cập nhật điểm cuối kỳ
UPDATE Result
SET final_score = 9.8
WHERE student_id = 'SV05' AND course_id = 'KH05';

-- PHẦN IV – XÓA DỮ LIỆU (DELETE)

-- Xóa lượt đăng ký học không hợp lệ
DELETE FROM Enrollment
WHERE student_id = 'SV04' AND course_id = 'KH04';

-- Xóa kết quả học tập tương ứng
DELETE FROM Result
WHERE student_id = 'SV04' AND course_id = 'KH04';

-- PHẦN V – TRUY VẤN DỮ LIỆU (SELECT)

-- Danh sách sinh viên
SELECT * FROM Student;

-- Danh sách giảng viên
SELECT * FROM Instructor;

-- Danh sách khóa học
SELECT * FROM Course;

-- Danh sách đăng ký học
SELECT * FROM Enrollment;

-- Danh sách kết quả học tập
SELECT * FROM Result;
