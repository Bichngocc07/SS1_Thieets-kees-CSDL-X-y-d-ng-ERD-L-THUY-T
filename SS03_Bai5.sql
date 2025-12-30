-- 1. Tạo bảng Enrollment với khóa ngoại
CREATE TABLE Enrollment (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    enroll_date DATE NOT NULL,

    -- Khóa chính kép: không cho đăng ký trùng môn
    PRIMARY KEY (student_id, subject_id),

    -- Khóa ngoại liên kết Student
    FOREIGN KEY (student_id) REFERENCES Student(student_id),

    -- Khóa ngoại liên kết Subject
    FOREIGN KEY (subject_id) REFERENCES Subject(subject_id)
);

-- 2. Thêm dữ liệu đăng ký môn học (INSERT nhiều bản ghi)
INSERT INTO Enrollment (student_id, subject_id, enroll_date)
VALUES
    (1, 1, '2024-08-01'),
    (1, 2, '2024-08-01'),
    (2, 1, '2024-08-02'),
    (2, 3, '2024-08-02');

-- 3. Lấy ra tất cả các lượt đăng ký
SELECT * FROM Enrollment;

-- 4. Lấy ra các lượt đăng ký của một sinh viên cụ thể
-- Ví dụ: sinh viên có student_id = 1
SELECT *
FROM Enrollment
WHERE student_id = 1;