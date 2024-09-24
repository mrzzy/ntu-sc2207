-- User table
CREATE TABLE [User] (
    nric VARCHAR(9) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    contactNum VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
-- Customer table
CREATE TABLE Customer (
    nric VARCHAR(9) PRIMARY KEY,
    intention VARCHAR(100),
    FOREIGN KEY (Nric) REFERENCES [User] (Nric)
);
-- Agent table
CREATE TABLE Agent (
    nric VARCHAR(9) PRIMARY KEY,
    licenseNum VARCHAR(50) UNIQUE NOT NULL,
    licenseExpiry DATE NOT NULL,
    FOREIGN KEY (Nric) REFERENCES [User] (Nric)
);
-- Agency table
CREATE TABLE Agency (
    [Name] VARCHAR(100) PRIMARY KEY,
    establishedYear INT NOT NULL
);
-- PropertyOwner table
CREATE TABLE PropertyOwner (
    nric VARCHAR(9) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    contactNum VARCHAR(20) UNIQUE NOT NULL,
    gender CHAR(1) CHECK (GENDER IN ('M', 'F')),
    age INT CHECK (AGE > 0)
);
-- Listing table
CREATE TABLE Listing (
    id INT PRIMARY KEY IDENTITY (1, 1),
    createdOn DATE NOT NULL,
    unitNum VARCHAR(50) NOT NULL
);
