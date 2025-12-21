--Task 8 ( Joins Lab ) 
--Company Database (the provided database) – JOIN Queries 
--1. Display the department ID, department name, manager ID, and the full name of the manager.

select * from Department
select * from Employee
UPDATE Department SET DSSN = 1 WHERE DNum = 1;  -- Ali ???? HR
UPDATE Department SET DSSN = 2 WHERE DNum = 2;  -- Sara ???? IT
UPDATE Department SET DSSN = 3 WHERE DNum = 3;  -- Omar ???? Finance
UPDATE Department SET DSSN = 4 WHERE DNum = 4;  -- Noura ???? Design
SELECT d.DNum,
       d.DName,
       d.DSSN,
       e.FName + ' ' + e.LName AS ManagerName
FROM Department d LEFT JOIN Employee e
ON d.DSSN = e.SSN;
--2. Display the names of departments and the names of the projects they control. 
select * from Department
select * from Project
UPDATE Project SET DNum = 1 WHERE PNum = 1;
UPDATE Project SET DNum = 2 WHERE PNum = 2;
UPDATE Project SET DNum = 3 WHERE PNum = 3;
UPDATE Project SET DNum = 4 WHERE PNum = 4;
SELECT d.DName,
       p.PName
FROM Department d
JOIN Project p
ON d.DNum = p.DNum;
--3. Display full data of all dependents, along with the full name of the employee they depend on. 
select * from Dependent
SELECT dep.DName,
       dep.Gender,
       dep.BD,
       e.FName + ' ' + e.LName AS EmployeeName
FROM Dependent dep
JOIN Employee e
ON dep.SSN = e.SSN;
--4. Display the project ID, name, and location of all projects located in Muscat or Suhar.
select * from Project
SELECT PNum,
       PName,
       City
FROM Project
WHERE City IN ('Muscat', 'Suhar');
--5. Display all project data where the project name starts with the letter 'S'. 
SELECT *
FROM Project
WHERE PName LIKE 'S%';
--6. Display the IDs and names of employees in department 30 with a salary between 1000 and 2000 LE. 
select * from Employee
SELECT SSN,
       FName,
       LName
FROM Employee
WHERE ENum = 3;
--7. Retrieve the names of employees in department 10 who work ? 10 hours/week on the "AL Rabwah" project. 
SELECT e.FName,
       e.LName
FROM Employee e
JOIN EmpProj ep ON e.SSN = ep.SSN
JOIN Project p ON ep.PNum = p.PNum
WHERE e.ENum = 1
  AND p.PName = 'System Upgrade'
  AND ep.Hours >= 10;
--8. Find the names of employees who are directly supervised by "Kamel Mohamed". 
UPDATE Employee SET SuperID = 1 WHERE SSN IN (2,3,4);
SELECT e.FName,
       e.LName
FROM Employee e
JOIN Employee s ON e.SuperID = s.SSN
WHERE s.FName = 'Ali' AND s.LName = 'Ahmed';
--9. Retrieve the names of employees and the names of the projects they work on, sorted by project name. 
SELECT e.FName,
       e.LName,
       p.PName
FROM Employee e
JOIN EmpProj ep ON e.SSN = ep.SSN
JOIN Project p ON ep.PNum = p.PNum
ORDER BY p.PName;
--10. For each project located in Cairo, display the project number, controlling department name, manager's last name, address, and birthdate. 
SELECT p.PNum,
       d.DName,
       m.LName AS ManagerLastName,
       m.DB
FROM Project p
JOIN Department d ON p.DNum = d.DNum
JOIN Employee m ON d.DSSN = m.SSN;
--11. Display all data of managers in the company. 
SELECT DISTINCT e.*
FROM Employee e
JOIN Department d ON e.SSN = d.DSSN;
--12. Display all employees and their dependents, even if some employees have no dependents.
SELECT e.FName,
       e.LName,
       dep.DName AS DependentName
FROM Employee e
LEFT JOIN Dependent dep ON e.SSN = dep.SSN;
