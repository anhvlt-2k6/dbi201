CREATE TABLE Customers (
    [custID] INT PRIMARY KEY,
    [FirstName] NVARCHAR(30),
    [LastName] NVARCHAR(30),
    [FullName] AS (CONCAT(FirstName, LastName)) PERSISTED,
    [phone] NVARCHAR(100)
);

CREATE TABLE Accounts (
    [accNo] VARCHAR(25) PRIMARY KEY,
    [balance] MONEY,
    [openTime] DATETIME,
    [custID] INT UNIQUE,
    CONSTRAINT fk_accounts_customers FOREIGN KEY (custID) REFERENCES Customers(custID)
);

CREATE TABLE Cards (
    [CardNo] VARCHAR(20) PRIMARY KEY,
    [expiryDate] DATE,
    [credLimit] MONEY,
    [cardType] VARCHAR(30),
    [accNo] VARCHAR(25) NOT NULL,
    CONSTRAINT fk_cards_accounts FOREIGN KEY (accNo) REFERENCES Accounts(accNo)
);