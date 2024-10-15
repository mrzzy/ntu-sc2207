--
-- SC2207
-- Schema DDL
--


BEGIN TRANSACTION;

-- Drop tables with foreign key constraints first
DROP TABLE IF EXISTS APPOINTMENTLOG;
DROP TABLE IF EXISTS APPOINTMENT;
DROP TABLE IF EXISTS ENGAGEMENT;
DROP TABLE IF EXISTS SHORTTERMRENTAL;
DROP TABLE IF EXISTS LONGTERMRENTAL;
DROP TABLE IF EXISTS RENTAL;
DROP TABLE IF EXISTS SALE;
DROP TABLE IF EXISTS PROPERTY_R1;
DROP TABLE IF EXISTS LISTING;
DROP TABLE IF EXISTS CUSTOMER;
DROP TABLE IF EXISTS AGENT;
DROP TABLE IF EXISTS PROPERTYOWNER;


-- User table
CREATE TABLE [User] (
    NRIC VARCHAR(9) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    CONTACTNUM VARCHAR(20) NOT NULL,
    [password] VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(100) UNIQUE NOT NULL
);
-- Customer table
CREATE TABLE CUSTOMER (
    NRIC VARCHAR(9) PRIMARY KEY,
    INTENTION VARCHAR(100),
    FOREIGN KEY (NRIC) REFERENCES [User] (NRIC)
);
-- Agent table
CREATE TABLE AGENT (
    NRIC VARCHAR(9) PRIMARY KEY,
    LICENSENUM VARCHAR(50) UNIQUE NOT NULL,
    LICENSEEXPIRY DATE NOT NULL,
    FOREIGN KEY (NRIC) REFERENCES [User] (NRIC)
);
-- Agency table
CREATE TABLE AGENCY (
    [Name] VARCHAR(100) PRIMARY KEY,
    ESTABLISHEDYEAR INT NOT NULL
);
-- PropertyOwner table
CREATE TABLE PROPERTYOWNER (
    NRIC VARCHAR(9) PRIMARY KEY,
    [name] VARCHAR(100) NOT NULL,
    CONTACTNUM VARCHAR(20) UNIQUE NOT NULL,
    GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')),
    AGE INT CHECK (AGE > 0)
);
-- Listing table
CREATE TABLE LISTING (
    ID INT PRIMARY KEY IDENTITY (1, 1),
    CREATEDON DATE NOT NULL,
    UNITNUM VARCHAR(50) NOT NULL
);

-- Property tables
CREATE TABLE PROPERTY_R1 (
    UNITNUM INT PRIMARY KEY,
    PROPERTYOWNERID INT NOT NULL,
    [TYPE] VARCHAR(50) NOT NULL, -- noqa: RF06
    POSTCODE VARCHAR(10) NOT NULL,
    SIZE INT,
    FURNISHING VARCHAR(50)
);

CREATE TABLE PROPERTY_R2 (
    POSTCODE VARCHAR(10) PRIMARY KEY,
    STREET VARCHAR(100) NOT NULL
);

ALTER TABLE PROPERTY_R1
ADD CONSTRAINT FK_POSTCODE
FOREIGN KEY (POSTCODE) REFERENCES PROPERTY_R2 (POSTCODE);

-- Engagement table
CREATE TABLE ENGAGEMENT (
    CUSTOMERID VARCHAR(9),
    LISTINGID INT,
    PRIMARY KEY (CUSTOMERID, LISTINGID),
    FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER (NRIC),
    FOREIGN KEY (LISTINGID) REFERENCES LISTING (ID)
);

-- Appointment table
CREATE TABLE APPOINTMENT (
    CUSTOMERID VARCHAR(9),
    LISTINGID INT,
    APPOINTMENTDATE DATE,
    APPOINTMENTTIME TIME,
    PRIMARY KEY (CUSTOMERID, LISTINGID, APPOINTMENTDATE),
    FOREIGN KEY (CUSTOMERID, LISTINGID) REFERENCES ENGAGEMENT (
        CUSTOMERID, LISTINGID
    )
);

-- AppointmentLog table
CREATE TABLE APPOINTMENTLOG (
    CUSTOMERID VARCHAR(9),
    LISTINGID INT,
    APPOINTMENTDATE DATE,
    [TIME] DATETIME,-- noqa: RF06
    STATUS VARCHAR(50),
    ACTIONBY VARCHAR(9),
    PRIMARY KEY (CUSTOMERID, LISTINGID, APPOINTMENTDATE, TIME),
    FOREIGN KEY (
        CUSTOMERID, LISTINGID, APPOINTMENTDATE
    ) REFERENCES APPOINTMENT (CUSTOMERID, LISTINGID, APPOINTMENTDATE),
    FOREIGN KEY (ACTIONBY) REFERENCES [User] (NRIC)
);

-- Sale table
CREATE TABLE SALE (
    LISTINGID INT FOREIGN KEY REFERENCES LISTING (ID),
    PRICE DECIMAL(10, 2) NOT NULL,
    BUILDYEAR INT NOT NULL,
    TENURE VARCHAR(50) NOT NULL
);

-- Rental table
CREATE TABLE RENTAL (
    LISTINGID INT FOREIGN KEY REFERENCES LISTING (ID),
    HASUTILITIES BIT NOT NULL,
    HASAIRCON BIT NOT NULL
);

--ShortTermRental
CREATE TABLE SHORTTERMRENTAL (
    LISTINGID INT FOREIGN KEY REFERENCES LISTING (ID),
    DAILYRENTAL FLOAT NOT NULL
);
--LongTermRental
CREATE TABLE LONGTERMRENTAL (
    LISTINGID INT FOREIGN KEY REFERENCES LISTING (ID),
    MONTHLYRENTAL FLOAT NOT NULL,
    MINSTAY INT NOT NULL,
    ALLOWVISITORS BIT NOT NULL
);
COMMIT;
