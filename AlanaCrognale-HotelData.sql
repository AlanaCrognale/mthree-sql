USE Hotel;

INSERT INTO Guest (`Name`, Address, City, State, Zip, Phone) VALUES
	('Alana Crognale','217 Boerum St.','Brooklyn','NY','11206','(775) 997-8724'),
	('Mack Simmer','379 Old Shore Street','Council Bluffs','IA','51501','(291) 553-0508'),
	('Bettyann Seery','750 Wintergreen Dr.','Wasilla','AK','99654','(478) 277-9632'),
	('Duane Cullison','9662 Foxrun Lane','Harlingen','TX','78552','(308) 494-0198'),
	('Karie Yang','9378 W. Augusta Ave.','West Deptford','NJ','08096','(214) 730-0298'),
	('Aurore Lipton','762 Wild Rose Street','Saginaw','MI','48601','(377) 507-0974'),
	('Zachery Luechtefeld','7 Poplar Dr.','Arvada','CO','80003','(814) 485-2615'),
	('Jeremiah Pendergrass','70 Oakwood St.','Zion','IL','60099','(279) 491-0960'),
	('Walter Holaway','7556 Arrowhead St.','Cumberland','RI','02864','(446) 396-6785'),
	('Wilfred Vise','77 West Surrey Street','Oswego','NY','13126','(834) 727-1001'),
	('Maritza Tilton','939 Linda Rd.','Burke','VA','22015','(446) 351-6860'),
	('Joleen Tison','87 Queen St.','Drexel Hill','PA','19026','(231) 893-2755');
    
-- SELECT * FROM Guest;
    
INSERT INTO Amenity (`Name`) VALUES
	('Microwave'),
    ('Refrigerator'),
    ('Oven'),
	('Jacuzzi');

-- SELECT * FROM Amenity;

INSERT INTO RoomType (`Name`, StandardOccupancy, MaxOccupancy, ExtraAdultCost) VALUES
	('Single', 2, 2, 0),
	('Double', 2, 4, 10),
	('Suite', 3, 8, 20);

-- SELECT * FROM RoomType;
    
INSERT INTO Reservation (NumAdults, NumChildren, StartDate, EndDate, TotalCost, GuestId) VALUES
	(1,0,'2023-02-02','2023-02-04',299.98,2),
	(2,1,'2023-02-05','2023-02-10',999.95,3),
	(2,0,'2023-02-22','2023-02-24',349.98,4),
	(2,2,'2023-03-06','2023-03-07',199.99,5),
	(1,1,'2023-03-17','2023-03-20',524.97,1),
	(3,0,'2023-03-18','2023-03-23',924.95,6),
	(2,2,'2023-03-29','2023-03-31',349.98,7),
	(2,0,'2023-03-31','2023-04-05',874.95,8),
	(1,0,'2023-04-09','2023-04-13',799.96,9),
	(1,1,'2023-04-23','2023-04-24',174.99,10),
	(2,4,'2023-05-30','2023-06-02',1199.97,11),
	(3,0,'2023-06-10','2023-06-14',1199.92,12),
	(3,0,'2023-06-17','2023-06-18',184.99,6),
	(2,0,'2023-06-28','2023-07-02',699.96,1),
	(3,1,'2023-07-13','2023-07-14',184.99,9),
	(4,2,'2023-07-18','2023-07-21',1259.97,10),
	(2,1,'2023-07-28','2023-07-29',199.99,3),
	(1,0,'2023-08-30','2023-09-01',349.98,3),
	(2,0,'2023-09-16','2023-09-17',149.99,2),
	(2,2,'2023-09-13','2023-09-15',399.98,5),
	(2,2,'2023-11-22','2023-11-25',1199.97,4),
	(4,2,'2023-11-22','2023-11-25',1049.94,2),
	(2,0,'2023-12-24','2023-12-28',699.96,11);
    
-- SELECT * FROM Reservation;
    
INSERT INTO Room (RoomNum, BasePrice, Ada, RoomTypeId) VALUES
	(201,199.99,0,2),
	(202,174.99,1,2),
	(203,199.99,0,2),
	(204,174.99,1,2),
	(205,174.99,0,1),
	(206,149.99,1,1),
	(207,174.99,0,1),
	(208,149.99,1,1),
	(301,199.99,0,2),
	(302,174.99,1,2),
	(303,199.99,0,2),
	(304,174.99,1,2),
	(305,174.99,0,1),
	(306,149.99,1,1),
	(307,174.99,0,1),
	(308,149.99,1,1),
	(401,399.99,0,3),
	(402,399.99,0,3);
    
-- SELECT * FROM Room;

INSERT INTO RoomAmenity (RoomNum, AmenityId) VALUES
	(201,1),
 	(201,4),   
 	(202,2),   
 	(203,1),
	(203,4),
	(204,2),
	(205,1),
	(205,2),
	(205,4),
	(206,1),
	(206,2),
	(207,1),
	(207,2),
	(207,4),
	(208,1),
	(208,2),
	(301,1),
	(301,4),
	(302,2),
	(303,1),
	(303,4),
	(304,2),
	(305,1),
	(305,2),
	(305,4),
	(306,1),
	(306,2),
	(307,1),
	(307,2),
	(307,4),
	(308,1),
	(308,2),
	(401,1),
	(401,2),
	(401,3),
	(402,1),
    (402,2),
	(402,3);

-- SELECT * FROM RoomAmenity;

INSERT INTO RoomReservation (RoomNum, ReservationId, NumAdults, NumChildren) VALUES
	(308,1,1,0),
	(203,2,2,1),
	(305,3,2,0),
	(201,4,2,2),
	(307,5,1,1),
	(302,6,3,0),
	(202,7,2,2),
	(304,8,2,0),
	(301,9,1,0),
	(207,10,1,1),
	(401,11,2,4),
	(206,12,2,0),
	(208,12,1,0),
	(304,13,3,0),
	(205,14,2,0),
	(204,15,3,1),
	(401,16,4,2),
	(303,17,2,1),
	(305,18,1,0),
	(208,19,2,0),
	(203,20,2,2),
	(401,21,2,2),
	(206,22,2,0),
	(301,22,2,2),
	(302,23,2,0);
    
-- SELECT * FROM RoomReservation;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM RoomReservation
	WHERE ReservationId = (SELECT ReservationId FROM Reservation WHERE GuestId = (SELECT GuestId FROM Guest WHERE `Name` = 'Jeremiah Pendergrass'));

DELETE FROM Reservation
	WHERE GuestId = (SELECT GuestId FROM Guest WHERE `Name` = 'Jeremiah Pendergrass');
    
DELETE FROM Guest
	WHERE `Name` = 'Jeremiah Pendergrass';
    
SET SQL_SAFE_UPDATES = 1;
    
-- SELECT * FROM Guest;
-- SELECT * FROM Amenity;
-- SELECT * FROM RoomType;
-- SELECT * FROM Reservation;
-- SELECT * FROM Room;
-- SELECT * FROM RoomAmenity;
-- SELECT * FROM RoomReservation;