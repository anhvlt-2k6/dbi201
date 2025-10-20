CREATE TABLE [CATEGORY] (
    [Category_ID]    INT PRIMARY KEY,
    [Category_Name]  NVARCHAR (20),
    [Number_Of_Seat] INT
);

CREATE TABLE [ROOM] (
    [Room_ID] INT PRIMARY KEY,
    [Status] bit,
    [Category_ID] INT NOT NULL,
    CONSTRAINT fk_room_category FOREIGN KEY (Category_ID) REFERENCES CATEGORY(Category_ID)
);

CREATE TABLE [CUSTOMER] (
    [Customer_ID]   INT  PRIMARY KEY,
    [Phone]         NVARCHAR (10) NULL,
    [Customer_Name] NVARCHAR (20) NULL
);

CREATE TABLE [Use] (
    [StartTime] DATETIME,
    [EndTime] DATETIME,
    [Note] NVARCHAR(50),
    [Customer_ID]   INT  NOT NULL,
    [Room_ID] INT NOT NULL,
	CONSTRAINT pk_use PRIMARY KEY (Customer_ID, Room_ID, StartTime),
    CONSTRAINT fk_use_customer FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID),
    CONSTRAINT fk_use_room FOREIGN KEY (Room_ID) REFERENCES ROOM(Room_ID)
);
