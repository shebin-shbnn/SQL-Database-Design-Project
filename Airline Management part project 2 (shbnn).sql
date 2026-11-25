CREATE DATABASE Airline_Management;

USE Airline_Management;

CREATE TABLE Airlines
(
    Airline_ID INT PRIMARY KEY,
    Airline_Name VARCHAR(50),
    Country VARCHAR(30),
    IATA_Code VARCHAR(10)
);

INSERT INTO Airlines VALUES
(1,'IndiGo','India','6E'),
(2,'Air India','India','AI'),
(3,'Emirates','UAE','EK'),
(4,'Qatar Airways','Qatar','QR'),
(5,'Singapore Airlines','Singapore','SQ');


CREATE TABLE Flights
(
    Flight_ID INT PRIMARY KEY,
    Airline_ID INT,
    Flight_Number VARCHAR(10),
    Source VARCHAR(30),
    Destination VARCHAR(30),
    Departure_Date DATE,

    FOREIGN KEY (Airline_ID)
    REFERENCES Airlines(Airline_ID)
);

INSERT INTO Flights VALUES
(301,1,'6E201','Delhi','Kochi','2026-12-10'),
(302,2,'AI601','Mumbai','Delhi','2026-12-11'),
(303,3,'EK530','Dubai','Kochi','2026-12-12'),
(304,4,'QR572','Doha','Delhi','2026-12-13'),
(305,5,'SQ423','Mumbai','Singapore','2026-12-14');


CREATE TABLE Passengers
(
    Passenger_ID INT PRIMARY KEY,
    First_Name VARCHAR(25),
    Last_Name VARCHAR(25),
    Gender VARCHAR(10),
    Country VARCHAR(30)
);

INSERT INTO Passengers VALUES
(201,'Arjun','Nair','Male','India'),
(202,'Aisha','Rahman','Female','India'),
(203,'Rahul','Sharma','Male','India'),
(204,'Sarah','Khan','Female','UAE'),
(205,'Daniel','Thomas','Male','Singapore');



CREATE TABLE Bookings
(
    Booking_ID INT PRIMARY KEY,
    Passenger_ID INT,
    Flight_ID INT,
    Booking_Date DATE,
    Booking_Status VARCHAR(20),

    FOREIGN KEY (Flight_ID)
    REFERENCES Flights(Flight_ID)
);

INSERT INTO Bookings VALUES
(401,201,301,'2026-11-20','Confirmed'),
(402,202,302,'2026-11-21','Confirmed'),
(403,203,303,'2026-11-22','Pending'),
(404,204,304,'2026-11-23','Confirmed'),
(405,205,305,'2026-11-24','Cancelled');



CREATE TABLE Payments
(
    Payment_ID INT PRIMARY KEY,
    Booking_ID INT,
    Amount DECIMAL(10,2),
    Payment_Method VARCHAR(20),
    Payment_Status VARCHAR(20),

    FOREIGN KEY (Booking_ID)
    REFERENCES Bookings(Booking_ID)
);

INSERT INTO Payments VALUES
(601,401,5500.00,'UPI','Paid'),
(602,402,12500.00,'Credit Card','Paid'),
(603,403,18000.00,'Net Banking','Pending'),
(604,404,45000.00,'Credit Card','Paid'),
(605,405,6200.00,'UPI','Refunded');


SELECT * FROM Airlines;

SELECT * FROM Flights;

SELECT * FROM Passengers;

SELECT * FROM Bookings;

SELECT * FROM Payments;


