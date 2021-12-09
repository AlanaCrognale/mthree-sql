DROP DATABASE IF EXISTS Hotel;

CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE IF NOT EXISTS Guest(
	GuestID INT PRIMARY KEY AUTO_INCREMENT,
	`Name` VARCHAR(30) NOT NULL, 
    Address VARCHAR(30),
    City VARCHAR(30),
    State CHAR(2),
    Zip CHAR(5),
    Phone CHAR(14)
);

CREATE TABLE IF NOT EXISTS Amenity(
	AmenityID INT PRIMARY KEY AUTO_INCREMENT,
	`Name` VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS RoomType(
	RoomTypeID INT PRIMARY KEY AUTO_INCREMENT,
    `Name` VARCHAR(6) NOT NULL,
    StandardOccupancy INT NOT NULL,
    MaxOccupancy INT NOT NULL,
    ExtraAdultCost FLOAT NOT NULL
);

CREATE TABLE IF NOT EXISTS Reservation(
	ReservationId INT PRIMARY KEY AUTO_INCREMENT,
    NumAdults INT NOT NULL,
    NumChildren INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalCost FLOAT NOT NULL,
    GuestId INT NOT NULL,
    CONSTRAINT fk_Reservation_Guest FOREIGN KEY(GuestId)
		REFERENCES Guest(GuestId)
);

CREATE TABLE IF NOT EXISTS Room(
	RoomNum INT PRIMARY KEY,
	BasePrice FLOAT NOT NULL,
    Ada TINYINT NOT NULL,
    RoomTypeId INT NOT NULL,
    CONSTRAINT fk_Room_RoomType FOREIGN KEY(RoomTypeId)
		REFERENCES RoomType(RoomTypeId)
);

CREATE TABLE IF NOT EXISTS RoomAmenity(
	RoomNum INT NOT NULL,
	AmenityId INT NOT NULL,
    PRIMARY KEY (RoomNum, AmenityId),
    CONSTRAINT fk_RoomAmenity_Room FOREIGN KEY (RoomNum)
		REFERENCES Room(RoomNum),
	CONSTRAINT fk_RoomAmenity_Amenity FOREIGN KEY (AmenityId)
		REFERENCES Amenity (AmenityId)
);

CREATE TABLE IF NOT EXISTS RoomReservation(
	RoomNum INT NOT NULL,
	ReservationId INT NOT NULL,
    NumAdults INT NOT NULL,
    NumChildren INT NOT NULL,
    PRIMARY KEY (RoomNum, ReservationId),
    CONSTRAINT fk_RoomReservation_Room FOREIGN KEY (RoomNum)
		REFERENCES Room(RoomNum),
	CONSTRAINT fk_RoomReservation_Reservation FOREIGN KEY(ReservationId)
		REFERENCES Reservation(ReservationId)
);
