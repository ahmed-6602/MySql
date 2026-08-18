-- task 1:
-- checking data of all the tables 
select * from students;
select * from subjects;
select * from marks;
select * from fees;
select *  from attendance;

-- task 2:
-- First exercise: Students + Marks
-- Show me the student name, roll number, subject ID and marks
-- 
select 
 s.student_name,
 s.roll_number,
 sub.subject_name,
 m.marks
from students s
join marks m
  on s.student_id = m.student_id
join subjects sub
  on m.subject_id = sub.subject_id;
    
-- task 3:
-- INNER JOIN expected result
-- Give me only students who have marks
select 
	s.student_name,
	s.roll_number,
    m.marks,
    sub.subject_name
from students s
inner join marks m
 on s.student_id = m.student_id
inner join subjects sub
 on sub.subject_id = m.subject_id;

-- task 4:
-- LEFT JOIN expected result
-- Show me all students, even if they don't have marks.
select 
 s.student_name,
 s.roll_number,
 m.marks,
 sub.subject_name
 from students s
 left join marks m
 on s.student_id = m.student_id
left join subjects sub
 on sub.subject_id = m.subject_id;

-- task 5:
-- RIGHT JOIN expected result
-- Show me all marks records, even if there isn't a corresponding student
select 
 s.student_name,
 s.roll_number,
 m.marks,
 sub.subject_name
from students s
right join marks m
 on s.student_id = m.student_id
inner join subjects sub
 on sub.subject_id = m.subject_id;


-- task 6:
-- Now introduce Subjects
-- Show every student's marks along with the subject name
select 
 s.student_name,
 sub.subject_name,
 m.marks
 from students s
inner join  marks m
  on s.student_id = m.student_id
inner join subjects sub
 on sub.subject_id = m.subject_id;

-- task 7:
-- Fees exercise
-- Show every student and their fee status.
select 
 s.student_name,
 s.roll_number,
 f.fee_amount,
 f.fee_status
 from students s
left join fees f
 on s.roll_number = f.roll_number;
 
 -- task 8:
 -- Fees RIGHT JOIN exercise
 -- Show every fee record, even if the student doesn't exist 
 select 
 s.student_name,
 s.roll_number,
 f.fee_amount,
 f.fee_status
from students s
 right join fees f
 on s.roll_number = f.roll_number;
 
 -- task 9:
 -- Attendance exercise
 -- Show every student and their attendance
 select
 s.student_name,
 s.roll_number,
 a.attendance_percentage
 from students s
 left join attendance a
  on s.roll_number = a.roll_number;
  
