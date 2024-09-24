-- User table
CREATE TABLE [User] (
    nric VARCHAR(9) PRIMARY KEY,
    "name" VARCHAR(100) NOT NULL,
    contactnum VARCHAR(20) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
