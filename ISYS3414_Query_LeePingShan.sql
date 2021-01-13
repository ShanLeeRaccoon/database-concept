-- Author: Lee Ping Shan(s3635413)
-- The below queries has been applied to the application to interact with the database
-- The below queries is compatible with MySQL environment and has been tested without any errors


-- USER TABLE--


-- Get all user rows
SELECT * FROM User;

-- Get users by userID (search for user that userID = 1)
SELECT * FROM User
WHERE userID =1;

-- Get users by firstname (search for user name contains "Shan")
SELECT * FROM User
WHERE fName LIKE '%Shan%';

-- Get users by email (search for user email contains "tomhanks")
SELECT * FROM User
WHERE userEmail LIKE '%tomhanks%';

-- Update user email by userID (update user email to 'shanle@gmail.com' that userID = 1)
UPDATE User
SET userEmail = 'shanle@gmail.com'
WHERE userID = 1;

-- Update user phone number by userID (update user phone number to '0938813477' that userID = 2)
UPDATE User
SET phoneNum = '0938813477'
WHERE userID = 2;

-- Delete user by userID (delete user that userID = 10. Note that any bookings that created by deleted user will be deleted too)
DELETE FROM User WHERE userID=10;


-- CAR TABLE--


-- Get all car rows
SELECT * FROM Car;

-- Get car by carID (search for car that carID = 5)
SELECT * FROM Car
WHERE carID =5;

-- Get cars by brand (search for cars that brand contains "mazda")
SELECT * FROM Car
WHERE brand LIKE '%mazda%';

-- Get cars by color (search for cars that color contains "black")
SELECT * FROM Car
WHERE color LIKE '%black%';

-- Get cars by type (search for cars that type = sedan)
SELECT * FROM Car
WHERE type = 'sedan';

-- Get cars by seat numbers (search for cars that has 2 seats)
SELECT * FROM Car
WHERE seat = 2;

-- Get cars by status (search for cars that status = available)
SELECT * FROM Car
WHERE status = 'available';

-- Get cars by year (search for cars that year = 2018)
SELECT * FROM Car
WHERE year = 2018;

-- Get cars by price range (search for cars that rate between 8 and 50 USD/H)
SELECT * FROM Car
WHERE rate >= 8 AND rate <= 50;

-- Update car color by carID (update car color to 'green' that carID = 5)
UPDATE Car
SET color = 'green'
WHERE carID = 5;

-- Update car location by carID (update car location to 'VivoCity' that carID = 2)
UPDATE Car
SET location = 'VivoCity'
WHERE carID = 2;

-- Update car status by car brand (update car status to 'busy' that brand = porsche)
UPDATE Car
SET status = 'available'
WHERE brand = 'Porsche';

-- Update car rate by car brand and model (update car rate to 30 that brand = porsche and model = macan)
UPDATE Car
SET rate = 12
WHERE brand = 'Mazda' AND model = '6';

-- Delete car by carID (delete car that carID = 10. Note that any bookings that involved deleted car will be deleted too)
DELETE FROM Car WHERE carID=10;


-- BOOKING TABLE--


-- Get all booking rows
SELECT * FROM Booking;

-- Get booking by bookingID (search for booking that bookingID = 4)
SELECT * FROM Booking
WHERE bookingID =4;

-- Get booking by carID (search for bookings that carID = 1)
SELECT * FROM Booking
WHERE carID =1;

-- Get booking by userID (search for bookings that userID = 5)
SELECT * FROM Booking
WHERE userID =5;

-- Get bookings by startDate (search for bookings that startDate = 2020-11-28)
SELECT * FROM Booking
WHERE startDate ='2020-11-28';

-- Get bookings by start location (search for bookings that pickUpLocation = SunriseCity)
SELECT * FROM Booking
WHERE pickUpLocation ='SunriseCity';

-- Get bookings by cost range (search for bookings that cost between 80 and 500 USD)
SELECT * FROM Booking
WHERE cost >= 80 AND cost <= 500;

-- Update booking start time by bookingID (update booking startDate to '2020-11-27' and startTime to '14:00:00' that bookingID = 1)
UPDATE Booking
SET startTime = '14:00:00', startDate = '2020-11-27', duration = 48, cost = 960
WHERE bookingID = 1;

-- Update booking end time by bookingID (update booking endDate to '2020-11-28' and endTime to '21:00:00' that bookingID = 2)
UPDATE Booking
SET endTime = '21:00:00', endDate = '2020-11-28', duration = 11, cost = 88
WHERE bookingID = 2;

-- Update booking start location by bookingID (update booking pickUpLocation to 'PullmanHotel' that bookingID = 3)
UPDATE Booking
SET pickUpLocation = 'PullmanHotel'
WHERE bookingID = 3;

-- Update booking return location by bookingID (update booking returnLocation to 'PMHTower' that bookingID = 3)
UPDATE Booking
SET returnLocation = 'PMHTower'
WHERE bookingID = 3;

-- Delete booking by bookingID
DELETE FROM Booking WHERE bookingID=3;


-- DATA ANALYSIS--


-- Get user amount
SELECT COUNT(*) FROM User;

-- Get car amount
SELECT COUNT(*) FROM Car;

-- Get booking amount
SELECT COUNT(*) FROM Booking;

-- Get users age between 18 and 30
SELECT COUNT(*) FROM User 
WHERE age BETWEEN 18 AND 30;

-- Get user age between 31 and 50
SELECT COUNT(*) FROM User 
WHERE age BETWEEN 31 AND 50;

-- Get users age between 51 and 70
SELECT COUNT(*) FROM User 
WHERE age BETWEEN 51 AND 70;

-- Get users age above 70
SELECT COUNT(*) FROM User 
WHERE age >70;

-- Get minimum user age
SELECT MIN(age) FROM User;

-- Get maximum user age
SELECT max(age) FROM User;

-- Get available car amount
SELECT COUNT(*) FROM Car
WHERE status = 'available';

-- Get unavailable car amount
SELECT COUNT(*) FROM Car
WHERE status <> 'available';

-- Get car above selected rate amount (Above 10 USD/H in this sample query)
SELECT COUNT(*) FROM Car
WHERE rate >= 10;

-- Get lastest 7 bookings with user names and car models
SELECT B.bookingID, B.startDate, B.pickUpLocation, B.duration, B.cost, CONCAT(U.fName,' ', U.lName) AS UserName, CONCAT(C.brand,' ', C.model) AS Car FROM Booking B, Car C, User U 
WHERE B.carID = C.carID AND B.userID = U.userID
ORDER BY bookingID DESC LIMIT 7;

-- Get current month booking amount (Take January for example)
SELECT COUNT(*) FROM Booking
WHERE MONTH(startDate) = 1;

-- Get last month booking amount (Take December for example)
SELECT COUNT(*) FROM Booking
WHERE MONTH(startDate) = 12;

-- Get bookings by car brand or car model (Search for car contains 'mazda' in brand or model)
SELECT B.bookingID, B.startDate, B.pickUpLocation, B.duration, B.cost, CONCAT(C.brand,' ', C.model) AS Car FROM Booking B, Car C 
WHERE C.carID = B.carID AND C.brand LIKE '%Mazda%'
OR C.carID = B.carID AND C.model LIKE '%Mazda%';


-- Get bookings by user first name or last name (Search for user contains 'shan' in fName or lName)
SELECT B.bookingID, B.startDate, B.pickUpLocation, B.duration, B.cost, CONCAT(U.fName,' ', U.lName) AS UserName FROM Booking B, User U 
WHERE U.lName LIKE '%shan%' AND U.userID = B.userID
OR U.fName LIKE '%shan%' AND U.userID = B.userID;





