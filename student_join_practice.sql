**Schema (MySQL v9)**

    drop table if exists marks;
    drop table if exists attendance;
    drop table if exists fees;
    drop table if exists subject;
    drop table if exists students;
    
    -- student dimension
    create table students(
    	student_id int primary key,
        roll_number int unique,
        student_name varchar(100)
     );
     
     -- subject dimension 
     create table subjects(
       subject_id int primary key,
       subject_name varchar(100)
     );
     
     -- marks fact
     create table marks(
       student_id int,
       subject_id int,
       marks int
      );
      
      -- fees fact 
      
      create table fees(
        roll_number int,
        fee_amount decimal(10,2),
        fee_status varchar(20)
     );
     
     -- attendance fact table
     create table attendance(
       roll_number int,
       attendance_percentage decimal(5,2)
     );
     
     -- insert students
     insert into students
     (student_id,roll_number,student_name)
     values
     (1,101,'kashif'),
     (2,102,'ahmed'),
     (3,103,'musaib'),
     (4,104,'bilal');
     
     -- insert subject
     insert into subjects
     (subject_id,subject_name)
     values
     (10,'mathematics'),
     (20,'science'),
     (30,'english');
     
     -- insert marks
     insert into marks
     (student_id,subject_id, marks)
     values
     (1,10,85),
     (1,20,78),
     (2,10,92),
     (3,20,74),
     (99,10,88);
     
     -- insert fees
     
     insert into fees
     (roll_number,fee_amount,fee_status)
     values
     (101,50000,'paid'),
     (102,50000,'paid'),
     (103,50000,'pending'),
     (999,50000,'paid');
     
     -- insert attendance
     insert into attendance
     (roll_number,attendance_percentage)
     values
     (101,95.00),
     (102,88.00),
     (104,91.00),
     (999,75.00);
     
    

---

**Query #1**

    -- task 1:
    -- checking data of all the tables 
    select * from students;

| student_id | roll_number | student_name |
| ---------- | ----------- | ------------ |
| 1          | 101         | kashif       |
| 2          | 102         | ahmed        |
| 3          | 103         | musaib       |
| 4          | 104         | bilal        |

---
**Query #2**

    select * from subjects;

| subject_id | subject_name |
| ---------- | ------------ |
| 10         | mathematics  |
| 20         | science      |
| 30         | english      |

---
**Query #3**

    select * from marks;

| student_id | subject_id | marks |
| ---------- | ---------- | ----- |
| 1          | 10         | 85    |
| 1          | 20         | 78    |
| 2          | 10         | 92    |
| 3          | 20         | 74    |
| 99         | 10         | 88    |

---
**Query #4**

    select * from fees;

| roll_number | fee_amount | fee_status |
| ----------- | ---------- | ---------- |
| 101         | 50000.0    | paid       |
| 102         | 50000.0    | paid       |
| 103         | 50000.0    | pending    |
| 999         | 50000.0    | paid       |

---
**Query #5**

    select *  from attendance;

| roll_number | attendance_percentage |
| ----------- | --------------------- |
| 101         | 95.0                  |
| 102         | 88.0                  |
| 104         | 91.0                  |
| 999         | 75.0                  |

---
**Query #6**

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

| student_name | roll_number | subject_name | marks |
| ------------ | ----------- | ------------ | ----- |
| kashif       | 101         | mathematics  | 85    |
| kashif       | 101         | science      | 78    |
| ahmed        | 102         | mathematics  | 92    |
| musaib       | 103         | science      | 74    |

---
**Query #7**

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

| student_name | roll_number | marks | subject_name |
| ------------ | ----------- | ----- | ------------ |
| kashif       | 101         | 85    | mathematics  |
| kashif       | 101         | 78    | science      |
| ahmed        | 102         | 92    | mathematics  |
| musaib       | 103         | 74    | science      |

---
**Query #8**

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

| student_name | roll_number | marks | subject_name |
| ------------ | ----------- | ----- | ------------ |
| kashif       | 101         | 78    | science      |
| kashif       | 101         | 85    | mathematics  |
| ahmed        | 102         | 92    | mathematics  |
| musaib       | 103         | 74    | science      |
| bilal        | 104         |       |              |

---
**Query #9**

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

| student_name | roll_number | marks | subject_name |
| ------------ | ----------- | ----- | ------------ |
| kashif       | 101         | 85    | mathematics  |
| kashif       | 101         | 78    | science      |
| ahmed        | 102         | 92    | mathematics  |
| musaib       | 103         | 74    | science      |
|              |             | 88    | mathematics  |

---
**Query #10**

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

| student_name | subject_name | marks |
| ------------ | ------------ | ----- |
| kashif       | mathematics  | 85    |
| kashif       | science      | 78    |
| ahmed        | mathematics  | 92    |
| musaib       | science      | 74    |

---
**Query #11**

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

| student_name | roll_number | fee_amount | fee_status |
| ------------ | ----------- | ---------- | ---------- |
| kashif       | 101         | 50000.0    | paid       |
| ahmed        | 102         | 50000.0    | paid       |
| musaib       | 103         | 50000.0    | pending    |
| bilal        | 104         |            |            |

---
**Query #12**

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

| student_name | roll_number | fee_amount | fee_status |
| ------------ | ----------- | ---------- | ---------- |
| kashif       | 101         | 50000.0    | paid       |
| ahmed        | 102         | 50000.0    | paid       |
| musaib       | 103         | 50000.0    | pending    |
|              |             | 50000.0    | paid       |

---
**Query #13**

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

| student_name | roll_number | attendance_percentage |
| ------------ | ----------- | --------------------- |
| kashif       | 101         | 95.0                  |
| ahmed        | 102         | 88.0                  |
| musaib       | 103         |                       |
| bilal        | 104         | 91.0                  |

---

[View on DB Fiddle](https://www.db-fiddle.com/)
