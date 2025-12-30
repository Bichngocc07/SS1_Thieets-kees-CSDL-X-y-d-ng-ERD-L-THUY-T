-- 1. Tạo bảng Student
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

-- 2. Thêm dữ liệu sinh viên
INSERT INTO Student (student_id, full_name, date_of_birth, email)
VALUES
    (1, 'Nguyen Van A', '2003-05-12', 'a@student.edu.vn'),
    (2, 'Tran Thi B', '2002-09-20', 'b@student.edu.vn'),
    (3, 'Le Van C', '2003-01-15', 'c@student.edu.vn');

-- 3. Lấy ra toàn bộ danh sách sinh viên
SELECT * FROM Student;

-- 4. Lấy ra mã sinh viên và họ tên của tất cả sinh viên
SELECT student_id, full_name
FROM Student;