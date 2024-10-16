--
-- SC2207
-- Schema DDL
--

BEGIN TRANSACTION;

-- Drop tables with foreign key constraints first
DROP TABLE IF EXISTS AppointmentLog;
DROP TABLE IF EXISTS Appointment;
DROP TABLE IF EXISTS Engagement;
DROP TABLE IF EXISTS ShortTermRental;
DROP TABLE IF EXISTS LongTermRental;
DROP TABLE IF EXISTS Rental;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS PropertyMain;
DROP TABLE IF EXISTS Listing;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Agent;
DROP TABLE IF EXISTS PropertyOwner;

-- User table
CREATE TABLE [User] (
    Nric VARCHAR(9) PRIMARY KEY,
    [Name] VARCHAR(100) NOT NULL,
    ContactNum VARCHAR(20) NOT NULL,
    [Password] VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Customer table
CREATE TABLE Customer (
    Nric VARCHAR(9) PRIMARY KEY,
    Intention VARCHAR(100),
    FOREIGN KEY (Nric) REFERENCES [User] (Nric)
);

-- Agent table
CREATE TABLE Agent (
    Nric VARCHAR(9) PRIMARY KEY,
    LicenseNum VARCHAR(50) UNIQUE NOT NULL,
    LicenseExpiry DATE NOT NULL,
    FOREIGN KEY (Nric) REFERENCES [User] (Nric)
);

-- Agency table
CREATE TABLE Agency (
    [Name] VARCHAR(100) PRIMARY KEY,
    EstablishedYear INT NOT NULL
);

-- PropertyOwner table
CREATE TABLE PropertyOwner (
    Nric VARCHAR(9) PRIMARY KEY,
    [Name] VARCHAR(100) NOT NULL,
    ContactNum VARCHAR(20) UNIQUE NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Age INT CHECK (Age > 0)
);

-- Listing table
CREATE TABLE Listing (
    Id INT PRIMARY KEY IDENTITY (1, 1),
    CreatedOn DATE NOT NULL,
    UnitNum VARCHAR(50) NOT NULL
);

-- Property tables
CREATE TABLE PropertyMain (
    UnitNum INT PRIMARY KEY,
    PropertyOwnerId INT NOT NULL,
    [Type] VARCHAR(50) NOT NULL, -- noqa: RF06
    Postcode VARCHAR(10) NOT NULL,
    Size INT,
    Furnishing VARCHAR(50)
);

CREATE TABLE Property2 (
    Postcode VARCHAR(10) PRIMARY KEY,
    Street VARCHAR(100) NOT NULL
);

ALTER TABLE PropertyMain
ADD CONSTRAINT FK_Postcode
FOREIGN KEY (Postcode) REFERENCES Property2 (Postcode);

-- Sale tables
CREATE TABLE SaleMain (
    ListingId INT FOREIGN KEY REFERENCES Listing (Id),
    Price DECIMAL(10, 2) NOT NULL,
    BuildYear INT NOT NULL
);

CREATE TABLE Sale2 (
    BuildYear INT PRIMARY KEY,
    Tenure VARCHAR(50) NOT NULL
);

ALTER TABLE SaleMain
ADD CONSTRAINT FK_BuildYear
FOREIGN KEY (BuildYear) REFERENCES Sale2 (BuildYear);

-- Rental table
CREATE TABLE Rental (
    ListingId INT FOREIGN KEY REFERENCES Listing (Id),
    HasUtilities BIT NOT NULL,
    HasAircon BIT NOT NULL
);

-- ShortTermRental
CREATE TABLE ShortTermRental (
    ListingId INT FOREIGN KEY REFERENCES Listing (Id),
    DailyRental FLOAT NOT NULL
);

-- LongTermRental
CREATE TABLE LongTermRental (
    ListingId INT FOREIGN KEY REFERENCES Listing (Id),
    MonthlyRental FLOAT NOT NULL,
    MinStay INT NOT NULL,
    AllowVisitors BIT NOT NULL
);

-- Engagement table
CREATE TABLE Engagement (
    CustomerId VARCHAR(9),
    ListingId INT,
    PRIMARY KEY (CustomerId, ListingId),
    FOREIGN KEY (CustomerId) REFERENCES Customer (Nric),
    FOREIGN KEY (ListingId) REFERENCES Listing (Id)
);

-- ViewingHistory
CREATE TABLE ViewingHistory (
    CustomerId INT FOREIGN KEY REFERENCES Customer (Nric),
    ListingId INT FOREIGN KEY REFERENCES Listing (Id),
    DateTime TIME NOT NULL,
    Status STRING NOT NULL
);

-- Chat table
CREATE TABLE Chat (
    CustomerId INT FOREIGN KEY REFERENCES Customer (Nric),
    ListingId INT FOREIGN KEY REFERENCES Listing (Id),
    [Timestamp] TIME NOT NULL,
    Content STRING
);

-- ReviewLog table
CREATE TABLE ReviewLog (
    ListingId INT FOREIGN KEY REFERENCES Listing (Id),
    UserNric INT FOREIGN KEY REFERENCES [User] (Nric),
    DateTime TIME NOT NULL,
    Comment STRING NOT NULL,
    Rating INT NOT NULL
);

-- Appointment table
CREATE TABLE Appointment (
    CustomerId VARCHAR(9),
    ListingId INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    PRIMARY KEY (CustomerId, ListingId, AppointmentDate),
    FOREIGN KEY (CustomerId, ListingId) REFERENCES Engagement (
        CustomerId, ListingId
    )
);

-- AppointmentLog table
CREATE TABLE AppointmentLog (
    CustomerId VARCHAR(9),
    ListingId INT,
    AppointmentDate DATE,
    [Time] DATETIME, -- noqa: RF06
    Status VARCHAR(50),
    ActionBy VARCHAR(9),
    PRIMARY KEY (CustomerId, ListingId, AppointmentDate, Time),
    FOREIGN KEY (
        CustomerId, ListingId, AppointmentDate
    ) REFERENCES Appointment (
        CustomerId, ListingId, AppointmentDate
    ),
    FOREIGN KEY (ActionBy) REFERENCES [User] (Nric)
);

COMMIT;
