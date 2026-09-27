-- CAKE SHOP DATABASE
-- Data Management 1 - Coursework

CREATE DATABASE CUTE_CUPCAKES;
USE CUTE_CUPCAKES;
GO

-- TABLE 1: Customers
CREATE TABLE Customers(
  CustomerID      VARCHAR(5)   PRIMARY KEY,
  FirstName       VARCHAR(50)   NOT NULL,
  LastName        VARCHAR(50)   NOT NULL,
  PhoneNumber     VARCHAR(15)    NOT NULL,
  Email           VARCHAR(50)   NOT NULL,
  Address         VARCHAR(150)    NOT NULL,

  CONSTRAINT UQ_Customers_Email
        UNIQUE (Email)
);
GO

    -- TABLE 2: Employees

CREATE TABLE Employees
(
    EmployeeID      VARCHAR(10)    PRIMARY KEY,
    FirstName       VARCHAR(50)      NOT NULL,
    LastName        VARCHAR(50)     NOT NULL,
    PhoneNumber     VARCHAR(15)      NOT NULL,
    JobRole         VARCHAR(50)     NOT NULL,
    Salary          DECIMAL(10,2)     NOT NULL,


    CONSTRAINT CK_Employees_Salary
        CHECK (Salary > 0)
);
GO

--Table 6:Categories
CREATE TABLE Categories
(
    CategoryID      VARCHAR(10)     PRIMARY KEY,
    CategoryName    VARCHAR(50)     NOT NULL,
    Description     VARCHAR(200)     NOT NULL,

    CONSTRAINT UQ_Categories_Name
        UNIQUE (CategoryName)
);
GO

-- TABLE 3: Cakes

CREATE TABLE Cakes
(
    CakeID          VARCHAR(10)     PRIMARY KEY,
    CakeName        VARCHAR(100)    NOT NULL,
    Flavor          VARCHAR(100)    NOT NULL,
    Sizes            VARCHAR(20)     NOT NULL,
    Price           DECIMAL(10,2)   NOT NULL,
    StockQuantity   INT             NOT NULL,
    CategoryID      VARCHAR(10)     NOT NULL,

    CONSTRAINT FK_Cakes_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID),

    CONSTRAINT CK_Cakes_Price
        CHECK (Price > 0),

    CONSTRAINT CK_Cakes_Stock
        CHECK (StockQuantity >= 0)
);
GO

--Table 4: Orders
CREATE TABLE Orders
(
    OrderID         VARCHAR(5)      PRIMARY KEY,
    OrderDate       DATE            NOT NULL,
    TotalAmount     DECIMAL(10,2)    NOT NULL,
    OrderStatus     VARCHAR(30)     NOT NULL,
    CustomerID      VARCHAR(5)     NOT NULL,
    EmployeeID      VARCHAR(10)     NOT NULL,


    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
         REFERENCES Customers(CustomerID),

    CONSTRAINT FK_Orders_Employees
        FOREIGN KEY (EmployeeID)
         REFERENCES Employees(EmployeeID),

    CONSTRAINT CK_Orders_TotalAmount
        CHECK (TotalAmount >= 0),

    CONSTRAINT CK_Orders_Status
        CHECK (OrderStatus IN
        ('Pending', 'Processing', 'Completed', 'Cancelled'))
);
GO

--Table 5: OrderItems
CREATE TABLE OrderItems
(
    OrderItemID     INT           PRIMARY KEY,
    OrderID         VARCHAR(5)        NOT NULL,
    CakeID          VARCHAR(10)      NOT NULL,
    Quantity        INT             NOT NULL,
    UnitPrice       DECIMAL(10,2)    NOT NULL,
    SubTotal        DECIMAL(10,2)    NOT NULL,

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CONSTRAINT FK_OrderItems_Cakes
        FOREIGN KEY (CakeID)
        REFERENCES Cakes(CakeID),

    CONSTRAINT CK_OrderItems_Quantity
        CHECK (Quantity > 0),

    CONSTRAINT CK_OrderItems_UnitPrice
        CHECK (UnitPrice > 0),

    CONSTRAINT CK_OrderItems_SubTotal
        CHECK (SubTotal > 0)
);
GO


--Table 7:Payments
CREATE TABLE Payments
(
    PaymentID       VARCHAR(10)     PRIMARY KEY,
    OrderID         VARCHAR(5)     NOT NULL,
    PaymentDate     DATETIME        NOT NULL,
    PaymentMethod   VARCHAR(30)     NOT NULL,
    Amount          DECIMAL(10,2)     NOT NULL,
    PaymentStatus   VARCHAR(30)     NOT NULL,

    CONSTRAINT FK_Payments_Orders
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CONSTRAINT UQ_Payments_Order
        UNIQUE (OrderID),

    CONSTRAINT CK_Payments_Amount
        CHECK (Amount > 0),

    CONSTRAINT CK_Payments_Method
        CHECK (PaymentMethod IN
        ('Cash', 'Card', 'Online')),

    CONSTRAINT CK_Payments_Status
        CHECK (PaymentStatus IN
        ('Pending', 'Completed', 'Failed', 'Refunded'))
);
GO

--Table 8: Deliveries
CREATE TABLE Deliveries
(
    DeliveryID       VARCHAR(10)     PRIMARY KEY,
    OrderID          VARCHAR(5)       NOT NULL,
    DeliveryAddress  VARCHAR(150)     NOT NULL,
    DeliveryDate     DATE            NOT NULL,
    DeliveryStatus   VARCHAR(30)     NOT NULL,
    DeliveryFee      DECIMAL(10,2)    NOT NULL,

    CONSTRAINT FK_Deliveries_Orders
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CONSTRAINT UQ_Deliveries_Order
        UNIQUE (OrderID),

    CONSTRAINT CK_Deliveries_Fee
        CHECK (DeliveryFee >= 0),

    CONSTRAINT CK_Deliveries_Status
        CHECK (DeliveryStatus IN
        ('Pending', 'Out for Delivery', 'Delivered', 'Cancelled'))
);
GO

-- Display all tables in the database

SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- INSERT DATA INTO CAKE SHOP DATABASE

USE CUTE_CUPCAKES;
GO

-- 1. INSERT CUSTOMERS

INSERT INTO Customers
    (CustomerID, FirstName, LastName, PhoneNumber, Email, Address)
VALUES
    ('C001', 'Amal', 'Perera', '0712345678', 'amal@gmail.com', 'Colombo'),
    ('C002', 'Nimali', 'Fernando', '0723456789', 'nimali@gmail.com', 'Kandy'),
    ('C003', 'Kasun', 'Silva', '0774567890', 'kasun@gmail.com', 'Galle'),
    ('C004', 'Tharushi', 'Perera', '0755678901', 'tharushi@gmail.com', 'Negombo'),
    ('C005', 'Dinesh', 'Kumar', '0766789012', 'dinesh@gmail.com', 'Jaffna'),
    ('C006', 'Sithmi', 'Jayasinghe', '0787890123', 'sithmi@gmail.com', 'Kurunegala'),
    ('C007', 'Ravindu', 'De Silva', '0708901234', 'ravindu@gmail.com', 'Matara'),
    ('C008', 'Shalini', 'Fernando', '0749012345', 'shalini@gmail.com', 'Nugegoda'),
    ('C009', 'Isuru', 'Bandara', '0771122334', 'isuru@gmail.com', 'Rajagiriya'),
    ('C010', 'Madhavi', 'Gunasekara', '0712233445', 'madhavi@gmail.com', 'Dehiwala');
GO
-- 2. INSERT EMPLOYEES

INSERT INTO Employees
    (EmployeeID, FirstName, LastName, PhoneNumber, JobRole, Salary)
VALUES
    ('E001', 'Nuwan', 'Perera', '0711111111', 'Manager', 85000.00),
    ('E002', 'Dilani', 'Silva', '0722222222', 'Cashier', 55000.00),
    ('E003', 'Chamara', 'Fernando', '0733333333', 'Baker', 65000.00),
    ('E004', 'Ishara', 'Perera', '0744444444', 'Baker', 62000.00),
    ('E005', 'Ruwan', 'Kumar', '0755555555', 'Cashier', 54000.00),
    ('E006', 'Sachini', 'De Silva', '0766666666', 'Sales Assistant', 50000.00),
    ('E007', 'Hasitha', 'Bandara', '0777777777', 'Delivery Staff', 48000.00),
    ('E008', 'Piumi', 'Jayasinghe', '0788888888', 'Sales Assistant', 51000.00),
    ('E009', 'Thilina', 'Gunasekara', '0799999999', 'Baker', 63000.00),
    ('E010', 'Menaka', 'Fernando', '0701010101', 'Delivery Staff', 47000.00);
GO


-- 3. INSERT CATEGORIES

INSERT INTO Categories
    (CategoryID, CategoryName, Description)
VALUES
    ('CAT001', 'Birthday Cakes', 'Cakes suitable for birthday celebrations'),
    ('CAT002', 'Wedding Cakes', 'Cakes designed for weddings and receptions'),
    ('CAT003', 'Chocolate Cakes', 'Chocolate based cakes'),
    ('CAT004', 'Fruit Cakes', 'Cakes containing fresh or dried fruits'),
    ('CAT005', 'Cheesecakes', 'Cream cheese based cakes'),
    ('CAT006', 'Cupcakes', 'Small individual sized cakes'),
    ('CAT007', 'Red Velvet', 'Red velvet flavoured cakes'),
    ('CAT008', 'Custom Cakes', 'Custom designed cakes'),
    ('CAT009', 'Anniversary Cakes', 'Cakes for anniversary celebrations'),
    ('CAT010', 'Seasonal Cakes', 'Special seasonal cake selections');
GO


-- 4. INSERT CAKES

INSERT INTO Cakes
    (CakeID, CakeName, Flavor, Sizes, Price, StockQuantity, CategoryID)
VALUES
    ('CK001', 'Chocolate Dream', 'Chocolate', '1 kg', 4500.00, 15, 'CAT003'),
    ('CK002', 'Vanilla Delight', 'Vanilla', '1 kg', 4000.00, 12, 'CAT001'),
    ('CK003', 'Strawberry Bliss', 'Strawberry', '1.5 kg', 5500.00, 10, 'CAT004'),
    ('CK004', 'Red Velvet Classic', 'Red Velvet', '1 kg', 5000.00, 8, 'CAT007'),
    ('CK005', 'Blueberry Cheesecake', 'Blueberry', '1 kg', 6000.00, 7, 'CAT005'),
    ('CK006', 'Black Forest', 'Chocolate Cherry', '1.5 kg', 6500.00, 9, 'CAT003'),
    ('CK007', 'Wedding Elegance', 'Vanilla', '3 kg', 15000.00, 4, 'CAT002'),
    ('CK008', 'Fruit Fantasy', 'Mixed Fruit', '1 kg', 4800.00, 11, 'CAT004'),
    ('CK009', 'Birthday Fun', 'Butterscotch', '1 kg', 4200.00, 13, 'CAT001'),
    ('CK010', 'Custom Rose Cake', 'Vanilla Rose', '2 kg', 8500.00, 5, 'CAT008');
GO


-- 5. INSERT ORDERS

INSERT INTO Orders
    (OrderID, OrderDate, TotalAmount, OrderStatus, CustomerID, EmployeeID)
VALUES
    (1001, '2026-09-01', 13500.00, 'Completed', 'C001', 'E001'),
    (1002, '2026-09-02', 4000.00, 'Completed', 'C002', 'E002'),
    (1003, '2026-09-03', 11000.00, 'Processing', 'C003', 'E003'),
    (1004, '2026-09-04', 5000.00, 'Completed', 'C004', 'E004'),
    (1005, '2026-09-05', 6000.00, 'Pending', 'C005', 'E005'),
    (1006, '2026-09-06', 6500.00, 'Completed', 'C006', 'E006'),
    (1007, '2026-09-07', 15000.00, 'Processing', 'C007', 'E007'),
    (1008, '2026-09-08', 4800.00, 'Completed', 'C008', 'E008'),
    (1009, '2026-09-09', 8400.00, 'Pending', 'C009', 'E009'),
    (1010, '2026-09-10', 8500.00, 'Completed', 'C010', 'E010');
GO


-- 6. INSERT ORDER ITEMS

INSERT INTO OrderItems
    (OrderItemID, OrderID, CakeID, Quantity, UnitPrice, SubTotal)
VALUES
    (1, 1001, 'CK001', 1, 4500.00, 4500.00),

    (2, 1001, 'CK007', 1, 15000.00, 15000.00),

    (3, 1002, 'CK002', 1, 4000.00, 4000.00),

    (4, 1003, 'CK003', 2, 5500.00, 11000.00),

    (5, 1004, 'CK004', 1, 5000.00, 5000.00),

    (6, 1005, 'CK005', 1, 6000.00, 6000.00),

    (7, 1006, 'CK006', 1, 6500.00, 6500.00),

    (8, 1007, 'CK007', 1, 15000.00, 15000.00),

    (9, 1008, 'CK008', 1, 4800.00, 4800.00),

    (10, 1009, 'CK009', 2, 4200.00, 8400.00),

    (11, 1010, 'CK010', 1, 8500.00, 8500.00),

    (12, 1003, 'CK001', 1, 4500.00, 4500.00),

    (13, 1004, 'CK002', 1, 4000.00, 4000.00),

    (14, 1005, 'CK009', 1, 4200.00, 4200.00),

    (15, 1006, 'CK002', 1, 4000.00, 4000.00),

    (16, 1008, 'CK002', 1, 4000.00, 4000.00);
GO

-- 7. INSERT PAYMENTS

INSERT INTO Payments
    (PaymentID, OrderID, PaymentDate, PaymentMethod, Amount, PaymentStatus)
VALUES
    ('PM001', 1001, '2026-09-01 10:00:00', 'Card', 13500.00, 'Completed'),
    ('PM002', 1002, '2026-09-02 11:30:00', 'Cash', 4000.00, 'Completed'),
    ('PM003', 1003, '2026-09-03 09:45:00', 'Online', 11000.00, 'Completed'),
    ('PM004', 1004, '2026-09-04 14:20:00', 'Card', 5000.00, 'Completed'),
    ('PM005', 1005, '2026-09-05 15:10:00', 'Cash', 6000.00, 'Pending'),
    ('PM006', 1006, '2026-09-06 12:00:00', 'Online', 6500.00, 'Completed'),
    ('PM007', 1007, '2026-09-07 13:30:00', 'Card', 15000.00, 'Completed'),
    ('PM008', 1008, '2026-09-08 16:15:00', 'Cash', 4800.00, 'Completed'),
    ('PM009', 1009, '2026-09-09 10:45:00', 'Online', 8400.00, 'Pending'),
    ('PM010', 1010, '2026-09-10 17:00:00', 'Card', 8500.00, 'Completed');
GO


-- 8. INSERT DELIVERIES

INSERT INTO Deliveries
    (DeliveryID, OrderID, DeliveryAddress, DeliveryDate, DeliveryStatus, DeliveryFee)
VALUES
    ('D001', 1001, 'Colombo 03', '2026-09-02', 'Delivered', 500.00),
    ('D002', 1002, 'Kandy', '2026-09-03', 'Delivered', 800.00),
    ('D003', 1003, 'Galle', '2026-09-04', 'Out for Delivery', 700.00),
    ('D004', 1004, 'Negombo', '2026-09-05', 'Delivered', 600.00),
    ('D005', 1005, 'Jaffna', '2026-09-07', 'Pending', 1200.00),
    ('D006', 1006, 'Kurunegala', '2026-09-07', 'Delivered', 900.00),
    ('D007', 1007, 'Matara', '2026-09-08', 'Out for Delivery', 1000.00),
    ('D008', 1008, 'Nugegoda', '2026-09-09', 'Delivered', 400.00),
    ('D009', 1009, 'Rajagiriya', '2026-09-10', 'Pending', 450.00),
    ('D010', 1010, 'Dehiwala', '2026-09-11', 'Delivered', 500.00);
GO

--Check whether all records were created
USE CUTE_CUPCAKES;
GO

SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Categories;
SELECT * FROM Cakes;
SELECT * FROM Orders;
SELECT * FROM OrderItems;
SELECT * FROM Payments;
SELECT * FROM Deliveries;

--Count number of records for each table to see if its meets the minimum 10 records criteria
SELECT 'Customers' AS TableName, COUNT(*) AS RecordCount
FROM Customers

UNION ALL

SELECT 'Employees', COUNT(*)
FROM Employees

UNION ALL

SELECT 'Categories', COUNT(*)
FROM Categories

UNION ALL

SELECT 'Cakes', COUNT(*)
FROM Cakes

UNION ALL

SELECT 'Orders', COUNT(*)
FROM Orders

UNION ALL

SELECT 'OrderItems', COUNT(*)
FROM OrderItems

UNION ALL

SELECT 'Payments', COUNT(*)
FROM Payments

UNION ALL

SELECT 'Deliveries', COUNT(*)
FROM Deliveries;

--5 Basic SELECT queries

--Display all records in Cakes Table
SELECT *
FROM Cakes;

--Display specific information from the Cakes Table
SELECT CakeID, CakeName, Flavor, Sizes, Price
FROM Cakes;

--Displat Cakes costing more than 5000
SELECT CakeID, CakeName, Price
FROM Cakes
WHERE Price > 5000;

--Display all details of employees who are 'Bakers'
SELECT *
FROM Employees
WHERE JobRole = 'Baker';

--Display selected information of all completed orders
SELECT OrderID, OrderDate, TotalAmount, OrderStatus
FROM Orders
WHERE OrderStatus = 'Completed';

--5 Advanced SELECT Queries

SELECT 
    e.EmployeeID,
    e.FirstName + ' ' + e.LastName AS EmployeeName,
    COUNT(o.OrderID) AS TotalOrders
FROM Employees e
JOIN Orders o ON e.EmployeeID = o.EmployeeID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalOrders DESC;