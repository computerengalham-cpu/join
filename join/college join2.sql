--University Database – JOIN Queries 
--1. Display the department ID, name, and the full name of the faculty managing it. 
ALTER TABLE student
ADD 
  GPA DECIMAL(3,2),
  enrollment_date DATE,
  status NVARCHAR(20),
  advisor INT;
select * from faculty
select * from department
SELECT d.D_id,
       d.D_Name,
       f.F_Name 
FROM Department d
JOIN Faculty f
ON d.D_id = f.F_id;

--2. Display each program's name and the name of the department offering it.
select * from course
SELECT c.c_Name,
       d.D_Name
FROM course c
JOIN Department d
ON c.D_id = d.D_id;
--3. Display the full student data and the full name of their faculty advisor. 
select * from student
SELECT s.*,
       f.F_Name AS Advisor_Name
FROM student s
LEFT JOIN faculty f
ON s.advisor = f.F_id;
--4. Display class IDs, course titles, and room locations for classes in buildings 'A' or 'B'.
SELECT e.exam_code,
       c.c_Name,
       e.room
FROM exam e
JOIN course c
ON e.D_id = c.D_id
WHERE e.room = 'Hall A';
select * FROM exam 
--5. Display full data about courses whose titles start with "D" (e.g., "Database..."). 
select * from course 
where c_Name like 'D%'
--6. Display names of students in program ID 6 whose GPA is between 2.5 and 3.5. 
UPDATE student SET GPA = 3.0 WHERE s_id = 1;
UPDATE student SET GPA = 2.8 WHERE s_id = 2;
UPDATE student SET GPA = 3.2 WHERE s_id = 3;
SELECT s_id, FName, GPA FROM student;
select * FROM department
select * from student
UPDATE student
SET D_id = 6
WHERE s_id = 1;
SELECT FName,
       LName,
       GPA
FROM student
WHERE D_id = 6
  AND GPA BETWEEN 2.5 AND 3.5;
--7. Retrieve student names in the Engineering program who earned grades ≥ 90 in the "Database" course. 
UPDATE student SET advisor = 6 WHERE s_id = 1;
UPDATE student SET advisor = 7 WHERE s_id = 2;
ALTER TABLE student_course
ADD grade INT;
UPDATE student_course
SET grade = 95
WHERE s_id = 1 AND c_id = 1;
SELECT s.FName, s.LName
FROM student s
JOIN student_course sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
WHERE s.D_id = 6               -- Engineering program
  AND c.c_Name LIKE '%Database%'
  AND sc.grade >= 90;
--8. Find names of students who are advised by " Ahmed Ali". 
select * from faculty
select * from student
SELECT s.FName, s.LName
FROM student s
JOIN faculty f ON s.advisor = f.F_id
WHERE f.F_Name = 'Ahmed Ali'; 
UPDATE student SET advisor = 1 WHERE s_id = 1;  -- Ahmed Ali
UPDATE student SET advisor = 2 WHERE s_id = 2;  -- Sara Hosain
UPDATE student SET advisor = 3 WHERE s_id = 3;  -- Mohammad Saleh
--9. Retrieve each student's name and the titles of courses they are enrolled in, ordered by course title. 
SELECT s.FName, s.LName, c.c_Name AS Course_Name
FROM student s
JOIN student_course sc ON s.s_id = sc.s_id
JOIN course c ON sc.c_id = c.c_id
ORDER BY c.c_Name;
--10. For each class in Building 'Main', retrieve class ID, course name, department name, and faculty name teaching the class. 
SELECT e.exam_code, c.c_Name AS Course_Name, d.D_Name AS Department_Name, f.F_Name AS Faculty_Name
FROM exam e
JOIN course c ON e.D_id = c.D_id
JOIN department d ON c.D_id = d.D_id
JOIN faculty f ON f.D_id = d.D_id
WHERE e.room LIKE '%lab%';
--11. Display all faculty members who manage any department. 
SELECT f.*
FROM faculty f
JOIN department d ON f.D_id = d.D_id;
--12. Display all students and their advisors' names, even if some students don’t have advisors yet.
SELECT s.FName, s.LName, f.F_Name AS Advisor_Name
FROM student s
LEFT JOIN faculty f ON s.advisor = f.F_id;

select * from faculty