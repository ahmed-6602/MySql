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
