CREATE TABLE [Category] (
    [CategoryID] CHAR(9) PRIMARY KEY,
    [Description] VARCHAR(50),
    [NumSeats] INT,
    [MadeinBy] VARCHAR(25)
);

CREATE TABLE [Car] (
    [CarID] CHAR(9) PRIMARY KEY,
    [Name] VARCHAR(150),
    [Model] VARCHAR(50),
    [DailyRate] INT,
    [FuelType] VARCHAR(15),
    [FuelConsum] FLOAT,
    [Available] BIT,
    [CategoryID] CHAR(9) NOT NULL,
    CONSTRAINT fk_car_category FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

CREATE TABLE [Customer] (
    [CustID] CHAR(9) PRIMARY KEY,
    [FirstName] VARCHAR(50),
    [LastName] VARCHAR(50),
    [CustPhone] VARCHAR(15),
    [IdentificationNum] VARCHAR(12),
    [CustAddr] VARCHAR(50)
);

CREATE TABLE [Rental] (
    [CarID] CHAR(9) NOT NULL,
    [CustID] CHAR(9) NOT NULL,
    [FuelCharge] FLOAT,
    [RentRate] INT,
    [StartDate] DATE,
    [EndDate] DATE,
    CONSTRAINT pk_rental PRIMARY KEY (CarID, CustID),
    CONSTRAINT fk_rental_customer FOREIGN KEY (CustID) REFERENCES Customer(CustID),
    CONSTRAINT fk_rental_car FOREIGN KEY (CarID) REFERENCES Car(CarID)
);