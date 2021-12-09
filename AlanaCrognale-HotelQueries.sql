USE Hotel;

-- 1. Write a query that returns a list of reservations that end in July 2023, including the 
-- name of the guest, the room number(s), and the reservation dates.

SELECT g.`Name` GuestName, rr.RoomNum RoomNumber, r.StartDate, r.EndDate
FROM Guest g
INNER JOIN Reservation r on g.GuestId = r.GuestId
INNER JOIN RoomReservation rr ON r.ReservationId = rr.reservationId
WHERE r.EndDate BETWEEN '2023-07-01' AND '2023-07-31';

-- results:
--   GuestName	RoomNumber	StartDate	EndDate
-- Alana Crognale	205	2023-06-28	2023-07-02
-- Walter Holaway	204	2023-07-13	2023-07-14
-- Wilfred Vise		401	2023-07-18	2023-07-21
-- Bettyann Seery	303	2023-07-28	2023-07-29

-- 2. Write a query that returns a list of all reservations for rooms with a jacuzzi, 
-- displaying the guest's name, the room number, and the dates of the reservation.

SELECT g.`Name` GuestName, rr.RoomNum RoomNumber, r.StartDate, r.EndDate
FROM Guest g
INNER JOIN Reservation r ON g.GuestId = r.GuestId
INNER JOIN RoomReservation rr ON r.ReservationId = rr.ReservationId
INNER JOIN RoomAmenity ra ON rr.RoomNum = ra.RoomNum
INNER JOIN Amenity a ON ra.AmenityId = a.AmenityId
WHERE a.`Name` = 'jacuzzi';

-- results:
--   GuestName	RoomNumber	StartDate	EndDate
-- Karie Yang		201	2023-03-06	2023-03-07
-- Bettyann Seery	203	2023-02-05	2023-02-10
-- Karie Yang		203	2023-09-13	2023-09-15
-- Alana Crognale	205	2023-06-28	2023-07-02
-- Wilfred Vise		207	2023-04-23	2023-04-24
-- Walter Holaway	301	2023-04-09	2023-04-13
-- Mack Simmer		301	2023-11-22	2023-11-25
-- Bettyann Seery	303	2023-07-28	2023-07-29
-- Duane Cullison	305	2023-02-22	2023-02-24
-- Bettyann Seery	305	2023-08-30	2023-09-01
-- Alana Crognale	307	2023-03-17	2023-03-20

-- 3. Write a query that returns all the rooms reserved for a specific guest, including the 
-- guest's name, the room(s) reserved, the starting date of the reservation, and how many 
-- people were included in the reservation. (Choose a guest's name from the existing data.)

SELECT g.`Name` GuestName, rr.RoomNum RoomNumber, r.StartDate, (rr.NumAdults+rr.NumChildren) NumberOfPeople
FROM RoomReservation rr
INNER JOIN Reservation r ON rr.ReservationId = r.ReservationId
INNER JOIN Guest g ON r.GuestId = g.GuestId
WHERE g.`Name` = 'Maritza Tilton';

-- results:
--   GuestName	RoomNumber	StartDate	NumberOfPeople
-- Maritza Tilton	401	2023-05-30	6
-- Maritza Tilton	302	2023-12-24	2

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each 
-- reservation. The results should include all rooms, whether or not there is a reservation 
-- associated with the room.

SELECT ro.RoomNum RoomNumber, rr.ReservationId, IF (rr.NumAdults>rt.StandardOccupancy, ROUND(DATEDIFF(re.EndDate,re.StartDate)* (ro.BasePrice + (rt.ExtraAdultCost*(rr.NumAdults-rt.StandardOccupancy))),2), ROUND(DATEDIFF(re.EndDate,re.StartDate) * ro.BasePrice,2)) CostInUSD
FROM RoomType rt
INNER JOIN Room ro ON rt.RoomTypeId = ro.RoomTypeId
LEFT JOIN RoomReservation rr ON ro.RoomNum = rr.RoomNum
LEFT JOIN Reservation re ON rr.ReservationId = re.ReservationId
ORDER BY ro.RoomNum;

-- results:
--   RoomNumber	ReservationId	CostInUSD
-- 201	4	199.99
-- 202	7	349.98
-- 203	2	999.95
-- 203	20	399.98
-- 204	15	184.99
-- 205	14	699.96
-- 206	12	599.96
-- 206	22	449.97
-- 207	10	174.99
-- 208	12	599.96
-- 208	19	149.99
-- 301	9	799.96
-- 301	22	599.97
-- 302	6	924.95
-- 302	23	699.96
-- 303	17	199.99
-- 304	13	184.99
-- 305	3	349.98
-- 305	18	349.98
-- 306
-- 307	5	524.97
-- 308	1	299.98
-- 401	11	1199.97
-- 401	16	1259.97
-- 401	21	1199.97
-- 402

-- 5. Write a query that returns all the rooms accommodating at least three guests and that 
-- are reserved on any date in April 2023.

SELECT rr.RoomNum RoomNumber, rt.MaxOccupancy MaximumOccupancy, r.StartDate, r.EndDate
FROM RoomType rt
INNER JOIN Room ro ON rt.RoomTypeId = ro.RoomTypeId
INNER JOIN RoomReservation rr on ro.RoomNum = rr.RoomNum
INNER JOIN Reservation r ON rr.ReservationId = r.ReservationId
WHERE (rt.MaxOccupancy >=3) AND (r.StartDate <= '2023-04-30' AND r.EndDate >= '2023-04-01');

-- results:
--  RoomNumber	MaximumOccupancy	StartDate	EndDate
-- 301	4	2023-04-09	2023-04-13

-- below query/results for first interpretation (returns all rooms with >= 3 guests reserved under the reservation)
-- SELECT rr.RoomNum RoomNumber, SUM(rr.NumAdults+rr.NumChildren) NumberOfGuests, r.StartDate, r.EndDate
-- FROM RoomReservation rr
-- INNER JOIN Reservation r ON rr.ReservationId = r.ReservationId
-- GROUP BY rr.RoomNum, r.StartDate, r.EndDate
-- HAVING (NumberOfGuests >=3) AND (r.StartDate <= '2023-04-30' AND r.EndDate >= '2023-04-01');

-- results: (no results which fit this query criteria)
--   RoomNumber, NumberOfGuests, StartDate, EndDate

-- 6. Write a query that returns a list of all guest names and the number of reservations per
-- guest, sorted starting with the guest with the most reservations and then by the guest's 
-- last name.

SELECT g.`Name` GuestName, COUNT(r.ReservationId) NumberOfReservations
FROM Guest g
LEFT JOIN Reservation r ON g.GuestId = r.GuestId
GROUP BY GuestName
ORDER BY NumberOfReservations DESC, SUBSTRING_INDEX(GuestName,' ',-1);

-- result:
--   GuestName	NumberOfReservations
-- Bettyann Seery	3
-- Mack Simmer		3
-- Alana Crognale	2
-- Duane Cullison	2
-- Walter Holaway	2
-- Aurore Lipton	2
-- Maritza Tilton	2
-- Wilfred Vise		2
-- Karie Yang		2
-- Zachery Luechtefeld	1
-- Joleen Tison		1

-- 7. Write a query that displays the name, address, and phone number of a guest based on 
-- their phone number. (Choose a phone number from the existing data.)

SELECT `Name`GuestName, Address, Phone
FROM Guest
WHERE Phone = '(308) 494-0198';

-- results:
--   GuestName	Address	Phone
-- Duane Cullison	9662 Foxrun Lane	(308) 494-0198




