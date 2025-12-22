--Hotel Database – JOIN Queries 
--1. Display hotel ID, name, and the name of its manager. 
select * from Booking
select * from Room
select * from Branch
select * from Customer
select * from Staff
SELECT 
    b.branch_id AS HotelID,
    b.name AS HotelName,
    s.name AS ManagerName
FROM Branch b
JOIN Staff s
    ON b.branch_id = s.branch_id
WHERE s.job_title = 'Manager';
--2. Display hotel names and the rooms available under them. 
select * from Branch
select * from Room
SELECT 
    b.name AS HotelName,
    r.room_no,
    r.room_type,
    r.nightly_rate
FROM Branch b
JOIN Room r
    ON b.branch_id = r.branch_id
ORDER BY b.name;
--we can also ordered by nightly room price 
SELECT 
    b.name AS HotelName,
    r.room_no,
    r.room_type,
    r.nightly_rate
FROM Branch b
JOIN Room r
    ON b.branch_id = r.branch_id;
--3. Display guest data along with the bookings they made. 
select * from Booking
select * from Customer
SELECT 
    c.customer_id,
    c.name AS GuestName,
    c.phone,
    b.booking_id,
    b.check_in_date,
    b.check_out_date
FROM Customer c
JOIN Booking b
    ON c.customer_id = b.customer_id;
--4. Display bookings for hotels in 'Muscat' or 'Salalah'. 
SELECT 
    br.name AS HotelName,
    b.booking_id,
    b.check_in_date,
    b.check_out_date
FROM Booking b
JOIN BookingRoom brm
    ON b.booking_id = brm.booking_id
JOIN Branch br
    ON brm.branch_id = br.branch_id
WHERE br.location IN ('Muscat, Oman', 'Salalah, Oman');
--5. Display all room records where room type starts with "S" (e.g., "Suite", "Single").
select * from Room
select * from Room where room_type like 'S%'
--6. List guests who booked rooms priced between 100 and 250 LE. 
select * from Booking
select * from Customer
select * from Room
select * from BookingRoom
SELECT DISTINCT
    c.name AS GuestName,
    r.room_type,
    r.nightly_rate
FROM Customer c
JOIN Booking b
    ON c.customer_id = b.customer_id
JOIN BookingRoom brm
    ON b.booking_id = brm.booking_id
JOIN Room r
    ON brm.room_no = r.room_no
   AND brm.branch_id = r.branch_id
WHERE r.nightly_rate BETWEEN 150 AND 250;
--7. Retrieve guest names who have bookings marked as 'Confirmed' in hotel "Hilton Downtown". 
--??????? status
--8. Find guests whose bookings were handled by staff member "Mona Ali". 
select * from Staff
select * from Customer
select * from StaffAction
select * from Booking
SELECT DISTINCT
    c.name AS GuestName
FROM Customer c
JOIN Booking b
    ON c.customer_id = b.customer_id
JOIN StaffAction sa
    ON b.booking_id = sa.booking_id
JOIN Staff s
    ON sa.staff_id = s.staff_id
WHERE s.name = 'Ahmed Al Maskari';
--9. Display each guest’s name and the rooms they booked, ordered by room type. 
select * from Room
select * from Customer
select * from Booking
select * from BookingRoom
SELECT 
    c.name AS GuestName,
    r.room_no,
    r.room_type
FROM Customer c
JOIN Booking b
    ON c.customer_id = b.customer_id
JOIN BookingRoom brm
    ON b.booking_id = brm.booking_id
JOIN Room r
    ON brm.room_no = r.room_no
   AND brm.branch_id = r.branch_id
ORDER BY r.room_type;
--10. For each hotel in 'Muscat', display hotel ID, name, manager name, and contact info. 
SELECT 
    b.branch_id,
    b.name AS HotelName,
    s.name AS ManagerName
FROM Branch b
JOIN Staff s
    ON b.branch_id = s.branch_id
WHERE s.job_title = 'Manager'
  AND b.location LIKE '%Muscat%';
--11. Display all staff members who hold 'Manager' positions. 
SELECT 
    staff_id,
    name,
    job_title,
    salary
FROM Staff
WHERE job_title = 'Manager';
--12. Display all guests and their reviews, even if some guests haven't submitted any reviews. 
--??????? review