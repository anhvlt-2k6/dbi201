USE [DBI202_Group2_FlightMgmt];
GO

INSERT INTO [Airports] (ApID, ApName, [Address], TimeOffset, MaxWTCategory)
    VALUES ('KSEA', 'Seattle Tacoma International Airport', 'Seattle, WA, US', -7, 'J'),
            ('KSFO', 'San Francisco Internation Airport', 'San Francisco, CA, US', -7, 'J'),
            ('KBOS', 'General Edward Lawrence Logan International Airport', 'Boston, MA, US', -4, 'J'),
            ('KJFK', 'John F Kennedy International Airport', 'New York, WA, US', -4, 'J'),
            ('CYUL', 'Montreal / Pierre Elliott Trudeau International Airport', 'Montreal, CA', -4, 'L'),
            ('KMIA', 'Miami International Airport', 'Miami, FL, US', -4, 'J'),
            ('EHAM', 'Amsterdam International Airport', 'Schiphol, NL', 0, 'J'),
            ('EGLL', 'London Heathrow Airport', 'London, UK', 0, 'J');

INSERT INTO [Airlines] (AirlineID, AirlineName, OperatingCountry, [Address], Email, PhoneNum)
    VALUES ('DAL', 'Delta Airlines', 'US', 'Atlanta, Georgia, United States', 'ticketreceipt@delta.com', '+1 800-221-1212'),
            ('UAL', 'United Airlines', 'US', 'Chicago, Illinois, United States', NULL, '+1 800-864-8331'),
            ('AAL', 'American Airlines', 'US', 'Fort Worth, Texas, United States', 'american.support@aa.com', '+1 800-433-7300'),
            ('ACA', 'Air Canada', 'CA', 'Montreal, Canada', NULL, '+1 514-393-3333');

INSERT INTO [AircraftTypes] (AcID, AcName, SeatCapacity, MaxDistance, WTCategory) 
    VALUES ('A333', 'Airbus A330-300', 375, 11750, 'H'),
            ('A359', 'Airbus A350-900 XWB', 350, 15750, 'H'),
            ('B77L', 'Boeing 777-200LR', 317, 15843, 'H'),
            ('A320', 'Airbus A320-200', 180, 4630, 'M'),
            ('B738', 'Boeing 737-800', 189, 6570, 'M');

INSERT INTO [Passengers] (FirstName, LastName, Email, PassportNum)
    VALUES ('Charles', 'Cartagena', 'CharlesDCartagena@rhyta.com', '435678564'),
            ('Portia', 'Lillis', 'PortiaALillis@armyspy.com', '23412434121'),
            ('Lisa', 'Davis', 'LisaMDavis@dayrep.com', '23456789'),
            ('Isabel', 'Tingle', 'IsabelATingle@armyspy.com', '4321431431434'),
            ('Mathilda', 'Burchfield', 'MathildaFBurchfield@jourrapide.com', '34343143431431');

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
    VALUES ();