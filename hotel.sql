-- Customer entity
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR2(40),
    Country VARCHAR(255),
    email VARCHAR(255),
    Address VARCHAR(255),
    Contact_no VARCHAR(20)
);


-- Hotel entity
CREATE TABLE Hotel (
    H_ID INT PRIMARY KEY,
    H_NAME VARCHAR(255),
    LOCATION VARCHAR(255)
);

-- Amenities entity
CREATE TABLE Amenities (
    Amenity_ID INT PRIMARY KEY,
    H_ID INT,
    Concierge_Service varchar2(20),
    Spa varchar2(20),
    Room_Service varchar2(20),
    Restaurant varchar2(20)
);

-- Link Amenities to Hotel
CREATE TABLE Hotel_Amenities (
    H_ID INT,
    Amenity_ID INT,
    FOREIGN KEY (H_ID) REFERENCES Hotel(H_ID),
    FOREIGN KEY (Amenity_ID) REFERENCES Amenities(Amenity_ID)
);

-- Employee entity
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(255),
    emp_address VARCHAR(255),
    emp_phone VARCHAR(20),
    emp_salary number
);

-- Link Employee to Hotel
CREATE TABLE Hotel_Employee (
    H_ID INT,
    emp_id INT,
    FOREIGN KEY (H_ID) REFERENCES Hotel(H_ID),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Link Employee to Receptionist
CREATE TABLE Receptionist_Employee (
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Link Employee to Admin
CREATE TABLE Admin_Employee (
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Link Employee to Room Service
CREATE TABLE RoomService_Employee (
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id)
);

-- Room_type entity
CREATE TABLE Room_Type (
    room_type_id INT PRIMARY KEY,
    room_price number,
    description varchar2(50),
    occupancy_capacity INT
);

-- Rooms entity
CREATE TABLE Rooms (
    room_no INT PRIMARY KEY,
    room_category VARCHAR(255),
    H_ID INT,
    room_type_id INT
);

-- Link Rooms to Hotel
CREATE TABLE Hotel_Rooms (
    H_ID INT,
    room_no INT,
    FOREIGN KEY (H_ID) REFERENCES Hotel(H_ID),
    FOREIGN KEY (room_no) REFERENCES Rooms(room_no)
);

-- Link Rooms to Room_Type
CREATE TABLE RoomType_Rooms (
    room_no INT,
    room_type_id INT,
    FOREIGN KEY (room_no) REFERENCES Rooms(room_no),
    FOREIGN KEY (room_type_id) REFERENCES Room_Type(room_type_id)
);

-- Reservation entity
CREATE TABLE Reservation (
    reservation_id INT PRIMARY KEY,
    st_date DATE,
    end_date DATE,
    customer_id INT,
    payment_id INT,
    description varchar2(20),
    occupancy_capacity INT
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    reservation_id INT,
    payment_amount number,
    payment_date DATE,
    customer_id INT
);
-- Link Reservation to Customer
CREATE TABLE Customer_Reservation (
    customer_id INT,
    reservation_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);

-- Link Reservation to Payment
CREATE TABLE Payment_Reservation (
    payment_id INT,
    reservation_id INT,
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id),
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id)
);

-- Feedback entity
CREATE TABLE Feedback (
    Feedback_id INT PRIMARY KEY,
    Suggestions varchar2(20),
    Rating INT,
    customer_id INT
);

-- Link Feedback to Customer
CREATE TABLE Customer_Feedback (
    customer_id INT,
    Feedback_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (Feedback_id) REFERENCES Feedback(Feedback_id)
);



INSERT INTO Customer values(1, 'Ravi Kumar', 'India', 'ravi.kumar@gmail.com', '1234 elm st, Delhi, India', '123-456-7890');
INSERT INTO Customer values(2, 'Neha Sharma', 'India', 'neha.sharma@gmail.com', '5678 maple ave, Mumbai, India', '987-654-3210');
INSERT INTO Customer values(3, 'Amit Jain', 'India', 'amit.jain@gmail.com', '4567 oxford st, Bangalore, India', '345-678-9012');
INSERT INTO Customer values(4, 'Priya Verma', 'India', 'priya.verma@gmail.com', '789 sydney rd, Chennai, India', '111-222-3333');
INSERT INTO Customer values(5, 'Sandeep Yadav', 'India', 'sandeep.yadav@gmail.com', '456 berlin strasse, Kolkata, India', '555-444-3333');
INSERT INTO Customer values(6, 'Ananya Mishra', 'India', 'ananya.mishra@gmail.com', '789 paris avenue, Hyderabad, India', '777-888-9999');
INSERT INTO Customer values(7, 'Akash Gupta', 'India', 'akash.gupta@gmail.com', '456 madrid blvd, Pune, India', '123-987-5678');
INSERT INTO Customer values(8, 'Shivani Sharma', 'India', 'shivani.sharma@gmail.com', '789 rome street, Jaipur, India', '890-345-6789');
INSERT INTO Customer values(9, 'Arjun Das', 'India', 'arjun.das@gmail.com', '456 tokyo ave, Chandigarh, India', '111-222-3333');
INSERT INTO Customer values(10, 'Deepa Mahajan', 'India', 'deepa.mahajan@gmail.com', '789 bangalore st, Ahmedabad, India', '555-444-3333');

INSERT INTO Hotel VALUES (1, 'Taj hotel', 'mumbai, maharashtra');

INSERT INTO Amenities VALUES (1, 1, 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO Amenities VALUES (2, 1, 'No', 'Yes', 'Yes', 'No');
INSERT INTO Amenities VALUES (3, 1, 'Yes', 'No', 'Yes', 'Yes');
INSERT INTO Amenities VALUES (4, 1, 'Yes', 'Yes', 'No', 'Yes');
INSERT INTO Amenities VALUES (5, 1, 'No', 'No', 'Yes', 'Yes');
INSERT INTO Amenities VALUES (6, 1, 'Yes', 'Yes', 'Yes', 'Yes');
INSERT INTO Amenities VALUES (7, 1, 'No', 'Yes', 'No', 'Yes');
INSERT INTO Amenities VALUES (8, 1, 'Yes', 'Yes', 'Yes', 'No');
INSERT INTO Amenities VALUES (9, 1, 'No', 'Yes', 'No', 'Yes');
INSERT INTO Amenities VALUES (10, 1, 'Yes', 'No', 'Yes', 'Yes');

INSERT INTO Hotel_Amenities VALUES (1, 1);
INSERT INTO Hotel_Amenities VALUES (1, 2);
INSERT INTO Hotel_Amenities VALUES (1, 3);
INSERT INTO Hotel_Amenities VALUES (1, 4);
INSERT INTO Hotel_Amenities VALUES (1, 5);
INSERT INTO Hotel_Amenities VALUES (1, 6);
INSERT INTO Hotel_Amenities VALUES (1, 7);
INSERT INTO Hotel_Amenities VALUES (1, 8);
INSERT INTO Hotel_Amenities VALUES (1, 9);
INSERT INTO Hotel_Amenities VALUES (1, 10);

INSERT INTO Employee VALUES (1, 'John Doe', '123 Main St, Some City, USA', '555-123-4567', 50000);
INSERT INTO Employee VALUES (2, 'Jane Smith', '456 Elm Ave, Another City, Canada', '555-987-6543', 48000);
INSERT INTO Employee VALUES (3, 'Rahul Sharma', '789 Park Rd, Delhi, India', '123-456-7890', 55000);
INSERT INTO Employee VALUES (4, 'Sneha Gupta', '567 River View, Mumbai, India', '987-654-3210', 49000);
INSERT INTO Employee VALUES (5, 'Amit Patel', '890 Green Lane, Bangalore, India', '111-222-3333', 51000);
INSERT INTO Employee VALUES (6, 'Nisha Verma', '456 Hilltop, Chennai, India', '555-444-3333', 47000);
INSERT INTO Employee VALUES (7, 'Raj Singh', '123 Sunset Blvd, Hyderabad, India', '777-888-9999', 52000);
INSERT INTO Employee VALUES (8, 'Aruna Kumari', '789 Valley Rd, Pune, India', '123-987-5678', 48000);
INSERT INTO Employee VALUES (9, 'Vinod Sharma', '456 Garden Ave, Jaipur, India', '890-345-6789', 53000);
INSERT INTO Employee VALUES (10, 'Sarika Jain', '789 Lakeview, Ahmedabad, India', '555-444-3333', 49000);

INSERT INTO Hotel_Employee VALUES (1, 1);
INSERT INTO Hotel_Employee VALUES (1, 2);
INSERT INTO Hotel_Employee VALUES (1, 3);
INSERT INTO Hotel_Employee VALUES (1, 4);
INSERT INTO Hotel_Employee VALUES (1, 5);
INSERT INTO Hotel_Employee VALUES (1, 6);
INSERT INTO Hotel_Employee VALUES (1, 7);
INSERT INTO Hotel_Employee VALUES (1, 8);
INSERT INTO Hotel_Employee VALUES (1, 9);
INSERT INTO Hotel_Employee VALUES (1, 10);


INSERT INTO Receptionist_Employee VALUES (1);
INSERT INTO Receptionist_Employee VALUES (2);
INSERT INTO Receptionist_Employee VALUES (3);
INSERT INTO Receptionist_Employee VALUES (4);
INSERT INTO Receptionist_Employee VALUES (5);
INSERT INTO Receptionist_Employee VALUES (6);
INSERT INTO Receptionist_Employee VALUES (7);
INSERT INTO Receptionist_Employee VALUES (8);
INSERT INTO Receptionist_Employee VALUES (9);
INSERT INTO Receptionist_Employee VALUES (10);


INSERT INTO Admin_Employee VALUES (1);
INSERT INTO Admin_Employee VALUES (2);
INSERT INTO Admin_Employee VALUES (3);
INSERT INTO Admin_Employee VALUES (4);
INSERT INTO Admin_Employee VALUES (5);
INSERT INTO Admin_Employee VALUES (6);
INSERT INTO Admin_Employee VALUES (7);
INSERT INTO Admin_Employee VALUES (8);
INSERT INTO Admin_Employee VALUES (9);
INSERT INTO Admin_Employee VALUES (10);

INSERT INTO RoomService_Employee VALUES (1);
INSERT INTO RoomService_Employee VALUES (2);
INSERT INTO RoomService_Employee VALUES (3);
INSERT INTO RoomService_Employee VALUES (4);
INSERT INTO RoomService_Employee VALUES (5);
INSERT INTO RoomService_Employee VALUES (6);
INSERT INTO RoomService_Employee VALUES (7);
INSERT INTO RoomService_Employee VALUES (8);
INSERT INTO RoomService_Employee VALUES (9);
INSERT INTO RoomService_Employee VALUES (10);

INSERT INTO Rooms VALUES (101, 'Standard', 1, 1);
INSERT INTO Rooms VALUES (102, 'Standard', 1, 1);
INSERT INTO Rooms VALUES (103, 'Deluxe', 1, 2);
INSERT INTO Rooms VALUES (104, 'Deluxe', 1, 2);
INSERT INTO Rooms VALUES (105, 'Suite', 1, 3);
INSERT INTO Rooms VALUES (106, 'Suite', 1, 3);
INSERT INTO Rooms VALUES (107, 'Standard', 1, 4);
INSERT INTO Rooms VALUES (108, 'Standard', 1, 4);
INSERT INTO Rooms VALUES (109, 'Deluxe', 1, 5);
INSERT INTO Rooms VALUES (110, 'Deluxe', 1, 5);

INSERT INTO Room_Type VALUES (1, 100, 'Standard Room', 2);
INSERT INTO Room_Type VALUES (2, 120, 'Standard Room with View', 2);
INSERT INTO Room_Type VALUES (3, 150, 'Deluxe Room', 3);
INSERT INTO Room_Type VALUES (4, 180, 'Suite', 4);
INSERT INTO Room_Type VALUES (5, 200, 'Executive Suite', 4);
INSERT INTO Room_Type VALUES (6, 90, 'Economy Room', 1);
INSERT INTO Room_Type VALUES (7, 140, 'Deluxe Room with View', 3);
INSERT INTO Room_Type VALUES (8, 220, 'Presidential Suite', 6);
INSERT INTO Room_Type VALUES (9, 110, 'Superior Room', 2);
INSERT INTO Room_Type VALUES (10, 130, 'Family Suite', 5);


INSERT INTO Hotel_Rooms VALUES (1, 101);
INSERT INTO Hotel_Rooms VALUES (1, 102);
INSERT INTO Hotel_Rooms VALUES (1, 103);
INSERT INTO Hotel_Rooms VALUES (1, 104);
INSERT INTO Hotel_Rooms VALUES (1, 105);
INSERT INTO Hotel_Rooms VALUES (1, 106);
INSERT INTO Hotel_Rooms VALUES (1, 107);
INSERT INTO Hotel_Rooms VALUES (1, 108);
INSERT INTO Hotel_Rooms VALUES (1, 109);
INSERT INTO Hotel_Rooms VALUES (1, 110);


INSERT INTO RoomType_Rooms VALUES (101, 1);
INSERT INTO RoomType_Rooms VALUES (102, 2);
INSERT INTO RoomType_Rooms VALUES (103, 3);
INSERT INTO RoomType_Rooms VALUES (104, 4);
INSERT INTO RoomType_Rooms VALUES (105, 5);
INSERT INTO RoomType_Rooms VALUES (106, 6);
INSERT INTO RoomType_Rooms VALUES (107, 7);
INSERT INTO RoomType_Rooms VALUES (108, 8);
INSERT INTO RoomType_Rooms VALUES (109, 9);
INSERT INTO RoomType_Rooms VALUES (110, 10);


desc Reservation;
INSERT INTO Reservation VALUES (1, '20-Oct-2023', '22-Oct-2023', 1, 1, 'Standard reservation', 2);
INSERT INTO Reservation VALUES (2, '22-Oct-2023', '25-Oct-2023', 2, 2, 'Deluxe reservation', 2);
INSERT INTO Reservation VALUES (3, '24-Oct-2023', '27-Oct-2023', 3, 3, 'Suite reservation', 4);
INSERT INTO Reservation VALUES (4, '26-Oct-2023', '30-Oct-2023', 4, 4, 'Standard reservation', 2);
INSERT INTO Reservation VALUES (5, '28-Oct-2023', '31-Oct-2023', 5, 5, 'Deluxe reservation', 2);
INSERT INTO Reservation VALUES (6, '30-Oct-2023', '03-Nov-2023', 6, 6, 'Suite reservation', 4);
INSERT INTO Reservation VALUES (7, '01-Nov-2023', '05-Nov-2023', 7, 7, 'Standard reservation', 2);
INSERT INTO Reservation VALUES (8, '03-Nov-2023', '08-Nov-2023', 8, 8, 'Deluxe reservation', 2);
INSERT INTO Reservation VALUES (9, '05-Nov-2023', '10-Nov-2023', 9, 9, 'Suite reservation', 4);
INSERT INTO Reservation VALUES (10, '07-Nov-2023', '12-Nov-2023', 10, 10, 'Standard reservation', 2);

INSERT INTO Payment VALUES (1, 1, 500.00, '21-OCT-2023', 1);
INSERT INTO Payment VALUES (2, 2, 600.00, '23-OCT-2023', 2);
INSERT INTO Payment VALUES (3, 3, 700.00, '25-OCT-2023', 3);
INSERT INTO Payment VALUES (4, 4, 800.00, '27-OCT-2023', 4);
INSERT INTO Payment VALUES (5, 5, 900.00, '29-OCT-2023', 5);
INSERT INTO Payment VALUES (6, 6, 1000.00, '31-OCT-2023', 6);
INSERT INTO Payment VALUES (7, 7, 1100.00, '02-NOV-2023', 7);
INSERT INTO Payment VALUES (8, 8, 1200.00, '04-NOV-2023', 8);
INSERT INTO Payment VALUES (9, 9, 1300.00, '06-NOV-2023', 9);
INSERT INTO Payment VALUES (10, 10, 1400.00, '08-NOV-2023', 10);


INSERT INTO Customer_Reservation VALUES (1, 1);
INSERT INTO Customer_Reservation VALUES (2, 2);
INSERT INTO Customer_Reservation VALUES (3, 3);
INSERT INTO Customer_Reservation VALUES (4, 4);
INSERT INTO Customer_Reservation VALUES (5, 5);
INSERT INTO Customer_Reservation VALUES (6, 6);
INSERT INTO Customer_Reservation VALUES (7, 7);
INSERT INTO Customer_Reservation VALUES (8, 8);
INSERT INTO Customer_Reservation VALUES (9, 9);
INSERT INTO Customer_Reservation VALUES (10, 10);

INSERT INTO Payment_Reservation VALUES (1, 1);
INSERT INTO Payment_Reservation VALUES (2, 2);
INSERT INTO Payment_Reservation VALUES (3, 3);
INSERT INTO Payment_Reservation VALUES (4, 4);
INSERT INTO Payment_Reservation VALUES (5, 5);
INSERT INTO Payment_Reservation VALUES (6, 6);
INSERT INTO Payment_Reservation VALUES (7, 7);
INSERT INTO Payment_Reservation VALUES (8, 8);
INSERT INTO Payment_Reservation VALUES (9, 9);
INSERT INTO Payment_Reservation VALUES (10, 10);


INSERT INTO Feedback VALUES (1, 'Good service', 4, 1);
INSERT INTO Feedback VALUES (2, 'Amazing experience', 5, 2);
INSERT INTO Feedback VALUES (3, 'Satisfactory stay', 3, 3);
INSERT INTO Feedback VALUES (4, 'Excellent service', 5, 4);
INSERT INTO Feedback VALUES (5, 'Poor experience', 1, 5);
INSERT INTO Feedback VALUES (6, 'Average service', 2, 6);
INSERT INTO Feedback VALUES (7, 'Wonderful stay', 5, 7);
INSERT INTO Feedback VALUES (8, 'Great hospitality', 5, 8);
INSERT INTO Feedback VALUES (9, 'Fantastic experience', 5, 9);
INSERT INTO Feedback VALUES (10, 'Exceptional service', 5, 10);

INSERT INTO Customer_Feedback VALUES (1, 1);
INSERT INTO Customer_Feedback VALUES (2, 2);
INSERT INTO Customer_Feedback VALUES (3, 3);
INSERT INTO Customer_Feedback VALUES (4, 4);
INSERT INTO Customer_Feedback VALUES (5, 5);
INSERT INTO Customer_Feedback VALUES (6, 6);
INSERT INTO Customer_Feedback VALUES (7, 7);
INSERT INTO Customer_Feedback VALUES (8, 8);
INSERT INTO Customer_Feedback VALUES (9, 9);
INSERT INTO Customer_Feedback VALUES (10,10);


SELECT * FROM Customer;
SELECT * FROM Hotel;
SELECT * FROM Amenities;
SELECT * FROM Hotel_Amenities;
SELECT * FROM Employee;
SELECT * FROM Hotel_Employee;
SELECT * FROM Receptionist_Employee;
SELECT * FROM Admin_Employee;
SELECT * FROM RoomService_Employee;
SELECT * FROM Room_Type;
SELECT * FROM Rooms;
SELECT * FROM Hotel_Rooms;
SELECT * FROM RoomType_Rooms;
SELECT * FROM Reservation;
SELECT * FROM Payment;
SELECT * FROM Customer_Reservation;
SELECT * FROM Payment_Reservation;
SELECT * FROM Feedback;
SELECT * FROM Customer_Feedback;



-- SIMPLE QUERIES

--(1) Retrieve the names and email addresses of all customers.
SELECT customer_id, customer_name, email FROM Customer;
--(2)List the amenities for a specific hotel (e.g., Hotel with H_ID = 1).
SELECT Amenity_ID, Concierge_Service, Spa, Room_Service, Restaurant
FROM Amenities;
--(3)Find the customer details who made payments on '29-OCT-2023.'
SELECT C.customer_id, C.email
FROM Customer C, Payment P
WHERE C.customer_id = P.customer_id
and P.payment_date = '29-OCT-2023';
--(4)Show the room numbers and their categories in a specific hotel (e.g., Hotel with H_ID = 1).
SELECT HR.room_no, R.room_category
FROM Hotel_Rooms HR, Rooms R
WHERE HR.H_ID = 1 AND HR.room_no = R.room_no;
--(5)Find Customer Reservations: Retrieve all reservations made by a specific customer (e.g., customer_id = 6).
SELECT R.reservation_id, R.st_date, R.end_date
FROM Reservation R
WHERE R.customer_id = 6;

-- QUERIES USING JOIN

--(1) Retrieve the names of customers who provided feedback.
SELECT C.customer_id, C.email, CF.feedback_id
FROM Customer C
JOIN Customer_Feedback CF ON C.customer_id = CF.customer_id;

--(2) List all the customers who made reservations for the Suite category.
SELECT C.customer_id, C.email
FROM Customer C
JOIN Customer_Reservation CR ON C.customer_id = CR.customer_id
JOIN Reservation R ON CR.reservation_id = R.reservation_id
JOIN Room_Type RT ON R.occupancy_capacity = RT.occupancy_capacity
WHERE RT.description = 'Suite';

--(3) Calculate the total revenue generated by the hotel from room reservations.
SELECT SUM(P.payment_amount) AS total_revenue
FROM Payment P
JOIN Reservation R ON P.reservation_id = R.reservation_id;

-- QUERIES USING AGGREGATE FUNCTIONS

--(1) Find the average rating of feedback received from customers.
SELECT AVG(CF.Rating) AS average_rating
FROM Feedback CF;

--(2) Retrieve the highest-paid staff member.
SELECT e.emp_id, e.emp_name
FROM Employee e
WHERE e.emp_salary = (SELECT MAX(emp_salary) FROM Employee);

--(3) Calculate the total number of customers in the database.
SELECT COUNT(customer_id) AS total_customers
FROM Customer;

--(4)Determine the maximum payment amount made in any reservation.
SELECT MAX(payment_amount) AS max_payment_amount
FROM Payment;

--(5)Retrieve the highest and lowest room prices and display room type:
SELECT description, room_price FROM Room_Type WHERE room_price = (SELECT MAX(room_price) FROM Room_Type)
union all
SELECT description, room_price FROM Room_Type WHERE room_price = (SELECT MIN(room_price) FROM Room_Type);

--QUERIES USING NESTED QUERIES

--(1)Find the total payment amount for reservations at your hotel with a room price greater than 1000/-:
SELECT SUM(payment_amount) AS TotalPayment
FROM Payment
WHERE reservation_id IN (
    SELECT rt.reservation_id
    FROM Reservation rt
    WHERE rt.reservation_id IN (
        SELECT pr.reservation_id
        FROM Reservation rt, Payment_Reservation pr, Payment p
        WHERE rt.reservation_id = pr.reservation_id
        AND p.payment_id = pr.payment_id
        AND p.payment_amount > 1000  
    )
);

--(2)Retrieve the customers who made reservations at your hotel for suite rooms:
SELECT c.customer_name, c.customer_id
FROM Customer c
WHERE c.customer_id NOT IN (
    SELECT r.customer_id
    FROM Reservation r
    WHERE r.reservation_id NOT IN (SELECT reservation_id FROM Reservation WHERE description = 'Suite reservation')
);

--(3)Find the employees with the highest salary in your hotel:
SELECT emp_name, emp_salary
FROM Employee e
WHERE 5 >= (
    SELECT COUNT(DISTINCT emp_salary)
    FROM Employee e1
    WHERE e1.emp_salary >= e.emp_salary
)
ORDER BY emp_salary DESC;

--(4)Retrieve the customers who provided feedback with a rating of 5 at your hotel:
SELECT customer_name, customer_id, email
FROM Customer
WHERE customer_id IN (
    SELECT customer_id
    FROM Feedback
    WHERE Rating = 5
);

--(5)Find the reservations with the earliest start date:
SELECT reservation_id, st_date
FROM Reservation
WHERE st_date = (
    SELECT MIN(st_date)
    FROM Reservation
);

-- QUERIES USING GROUP BY

--(1)Find the total number of reservations made for each room category at your hotel:
SELECT description, COUNT(*)
FROM Reservation
GROUP BY description;

-- QUERIES USING PL/SQL

-- (1)Calculate and display the total hotel revenue
DECLARE
  total_revenue NUMBER := 0;
BEGIN
  SELECT SUM(payment_amount) INTO total_revenue
  FROM Payment;

  DBMS_OUTPUT.PUT_LINE('Total Hotel Revenue: ' || total_revenue);
END;

--(2)Retrieve the highest and lowest room prices and their descriptions:

DECLARE
  highest_room_description VARCHAR2(50);
  highest_room_price NUMBER;
  lowest_room_description VARCHAR2(50);
  lowest_room_price NUMBER;
BEGIN
  -- Highest room price
  SELECT description, room_price
  INTO highest_room_description, highest_room_price
  FROM Room_Type
  WHERE room_price = (SELECT MAX(room_price) FROM Room_Type);
  
  -- Lowest room price
  SELECT description, room_price
  INTO lowest_room_description, lowest_room_price
  FROM Room_Type
  WHERE room_price = (SELECT MIN(room_price) FROM Room_Type);
  
  DBMS_OUTPUT.PUT_LINE('Highest Room Description: ' || highest_room_description || ', Price: ' || highest_room_price);
  DBMS_OUTPUT.PUT_LINE('Lowest Room Description: ' || lowest_room_description || ', Price: ' || lowest_room_price);
END;

--(3)Retrieve Customer Names Who Only Booked "Suite" Reservations:

DECLARE
  v_customer_name VARCHAR2(255);
BEGIN
  FOR c IN (SELECT c.customer_name
            FROM Customer c
            WHERE NOT EXISTS (
              SELECT 1
              FROM Reservation r
              WHERE r.customer_id = c.customer_id
              AND r.description = 'Suite reservation'
            ))
  LOOP
    v_customer_name := c.customer_name;
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer_name);
  END LOOP;
END;

--(4)Retrieve the Names and Salaries of the Top 3 Highest-Earning Employees:
DECLARE
  TYPE emp_salary_list IS TABLE OF NUMBER;
  emp_salaries emp_salary_list;
BEGIN
  SELECT emp_salary
  BULK COLLECT INTO emp_salaries
  FROM Employee
  ORDER BY emp_salary DESC;

  FOR i IN 1..3
  LOOP
    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || emp_salaries(i));
  END LOOP;
END;

--QUERIES USING CURSORS

--(1)Fetching Employee Names using Cursor:

DECLARE
  employee_name VARCHAR2(50);

  CURSOR emp_cursor IS
    SELECT emp_name
    FROM Employee;

BEGIN
  FOR emp_rec IN emp_cursor
  LOOP
    employee_name := emp_rec.emp_name;
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || employee_name);
  END LOOP;
END;

--(2)Calculating Total Salary using Cursor:
DECLARE
  total_salary NUMBER := 0;

  CURSOR emp_cursor IS
    SELECT emp_salary
    FROM Employee;

BEGIN
  FOR emp_rec IN emp_cursor
  LOOP
    total_salary := total_salary + emp_rec.emp_salary;
  END LOOP;

  DBMS_OUTPUT.PUT_LINE('Total Salary: ' || total_salary);
END;

--QUERIES USING VIEWS

--(1)Create a view that displays rooms with prices higher than 600.
CREATE VIEW V1 AS
SELECT r.room_no, r.room_category, rt.description AS RoomType, rt.room_price
FROM Rooms r, Room_Type rt
WHERE r.room_type_id = rt.room_type_id AND rt.room_price > 150;

SELECT * FROM V1;
   
--(2)Create a view that displays employee names and salaries.
CREATE VIEW V2 AS
SELECT emp_name AS EmployeeName, emp_salary AS Salary
FROM Employee;

SELECT * FROM V2;



desc Customer;
desc Hotel;
desc Amenities;
desc Hotel_Amenities;
desc Employee;
desc Hotel_Employee;
desc Receptionist_Employee;
desc Admin_Employee;
desc RoomService_Employee;
desc Room_Type;
desc Rooms;
desc Hotel_Rooms;
desc RoomType_Rooms;
desc Reservation;
desc Payment;
desc Customer_Reservation;
desc Payment_Reservation;
desc Feedback;
desc Customer_Feedback;
