--
-- SC2207
-- Schema DDL
--


BEGIN TRANSACTION;

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

-- Sale table
CREATE TABLE Sale (
    listingId INT FOREIGN KEY REFERENCES listing(id),
    price DECIMAL(10, 2) NOT NULL,
    buildYear INT NOT NULL,
    tenure VARCHAR(50) NOT NULL
);

-- Rental table
CREATE TABLE rental (
    listingId INT FOREIGN KEY REFERENCES listing(id),
    hasUtilities BOOLEAN NOT NULL,
    hasAircon BOOLEAN NOT NULL
);

--ShortTermRental
CREATE TABLE shorttermrental (
    listingId INT FOREIGN KEY REFERENCES listing(id),
    dailyRental FLOAT NOT NULL
);
--LongTermRental
CREATE TABLE longtermrental (
    listingId INT FOREIGN KEY REFERENCES listing(id),
    monthlyRental FLOAT NOT NULL,
    minStay INT NOT NULL,
    allowVisitors BOOLEAN NOT NULL
);

--ViewingHistory
CREATE TABLE viewinghistory (
    customerId INT FOREIGN KEY REFERENCES customer(nric),
    listingId INT FOREIGN KEY REFERENCES listing(id),
    datetime TIME NOT NULL,
    status STRING NOT NULL,
)

CREATE TABLE chat (
    customerId INT FOREIGN KEY REFERENCES customer(nric),
    listingId INT FOREIGN KEY REFERENCES listing(id),
    timestamp TIME NOT NULL,
    content STRING,
)

CREATE TABLE reviewlog (
    listingId INT FOREIGN KEY REFERENCES listing(id),
    usernric INT FOREIGN KEY REFERENCES user(nric),
    datetime TIME NOT NULL,
    comment STRING NOT NULL,
    rating INT NOT NULL
)
COMMIT;
