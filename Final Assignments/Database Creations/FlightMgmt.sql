USE [master];
GO

CREATE DATABASE [DBI202_Group2_FlightMgmt];
GO

USE [DBI202_Group2_FlightMgmt];
GO

CREATE TABLE [Airports] (
	[ApID] VARCHAR(4) PRIMARY KEY,
	[ApName] NVARCHAR(MAX) NOT NULL,
	[Address] NVARCHAR(MAX) NOT NULL,
	[TimeOffset] INT NOT NULL,
	MaxWTCategory VARCHAR(1) NOT NULL
);

CREATE TABLE [Routes] (
	[RouteID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	[ArrICAO] VARCHAR(4) NOT NULL,
	[DepartICAO] VARCHAR(4) NOT NULL,
	[Distance] FLOAT NOT NULL,
	CONSTRAINT fk_routes_airports_arr FOREIGN KEY (ArrICAO) REFERENCES Airports(ApID),
	CONSTRAINT fk_routes_airports_depart FOREIGN KEY (DepartICAO) REFERENCES Airports(ApID)
);

CREATE TABLE [Airlines] (
	[AirlineID] VARCHAR(3) PRIMARY KEY,
	[AirlineName] NVARCHAR(MAX) NOT NULL,
	[OperatingCountry] VARCHAR(2) NOT NULL,
	[Address] NVARCHAR(MAX) NOT NULL,
	[Email] NVARCHAR(255),
	[PhoneNum] NVARCHAR(20)
);

CREATE TABLE [FlightNums] (
	[FlightNum] VARCHAR(7) PRIMARY KEY,
	[RouteID] UNIQUEIDENTIFIER NOT NULL,
	[AirlineID] VARCHAR(3) NOT NULL,
	CONSTRAINT fk_flightnums_routes FOREIGN KEY (RouteID) REFERENCES Routes(RouteID),
	CONSTRAINT fk_flightnums_airlines FOREIGN KEY (AirlineID) REFERENCES Airlines(AirlineID)
);

CREATE TABLE [AircraftTypes] (
	[AcID] VARCHAR(4) PRIMARY KEY,
	[AcName] NVARCHAR(MAX) NOT NULL,
	[SeatCapacity] INT NOT NULL,
	[MaxDistance] FLOAT NOT NULL,
	[WTCategory] VARCHAR(1) NOT NULL
);

CREATE TABLE [FlightInstances] (
	[FlightID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	[Status] NVARCHAR(MAX),
	[ArrTime] DATETIME NOT NULL,
	[DepartTime] DATETIME NOT NULL,
	[AcID] VARCHAR(4) NOT NULL,
	[FlightNum] VARCHAR(7) NOT NULL,
	CONSTRAINT fk_flightinstances_flightnums FOREIGN KEY (FlightNum) REFERENCES FlightNums(FlightNum),
	CONSTRAINT fk_flightinstances_aircrafttypes FOREIGN KEY (AcID) REFERENCES AircraftTypes(AcID)
);

CREATE TABLE [Seats] (
	[SeatID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	[FlightID] UNIQUEIDENTIFIER NOT NULL,
	[Description] NVARCHAR(MAX),
	[Price] MONEY NOT NULL,
	[Seat] VARCHAR(5) NOT NULL,
	[isOccupied] BIT NOT NULL,
	CONSTRAINT fk_seats_flightinstances FOREIGN KEY (FlightID) REFERENCES FlightInstances(FlightID)
);

CREATE TABLE [Transactions] (
	[TransactionID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	[Amount] MONEY NOT NULL,
	[PaymentMethod] NVARCHAR(MAX) NOT NULL,
	[PaymentTime] DATETIME NOT NULL,
	[isSuccess] BIT NOT NULL
);

CREATE TABLE [Passengers] (
	[PassengerID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	[FirstName] NVARCHAR(MAX) NOT NULL,
	[LastName] NVARCHAR(MAX) NOT NULL,
	[Email] NVARCHAR(255),
	[PassportNum] NVARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE [Booking] (
	[BookingID] UNIQUEIDENTIFIER PRIMARY KEY DEFAULT NEWSEQUENTIALID(),
	[SeatID] UNIQUEIDENTIFIER NOT NULL,
	[TransactionID] UNIQUEIDENTIFIER NOT NULL,
	[PassengerID] UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT fk_booking_seat FOREIGN KEY (SeatID) REFERENCES Seats(SeatID),
	CONSTRAINT fk_booking_passenger FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
	CONSTRAINT fk_booking_transactions FOREIGN KEY (TransactionID) REFERENCES Transactions(TransactionID)
);

INSERT INTO [Airports] (ApID, ApName, [Address], TimeOffset, MaxWTCategory)
    VALUES  ('KSEA', 'Seattle Tacoma International Airport', 'Seattle, WA, US', -7, 'J'),
            ('KSFO', 'San Francisco Internation Airport', 'San Francisco, CA, US', -7, 'J'),
            ('KBOS', 'General Edward Lawrence Logan International Airport', 'Boston, MA, US', -4, 'J'),
            ('KJFK', 'John F Kennedy International Airport', 'New York, WA, US', -4, 'J'),
            ('CYUL', 'Montreal / Pierre Elliott Trudeau International Airport', 'Montreal, CA', -4, 'L'),
            ('KMIA', 'Miami International Airport', 'Miami, FL, US', -4, 'J'),
            ('EHAM', 'Amsterdam International Airport', 'Schiphol, NL', 0, 'J'),
            ('EGLL', 'London Heathrow Airport', 'London, UK', 0, 'J');

INSERT INTO [Airlines] (AirlineID, AirlineName, OperatingCountry, [Address], Email, PhoneNum)
    VALUES  ('DAL', 'Delta Airlines', 'US', 'Atlanta, Georgia, United States', 'ticketreceipt@delta.com', '+1 800-221-1212'),
            ('UAL', 'United Airlines', 'US', 'Chicago, Illinois, United States', NULL, '+1 800-864-8331'),
            ('AAL', 'American Airlines', 'US', 'Fort Worth, Texas, United States', 'american.support@aa.com', '+1 800-433-7300'),
            ('ACA', 'Air Canada', 'CA', 'Montreal, Canada', NULL, '+1 514-393-3333'),
            ('KLM', 'KLM Royal Dutch Airlines', 'NL', 'Amsterdam, Netherlands', NULL, NULL);

INSERT INTO [AircraftTypes] (AcID, AcName, SeatCapacity, MaxDistance, WTCategory) 
    VALUES  ('A333', 'Airbus A330-300', 375, 11750, 'H'),
            ('A359', 'Airbus A350-900 XWB', 350, 15750, 'H'),
            ('B77L', 'Boeing 777-200LR', 317, 15843, 'H'),
            ('A320', 'Airbus A320-200', 180, 4630, 'M'),
            ('B738', 'Boeing 737-800', 189, 6570, 'M');

INSERT INTO [Passengers] (PassengerID, FirstName, LastName, Email, PassportNum)
    VALUES  ('28d71fa5-3364-44df-ab76-0c89681370ff', 'Charles', 'Cartagena', 'CharlesDCartagena@rhyta.com', '435678564'),
            ('a9e7da79-4a3b-4b34-a672-9783105ba000', 'Portia', 'Lillis', 'PortiaALillis@armyspy.com', '23412434121'),
            ('2719db4c-174e-482b-b456-4c03257bc300', 'Lisa', 'Davis', 'LisaMDavis@dayrep.com', '23456789'),
            ('c0407078-8953-46c3-8b7d-33fa5c3eb242', 'Isabel', 'Tingle', 'IsabelATingle@armyspy.com', '4321431431434'),
            ('2126e4eb-3402-470c-bd57-a4786c15b17e', 'Mathilda', 'Burchfield', 'MathildaFBurchfield@jourrapide.com', '34343143431431');

INSERT INTO [Routes] (RouteID, ArrICAO, DepartICAO, Distance)
    VALUES  ('9ca071f9-2e8d-4b30-8f16-e23eadd6d71e', 'KBOS', 'KSFO', 2415.0),
            ('16ac3f2a-7b7b-47a4-a726-cc788fa70dc4', 'KBOS', 'KMIA', 1239.0),
            ('f7a77c89-ac7f-48f2-b764-5e7285c28869', 'KMIA', 'EGLL', 3970.0),
            ('5b15c229-21b1-4a4e-993d-5350d3d98252', 'CYUL', 'KJFK', 346.0),
            ('51728c78-a8fe-4bb9-9451-d00e8012936d', 'EHAM', 'KBOS', 3009.0),
            ('6ec6b44d-323b-411e-a72e-3025a5631360', 'EHAM', 'EGLL', 224.0),
            ('8b67918a-513f-452d-bca8-f731590194dc', 'KSEA', 'KSFO', 603.0),
            ('689b6b4c-a89c-4008-bc0e-129369ea64f9', 'EGLL', 'KBOS', 2975.0);

INSERT INTO [FlightNums] (FlightNum, RouteID, AirlineID)
    VALUES  ('ACA125', '9ca071f9-2e8d-4b30-8f16-e23eadd6d71e', 'ACA'),
            ('DAL3301', '16ac3f2a-7b7b-47a4-a726-cc788fa70dc4', 'DAL'),
            ('UAL335', 'f7a77c89-ac7f-48f2-b764-5e7285c28869', 'UAL'),
            ('UAL772', '5b15c229-21b1-4a4e-993d-5350d3d98252', 'UAL'), 
            ('UAL787', '51728c78-a8fe-4bb9-9451-d00e8012936d', 'UAL'),
            ('AAL123', '6ec6b44d-323b-411e-a72e-3025a5631360', 'AAL'),
            ('DAL2213', '8b67918a-513f-452d-bca8-f731590194dc', 'DAL'),
            ('DAL3329', '689b6b4c-a89c-4008-bc0e-129369ea64f9', 'DAL');

INSERT INTO [FlightInstances] (FlightID, [Status], DepartTime, ArrTime, AcID, FlightNum)
    VALUES ('970be60c-3704-491c-b2d4-2466e84e4e5d', 'In scheduled', GETDATE(), DATEADD(day, 1, GETDATE()), 'A333', 'ACA125'),
           ('5dc7cd4b-9ef5-4019-9df7-0b87fe2ceb83', 'In scheduled', GETDATE(), DATEADD(day, 1, GETDATE()), 'A359', 'UAL335'),
           ('67f8ae75-dc12-4848-a755-9748759d0f22', 'In scheduled', GETDATE(), DATEADD(day, 1, GETDATE()), 'B77L', 'DAL3301'),
           ('bf28e263-063b-4689-86ed-073e0842a62d', 'In scheduled', GETDATE(), DATEADD(day, 1, GETDATE()), 'B77L', 'UAL787'),
           ('b0e415c3-75ad-46d8-8bea-874c311e5211', 'In scheduled', GETDATE(), DATEADD(day, 1, GETDATE()), 'A359', 'UAL787');

INSERT INTO [Seats] (SeatID, FlightID, Description, Price, Seat, isOccupied)
    VALUES  ('dcb5b909-fc7f-4c05-86c0-8a1888fc4d82', '970be60c-3704-491c-b2d4-2466e84e4e5d', '', 20, 'A13', 1),
            ('d9382b0d-5d35-4bd6-a803-4c4eb3e39b0b', '970be60c-3704-491c-b2d4-2466e84e4e5d', '', 20, 'A14', 1),
            ('3b8d4c03-ec92-403a-a234-6fabd2136f94', '5dc7cd4b-9ef5-4019-9df7-0b87fe2ceb83', 'Premium Seat', 50, 'P1', 0),
            ('22b89f6c-8d4e-43ba-a1eb-056b77623179', '67f8ae75-dc12-4848-a755-9748759d0f22', 'Premium Seat', 40, 'P2', 1),
            ('ce6e77a0-4f42-41e4-a0da-baae8476ea64', '67f8ae75-dc12-4848-a755-9748759d0f22', 'Eco Seat', 15, 'E1', 0),
            ('6f1516d1-c70c-4edb-b574-0eaf35ee8600', 'bf28e263-063b-4689-86ed-073e0842a62d', 'Premium Seat', 50, 'P3', 0);

INSERT INTO [Transactions] (TransactionID, Amount, PaymentMethod, PaymentTime, isSuccess)
    VALUES  ('9964422e-011c-4ab6-b389-ce2d41e552ef', 20, 'Debit/Credit Card', GETDATE(), 1),
            ('a2c92b1a-d1b3-43a4-8c28-8b5ff25e974f', 20, 'Debit/Credit Card', GETDATE(), 1),
            ('7288f438-83e8-4522-a30e-4ada45827e1d', 40, 'Debit/Credit Card', GETDATE(), 1),
            ('94bd690a-b955-44d4-bf51-ef5fcb396bb2', 2, 'Debit/Credit Card', GETDATE(), 0),
            ('b43b4ce4-c6dd-4320-ac76-ca17c746cb53', 7, 'Debit/Credit Card', GETDATE(), 0);

INSERT INTO [Booking] (BookingID, SeatID, TransactionID, PassengerID)
    VALUES  ('66ca88ce-1a7b-4b13-83ce-f894685e84fa', 'dcb5b909-fc7f-4c05-86c0-8a1888fc4d82', '9964422e-011c-4ab6-b389-ce2d41e552ef', '28d71fa5-3364-44df-ab76-0c89681370ff'),
            ('c8ae9605-541d-4016-b233-1714bd85d6ee', 'd9382b0d-5d35-4bd6-a803-4c4eb3e39b0b', 'a2c92b1a-d1b3-43a4-8c28-8b5ff25e974f', 'a9e7da79-4a3b-4b34-a672-9783105ba000'),
            ('9b931a8b-560d-4eff-9920-4f981796a30b', '22b89f6c-8d4e-43ba-a1eb-056b77623179', '7288f438-83e8-4522-a30e-4ada45827e1d', '2719db4c-174e-482b-b456-4c03257bc300');

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [AvailSeatPerAirlines] AS
    SELECT Airlines.AirlineName, FlightNums.FlightNum, FlightInstances.DepartTime, FlightInstances.ArrTime, Seats.Seat, Seats.Price, Routes.ArrICAO, Routes.DepartICAO
    FROM  Seats INNER JOIN
            FlightInstances ON Seats.FlightID = FlightInstances.FlightID INNER JOIN
            FlightNums ON FlightInstances.FlightNum = FlightNums.FlightNum INNER JOIN
            Airlines ON FlightNums.AirlineID = Airlines.AirlineID INNER JOIN
            Routes ON FlightNums.RouteID = Routes.RouteID
    WHERE (Seats.isOccupied = 0)
GO

CREATE VIEW [AirlinesPerDestination] AS
    SELECT FlightNums.FlightNum, Airlines.AirlineName, Routes.DepartICAO, Routes.ArrICAO, Routes.Distance
    FROM Airlines INNER JOIN
            FlightNums ON Airlines.AirlineID = FlightNums.AirlineID INNER JOIN
            Routes ON FlightNums.RouteID = Routes.RouteID
GO

CREATE VIEW [PassWithASeat] AS
    SELECT Passengers.FirstName, Passengers.LastName, Seats.Seat, FlightInstances.AcID, FlightInstances.FlightNum, FlightInstances.DepartTime, FlightInstances.ArrTime, Airlines.AirlineName, Routes.DepartICAO, Routes.ArrICAO
    FROM Passengers INNER JOIN
            Booking ON Passengers.PassengerID = Booking.PassengerID INNER JOIN
            Seats ON Booking.SeatID = Seats.SeatID INNER JOIN
            FlightInstances ON Seats.FlightID = FlightInstances.FlightID INNER JOIN
            FlightNums ON FlightInstances.FlightNum = FlightNums.FlightNum INNER JOIN
            Routes ON FlightNums.RouteID = Routes.RouteID INNER JOIN
            Airlines ON FlightNums.AirlineID = Airlines.AirlineID
GO

CREATE PROCEDURE NewPassenger
        @FirstName NVARCHAR(MAX),
        @LastName NVARCHAR(MAX),
        @Email NVARCHAR(255),
        @PassportNum NVARCHAR(255)
    AS
    BEGIN
        INSERT INTO [Passengers] (PassengerID, FirstName, LastName, Email, PassportNum)
            VALUES (NEWID(), @FirstName, @LastName, @Email, @PassportNum)
    END;
GO

CREATE PROCEDURE BookNewFlight
        @Firstname NVARCHAR(MAX),
        @LastName NVARCHAR(MAX),
        @Email NVARCHAR(255),
        @PassportNum NVARCHAR(255),
        @FlightNum VARCHAR(7),
        @Seat VARCHAR(5),
        @Price MONEY
    AS
    BEGIN

    END;
GO

CREATE TRIGGER trg_prevent_update_on_transactions ON [Transactions]
        AFTER UPDATE
    AS
        BEGIN
            PRINT 'Updating existing data is not allowed on Transactions table.';
            ROLLBACK TRANSACTION;
        END;
GO



CREATE TRIGGER trg_prevent_update_on_booking ON [Booking]
        AFTER UPDATE
    AS
        BEGIN
            PRINT 'Updating existing data is not allowed on Booking table';
            ROLLBACK TRANSACTION;
        END;
GO
