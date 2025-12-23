--Library Database – JOIN Queries 
--1. Display library ID, name, and the name of the manager. 
select * from Library
select * from loan
select * from book
select * from staff
select * from review
select * from members
select * from fine_payment
SELECT 
    l.library_id,
    l.name AS library_name,
    s.full_name AS manager_name
FROM library l
JOIN staff s
    ON l.library_id = s.library_id
WHERE s.position = 'Head Librarian';
--2. Display library names and the books available in each one.
SELECT 
    l.name AS library_name,
    b.title AS book_title
FROM library l
JOIN book b
    ON l.library_id = b.library_id
WHERE b.availability_status = 1;
--3. Display all member data along with their loan history.
SELECT 
    m.*,
    lo.loan_id,
    lo.book_id,
    lo.loan_date,
    lo.due_date,
    lo.return_date,
    lo.status
FROM members m
LEFT JOIN loan lo
    ON m.member_id = lo.member_id;
--4. Display all books located in 'Zamalek' or 'Downtown'. 
SELECT 
    b.*
FROM book b
JOIN library l
    ON b.library_id = l.library_id
WHERE l.location IN ('Muscat', 'Salalah');
--5. Display all books whose titles start with 'T'. 
SELECT *
FROM book
WHERE title LIKE 'A%';
--6. List members who borrowed books priced between 100 and 300 LE. 
SELECT DISTINCT m.full_name
FROM members m
JOIN loan lo ON m.member_id = lo.member_id
JOIN book b ON lo.book_id = b.book_id
WHERE b.price BETWEEN 100 AND 300;
--7. Retrieve members who borrowed and returned books titled 'The Alchemist'.
SELECT DISTINCT m.full_name
FROM members m
JOIN loan lo ON m.member_id = lo.member_id
JOIN book b ON lo.book_id = b.book_id
WHERE b.title = 'Oman History'
  AND lo.status = 'Returned';

--8. Find all members assisted by librarian "Sarah Fathy". 
SELECT DISTINCT m.full_name
FROM members m
JOIN loan lo ON m.member_id = lo.member_id
JOIN book b ON lo.book_id = b.book_id
JOIN staff s ON b.library_id = s.library_id
WHERE s.full_name = 'Saeed Al-Rashdi';
--9. Display each member’s name and the books they borrowed, ordered by book title. 
SELECT m.full_name, b.title
FROM members m
JOIN loan lo ON m.member_id = lo.member_id
JOIN book b ON lo.book_id = b.book_id
ORDER BY b.title;
--10. For each book located in 'Cairo Branch', show title, library name, manager, and shelf info. 
SELECT 
    b.title,
    l.name AS library_name,
    s.full_name AS manager_name,
    b.shelf_location
FROM book b
JOIN library l ON b.library_id = l.library_id
JOIN staff s ON l.library_id = s.library_id
WHERE l.name = 'Muscat Central Library'
  AND s.position = 'Head Librarian';
--11. Display all staff members who manage libraries. 
SELECT s.full_name, l.name AS library_name
FROM staff s
JOIN library l ON s.library_id = l.library_id
WHERE s.position LIKE '%Librarian%';
--12. Display all members and their reviews, even if some didn’t submit any review yet.
SELECT 
    m.full_name,
    b.title AS book_title,
    r.rating,
    r.comments
FROM members m
LEFT JOIN review r ON m.member_id = r.member_id
LEFT JOIN book b ON r.book_id = b.book_id;