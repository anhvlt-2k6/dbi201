CREATE TABLE [Cusomters] (
    [CustID] INT PRIMARY KEY,
    [City] VARCHAR(100),
    [Cname] VARCHAR(100)
);

CREATE TABLE [Items] (
    [ItemID] INT PRIMARY KEY,
    [Unit_Price] DECIMAL(10),
    [Qty] INT
);

CREATE TABLE [Orders] (
    [OrderID] INT PRIMARY KEY,
    [Odate] DATE,
    [CustID] INT NOT NULL,
    CONSTRAINT fk_orders_customers FOREIGN KEY (CustID) REFERENCES Cusomters(CustID)
);

CREATE TABLE [Order_Item] (
    [Qty] INT,
    [OrderID] INT NOT NULL,
    [ItemID] INT NOT NULL, 
    CONSTRAINT pk_order  PRIMARY KEY (OrderID, ItemID),
    CONSTRAINT fk_order_item_orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    CONSTRAINT fk_order_item_items FOREIGN KEY (ItemID) REFERENCES Items(ItemID)
);
