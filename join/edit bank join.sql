--Bank Database – JOIN Queries 
--1. Display branch ID, name, and the name of the employee who manages it. 
select * from Account
select * from Branch
select * from Customer
select * from Employee
select * from Loan
select * from Account
SELECT 
    b.branch_id,
    b.address AS BranchName,
    e.name AS ManagerName
FROM Branch b
JOIN Employee e
    ON b.branch_id = e.branch_id
WHERE e.position = 'Loan Manager';
--2. Display branch names and the accounts opened under each. 
select * from Account
select * from Branch
SELECT DISTINCT
    b.address AS BranchAddress,
    a.account_no,
    a.account_type,
    a.balance
FROM Branch b
JOIN Employee e
    ON b.branch_id = e.branch_id
JOIN EmployeeCustomerAction eca
    ON e.employee_id = eca.employee_id
JOIN Account a
    ON eca.customer_id = a.customer_id;
--3. Display full customer details along with their loans. 
SELECT 
    c.*,
    l.loan_id,
    l.loan_type,
    l.amount
FROM Customer c
JOIN Loan l
    ON c.customer_id = l.customer_id;
--4. Display loan records where the loan office is in 'Muscat' or 'Salalah'. 
SELECT 
    l.*
FROM Loan l
JOIN Employee e
    ON l.employee_id = e.employee_id
JOIN Branch b
    ON e.branch_id = b.branch_id
WHERE b.address LIKE '%Muscat%'
   OR b.address LIKE '%Salalah%';
--5. Display account data where the type starts with "S" (e.g., "Savings"). 
SELECT *
FROM Account
WHERE account_type LIKE 'S%';
--6. List customers with accounts having balances between 20,000 and 50,000. 
SELECT DISTINCT
    c.name,
    a.balance
FROM Customer c
JOIN Account a
    ON c.customer_id = a.customer_id
WHERE a.balance BETWEEN 2000 AND 5000;
--7. Retrieve customer names who borrowed more than 100,000 LE from 'Cairo Main Branch'. 

--8. Find all customers assisted by employee "Mona Al Hinai". 
SELECT DISTINCT
    c.name AS CustomerName
FROM Customer c
JOIN EmployeeCustomerAction eca
    ON c.customer_id = eca.customer_id
JOIN Employee e
    ON eca.employee_id = e.employee_id
WHERE e.name = 'Mona Al Hinai';
--9. Display each customer’s name and the accounts they hold, sorted by account type. 
SELECT 
    c.name AS CustomerName,
    a.account_no,
    a.account_type,
    a.balance
FROM Customer c
JOIN Account a
    ON c.customer_id = a.customer_id
ORDER BY a.account_type;
--10. For each loan issued in Cairo, show loan ID, customer name, employee handling it, and branch name. 
SELECT 
    l.loan_id,
    c.name AS CustomerName,
    e.name AS EmployeeName,
    b.address AS BranchName
FROM Loan l
JOIN Customer c
    ON l.customer_id = c.customer_id
JOIN Employee e
    ON l.employee_id = e.employee_id
JOIN Branch b
    ON e.branch_id = b.branch_id
WHERE b.address LIKE '%S%';
--11. Display all employees who manage any branch. 
SELECT 
    employee_id,
    name,
    position
FROM Employee
WHERE position = 'Loan Manager';
--12. Display all customers and their transactions, even if some customers have no transactions yet.
SELECT 
    c.name AS CustomerName,
    t.transaction_id,
    t.transaction_date,
    t.amount,
    t.transaction_type
FROM Customer c
LEFT JOIN Account a
    ON c.customer_id = a.customer_id
LEFT JOIN BankTransaction t
    ON a.account_no = t.account_no;