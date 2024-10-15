--
-- SC2207
-- Schema DDL
--


BEGIN TRANSACTION;

-- Drop tables with foreign key constraints first
DROP TABLE IF EXISTS AppointmentLog;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Engagement;
DROP TABLE IF EXISTS shorttermrental;
DROP TABLE IF EXISTS longtermrental;
DROP TABLE IF EXISTS rental;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS Property_R1;
DROP TABLE IF EXISTS listing;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS agent;
DROP TABLE IF EXISTS propertyowner;


-- User table
CREATE TABLE [User] (
    nric VARCHAR(9) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    contactnum VARCHAR(20) NOT NULL,
    [password] VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
-- Customer table
CREATE TABLE customer (
    nric VARCHAR(9) PRIMARY KEY,
    intention VARCHAR(100),
    FOREIGN KEY (nric) REFERENCES [User] (nric)
);
-- Agent table
CREATE TABLE agent (
    nric VARCHAR(9) PRIMARY KEY,
    licensenum VARCHAR(50) UNIQUE NOT NULL,
    licenseexpiry DATE NOT NULL,
    FOREIGN KEY (nric) REFERENCES [User] (nric)
);
-- Agency table
CREATE TABLE agency (
    [Name] VARCHAR(100) PRIMARY KEY,
    establishedyear INT NOT NULL
);
-- PropertyOwner table
CREATE TABLE propertyowner (
    nric VARCHAR(9) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    contactnum VARCHAR(20) UNIQUE NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    age INT CHECK (age > 0)
);
-- Listing table
CREATE TABLE listing (
    id INT PRIMARY KEY IDENTITY (1, 1),
    createdon DATE NOT NULL,
    unitnum VARCHAR(50) NOT NULL
);

-- Property tables
CREATE TABLE Property_R1 (
    unitNum INT PRIMARY KEY,
    propertyOwnerId INT NOT NULL,
    type VARCHAR(50) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    size INT,
    furnishing VARCHAR(50)
);

CREATE TABLE Property_R2 (
    postcode VARCHAR(10) PRIMARY KEY,
    street VARCHAR(100) NOT NULL
);

ALTER TABLE Property_R1
ADD CONSTRAINT fk_postcode
FOREIGN KEY (postcode) REFERENCES Property_R2(postcode);

-- Engagement table
CREATE TABLE Engagement (
    customerId VARCHAR(9),
    listingId INT,
    PRIMARY KEY (customerId, listingId),
    FOREIGN KEY (customerId) REFERENCES customer(nric),
    FOREIGN KEY (listingId) REFERENCES listing(id)
);

-- Appointment table
CREATE TABLE Appointment (
    customerId VARCHAR(9),
    listingId INT,
    appointmentDate DATE,
    appointmentTime TIME,
    PRIMARY KEY (customerId, listingId, appointmentDate),
    FOREIGN KEY (customerId, listingId) REFERENCES Engagement(customerId, listingId)
);

-- AppointmentLog table
CREATE TABLE AppointmentLog (
    customerId VARCHAR(9),
    listingId INT,
    appointmentDate DATE,
    time DATETIME,
    status VARCHAR(50),
    actionBy VARCHAR(9),
    PRIMARY KEY (customerId, listingId, appointmentDate, time),
    FOREIGN KEY (customerId, listingId, appointmentDate) REFERENCES Appointment(customerId, listingId, appointmentDate),
    FOREIGN KEY (actionBy) REFERENCES [User](nric)
);

-- Sale table
CREATE TABLE Sale (
    listingId INT FOREIGN KEY REFERENCES listing(id),
    price DECIMAL(10, 2) NOT NULL,
    buildYear INT NOT NULL,
    tenure VARCHAR(50) NOT NULL
);

-- Rental table
CREATE TABLE rental (
    listingid INT FOREIGN KEY REFERENCES listing (id),
    hasutilities BIT NOT NULL,
    hasaircon BIT NOT NULL
);

--ShortTermRental
CREATE TABLE shorttermrental (
    listingid INT FOREIGN KEY REFERENCES listing (id),
    dailyrental FLOAT NOT NULL
);
--LongTermRental
CREATE TABLE longtermrental (
    listingid INT FOREIGN KEY REFERENCES listing (id),
    monthlyrental FLOAT NOT NULL,
    minstay INT NOT NULL,
    allowvisitors BIT NOT NULL
);
COMMIT;
