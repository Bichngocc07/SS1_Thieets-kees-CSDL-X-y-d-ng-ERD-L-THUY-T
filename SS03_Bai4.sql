-- 1. Tạo bảng Subject với ràng buộc
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT CHECK (credit > 0)
);

-- 2. Thêm dữ liệu cho một số môn học
INSERT INTO Subject (subject_id, subject_name, credit)
VALUES
    (1, 'Co so du lieu', 3),
    (2, 'Lap trinh C', 4),
    (3, 'Mang may tinh', 3);

-- 3. Cập nhật số tín chỉ cho một môn học
-- Cập nhật môn có subject_id = 1 từ 3 tín chỉ thành 4
UPDATE Subject
SET credit = 4
WHERE subject_id = 1;

-- 4. Đổi tên một môn học
-- Đổi tên môn có subject_id = 2
UPDATE Subject
SET subject_name = 'Lap trinh C nang cao'
WHERE subject_id = 2;

-- 5. Hiển thị toàn bộ danh sách môn học sau khi cập nhật
SELECT * FROM Subject;

-- 6. Hiển thị mã môn, tên môn và số tín chỉ (lọc cột)
SELECT subject_id, subject_name, credit
FROM Subject
WHERE credit >= 3;