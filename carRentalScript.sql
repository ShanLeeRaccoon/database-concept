CREATE DATABASE db_car_service;

USE db_car_service;



CREATE TABLE Car (
    carID INT UNSIGNED AUTO_INCREMENT,
    brand VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    color VARCHAR(30) NOT NULL,
    year INT NOT NULL,
    type VARCHAR(50) NOT NULL,
    seat INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    location VARCHAR(255) DEFAULT NULL,
    rate INT NOT NULL ,
    CONSTRAINT PK_Car PRIMARY KEY (carID)
);

CREATE TABLE User(
    userID INT UNSIGNED AUTO_INCREMENT,
    fName VARCHAR(255) NOT NULL,
    lName VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    userEmail VARCHAR(255) NOT NULL,
    phoneNum VARCHAR(15) NOT NULL,
    CONSTRAINT PK_User PRIMARY KEY (userID),
    CONSTRAINT UC_User UNIQUE (userEmail,phoneNum)
);

CREATE TABLE Booking(
    bookingID INT UNSIGNED AUTO_INCREMENT,
    startTime TIME NOT NULL,
    endTime TIME NOT NULL,
    pickUpLocation VARCHAR(255) NOT NULL,
    returnLocation VARCHAR(255) NOT NULL,
    startDate DATE NOT NULL,
    endDate DATE NOT NULL,
    duration FLOAT(10,1) NOT NULL,
    userID INT UNSIGNED,
    carID INT UNSIGNED,
    cost INT UNSIGNED NOT NULL,
    CONSTRAINT PK_Booking PRIMARY KEY (bookingID),

    CONSTRAINT FK_Car_carID FOREIGN KEY (carID) REFERENCES Car (carID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    CONSTRAINT FK_User_userID FOREIGN KEY (userID) REFERENCES User (userID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


INSERT INTO Car (brand, model, color, year, type, seat, status, location, rate)
  VALUES ('Mazda', '6', 'white', 2016, 'sedan', 5, 'available', 'RMIT', 10);

INSERT INTO Car (brand,model, color, year, type, seat, status, rate)
 VALUES ('Porsche', 'Macan', 'blue', 2020, 'SUV', 5, 'busy', 20);

INSERT INTO Car (brand,model, color, year, type, seat, status,location, rate)
 VALUES ('Toyota', 'Vios', 'silver', 2015, 'sedan', 5, 'available', 'SunriseCity', 5);

INSERT INTO Car (brand,model, color, year, type, seat, status, rate)
 VALUES ('Honda', 'City', 'white', 2018, 'sedan', 5, 'busy', 8);

INSERT INTO Car (brand,model, color, year, type, seat, status, rate)
 VALUES ('Ford', 'Ranger', 'red', 2017, 'pickup', 5, 'busy', 12);

INSERT INTO Car (brand,model, color, year, type, seat, status, location, rate)
 VALUES ('Mazda', '3', 'black', 2018, 'sedan', 5, 'available', 'LotteMart', 8);

INSERT INTO Car (brand,model, color, year, type, seat, status, location, rate)
 VALUES ('Mercedes', 'C300', 'black', 2018, 'coupe', 4, 'available', 'CrescentMall', 20);

INSERT INTO Car (brand,model, color, year, type, seat, status, rate)
 VALUES ('Ford', 'Focus', 'blue', 2018, 'hatchback', 5, 'maintenance', 10);

INSERT INTO Car (brand,model, color, year, type, seat, status, location, rate)
 VALUES ('Porsche', 'Panamera', 'yellow', 2019, 'hatchback', 4, 'available', 'RMIT', 30);

INSERT INTO Car (brand,model, color, year, type, seat, status, rate)
 VALUES ('Ferrari', '458Spider', 'red', 2015, 'convertible', 2, 'busy', 80);

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Shan', 'Lee', 22, 's3635413@rmit.edu.vn', '0938814444');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Stan', 'Lee', 80, 'leestan@gmail.com', '0938123541');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Keanu', 'Reeves', 56, 'keanustar@gmail.com', '0812358428');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Tom', 'Hanks', 64, 'tomhanks@gmail.com', '0814569991');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Stanley', 'Kubrick', 40, 'kubrickspace@ibm.com', '0125412389');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Valentino', 'Rossi', 41, 'valeyello@gmail.com', '0919464646');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Ridley', 'Scott', 82, 'scottalien@gmail.com', '0933841426');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Neil', 'Armstrong', 39, 'armstrongstep@gmail.com', '0196972020');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Ronald', 'Reagan', 70, 'reaganpresident@gmail.com', '0819810120');

INSERT INTO User (fName, lName, age, userEmail, phoneNum)
  VALUES ('Nicky', 'Hayden', 35, 'thekentuckykid@gmail.com', '2522006691');

INSERT INTO Booking (startTime, endTime, pickUpLocation, returnLocation, startDate, endDate, duration, userID, carID, cost)
  VALUES ('14:00:00', '14:00:00', 'RMIT', 'CrescentMall', '2020-11-28', '2020-11-29', 24, 1, 2, 480);

INSERT INTO Booking (startTime, endTime, pickUpLocation, returnLocation, startDate, endDate, duration, userID, carID, cost)
  VALUES ('10:00:00', '20:00:00', 'CrescentMall', 'LotteMart', '2020-11-28', '2020-11-28', 10, 5, 4, 80);

INSERT INTO Booking (startTime, endTime, pickUpLocation, returnLocation, startDate, endDate, duration, userID, carID, cost)
  VALUES ('08:00:00', '20:00:00', 'SunriseCity', 'CrescentMall', '2020-12-01', '2020-12-02', 36, 5, 5, 432);

INSERT INTO Booking (startTime, endTime, pickUpLocation, returnLocation, startDate, endDate, duration, userID, carID, cost)
  VALUES ('06:00:00', '18:00:00', 'RMIT', 'RMIT', '2020-12-02', '2020-12-07', 132, 6, 10, 10560);
