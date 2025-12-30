-- Xóa bảng nếu đã tồn tại
DROP TABLE IF EXISTS Score;

-- Tạo bảng Score
CREATE TABLE Score (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    mid_score DECIMAL(4,2) NOT NULL,
    final_score DECIMAL(4,2) NOT NULL,

    -- Khóa chính kép
    PRIMARY KEY (student_id, subject_id),

    -- Ràng buộc khóa ngoại
    CONSTRAINT fk_score_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_score_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id),

    -- Ràng buộc điểm số
    CHECK (mid_score BETWEEN 0 AND 10),
    CHECK (final_score BETWEEN 0 AND 10)
);
