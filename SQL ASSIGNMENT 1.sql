-- DROP DATABASE IF EXISTS DDL_Commands;
-- CREATE DATABASE DDL_Commands;
-- USE DDL_Commands;
-- CREATE TABLE my_table(
-- 	id int,
--     name VARCHAR(50) NOT NULL,
--     age INT NOT NULL
-- );
-- INSERT INTO my_table(id,name,age) VALUES
-- (1,'ROHAN',25),
-- (2,'SACHINE',35),
-- (3,'BIKAS',28);



-- CREATE TABLE my_table2(
-- 	ID int,
--     description VARCHAR(255) NOT NULL
--     
-- );
-- INSERT INTO my_table2 (id,description) VALUES
-- (1,'ITEM 1'),
-- (2,'ITEM 2'),
-- (3,'ITEM 3');

-- ALTER TABLE my_table ADD COLUMN phone_no CHAR (10);
-- ALTER TABLE my_table ADD COLUMN middle_name VARCHAR(50) AFTER name;
-- ALTER TABLE my_table ADD COLUMN EMP_RANK INT FIRST;


-- ALTER TABLE my_table MODIFY COLUMN name  VARCHAR (100) AFTER EMP_RANK;
-- ALTER TABLE my_table MODIFY COLUMN name VARCHAR (200) NOT NULL;

-- ALTER TABLE my_table CHANGE COLUMN email email_address VARCHAR (200);
-- -- SELECT * FROM my_table;


-- ALTER TABLE my_table DROP COLUMN age;
-- ALTER TABLE my_table ADD PRIMARY KEY(ID);
-- ALTER TABLE my_table ADD CONSTRAINT fk_id FOREIGN KEY (id) REFERENCES my_table(id);
-- SELECT * FROM my_table;


-- SHOW INDEX FROM my_table2;
-- SHOW INDEX FROM my_table;


-- ALTER TABLE my_table DROP FOREIGN KEY fk_id;
-- ALTER TABLE my_table DROP PRIMARY KEY;
-- RENAME TABLE my_table TO my_new_table2;


-- RENAME TABLE my_table TO my_new_table;



-- DROP DATABASE IF exists sample;
-- CREATE DATABASE sample;
-- USE sample;

-- CREATE TABLE customer(
-- 	ID INT PRIMARY KEY AUTO_INCREMENT,
--     First_Name VARCHAR (50) NOT NULL,
--     Last_Name VARCHAR(50),
--     Phone VARCHAR(10) NOT NULL,
--     Age TINYINT UNSIGNED CHECK(Age >= 18),
--     Country VARCHAR(50) DEFAULT 'INDIA',
--     Email VARCHAR(100) NOT NULL UNIQUE,
--     Address tinytext,
--     Pincode VARCHAR(6) DEFAULT '201301',
--     Date_inserted_at DATE DEFAULT (CURRENT_DATE),
--     Created_Time TIME DEFAULT (CURRENT_TIME),
--     Created_at_Date_Time TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
-- );
-- INSERT INTO customer (First_Name, Last_Name, Phone, Age, Email, Address) 
-- VALUES
-- ('Amit', 'Sharma', '0984566363', 22, 'amitshrma@gmail.com', 'A-52 Sector 6 Noida'),
-- ('Priya', 'Verma', '2387652309', 21, 'priyaverma@gmail.com', 'c-21 Sector 43 Noida'),
-- ('Rahul', 'Gupta', '9897123423', 35, 'rahulgupt@mail.com', 'A-96 Sector 4 noida'),
-- ('Sneha', 'Tyer', '9876124589', 26, 'sneha@gamail.com','B-34 sector 126 noida'),
-- ('Vikram', 'Singh','9897213143',40,'bikram982@gmail.com', 'F-129 Ring road Delhi');

-- -- --02/11/2026--
-- CREATE TABLE customer_order(
-- 	Order_Id INT PRIMARY KEY AUTO_INCREMENT,
--     Customer_Id INT,
--     Order_Date DATE DEFAULT (CURRENT_DATE),
--     Oder_Amount DECIMAL(10,2) NOT NULL,
--     Order_status ENUM('Pending', 'Shipped', 'Deliverd', 'Cancelled') DEFAULT 'PENDING',
--     FOREIGN KEY (Customer_Id) REFERENCES customer(Id) ON DELETE CASCADE,
--     FOREIGN KEY (Customer_Id) References customer(Id) ON UPDATE CASCADE
-- );

-- INSERT INTO customer_order ( Customer_Id, Oder_Amount, Order_status)
-- VALUES
-- (1, 1500.50, 'Shipped'),
-- (2, 1200.99, 'Deliverd'),
-- (3, 1300.00, 'Pending'),
-- (4, 650.00, 'Cancelled'),
-- (5, 780.99, 'Deliverd');

-- SELECT * FROM customer_order;

-- DESCRIBE customer;


-- 03-11-2026 

DROP DATABASE IF EXISTS Shopping_Managment;
CREATE DATABASE Shopping_Managment;
USE Shopping_Managment;

CREATE TABLE Customers(
	Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR (150) NOT NULL UNIQUE,
    Phone_Number CHAR(10) NOT NULL UNIQUE,
    Age INT CHECK(Age >= 0),
    Gender ENUM('Male','Female','Other'),
    Country VARCHAR (50) DEFAULT 'INDIA',
    City VARCHAR (50),
    Pincode CHAR(6) DEFAULT '201301',
    Registration_Date DATE DEFAULT(CURRENT_DATE),
    Registration_Time TIME DEFAULT(CURRENT_TIME),
    Created_At DATETIME DEFAULT (CURRENT_TIMESTAMP),
    Address VARCHAR(250),
    Customer_status ENUM('Active', 'Inactive', 'Blocked') DEFAULT 'Active',
    Customer_Notes VARCHAR(100)
    );

CREATE TABLE Orders(
	Order_Id INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Id INT,
    Order_Date DATE DEFAULT (CURRENT_DATE),
    Order_Amount DECIMAL(10,2) NOT NULL,
    Order_Status ENUM('Pending','Processing','Shipped','Deliverd','Cancelled') DEFAULT 'Pending',
    Payment_Method ENUM('Cash','Card','UPI','Net Banking'),
    Payment_Status ENUM ('Pending','Failed','Paid')DEFAULT 'Pending',
    Shipping_Adress VARCHAR(250),
    Dellivery_Pincode CHAR(6),
    Quantity INT CHECK( Quantity > 0),
    Discount_Amount DECIMAL(10,2) DEFAULT 0.00,
    Delivery_Date DATETIME NULL,
    Created_At DATETIME DEFAULT (CURRENT_TIMESTAMP),
    Tracking_Number VARCHAR (30) UNIQUE,
    Delivery_Status ENUM('Not Dispatched','In Transit','Deliverd','Returned') DEFAULT 'Not Dispatched',
    Order_Notes VARCHAR(1000),
    CONSTRAINT fk_orders_customer
    FOREIGN KEY(Customer_Id)
    REFERENCES customers(Customer_Id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    
);




