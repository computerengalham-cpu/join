--Airline Database – JOIN Queries 
--1. Display each flight leg's ID, schedule, and the name of the airplane assigned to it. 
select *from airplane
select *from leg_instance
select *from flight_leg
SELECT fl.leg_no, fl.scheduled_dep_time,fl.scheduled_arr_time, a.type_name
FROM flight_leg fl
JOIN airplane a ON fl.leg_no = a.airplane_id;

--2. Display all flight numbers and the names of the departure and arrival airports.
SELECT fl.flight_no, f2.dep_airport,f2.arr_airport
FROM flight fl
JOIN flight_leg f2 ON fl.flight_no = f2.leg_no;

--3. Display all reservation data with the name and phone of the customer who made each booking. 
select * from reservation
--4. Display IDs and locations of flights departing from 'CAI' or 'DXB'. 
select *from flight_leg
select * from airport
select *from flight
SELECT 
    fl.leg_no,
    ap.city,
    ap.state
FROM flight_leg fl
JOIN airport ap ON fl.dep_airport = ap.airport_code
WHERE fl.dep_airport IN ('MCT', 'SLL');
--5. Display full data of flights whose names start with 'O'. 
SELECT *
FROM flight
WHERE airline LIKE 'O%';
--6. List customers who have bookings with total payment between 50 and 70. 
select *from fare
select * from reservation
select *from flight
SELECT DISTINCT r.customer_name
FROM reservation r
JOIN leg_instance li ON r.leg_instance_id = li.leg_instance_id
JOIN flight_leg fl ON li.leg_no = fl.leg_no
JOIN fare f ON fl.flight_no = f.flight_no
WHERE f.amount BETWEEN 50 AND 70;

--7. Retrieve all passengers on 'Flight 1' who booked more than 2 seats.
select *from fare
select * from reservation
select *from flight
SELECT r.customer_name
FROM reservation r
JOIN leg_instance li ON r.leg_instance_id = li.leg_instance_id
JOIN flight_leg fl ON li.leg_no = fl.leg_no
JOIN flight f ON fl.flight_no = f.flight_no
WHERE f.flight_no = 1
--8. Find names of passengers whose booking was handled by agent "Youssef Hamed". 
--??????? agent
--9. Display each passenger’s name and the flights they booked, ordered by flight date. 
SELECT 
    r.customer_name,
    f.flight_no,
    li.flight_date
FROM reservation r
JOIN leg_instance li ON r.leg_instance_id = li.leg_instance_id
JOIN flight_leg fl ON li.leg_no = fl.leg_no
JOIN flight f ON fl.flight_no = f.flight_no
ORDER BY li.flight_date;
--10. For each flight departing from 'Muscat', display the flight number, departure time, and airline name. 
SELECT 
    f.flight_no,
    fl.scheduled_dep_time,
    f.airline
FROM flight f
JOIN flight_leg fl ON f.flight_no = fl.flight_no
JOIN airport ap ON fl.dep_airport = ap.airport_code
WHERE ap.city = 'Muscat';
--11. Display all staff members who are assigned as supervisors for flights. 
--??????? staff
--12. Display all bookings and their related passengers, even if some bookings are unpaid. 
select * from reservation
select *from flight_leg
SELECT 
    r.reservation_id,
    r.customer_name,
    r.customer_phone,
    r.seat_no
FROM reservation r
LEFT JOIN leg_instance li ON r.leg_instance_id = li.leg_instance_id;