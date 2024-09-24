-- User table
CREATE TABLE [User] (
    nric VARCHAR(9) PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    contactnum VARCHAR(20) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
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
    Licensenum VARCHAR(50) UNIQUE NOT NULL,
    Licenseexpiry DATE NOT NULL,
    FOREIGN KEY (Nric) REFERENCES [User] (Nric)
);
-- Agency table
CREATE TABLE Agency (
    "Name" VARCHAR(100) PRIMARY KEY,
    Establishedyear INT NOT NULL
);
-- PropertyOwner table
CREATE TABLE PROPERTYOWNER (
    NRIC VARCHAR(9) PRIMARY KEY,
    "Name" VARCHAR(100) NOT NULL,
    CONTACTNUM VARCHAR(20) UNIQUE NOT NULL,
    GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')),
    AGE INT CHECK (AGE > 0)
);
-- Listing table
CREATE TABLE Listing (
    Id INT PRIMARY KEY IDENTITY (1, 1),
    Createdon DATE NOT NULL,
    Unitnum VARCHAR(50) NOT NULL
);
