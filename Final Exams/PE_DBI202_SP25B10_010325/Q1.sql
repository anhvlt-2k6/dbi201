CREATE TABLE tblAirport (
    [Airportcode] NCHAR(10) PRIMARY KEY,
    [Name] NVARCHAR(20),
    [City] NVARCHAR(50),
    [State] NVARCHAR(50)
)

CREATE TABLE tblAirPlane (
    [AirplaneID] NCHAR(10) PRIMARY KEY,
    [AriplanceName] NVARCHAR(20),
    [TotalSeat] INT,
    [Company] NVARCHAR(50)
);

CREATE TABLE CanLand (
    [TimeLand] DATETIME,
    [Airportcode] NCHAR(10) NOT NULL,
    [AirplaneID] NCHAR(10) NOT NULL,
    CONSTRAINT pk_canland PRIMARY KEY (Airportcode, AirplaneID),
    CONSTRAINT fk_canland_tblAirport FOREIGN KEY (Airportcode) REFERENCES tblAirport(Airportcode),
    CONSTRAINT fk_canland_tblAirPlane FOREIGN KEY (AirplaneID) REFERENCES tblAirPlane(AirplaneID)
);