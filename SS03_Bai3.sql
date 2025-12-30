-- 1. Cập nhật email cho sinh viên có student_id = 3
UPDATE Student
SET email = 'c_new@student.edu.vn'
WHERE student_id = 3;

-- 2. Cập nhật ngày sinh cho sinh viên có student_id = 2
UPDATE Student
SET date_of_birth = '2002-10-01'
WHERE student_id = 2;

-- 3. Xóa sinh viên nhập nhầm có student_id = 5
DELETE FROM Student
WHERE student_id = 5;

-- 4. Kiểm tra lại dữ liệu sau khi cập nhật và xóa
SELECT * FROM Student;
