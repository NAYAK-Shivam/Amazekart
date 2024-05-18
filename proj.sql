CREATE TABLE Customer (
    Cust_Id INT PRIMARY KEY,
    Name VARCHAR2(15),
    Email VARCHAR2(30),
    C_City VARCHAR2(15),
    C_State VARCHAR2(20),
    C_Pincode INT
);

CREATE TABLE Customer_Phone (
    Cust_Id INT,
    Phone int,
    PRIMARY KEY (Cust_Id, Phone),
    foreign key(Cust_Id) references Customer(Cust_Id)
);

CREATE TABLE Warehouse (
    Warehouse_Id INT PRIMARY KEY,
    War_Quantity INT
);
CREATE TABLE Category (
    Cat_type VARCHAR2(20) PRIMARY KEY
);

CREATE TABLE Product_belongsto (
    Product_Id INT PRIMARY KEY,
    Cat_type VARCHAR2(20),
    Product_Name VARCHAR2(20),
    Price INT,
    foreign key(Cat_type) references Category(Cat_type)
);

CREATE TABLE Cart_has (
    Cust_Id INT,
    Cart_Id INT,
    Cart_Quantity INT,
    PRIMARY KEY (Cust_Id, Cart_Id),
    foreign key(Cust_Id) references Customer(Cust_Id)
);
CREATE TABLE Order_orders (
    Order_Id INT,
    Cust_Id INT,
    Order_Date DATE,
    PRIMARY KEY (Cust_Id, Order_Id),
    FOREIGN KEY (Cust_Id) REFERENCES Customer(Cust_Id)
);
CREATE TABLE Supplier (
    Supplier_Id INT PRIMARY KEY,
    Supplier_Name VARCHAR2(15),
    S_Pincode int,
    S_State VARCHAR2(20),
    S_City VARCHAR2(20)
);
CREATE TABLE Stored_in (
    Warehouse_Id INT,
    Product_Id INT,
    PRIMARY KEY (Warehouse_Id, Product_Id),
    FOREIGN KEY (Warehouse_Id) REFERENCES Warehouse(Warehouse_Id),
    FOREIGN KEY (Product_Id) REFERENCES Product_belongsto(Product_Id)
);
CREATE TABLE Contains (
    Cart_Id INT,
    Product_Id INT,
    Cust_Id INT,
    PRIMARY KEY (Cart_Id, Product_Id,Cust_Id),
    FOREIGN KEY (Cust_Id,Cart_Id) REFERENCES Cart_has(Cust_Id,Cart_Id),
    FOREIGN KEY (Product_Id) REFERENCES Product_belongsto(Product_Id)
);
CREATE TABLE Comprises (
    Order_Id INT,
    Product_Id INT,
    Cust_Id INT,
    PRIMARY KEY (Order_Id, Product_Id,Cust_Id),
    FOREIGN KEY (Cust_Id,Order_Id) REFERENCES Order_orders(Cust_Id,Order_id),
    FOREIGN KEY (Product_Id) REFERENCES Product_belongsto(Product_Id)
);
CREATE TABLE Provides (
    Supplier_Id INT,
    Product_Id INT,
    PRIMARY KEY (Supplier_Id, Product_Id),
    FOREIGN KEY (Supplier_Id) REFERENCES Supplier(Supplier_Id),
    FOREIGN KEY (Product_Id) REFERENCES Product_belongsto(Product_Id)
);
INSERT INTO Customer VALUES(1, 'Rahul', 'rahul@gmail.com', 'Mumbai', 'Maharashtra', 889562);
INSERT INTO Customer VALUES(2, 'Priya', 'priya@gmail.com', 'Delhi', 'Delhi', 152456);
INSERT INTO Customer VALUES(3, 'Amit', 'amit@gmail.com', 'Bangalore', 'Karnataka', 848565);
INSERT INTO Customer VALUES(4, 'Sneha', 'sneha@gmail.com', 'Kolkata', 'West Bengal', 253545);
INSERT INTO Customer VALUES(5, 'Neha', 'neha@gmail.com', 'Chennai', 'Tamil Nadu', 154565);
INSERT INTO Customer_Phone VALUES(1, 912345678901);
INSERT INTO Customer_Phone VALUES(2, 912345678902);
INSERT INTO Customer_Phone VALUES(3, 912345678903);
INSERT INTO Customer_Phone VALUES(4, 912345678904);
INSERT INTO Customer_Phone VALUES(5, 912345678905);
INSERT INTO Warehouse VALUES(1, 100);
INSERT INTO Warehouse VALUES(2, 2000);
INSERT INTO Warehouse VALUES(3, 1500);
INSERT INTO Warehouse VALUES(4, 300);
INSERT INTO Warehouse VALUES(5, 2500);
INSERT INTO Category VALUES('Electronics');
INSERT INTO Category VALUES('Clothing');
INSERT INTO Category VALUES('Books');
INSERT INTO Category VALUES('Home Appliances');
INSERT INTO Category VALUES('Toys');
INSERT INTO Product_belongsto VALUES(1, 'Electronics', 'Smartphone', 20000);
INSERT INTO Product_belongsto VALUES(2, 'Clothing', 'Shirt', 500);
INSERT INTO Product_belongsto VALUES(3, 'Books', 'Novel', 300);
INSERT INTO Product_belongsto VALUES(4, 'Home Appliances', 'Microwave', 5000);
INSERT INTO Product_belongsto VALUES(5, 'Toys', 'Action Figure', 200);
INSERT INTO Cart_has VALUES(1, 101, 2);
INSERT INTO Cart_has VALUES(2, 102, 3);
INSERT INTO Cart_has VALUES(3, 103, 1);
INSERT INTO Cart_has VALUES(4, 104, 4);
INSERT INTO Cart_has VALUES(5, 105, 2);
INSERT INTO Supplier VALUES(1, 'Supplier1', 562597, 'Maharashtra', 'Mumbai');
INSERT INTO Supplier VALUES(2, 'Supplier2', 585954, 'Delhi', 'Delhi');
INSERT INTO Supplier VALUES(3, 'Supplier3', 985645, 'Karnataka', 'Bangalore');
INSERT INTO Supplier VALUES(4, 'Supplier4', 457456, 'West Bengal', 'Kolkata');
INSERT INTO Supplier VALUES(5, 'Supplier5', 325654, 'Tamil Nadu', 'Chennai');
INSERT INTO Stored_in VALUES(1,1);
INSERT INTO Stored_in VALUES(2,2);
INSERT INTO Stored_in VALUES(3,3);
INSERT INTO Stored_in VALUES(4,4);
INSERT INTO Stored_in VALUES(5,5);
INSERT INTO Contains VALUES(101, 1, 1);
INSERT INTO Contains VALUES(102, 2, 2);
INSERT INTO Contains VALUES(103, 3, 3);
INSERT INTO Contains VALUES(104, 4, 4);
INSERT INTO Contains VALUES(105, 5, 5);
INSERT INTO Provides VALUES(1, 5);
INSERT INTO Provides VALUES(2, 2);
INSERT INTO Provides VALUES(3, 4);
INSERT INTO Provides VALUES(4, 1);
INSERT INTO Provides VALUES(5, 3);
INSERT INTO Order_orders VALUES(201, 1, '4-APR-2024');
INSERT INTO Order_orders VALUES(202, 2, '5-APR-2024');
INSERT INTO Order_orders VALUES(203, 3, '6-APR-2024');
INSERT INTO Order_orders VALUES(204, 4, '7-APR-2024');
INSERT INTO Order_orders VALUES(205, 5, '8-APR-2024');
INSERT INTO Comprises VALUES(201, 1, 1);
INSERT INTO Comprises VALUES(202, 2, 2);
INSERT INTO Comprises VALUES(203, 3, 3);
INSERT INTO Comprises VALUES(204, 4, 4);
INSERT INTO Comprises VALUES(205, 5, 5);

